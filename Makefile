CROSS   ?=
CC       = $(CROSS)gcc
STRIP    = $(CROSS)strip

CFLAGS  ?= -O2 -Wall
LDFLAGS ?=

ifdef DEFAULT_CONF_PATH
CFLAGS += -DDEFAULT_CONF_PATH='"$(DEFAULT_CONF_PATH)"'
endif

all: bin/inetd

dir:
	mkdir -p bin

bin/inetd: src/inetd.c | dir
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)
	$(STRIP) $@

clean:
	rm -rf bin
