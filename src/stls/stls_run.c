/* ISC license. */

#include <skalibs/nonposix.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <errno.h>
#include <signal.h>
#include <tls.h>
#include <skalibs/uint32.h>
#include <skalibs/allreadwrite.h>
#include <skalibs/error.h>
#include <skalibs/buffer.h>
#include <skalibs/sig.h>
#include <skalibs/selfpipe.h>
#include <skalibs/strerr2.h>
#include <skalibs/tai.h>
#include <skalibs/iopause.h>
#include <skalibs/djbunix.h>
#include <skalibs/siovec.h>
#include <s6-networking/stls.h>

typedef struct tlsbuf_s tlsbuf_t, *tlsbuf_t_ref ;
struct tlsbuf_s
{
  char buf[STLS_BUFSIZE] ;
  buffer b ;
  unsigned int blockedonother : 1 ;
} ;

static inline int buffer_tls_flush (struct tls *ctx, tlsbuf_t *b)
{
  siovec_t v[2] ;
  ssize_t r, w ;
  buffer_rpeek(&b[0].b, v) ;
  r = tls_write(ctx, v[0].s, v[0].len) ;
  switch (r)
  {
    case -1 : return -1 ;
    case TLS_WANT_POLLIN :
      if (b[1].blockedonother) strerr_dief1x(101, "TLS deadlock") ;
      b[0].blockedonother = 1 ;
    case TLS_WANT_POLLOUT : return 0 ;
    default : break ;
  }
  w = r ;
  if (v[1].len)
  {
    r = tls_write(ctx, v[1].s, v[1].len) ;
    switch (r)
    {
      case TLS_WANT_POLLIN :
        if (b[1].blockedonother) strerr_dief1x(101, "TLS deadlock") ;
        b[0].blockedonother = 1 ;
      case -1 :
      case TLS_WANT_POLLOUT :
        buffer_rseek(&b[0].b, w) ;
        return 0 ;
      default : break ;
    }
    w += r ;
  }
  buffer_rseek(&b[0].b, w) ;
  return 1 ;
}

static inline int buffer_tls_fill (struct tls *ctx, tlsbuf_t *b)
{
  siovec_t v[2] ;
  ssize_t r, w ;
  int ok = 1 ;
  buffer_wpeek(&b[1].b, v) ;
  r = tls_read(ctx, v[0].s, v[0].len) ;
  switch (r)
  {
    case 0 : return -2 ;
    case -1 : return -1 ;
    case TLS_WANT_POLLOUT :
      if (b[0].blockedonother) strerr_dief1x(101, "TLS deadlock") ;
      b[1].blockedonother = 1 ;
    case TLS_WANT_POLLIN : return 0 ;
    default : break ;
  }
  w = r ;
  if (v[1].len)
  {
    r = tls_read(ctx, v[1].s, v[1].len) ;
    switch (r)
    {
      case TLS_WANT_POLLOUT :
        if (b[0].blockedonother) strerr_dief1x(101, "TLS deadlock") ;
        b[1].blockedonother = 1 ;
      case -1 :
      case TLS_WANT_POLLIN :
        buffer_wseek(&b[1].b, w) ;
        return 0 ;
      case 0 : ok = -1 ;
      default : break ;
    }
    w += r ;
  }
  buffer_wseek(&b[1].b, w) ;
  return ok ;
}

static void do_tls_close (struct tls *ctx, int fd)
{
  iopause_fd x = { .fd = fd, .events = IOPAUSE_WRITE } ;
  while (tls_close(ctx) == TLS_WANT_POLLOUT) 
    if (iopause_g(&x, 1, 0) < 0)
      strerr_diefu1sys(111, "iopause") ;
}

