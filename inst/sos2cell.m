## Copyright (C) 2025 Abinash Singh <abinashsinghlalotra@gmail.com>
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; see the file COPYING. If not, see
## <https:##www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {Function File} {C =} sos2cell (@var{S})
## @deftypefnx {Function File} {C =} sos2cell (@var{S}, @var{G})
## Convert a second-order-section matrix to a cell array.
##
## @var{S} is an L-by-6 matrix, where each row represents a second-order section in the form:
##
## @example
## @group
## S = [B1 A1;
##      B2 A2;
##      ...
##      BL AL]
## @end group
## @end example
##
## where @var{Bi} and @var{Ai} are the numerator and denominator coefficients of a linear
## or quadratic polynomial. The function converts this matrix into a cell array @var{C}
## with the following format:
##
## @example
## @group
## C = @{ @{B1, A1@}, @{B2, A2@}, ..., @{BL, AL@} @}
## @end group
## @end example
##
## Each element of the cell array is a cell containing a pair of vectors: @var{Bi} and @var{Ai}.
##
## If an additional gain term @var{G} is provided, the function returns:
##
## @example
## @group
## C = @{ @{G, 1@}, @{B1, A1@}, @{B2, A2@}, ..., @{BL, AL@} @}
## @end group
## @end example
##
## where @{G, 1@} represents the constant gain term applied to the filter.
##
## @example
## @group
## S = [ [1, 2, 3, 4, 5, 6];
##       [7, 8, 9, 10, 11, 12] ];
## C = sos2cell(S);
## @end group
## @end example
## @end deftypefn
function cll=sos2cell(sos ,g=1)
  if ( nargin < 1 || nargin > 2)
    print_usage();
  endif
  if ismatrix(sos) && !isnumeric(sos)
    error("sos2cell: SOS Matrix must be specified as a matrix with 6 columns")
  endif
  if isempty(g) || !isscalar(g) || !isnumeric(g)
    error("sos2cell: Gain must be a scalar value")
  endif
  [L,n] = size(sos);
  if ( n != 6 )
    error("sos2cell: SOS Matrix must be specified as a matrix with 6 columns")
  endif
  start_idx=1 ;
  if g != 1
    start_idx++;
    L++;
  endif
  cll = cell(1,L);
  if g != 1
    cll{1}={g 1};
  endif
  for i=start_idx:L
    cll{i} = {sos(i+1-start_idx,1:3) sos(i+1-start_idx,4:6)};
  endfor
endfunction
%!test # Basic conversion without gain
%! sos = [3. 6. 7. 1. 1. 2.; 1. 4. 5. 1. 9. 3.; 2. 7. 1. 1. 7. 8.];
%! cll = sos2cell(sos);
%! assert(length(cll), 3);
%! assert(length(cll{1}), 2);
%! assert(isequal(cll{1}{1}, [3., 6., 7.]));
%! assert(isequal(cll{1}{2}, [1., 1., 2.]));
%! assert(isequal(cll{2}{1}, [1., 4., 5.]));
%! assert(isequal(cll{2}{2}, [1., 9., 3.]));
%! assert(isequal(cll{3}{1}, [2., 7., 1.]));
%! assert(isequal(cll{3}{2}, [1., 7., 8.]));
%!
%!test # Conversion with non-unity gain
%! sos = [3. 6. 7. 1. 1. 2.; 1. 4. 5. 1. 9. 3.; 2. 7. 1. 1. 7. 8.];
%! g = 0.5;
%! cll = sos2cell(sos, g);
%! assert(length(cll), 4);
%! assert(isequal(cll{1}, {g, 1}));
%! assert(isequal(cll{2}{1}, [3., 6., 7.]));
%! assert(isequal(cll{2}{2}, [1., 1., 2.]));
%!
%!test 
%! [b_out, a_out] = butter(6, 0.2);
%! [sos, g] = tf2sos(b_out, a_out);
%! cll = sos2cell(sos, g);
%! assert(length(cll), length(sos(:,1)) + 1);  % +1 for gain term
%! assert(cll{1}, {g, 1});  % First element should be gain
%! assert(size(cll{2}{1}), [1, 3]);  % Each coefficient set should have 3 elements
%! assert(size(cll{2}{2}), [1, 3]);
%!
%!test # Single section SOS matrix
%! sos = [3. 6. 7. 1. 1. 2.];
%! cll = sos2cell(sos);
%! assert(length(cll), 1);
%! assert(isequal(cll{1}{1}, [3., 6., 7.]));
%! assert(isequal(cll{1}{2}, [1., 1., 2.]));
%!
%!test # Single section SOS matrix with non-unity gain
%! sos = [3. 6. 7. 1. 1. 2.];
%! g = 0.75;
%! cll = sos2cell(sos, g);
%! assert(length(cll), 2);
%! assert(isequal(cll{1}, {g, 1}));
%! assert(isequal(cll{2}{1}, [3., 6., 7.]));
%! assert(isequal(cll{2}{2}, [1., 1., 2.]));
%!
##Test input validation
%! 
%!error sos2cell([]) 
%!error sos2cell({'a', 'b', 'c'}) 
%!error sos2cell([1, 2, 3, 4, 5])
%!error  sos2cell([3. 6. 7. 1. 1. 2.], [])
%!error  sos2cell([3. 6. 7. 1. 1. 2.], 'string')
%!error  sos2cell([3. 6. 7. 1. 1. 2.], [1, 2])
%!
