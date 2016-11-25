BIN_TARGETS := \
s6-getservbyname \
s6-ident-client \
s6-tcpclient \
s6-tcpserver \
s6-tcpserver4 \
s6-tcpserver4d \
s6-tcpserver4-socketbinder \
s6-tcpserver6 \
s6-tcpserver6d \
s6-tcpserver6-socketbinder \
s6-tcpserver-access \
s6-clockadd \
s6-clockview \
s6-sntpclock \
s6-taiclock \
s6-taiclockd \
minidentd

LIBEXEC_TARGETS :=

LIB_DEFS := S6NET=s6net

EXTRA_TARGETS := src/minidentd/mgetuid.c

src/minidentd/mgetuid.c: src/minidentd/mgetuid-linux.c src/minidentd/mgetuid-default.c
	@if grep -q -iF -- -linux $(sysdeps)/target 2>/dev/null ; then \
	  ln -sf mgetuid-linux.c src/minidentd/mgetuid.c ; \
	else \
	  ln -sf mgetuid-default.c src/minidentd/mgetuid.c ; \
	fi

ifneq ($(SSL_IMPL),)

BIN_TARGETS += s6-tlsclient s6-tlsc s6-tlsserver s6-tlsd

ifeq ($(SSL_IMPL),tls)

LIB_DEFS += STLS=stls
CRYPTO_LIB := -ltls -lssl -lcrypto
LIBCRYPTOSUPPORT := -lstls

else ifeq ($(SSL_IMPL),bearssl)

LIB_DEFS += SBEARSSL=sbearssl
CRYPTO_LIB := -lbearssl
LIBCRYPTOSUPPORT := -lsbearssl

endif
endif
