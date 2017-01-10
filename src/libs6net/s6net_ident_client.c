/* ISC license. */

#include <stdint.h>
#include <errno.h>
#include <skalibs/bytestr.h>
#include <skalibs/tai.h>
#include <skalibs/ip46.h>
#include <s6-networking/ident.h>

int s6net_ident_client (char *s, size_t max, ip46_t const *remoteip, uint16_t remoteport, ip46_t const *localip, uint16_t localport, tain_t const *deadline, tain_t *stamp)
{
  char buf[S6NET_IDENT_REPLY_SIZE] ;
  size_t len ;
  register ssize_t r = s6net_ident_reply_get(buf, remoteip, remoteport, localip, localport, deadline, stamp) ;
  if (r < 0) return errno == EPIPE ? (errno = EIO, 0) : -1 ; /* the RFC says so */
  len = r ;
  r = s6net_ident_reply_parse(buf, remoteport, localport) ;
  if (r <= 0) return r ;
  if (max + r < len + 1) return (errno = ENAMETOOLONG, -1) ;
  byte_copy(s, len - r + 1, buf + r) ;
  return len - r + 1 ;
}