int stls_run (struct tls *ctx, int *fds, unsigned int verbosity, uint32 options, tain_t const *tto)
{
  tlsbuf_t b[2] = { { .blockedonother = 0 }, { .blockedonother = 0 } } ;
  iopause_fd x[4] ;
  unsigned int xindex[4] ;
  register unsigned int i ;

  for (i = 0 ; i < 2 ; i++)
  {
    buffer_init(&b[i].b, i ? &buffer_write : &buffer_read, fds[i], b[i].buf, STLS_BUFSIZE) ;
    if (ndelay_on(fds[2+i]) < 0) strerr_diefu1sys(111, "set fds non-blocking") ;
  }
  if (sig_ignore(SIGPIPE) < 0) strerr_diefu1sys(111, "ignore SIGPIPE") ;

  tain_now_g() ;

  for (;;)
  {
    tain_t deadline ;
    unsigned int xlen = 0 ;
    register int r ;

    tain_add_g(&deadline, buffer_isempty(&b[0].b) && buffer_isempty(&b[1].b) ? tto : &tain_infinite_relative) ;


   /* poll() preparation */

    if (fds[0] >= 0 && buffer_isreadable(&b[0].b))
    {
      x[xlen].fd = fds[0] ;
      x[xlen].events = IOPAUSE_READ ;
      xindex[0] = xlen++ ;
    }
    else xindex[0] = 4 ;

    if (fds[1] >= 0 && buffer_iswritable(&b[1].b))
    {
      x[xlen].fd = fds[1] ;
      x[xlen].events = IOPAUSE_WRITE ;
      xindex[1] = xlen++ ;
    }
    else xindex[1] = 4 ;

    if (fds[2] >= 0 && !b[1].blockedonother && buffer_isreadable(&b[1].b))
    {
      x[xlen].fd = fds[2] ;
      x[xlen].events = IOPAUSE_READ ;
      xindex[2] = xlen++ ;
    }
    else xindex[2] = 4 ;

    if (fds[3] >= 0 && !b[0].blockedonother && buffer_iswritable(&b[0].b))
    {
      x[xlen].fd = fds[3] ;
      x[xlen].events = IOPAUSE_WRITE ;
      xindex[3] = xlen++ ;
    }
    else xindex[3] = 4 ;

    if (!xlen) break ;


   /* poll() */

    r = iopause_g(x, xlen, &deadline) ;
    if (r < 0) strerr_diefu1sys(111, "iopause") ;
    else if (!r)
    {
      fd_close(fds[0]) ;
      tls_close(ctx) ;
      continue ;
    }

    while (xlen--)
      if (x[xlen].revents & IOPAUSE_EXCEPT)
        x[xlen].revents |= IOPAUSE_READ | IOPAUSE_WRITE ;


   /* Flush to local */

    if (xindex[1] < 4 && x[xindex[1]].revents & IOPAUSE_WRITE)
    {
      r = buffer_flush(&b[1].b) ;
      if (!r && !error_isagain(errno))
      {
        strerr_warnwu1sys("write to application") ;
        if (fds[2] >= 0)
        {
          if (options & 1) shutdown(fds[2], SHUT_RD) ;
          fd_close(fds[2]) ; fds[2] = -1 ;
        }
        r = 1 ;
      }
      if (r && fds[2] < 0)
      {
        fd_close(fds[1]) ; fds[1] = -1 ;
      }
    }


   /* Flush to remote */

    if (xindex[3] < 4 && x[xindex[3]].revents & IOPAUSE_WRITE)
    {
      r = buffer_tls_flush(ctx, b) ;
      if (r < 0)
      {
        strerr_warnwu2x("write to peer: ", tls_error(ctx)) ;
        fd_close(fds[0]) ; fds[0] = -1 ;
      }
      if (r && fds[0] < 0)
      {
        if (fds[2] >= 0) do_tls_close(ctx, fds[3]) ;
        if (options & 1) shutdown(fds[3], SHUT_WR) ;
        fd_close(fds[3]) ; fds[3] = -1 ;
      }
    }


   /* Fill from local */

    if (xindex[0] < 4 && x[xindex[0]].revents & IOPAUSE_READ)
    {
      r = sanitize_read(buffer_fill(&b[0].b)) ;
      if (r < 0)
      {
        if (r == -1) strerr_warnwu1sys("read from application") ;
        fd_close(fds[0]) ; fds[0] = -1 ;
        if (buffer_isempty(&b[0].b))
        {
          if (fds[2] >= 0) do_tls_close(ctx, fds[3]) ;
          if (options & 1) shutdown(fds[3], SHUT_WR) ;
          fd_close(fds[3]) ; fds[3] = -1 ;
        }
      }
    }


   /* Fill from remote */

    if (xindex[2] < 4 && x[xindex[2]].revents & IOPAUSE_READ)
    {
      r = buffer_tls_fill(ctx, b) ;
      if (r < 0)
      {
        if (errno != EPIPE) strerr_warnwu1sys("read from peer") ;
        if (options & 1) shutdown(fds[2], SHUT_RD) ;
        fd_close(fds[2]) ; fds[2] = -1 ;
        if (buffer_isempty(&b[1].b))
        {
          fd_close(fds[1]) ; fds[1] = -1 ;
        }
      }
    }
  }

  if (fds[1] >= 0) fd_close(fds[1]) ;
  if (fds[0] >= 0) fd_close(fds[0]) ;
  if (fds[3] >= 0) fd_close(fds[3]) ;
  if (fds[2] >= 0) fd_close(fds[2]) ;
  return 0 ;
}