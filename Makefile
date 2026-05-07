# Makefile for Hellpaper

CC = gcc
SRC = hellpaper.c

TARGET = hellpaper
CFLAGS = -Wall -O2 -I$(shell brew --prefix raylib)/include
LIBS = -lraylib -lm -L$(shell brew --prefix raylib)/lib -framework OpenGL -framework Cocoa -framework IOKit -framework CoreVideo

PREFIX ?= /usr/local
BINDIR = $(PREFIX)/bin

all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) $(SRC) -o $(TARGET) $(LIBS)

clean:
	@echo "Cleaning up..."
	rm -f $(TARGET)

install: $(TARGET)
	mkdir -p $(BINDIR)
	install -m 755 $(TARGET) $(BINDIR)

uninstall:
	rm -f $(BINDIR)/$(TARGET)

.PHONY: all clean install uninstall
