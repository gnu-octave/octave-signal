MKOCTFILE ?= mkoctfile

all: __fwht__.oct cl2bp.oct remez.oct medfilt1.oct sosfilt.oct upfirdn.oct

%.oct: %.cc
	$(MKOCTFILE) -Wall -s $<

cl2bp.o: cl2bp.cc cl2bp_lib.h
	$(MKOCTFILE) -Wall -c $<

cl2bp_lib.o: cl2bp_lib.cc cl2bp_lib.h
	$(MKOCTFILE) -Wall -c $<

cl2bp.oct: cl2bp.o cl2bp_lib.o
	$(MKOCTFILE) -Wall -s $^

clean:
	rm -f *.o octave-core core *.oct *~
