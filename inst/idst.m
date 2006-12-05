## x = idst (y, n)
##    Computes the inverse type I discrete sine transform of y.  If n is 
##    given, then y is padded or trimmed to length n before computing 
##    the transform.  If y is a matrix, compute the transform along the 
##    columns of the the matrix.
##
## See also: idst

## This program is public domain

## Author: Paul Kienzle
## 2006-12-05
##   * initial release
function x = idst (y, n)

  if (nargin < 1 || nargin > 2)
    usage ("x = idst(y [, n])");
  endif

  if nargin == 1,
    n = size(y,1);
    if n==1, n = size(y,2); end
  end
  x = dst(y, n) * 2/(n+1);

endfunction


%!test
%! x = log(gausswin(32));
%! assert(x, idst(dst(x)), 100*eps)
