include config.mk

TARGET=$(BUILDDIR)/libdemo.so
SOURCES=$(wildcard src/scene/*.c)

CFLAGS+=$(shell pkg-config --cflags $(PKGS_MODULE)) -fPIC
LDFLAGS+=-shared
LDLIBS+=$(shell pkg-config --libs $(PKGS_MODULE))

include common.mk

.PHONY: install

# expects make -f executable.mk install to be done first for the PREFIX
install: $(TARGET)
	cp $(TARGET) $(PREFIX)/bin/
	-cp *.vert $(PREFIX)/bin/
	-cp *.frag $(PREFIX)/bin/
	-cp *.track $(PREFIX)/bin/
	-cp music.ogg $(PREFIX)/bin/
	-cp README.md $(PREFIX)/
	cp *.c $(PREFIX)/src/
	cp *.h $(PREFIX)/src/
