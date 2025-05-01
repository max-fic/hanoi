TARGETFILE = hanoi

SRCDIR = src
INCLUDEDIR = include
BUILDDIR = build
DEPDIR = deps
BINDIR = bin

SRCS = $(wildcard  $(SRCDIR)/*.c)
OBJS = $(patsubst $(SRCDIR)/%.c, $(BUILDDIR)/%.o, $(SRCS))
DEPS = $(patsubst $(SRCDIR)/%.c, $(DEPDIR)/%.d, $(SRCS))
TARGET = $(addprefix $(BINDIR)/, $(TARGETFILE))


CC=/usr/bin/clang
INCLUDELOCAL = -iquote $(INCLUDEDIR)
INCLUDESYS =
CPPFLAGS= 
CFLAGS= $(INCLUDELOCAL) -std=c11 -O3 -c
CXXFLAGS= $(INCLUDELOCAL) -std=c++17 -O3 -c
ASFLAGS=-S
LDFLAGS=

PHONYTARGETS := clean run

ifneq ($(BINDIR),.)
PHONYTARGETS := $(PHONYTARGETS) $(TARGETFILE)
$(TARGETFILE): $(TARGET)
endif

.PHONY: $(PHONYTARGETS)

.DEFAULT_GOAL := $(TARGET)

run: $(TARGET)
		$(TARGET)

$(TARGET):   $(OBJS) 
	$(CC) $(LDFLAGS) $(OBJS) -o $@

$(OBJS): | $(BINDIR) $(BUILDDIR) $(DEPDIR)

$(BINDIR):
	mkdir $(BINDIR)

$(BUILDDIR):
	mkdir $(BUILDDIR)

$(DEPDIR):
	mkdir $(DEPDIR)

$(BUILDDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(CPPFLAGS)  $(CFLAGS) -MMD -MF $(patsubst $(SRCDIR)/%.c, $(DEPDIR)/%.d, $<) $< -o $@


-include  $(DEPS)

clean:
	rm -f $(BUILDDIR)/*.[os] $(DEPDIR)/*.d $(TARGET)
