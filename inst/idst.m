## Author: Paul Kienzle <pkienzle@users.sf.net>
## 2006-12-05
##   * initial release
##
## This program is public domain

## -*- texinfo -*-
## @deftypefn {Function File} @var{y} = idst (@var{x})
## @deftypefnx {Function File} @var{y} = idst (@var{x}, @var{n})
## Computes the inverse type I discrete sine transform of @var{y}.  If @var{n} is 
## given, then @var{y} is padded or trimmed to length @var{n} before computing 
## the transform.  If @var{y} is a matrix, compute the transform along the 
## columns of the the matrix.
## @end deftypefn
## @seealso{dst}
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
