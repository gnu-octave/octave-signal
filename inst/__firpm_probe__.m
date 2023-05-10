########################################################################
##
## Copyright (C) 2021 The Octave Project Developers
##
## See the file COPYRIGHT.md in the top-level directory of this
## distribution or <https://octave.org/copyright/>.
##
## This file is part of Octave.
##
## Octave is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## Octave is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with Octave; see the file COPYING.  If not, see
## <https://www.gnu.org/licenses/>.
##
########################################################################

function is_odd = __firpm_probe__ (respFn, params)
  try   symm=feval (respFn, 'defaults', params);
  catch is_odd=0; return
  end_try_catch

  if     (strcmp (symm, 'even')) is_odd=0;
  elseif (strcmp (symm, 'odd' )) is_odd=1;
  else   error ("firpm respFn symmetry must be 'even' or 'odd'")
  endif
endfunction
