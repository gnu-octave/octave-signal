MKOCTFILE ?= mkoctfile
SED       ?= sed

CXXFLAGS_PKG := -Wall -Wno-deprecated-declarations $(CXXFLAGS_PKG_APPEND)

OCT_FILES = \
  __fwht__.oct \
  __ultrwin__.oct \
  cl2bp.oct \
  medfilt1.oct \
  remez.oct \
  sosfilt.oct \
  upfirdn.oct

CL2BP_OBJECTS = cl2bp.o cl2bp_lib.o

OCT_SOURCES = $(patsubst %.oct,%.cc,$(OCT_FILES))

all: $(OCT_FILES)

%.o: %.cc
	$(MKOCTFILE) $(CXXFLAGS_PKG) -c $< -o $@

%.oct: %.cc
	$(MKOCTFILE) $(CXXFLAGS_PKG) $< -o $@

cl2bp.oct: $(CL2BP_OBJECTS)
	$(MKOCTFILE) $(CXXFLAGS_PKG) $^ -o $@

$(CL2BP_OBJECTS): cl2bp_lib.h

PKG_ADD PKG_DEL: $(OCT_SOURCES)
	$(SED) -n -e 's/.*$@: \(.*\)/\1/p' $^ > $@-t
	mv $@-t $@

clean:
	-rm -f *.o *.oct PKG_*

.PHONY: all clean
