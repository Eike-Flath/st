# st version
VERSION = 0.9

# Customize below to fit your system

# paths
PREFIX = $(HOME)/.local
MANPREFIX = $(PREFIX)/`[ $$(uname) = "OpenBSD" ] || echo share/`man

X11INC = /usr/X11R6/include
X11LIB = /usr/X11R6/lib

PKG_CONFIG = pkg-config

# includes and libs
INCS = -I$(X11INC) \
       `$(PKG_CONFIG) --cflags fontconfig` \
       `$(PKG_CONFIG) --cflags freetype2`
LIBS = -L$(X11LIB) -lm `[ $$(uname) = "OpenBSD" ] || echo -lrt` \
       -lX11 -lutil -lXft \
       `$(PKG_CONFIG) --libs fontconfig` \
       `$(PKG_CONFIG) --libs freetype2`
       

# flags
STCPPFLAGS = -DVERSION=\"$(VERSION)\" -D_XOPEN_SOURCE=600 \
             `[ $$(uname) = "OpenBSD" ] && echo -D_BSD_SOURCE`
CPPFLAGS = $(STCPPFLAGS)
STCFLAGS = $(INCS) $(STCPPFLAGS) $(CPPFLAGS) $(CFLAGS)
STLDFLAGS = $(LIBS) $(LDFLAGS)

# compiler and linker
# CC = c99
