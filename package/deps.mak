#
# This file has been generated by tools/gen-deps.sh
#

src/include/s6-networking/s6net.h: src/include/s6-networking/ident.h
src/sbearssl/sbearssl-internal.h: src/include/s6-networking/sbearssl.h
src/clock/s6-clockadd.o src/clock/s6-clockadd.lo: src/clock/s6-clockadd.c
src/clock/s6-clockview.o src/clock/s6-clockview.lo: src/clock/s6-clockview.c
src/clock/s6-sntpclock.o src/clock/s6-sntpclock.lo: src/clock/s6-sntpclock.c
src/clock/s6-taiclock.o src/clock/s6-taiclock.lo: src/clock/s6-taiclock.c
src/clock/s6-taiclockd.o src/clock/s6-taiclockd.lo: src/clock/s6-taiclockd.c
src/conn-tools/s6-getservbyname.o src/conn-tools/s6-getservbyname.lo: src/conn-tools/s6-getservbyname.c
src/conn-tools/s6-ident-client.o src/conn-tools/s6-ident-client.lo: src/conn-tools/s6-ident-client.c src/include/s6-networking/ident.h
src/conn-tools/s6-tcpclient.o src/conn-tools/s6-tcpclient.lo: src/conn-tools/s6-tcpclient.c src/include/s6-networking/ident.h
src/conn-tools/s6-tcpserver-access.o src/conn-tools/s6-tcpserver-access.lo: src/conn-tools/s6-tcpserver-access.c src/include/s6-networking/ident.h
src/conn-tools/s6-tcpserver.o src/conn-tools/s6-tcpserver.lo: src/conn-tools/s6-tcpserver.c src/include/s6-networking/config.h
src/conn-tools/s6-tcpserver4-socketbinder.o src/conn-tools/s6-tcpserver4-socketbinder.lo: src/conn-tools/s6-tcpserver4-socketbinder.c
src/conn-tools/s6-tcpserver4.o src/conn-tools/s6-tcpserver4.lo: src/conn-tools/s6-tcpserver4.c src/include/s6-networking/config.h
src/conn-tools/s6-tcpserver4d.o src/conn-tools/s6-tcpserver4d.lo: src/conn-tools/s6-tcpserver4d.c
src/conn-tools/s6-tcpserver6-socketbinder.o src/conn-tools/s6-tcpserver6-socketbinder.lo: src/conn-tools/s6-tcpserver6-socketbinder.c
src/conn-tools/s6-tcpserver6.o src/conn-tools/s6-tcpserver6.lo: src/conn-tools/s6-tcpserver6.c src/include/s6-networking/config.h
src/conn-tools/s6-tcpserver6d.o src/conn-tools/s6-tcpserver6d.lo: src/conn-tools/s6-tcpserver6d.c
src/conn-tools/s6-tlsc.o src/conn-tools/s6-tlsc.lo: src/conn-tools/s6-tlsc.c src/include/s6-networking/config.h src/include/s6-networking/sbearssl.h src/include/s6-networking/stls.h
src/conn-tools/s6-tlsclient.o src/conn-tools/s6-tlsclient.lo: src/conn-tools/s6-tlsclient.c src/include/s6-networking/config.h
src/conn-tools/s6-tlsd.o src/conn-tools/s6-tlsd.lo: src/conn-tools/s6-tlsd.c src/include/s6-networking/config.h src/include/s6-networking/sbearssl.h src/include/s6-networking/stls.h
src/conn-tools/s6-tlsserver.o src/conn-tools/s6-tlsserver.lo: src/conn-tools/s6-tlsserver.c src/include/s6-networking/config.h
src/libs6net/s6net_ident_client.o src/libs6net/s6net_ident_client.lo: src/libs6net/s6net_ident_client.c src/include/s6-networking/ident.h
src/libs6net/s6net_ident_error.o src/libs6net/s6net_ident_error.lo: src/libs6net/s6net_ident_error.c src/include/s6-networking/ident.h
src/libs6net/s6net_ident_reply_get.o src/libs6net/s6net_ident_reply_get.lo: src/libs6net/s6net_ident_reply_get.c src/include/s6-networking/ident.h
src/libs6net/s6net_ident_reply_parse.o src/libs6net/s6net_ident_reply_parse.lo: src/libs6net/s6net_ident_reply_parse.c src/include/s6-networking/ident.h
src/minidentd/mgetuid-default.o src/minidentd/mgetuid-default.lo: src/minidentd/mgetuid-default.c src/minidentd/mgetuid.h
src/minidentd/mgetuid-linux.o src/minidentd/mgetuid-linux.lo: src/minidentd/mgetuid-linux.c src/minidentd/mgetuid.h
src/minidentd/minidentd.o src/minidentd/minidentd.lo: src/minidentd/minidentd.c src/minidentd/mgetuid.h
src/sbearssl/sbearssl_append.o src/sbearssl/sbearssl_append.lo: src/sbearssl/sbearssl_append.c src/sbearssl/sbearssl-internal.h
src/sbearssl/sbearssl_cert_from.o src/sbearssl/sbearssl_cert_from.lo: src/sbearssl/sbearssl_cert_from.c src/include/s6-networking/sbearssl.h
src/sbearssl/sbearssl_cert_readbigpem.o src/sbearssl/sbearssl_cert_readbigpem.lo: src/sbearssl/sbearssl_cert_readbigpem.c src/include/s6-networking/sbearssl.h
src/sbearssl/sbearssl_cert_readfile.o src/sbearssl/sbearssl_cert_readfile.lo: src/sbearssl/sbearssl_cert_readfile.c src/include/s6-networking/sbearssl.h
src/sbearssl/sbearssl_cert_to.o src/sbearssl/sbearssl_cert_to.lo: src/sbearssl/sbearssl_cert_to.c src/include/s6-networking/sbearssl.h
src/sbearssl/sbearssl_ec_issuer_keytype.o src/sbearssl/sbearssl_ec_issuer_keytype.lo: src/sbearssl/sbearssl_ec_issuer_keytype.c src/include/s6-networking/sbearssl.h src/sbearssl/sbearssl-internal.h
src/sbearssl/sbearssl_ec_pkey_from.o src/sbearssl/sbearssl_ec_pkey_from.lo: src/sbearssl/sbearssl_ec_pkey_from.c src/include/s6-networking/sbearssl.h
src/sbearssl/sbearssl_ec_pkey_to.o src/sbearssl/sbearssl_ec_pkey_to.lo: src/sbearssl/sbearssl_ec_pkey_to.c src/include/s6-networking/sbearssl.h
src/sbearssl/sbearssl_ec_skey_from.o src/sbearssl/sbearssl_ec_skey_from.lo: src/sbearssl/sbearssl_ec_skey_from.c src/include/s6-networking/sbearssl.h
src/sbearssl/sbearssl_ec_skey_to.o src/sbearssl/sbearssl_ec_skey_to.lo: src/sbearssl/sbearssl_ec_skey_to.c src/include/s6-networking/sbearssl.h
src/sbearssl/sbearssl_error_str.o src/sbearssl/sbearssl_error_str.lo: src/sbearssl/sbearssl_error_str.c src/include/s6-networking/sbearssl.h
src/sbearssl/sbearssl_isder.o src/sbearssl/sbearssl_isder.lo: src/sbearssl/sbearssl_isder.c src/include/s6-networking/sbearssl.h
src/sbearssl/sbearssl_pem_decode_from_buffer.o src/sbearssl/sbearssl_pem_decode_from_buffer.lo: src/sbearssl/sbearssl_pem_decode_from_buffer.c src/include/s6-networking/sbearssl.h src/sbearssl/sbearssl-internal.h
src/sbearssl/sbearssl_pem_decode_from_string.o src/sbearssl/sbearssl_pem_decode_from_string.lo: src/sbearssl/sbearssl_pem_decode_from_string.c src/include/s6-networking/sbearssl.h src/sbearssl/sbearssl-internal.h
src/sbearssl/sbearssl_pem_push.o src/sbearssl/sbearssl_pem_push.lo: src/sbearssl/sbearssl_pem_push.c src/sbearssl/sbearssl-internal.h
src/sbearssl/sbearssl_pkey_from.o src/sbearssl/sbearssl_pkey_from.lo: src/sbearssl/sbearssl_pkey_from.c src/include/s6-networking/sbearssl.h
src/sbearssl/sbearssl_pkey_to.o src/sbearssl/sbearssl_pkey_to.lo: src/sbearssl/sbearssl_pkey_to.c src/include/s6-networking/sbearssl.h
src/sbearssl/sbearssl_prep_spawn_drop.o src/sbearssl/sbearssl_prep_spawn_drop.lo: src/sbearssl/sbearssl_prep_spawn_drop.c src/sbearssl/sbearssl-internal.h
src/sbearssl/sbearssl_rsa_pkey_from.o src/sbearssl/sbearssl_rsa_pkey_from.lo: src/sbearssl/sbearssl_rsa_pkey_from.c src/include/s6-networking/sbearssl.h
src/sbearssl/sbearssl_rsa_pkey_to.o src/sbearssl/sbearssl_rsa_pkey_to.lo: src/sbearssl/sbearssl_rsa_pkey_to.c src/include/s6-networking/sbearssl.h
src/sbearssl/sbearssl_rsa_skey_from.o src/sbearssl/sbearssl_rsa_skey_from.lo: src/sbearssl/sbearssl_rsa_skey_from.c src/include/s6-networking/sbearssl.h
src/sbearssl/sbearssl_rsa_skey_to.o src/sbearssl/sbearssl_rsa_skey_to.lo: src/sbearssl/sbearssl_rsa_skey_to.c src/include/s6-networking/sbearssl.h
src/sbearssl/sbearssl_run.o src/sbearssl/sbearssl_run.lo: src/sbearssl/sbearssl_run.c src/include/s6-networking/sbearssl.h
src/sbearssl/sbearssl_s6tlsc.o src/sbearssl/sbearssl_s6tlsc.lo: src/sbearssl/sbearssl_s6tlsc.c src/include/s6-networking/sbearssl.h src/sbearssl/sbearssl-internal.h
src/sbearssl/sbearssl_s6tlsd.o src/sbearssl/sbearssl_s6tlsd.lo: src/sbearssl/sbearssl_s6tlsd.c src/include/s6-networking/sbearssl.h src/sbearssl/sbearssl-internal.h
src/sbearssl/sbearssl_skey_from.o src/sbearssl/sbearssl_skey_from.lo: src/sbearssl/sbearssl_skey_from.c src/include/s6-networking/sbearssl.h
src/sbearssl/sbearssl_skey_readfile.o src/sbearssl/sbearssl_skey_readfile.lo: src/sbearssl/sbearssl_skey_readfile.c src/include/s6-networking/sbearssl.h
src/sbearssl/sbearssl_skey_to.o src/sbearssl/sbearssl_skey_to.lo: src/sbearssl/sbearssl_skey_to.c src/include/s6-networking/sbearssl.h
src/sbearssl/sbearssl_ta_cert.o src/sbearssl/sbearssl_ta_cert.lo: src/sbearssl/sbearssl_ta_cert.c src/include/s6-networking/sbearssl.h src/sbearssl/sbearssl-internal.h
src/sbearssl/sbearssl_ta_certs.o src/sbearssl/sbearssl_ta_certs.lo: src/sbearssl/sbearssl_ta_certs.c src/include/s6-networking/sbearssl.h
src/sbearssl/sbearssl_ta_from.o src/sbearssl/sbearssl_ta_from.lo: src/sbearssl/sbearssl_ta_from.c src/include/s6-networking/sbearssl.h
src/sbearssl/sbearssl_ta_readdir.o src/sbearssl/sbearssl_ta_readdir.lo: src/sbearssl/sbearssl_ta_readdir.c src/include/s6-networking/sbearssl.h
src/sbearssl/sbearssl_ta_readfile.o src/sbearssl/sbearssl_ta_readfile.lo: src/sbearssl/sbearssl_ta_readfile.c src/include/s6-networking/sbearssl.h
src/sbearssl/sbearssl_ta_to.o src/sbearssl/sbearssl_ta_to.lo: src/sbearssl/sbearssl_ta_to.c src/include/s6-networking/sbearssl.h
src/sbearssl/sbearssl_x500_from_ta.o src/sbearssl/sbearssl_x500_from_ta.lo: src/sbearssl/sbearssl_x500_from_ta.c src/include/s6-networking/sbearssl.h
src/sbearssl/sbearssl_x500_name_len.o src/sbearssl/sbearssl_x500_name_len.lo: src/sbearssl/sbearssl_x500_name_len.c src/include/s6-networking/sbearssl.h
src/sbearssl/sbearssl_x509_minimal_set_tai.o src/sbearssl/sbearssl_x509_minimal_set_tai.lo: src/sbearssl/sbearssl_x509_minimal_set_tai.c src/include/s6-networking/sbearssl.h
src/stls/stls_prep_spawn_drop.o src/stls/stls_prep_spawn_drop.lo: src/stls/stls_prep_spawn_drop.c src/stls/stls-internal.h
src/stls/stls_run.o src/stls/stls_run.lo: src/stls/stls_run.c src/include/s6-networking/stls.h
src/stls/stls_s6tlsc.o src/stls/stls_s6tlsc.lo: src/stls/stls_s6tlsc.c src/include/s6-networking/stls.h src/stls/stls-internal.h
src/stls/stls_s6tlsd.o src/stls/stls_s6tlsd.lo: src/stls/stls_s6tlsd.c src/include/s6-networking/stls.h src/stls/stls-internal.h

