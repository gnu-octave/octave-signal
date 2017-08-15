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
  duty /= 100;
  t    /= 2*pi;

  v = ones(size(t));
  v(t-floor(t) >= duty) = -1;

endfunction
