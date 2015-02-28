MKOCTFILE ?= mkoctfile

OCT_FILES = \
  __fwht__.oct \
  __ultrwin__.oct \
  cl2bp.oct \
  medfilt1.oct \
  remez.oct \
  sosfilt.oct \
  upfirdn.oct

CL2BP_OBJECTS = cl2bp.o cl2bp_lib.o

all: $(OCT_FILES)

%.o: %.cc
	$(MKOCTFILE) -Wall -c $< -o $@

%.oct: %.cc
	$(MKOCTFILE) -Wall $< -o $@

cl2bp.oct: $(CL2BP_OBJECTS)
	$(MKOCTFILE) -Wall $^ -o $@

$(CL2BP_OBJECTS): cl2bp_lib.h

clean:
	-rm -f *.o *.oct

.PHONY: all clean
