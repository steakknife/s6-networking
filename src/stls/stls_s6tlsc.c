/* ISC license. */

#include <unistd.h>
#include <errno.h>
#include <tls.h>
#include <skalibs/strerr2.h>
#include <skalibs/env.h>
#include <skalibs/djbunix.h>
#include <s6-networking/stls.h>
#include "stls-internal.h"

#define diecfg(cfg, s) strerr_diefu3x(96, (s), ": ", tls_config_error(cfg))
#define diectx(e, ctx, s) strerr_diefu3x(e, (s), ": ", tls_error(ctx))

int stls_s6tlsc (char const *const *argv, char const *const *envp, tain_t const *tto, uint32_t preoptions, uint32_t options, uid_t uid, gid_t gid, unsigned int verbosity, char const *servername, int *sfd)
{
  int fds[5] = { sfd[0], sfd[1], sfd[0], sfd[1] } ;
  struct tls *ctx ;
  struct tls_config *cfg ;
  pid_t pid ;
  char const *x ;
  int wstat ;

  if (tls_init() < 0) strerr_diefu1sys(111, "tls_init") ;
  cfg = tls_config_new() ;
  if (!cfg) strerr_diefu1sys(111, "tls_config_new") ;

  x = env_get2(envp, "CADIR") ;
  if (x)
  {
    if (tls_config_set_ca_path(cfg, x) < 0)
      diecfg(cfg, "tls_config_set_ca_path") ;
  }
  else
  {
    x = env_get2(envp, "CAFILE") ;
    if (x)
    {
      if (tls_config_set_ca_file(cfg, x) < 0)
        diecfg(cfg, "tls_config_set_ca_file") ;
    }
    else strerr_dief1x(100, "no trust anchor found - please set CADIR or CAFILE") ;
  }

  if (preoptions & 1)
  {
    x = env_get2(envp, "CERTFILE") ;
    if (!x) strerr_dienotset(100, "CERTFILE") ;
    if (tls_config_set_cert_file(cfg, x) < 0)
      diecfg(cfg, "tls_config_set_cert_file") ;

    x = env_get2(envp, "KEYFILE") ;
    if (!x) strerr_dienotset(100, "KEYFILE") ;
    if (tls_config_set_key_file(cfg, x) < 0)
      diecfg(cfg, "tls_config_set_key_file") ;
  }

  if (tls_config_set_ciphers(cfg, "secure") < 0)
    diecfg(cfg, "tls_config_set_ciphers") ;

  if (tls_config_set_dheparams(cfg, "auto") < 0)
    diecfg(cfg, "tls_config_set_dheparams") ;

  if (tls_config_set_ecdhecurve(cfg, "auto") < 0)
    diecfg(cfg, "tls_config_set_ecdhecurve") ;

  tls_config_verify(cfg) ;
  tls_config_set_protocols(cfg, TLS_PROTOCOLS_ALL) ;
  tls_config_prefer_ciphers_server(cfg) ;
  if (!servername) tls_config_insecure_noverifyname(cfg) ;

  ctx = tls_client() ;
  if (!ctx) strerr_diefu1sys(111, "tls_client") ;
  if (tls_configure(ctx, cfg) < 0) diectx(97, ctx, "tls_configure") ;

  pid = stls_prep_spawn_drop(argv, envp, fds, uid, gid, !!(preoptions & 2)) ;

  if (tls_connect_fds(ctx, fds[2], fds[3], servername) < 0)
    diectx(97, ctx, "tls_connect_fds") ;
  tls_config_free(cfg) ;
  if (tls_handshake(ctx) < 0) diectx(97, ctx, "perform SSL handshake") ;

  wstat = stls_run(ctx, fds, pid, verbosity, options, tto) ;
  if (wstat < 0 && wait_pid(pid, &wstat) < 0) strerr_diefu1sys(111, "wait_pid") ;
  return wait_estatus(wstat) ;
}
