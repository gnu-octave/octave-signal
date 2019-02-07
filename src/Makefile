# Makefile for the signal package for GNU Octave
#
# Copyright (C) 2012-2019 Mike Miller
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; see the file COPYING. If not, see
# <https://www.gnu.org/licenses/>.

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

%.oct: %.cc octave-compat.h
	$(MKOCTFILE) $(CXXFLAGS_PKG) $< -o $@

cl2bp.oct: $(CL2BP_OBJECTS)
	$(MKOCTFILE) $(CXXFLAGS_PKG) $^ -o $@

$(CL2BP_OBJECTS): cl2bp_lib.h octave-compat.h

PKG_ADD PKG_DEL: $(OCT_SOURCES)
	$(SED) -n -e 's/.*$@: \(.*\)/\1/p' $^ > $@-t
	mv $@-t $@

clean:
	-rm -f *.o *.oct PKG_*

.PHONY: all clean
