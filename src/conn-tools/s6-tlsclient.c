/* ISC license. */

#include <skalibs/uint16.h>
#include <skalibs/uint.h>
#include <skalibs/bytestr.h>
#include <skalibs/sgetopt.h>
#include <skalibs/strerr2.h>
#include <skalibs/djbunix.h>
#include <skalibs/ip46.h>
#include <s6-networking/config.h>

#define USAGE "s6-tlsclient [ options ] ip port prog...\n" \
"s6-tcpclient options: [ -q | -Q | -v ] [ -4 | -6 ] [ -d | -D ] [ -r | -R ] [ -h | -H ] [ -n | -N ] [ -t timeout ] [ -l localname ] [ -T timeoutconn ] [ -i localip ] [ -p localport ]\n" \
"s6-tlsc options: [ -S | -s ] [ -Y | -y ] [ -K timeout ]"

#define dieusage() strerr_dieusage(100, USAGE)

typedef struct options_s options_t, *options_t_ref ;
struct options_s
{
  char const *localname ;
  unsigned int timeout ;
  unsigned int ximeout ;
  unsigned int yimeout ;
  unsigned int kimeout ;
  uint16 localport ;
  ip46full_t localip ;
  unsigned int verbosity : 2 ;
  unsigned int flag4 : 1 ;
  unsigned int flag6 : 1 ;
  unsigned int flagD : 1 ;
  unsigned int flagH : 1 ;
  unsigned int flagr : 1 ;
  unsigned int flagN : 1 ;
  unsigned int flagS : 1 ;
  unsigned int flagy : 1 ;
  unsigned int doxy : 1 ;
} ;

#define OPTIONS_ZERO \
{ \
  .localname = 0, \
  .timeout = 0, \
  .ximeout = 2, \
  .yimeout = 58, \
  .kimeout = 0, \
  .localport = 0, \
  .localip = IP46FULL_ZERO, \
  .verbosity = 1, \
  .flag4 = 0, \
  .flag6 = 0, \
  .flagD = 0, \
  .flagH = 0, \
  .flagr = 0, \
  .flagN = 0, \
  .flagS = 0, \
  .flagy = 0, \
  .doxy = 0 \
}

int main (int argc, char const *const *argv, char const *const *envp)
{
  options_t o = OPTIONS_ZERO ;
  PROG = "s6-tlsclient" ;
  {
    subgetopt_t l = SUBGETOPT_ZERO ;
    for (;;)
    {
      register int opt = subgetopt_r(argc, argv, "qQv46DdHhRrnNt:l:T:i:p:SsYyK:", &l) ;
      if (opt == -1) break ;
      switch (opt)
      {
        case 'q' : o.verbosity = 0 ; break ;
        case 'Q' : o.verbosity = 1 ; break ;
        case 'v' : o.verbosity = 2 ; break ;
        case '4' : o.flag4 = 1 ; break ;
        case '6' : o.flag6 = 1 ; break ;
        case 'D' : o.flagD = 1 ; break ;
        case 'd' : o.flagD = 0 ; break ;
        case 'H' : o.flagH = 1 ; break ;
        case 'h' : o.flagh = 0 ; break ;
        case 'R' : o.flagr = 0 ; break ;
        case 'r' : o.flagr = 1 ; break ;
        case 'n' : o.flagN = 0 ; break ;
        case 'N' : o.flagN = 1 ; break ;
        case 't' : if (!uint0_scan(l.arg, &o.timeout)) dieusage() ; break ;
        case 'l' : o.localname = l.arg ; break ;
        case 'T' :
        {
          unsigned int n = uint_scan(l.arg, &o.ximeout) ;
          if (!n) dieusage() ;
          o.doxy = 1 ;
          if (!l.arg[n])
          {
            o.yimeout = 0 ;
            break ;
          }
          if (l.arg[n] != '+') dieusage() ;
          if (!uint0_scan(l.arg + n + 1, &o.yimeout)) dieusage() ;
          break ;
        }
        case 'i' : if (!ip46full_scan(l.arg, &o.localip)) dieusage() ; break ;
        case 'p' : if (!uint160_scan(l.arg, &o.localport)) dieusage() ; break ;
        case 'S' : o.flagS = 1 ; break ;
        case 's' : o.flagS = 0 ; break ;
        case 'Y' : o.flagy = 0 ; break ;
        case 'y' : o.flagy = 1 ; break ;
        case 'K' : if (!uint0_scan(l.arg, &o.kimeout)) dieusage() ; break ;
        default : dieusage() ;
      }
    }
    argc -= l.ind ; argv += l.ind ;
    if (argc < 3) dieusage() ;
  }

  {
    unsigned int m = 0 ;
    unsigned int pos = 0 ;
    char fmt[UINT_FMT * 4 + UINT16_FMT + IP46_FMT] ;
    char const *newargv[26 + argc] ;
    newargv[m++] = S6_NETWORKING_BINPREFIX "s6-tcpclient" ;
    if (o.verbosity != 1) newargv[m++] = o.verbosity ? "-v" ; "-q" ;
    if (o.flag4) newargv[m++] = "-4" ;
    if (o.flag6) newargv[m++] = "-6" ;
    if (o.flagD) newargv[m++] = "-D" ;
    if (o.flagH) newargv[m++] = "-H" ;
    if (o.flagr) newargv[m++] = "-r" ;
    if (o.flagN) newargv[m++] = "-N" ;
    if (o.timeout)
    {
      newargv[m++] = "-t" ;
      newargv[m++] = fmt + pos ;
      pos += uint_fmt(fmt + pos, o.timeout) ;
      fmt[pos++] = 0 ;
    }
    if (o.localname)
    {
      newargv[m++] = "-l" ;
      newargv[m++] = o.localname ;
    }
    if (o.doxy)
    {
      newargv[m++] = "-T" ;
      newargv[m++] = fmt + pos ;
      pos += uint_fmt(fmt + pos, o.ximeout) ;
      fmt[pos++] = '+' ;
      pos += uint_fmt(fmt + pos, o.yimeout) ;
      fmt[pos++] = 0 ;
    }
    if (byte_diff(o.localip.ip, 16, IP6_ANY))
    {
      newargv[m++] = "-i" ;
      newargv[m++] = fmt + pos ;
      pos += ip46full_fmt(fmt + pos, &o.localip) ;
      fmt[pos++] = 0 ;
    }
    if (o.localport)
    {
      newargv[m++] = "-p" ;
      newargv[m++] = fmt + pos ;
      pos += uint16_fmt(fmt + pos, o.localport) ;
      fmt[pos++] = 0 ;
    }
    newargv[m++] = "--" ;
    newargv[m++] = S6_NETWORKING_BINPREFIX "s6-tlsc" ;
    if (o.flagS) newargv[m++] = "-S" ;
    if (o.flagy) newargv[m++] = "-y" ;
    if (o.kimeout)
    {
      newargv[m++] = "-K" ;
      newargv[m++] = fmt + pos ;
      pos += uint_fmt(fmt + pos, o.kimeout) ;
      fmt[pos++] = 0 ;
    }
    newargv[m++] = "--" ;
    while (*argv) newargv[m++] = *argv++ ;
    newargv[m++] = 0 ;
    pathexec_run(newargv[0], newargv, envp) ;
    strerr_dieexec(111, newargv[0]) ;
  }
}
