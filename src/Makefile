MKOCTFILE ?= mkoctfile

all: cl2bp.oct remez.oct medfilt1.oct sosfilt.oct upfirdn.oct

CL2BP_DEFINES =
# CL2BP_DEFINES = -DCL2BP_LOGGING

cl2bp.o: cl2bp.cc cl2bp_lib.h
	$(MKOCTFILE) -Wall $(CL2BP_DEFINES) -c $<

cl2bp_lib.o: cl2bp_lib.cc cl2bp_lib.h
	$(MKOCTFILE) -Wall $(CL2BP_DEFINES) -c $<

cl2bp.oct: cl2bp.o cl2bp_lib.o
	$(MKOCTFILE) -Wall -s $^

%.oct: %.cc
	$(MKOCTFILE) -Wall -s $<

clean: ; -rm -f *.o core octave-core *.oct *~