s6-clockadd: EXTRA_LIBS := ${SYSCLOCK_LIB}
s6-clockadd: src/clock/s6-clockadd.o -lskarnet
s6-clockview: EXTRA_LIBS := ${SYSCLOCK_LIB}
s6-clockview: src/clock/s6-clockview.o -lskarnet
s6-sntpclock: EXTRA_LIBS := ${SOCKET_LIB} ${TAINNOW_LIB}
s6-sntpclock: src/clock/s6-sntpclock.o -lskarnet
s6-taiclock: EXTRA_LIBS := ${SOCKET_LIB} ${TAINNOW_LIB}
s6-taiclock: src/clock/s6-taiclock.o -lskarnet
s6-taiclockd: EXTRA_LIBS := ${SOCKET_LIB} ${SYSCLOCK_LIB}
s6-taiclockd: src/clock/s6-taiclockd.o -lskarnet
s6-getservbyname: EXTRA_LIBS := ${SOCKET_LIB}
s6-getservbyname: src/conn-tools/s6-getservbyname.o -lskarnet
s6-ident-client: EXTRA_LIBS := ${SOCKET_LIB} ${TAINNOW_LIB}
s6-ident-client: src/conn-tools/s6-ident-client.o ${LIBS6NET} -lskarnet
s6-tcpclient: EXTRA_LIBS := ${SOCKET_LIB} ${TAINNOW_LIB}
s6-tcpclient: src/conn-tools/s6-tcpclient.o ${LIBS6NET} -ls6dns -lskarnet
s6-tcpserver: EXTRA_LIBS :=
s6-tcpserver: src/conn-tools/s6-tcpserver.o -lskarnet
s6-tcpserver-access: EXTRA_LIBS := ${SOCKET_LIB} ${TAINNOW_LIB}
s6-tcpserver-access: src/conn-tools/s6-tcpserver-access.o ${LIBS6NET} -ls6dns -ls6 -lskarnet
s6-tcpserver4: EXTRA_LIBS := ${SOCKET_LIB}
s6-tcpserver4: src/conn-tools/s6-tcpserver4.o -lskarnet
s6-tcpserver4-socketbinder: EXTRA_LIBS := ${SOCKET_LIB}
s6-tcpserver4-socketbinder: src/conn-tools/s6-tcpserver4-socketbinder.o -lskarnet
s6-tcpserver4d: EXTRA_LIBS := ${SOCKET_LIB}
s6-tcpserver4d: src/conn-tools/s6-tcpserver4d.o -lskarnet
s6-tcpserver6: EXTRA_LIBS := ${SOCKET_LIB}
s6-tcpserver6: src/conn-tools/s6-tcpserver6.o -lskarnet
s6-tcpserver6-socketbinder: EXTRA_LIBS := ${SOCKET_LIB}
s6-tcpserver6-socketbinder: src/conn-tools/s6-tcpserver6-socketbinder.o -lskarnet
s6-tcpserver6d: EXTRA_LIBS := ${SOCKET_LIB}
s6-tcpserver6d: src/conn-tools/s6-tcpserver6d.o -lskarnet
s6-tlsc: EXTRA_LIBS := ${CRYPTO_LIB} ${SOCKET_LIB} ${SPAWN_LIB} ${TAINNOW_LIB}
s6-tlsc: src/conn-tools/s6-tlsc.o ${LIBCRYPTOSUPPORT} -lskarnet
s6-tlsclient: EXTRA_LIBS :=
s6-tlsclient: src/conn-tools/s6-tlsclient.o -lskarnet
s6-tlsd: EXTRA_LIBS := ${CRYPTO_LIB} ${SOCKET_LIB} ${SPAWN_LIB} ${TAINNOW_LIB}
s6-tlsd: src/conn-tools/s6-tlsd.o ${LIBCRYPTOSUPPORT} -lskarnet
s6-tlsserver: EXTRA_LIBS :=
s6-tlsserver: src/conn-tools/s6-tlsserver.o -lskarnet
libs6net.a.xyzzy: src/libs6net/s6net_ident_client.o src/libs6net/s6net_ident_reply_get.o src/libs6net/s6net_ident_reply_parse.o src/libs6net/s6net_ident_error.o
libs6net.so.xyzzy: EXTRA_LIBS := -lskarnet
libs6net.so.xyzzy: src/libs6net/s6net_ident_client.lo src/libs6net/s6net_ident_reply_get.lo src/libs6net/s6net_ident_reply_parse.lo src/libs6net/s6net_ident_error.lo
minidentd: EXTRA_LIBS := ${SOCKET_LIB} ${TAINNOW_LIB}
minidentd: src/minidentd/minidentd.o src/minidentd/mgetuid.o -lskarnet
libsbearssl.a.xyzzy: src/sbearssl/sbearssl_append.o src/sbearssl/sbearssl_prep_spawn_drop.o src/sbearssl/sbearssl_cert_from.o src/sbearssl/sbearssl_cert_readbigpem.o src/sbearssl/sbearssl_cert_readfile.o src/sbearssl/sbearssl_cert_to.o src/sbearssl/sbearssl_ec_issuer_keytype.o src/sbearssl/sbearssl_ec_pkey_from.o src/sbearssl/sbearssl_ec_pkey_to.o src/sbearssl/sbearssl_ec_skey_from.o src/sbearssl/sbearssl_ec_skey_to.o src/sbearssl/sbearssl_error_str.o src/sbearssl/sbearssl_isder.o src/sbearssl/sbearssl_pem_decode_from_buffer.o src/sbearssl/sbearssl_pem_decode_from_string.o src/sbearssl/sbearssl_pem_push.o src/sbearssl/sbearssl_pkey_from.o src/sbearssl/sbearssl_pkey_to.o src/sbearssl/sbearssl_rsa_pkey_from.o src/sbearssl/sbearssl_rsa_pkey_to.o src/sbearssl/sbearssl_rsa_skey_from.o src/sbearssl/sbearssl_rsa_skey_to.o src/sbearssl/sbearssl_run.o src/sbearssl/sbearssl_skey_from.o src/sbearssl/sbearssl_skey_readfile.o src/sbearssl/sbearssl_skey_to.o src/sbearssl/sbearssl_ta_cert.o src/sbearssl/sbearssl_ta_certs.o src/sbearssl/sbearssl_ta_from.o src/sbearssl/sbearssl_ta_readdir.o src/sbearssl/sbearssl_ta_readfile.o src/sbearssl/sbearssl_ta_to.o src/sbearssl/sbearssl_x500_name_len.o src/sbearssl/sbearssl_x500_from_ta.o src/sbearssl/sbearssl_x509_minimal_set_tai.o src/sbearssl/sbearssl_s6tlsc.o src/sbearssl/sbearssl_s6tlsd.o
libsbearssl.so.xyzzy: EXTRA_LIBS := -lbearssl -lskarnet
libsbearssl.so.xyzzy: src/sbearssl/sbearssl_append.lo src/sbearssl/sbearssl_prep_spawn_drop.lo src/sbearssl/sbearssl_cert_from.lo src/sbearssl/sbearssl_cert_readbigpem.lo src/sbearssl/sbearssl_cert_readfile.lo src/sbearssl/sbearssl_cert_to.lo src/sbearssl/sbearssl_ec_issuer_keytype.lo src/sbearssl/sbearssl_ec_pkey_from.lo src/sbearssl/sbearssl_ec_pkey_to.lo src/sbearssl/sbearssl_ec_skey_from.lo src/sbearssl/sbearssl_ec_skey_to.lo src/sbearssl/sbearssl_error_str.lo src/sbearssl/sbearssl_isder.lo src/sbearssl/sbearssl_pem_decode_from_buffer.lo src/sbearssl/sbearssl_pem_decode_from_string.lo src/sbearssl/sbearssl_pem_push.lo src/sbearssl/sbearssl_pkey_from.lo src/sbearssl/sbearssl_pkey_to.lo src/sbearssl/sbearssl_rsa_pkey_from.lo src/sbearssl/sbearssl_rsa_pkey_to.lo src/sbearssl/sbearssl_rsa_skey_from.lo src/sbearssl/sbearssl_rsa_skey_to.lo src/sbearssl/sbearssl_run.lo src/sbearssl/sbearssl_skey_from.lo src/sbearssl/sbearssl_skey_readfile.lo src/sbearssl/sbearssl_skey_to.lo src/sbearssl/sbearssl_ta_cert.lo src/sbearssl/sbearssl_ta_certs.lo src/sbearssl/sbearssl_ta_from.lo src/sbearssl/sbearssl_ta_readdir.lo src/sbearssl/sbearssl_ta_readfile.lo src/sbearssl/sbearssl_ta_to.lo src/sbearssl/sbearssl_x500_name_len.lo src/sbearssl/sbearssl_x500_from_ta.lo src/sbearssl/sbearssl_x509_minimal_set_tai.lo src/sbearssl/sbearssl_s6tlsc.lo src/sbearssl/sbearssl_s6tlsd.lo
libstls.a.xyzzy: src/stls/stls_prep_spawn_drop.o src/stls/stls_run.o src/stls/stls_s6tlsc.o src/stls/stls_s6tlsd.o
libstls.so.xyzzy: EXTRA_LIBS := -ltls -lskarnet
libstls.so.xyzzy: src/stls/stls_prep_spawn_drop.lo src/stls/stls_run.lo src/stls/stls_s6tlsc.lo src/stls/stls_s6tlsd.lo
