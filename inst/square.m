## 2006-04-07 Paul Kienzle <paulkienzle@Avocado.local>
## Author: Paul Kienzle <paulkienzle@Avocado.local>
## 
## This program is public domain.

## s = square(t,duty)
## 
## Generate a square wave of period 2 pi with limits +1/-1.
##
## If the duty cycle is specified, the square wave is +1 for
## that portion of the time.
##
##                     on time
##    duty cycle = ------------------
##                 on time + off time
##


function v = square (t,duty)

  if nargin == 1,
    duty = .5;
  elseif nargin != 2,
    usage('v = square(t [, duty])');
  endif

  t /= 2*pi;
  v = ones(size(t));
  v(t-floor(t) >= duty) = -1;

endfunction
