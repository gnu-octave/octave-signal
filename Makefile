include ../../Makeconf

all: remez.oct medfilt1.oct

clean: ; -$(RM) *.o core octave-core *.oct *~
