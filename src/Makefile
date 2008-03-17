all: remez.oct medfilt1.oct sosfilt.oct upfirdn.oct

%.oct: %.cc
	mkoctfile -s $<

clean: ; -rm *.o core octave-core *.oct *~
