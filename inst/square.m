## Author: Paul Kienzle <paulkienzle@Avocado.local> (2006)
## This program is granted to the public domain.

## -*- texinfo -*-
## @deftypefn  {Function File} {@var{s} =} square (@var{t}, @var{duty})
## @deftypefnx {Function File} {@var{s} =} square (@var{t})
## Generate a square wave of period 2 pi with limits +1/-1.
##
## If @var{duty} is specified, it is the percentage of time the square
## wave is "on".  The square wave is +1 for that portion of the time.
##
## @verbatim
##                   on time * 100
##    duty cycle = ------------------
##                 on time + off time
## @end verbatim
##
## @seealso{cos, sawtooth, sin, tripuls}
## @end deftypefn

function v = square (t, duty = 50)

  if (nargin < 1 || nargin > 2)
    print_usage;
  endif

  if ! (isscalar(t)  || isnumeric(t))
    error ("square: Expected t as numeric scalar");
  endif
  if ! (isscalar(duty)  || isnumeric(duty)) || duty < 0 || duty > 100
    error ("square: Expected duty as numeric scalar between 0 ..to 1");
  endif


  duty /= 100;
  t    /= 2*pi;

  v = ones(size(t));
  v(t-floor(t) >= duty) = -1;

endfunction

%!error a = square ()
%!error a = square ("test")
%!error a = square (1,2,3)
%!error a = square ([1], "t")
%!error a = square ([1], -1)
%!error a = square ([1], 101)

%!test
%! t = [0:.1:2*pi];
%! v = square(t);
%! assert(sum(v == 1), 32);
%! assert(sum(v == -1), 31);
%! v1 = square(t, 50);
%! assert(sum(v1 == 1), 32);
%! assert(sum(v1 == -1), 31);
%! v2 = square(t, 1);
%! assert(sum(v2 == 1), 1);
%! assert(sum(v2 == -1), 62);
%! v3 = square(t, 10);
%! assert(sum(v3 == 1), 7);
%! assert(sum(v3 == -1), 56);
%! v4 = square(t, 100);
%! assert(sum(v4 == 1), 63);
%! assert(sum(v4 == -1), 0);
