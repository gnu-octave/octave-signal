include ../../Makeconf

all: remez.oct medfilt1.oct

clean:
	$(RM) *.oct *.o core octave-core *~
