## Author: Paul Kienzle <pkienzle@users.sf.net> (2007)
## This program is granted to the public domain.

## -*- texinfo -*-
## @deftypefn  {Function File} {@var{y} =} downsample (@var{x}, @var{n})
## @deftypefnx {Function File} {@var{y} =} downsample (@var{x}, @var{n}, @var{phase})
## Downsample the signal, selecting every @var{n}th element.  If @var{x}
## is a matrix, downsample every column.
##
## The optional argument @var{phase} specifies the offset (0 to @var{n}-1) for
## the starting point of the downsampled sequence.  The default value is 0.
##
## @strong{Note:} This function performs simple sample selection without
## anti-aliasing filtering.  For applications where aliasing may be a concern,
## consider using @code{decimate} instead.
## @seealso{decimate, interp, resample, upfirdn, upsample}
## @end deftypefn

function y = downsample (x, n, phase = 0)

  if (nargin < 2 || nargin > 3)
    print_usage ();
  endif

  if (! (isvector (x) || ismatrix (x)))
    error ("downsample: X must be a vector or matrix");
  endif

  if (! (isscalar (n) && n > 0 && fix (n) == n))
    error ("downsample: N must be a positive integer");
  endif

  if (! (isscalar (phase) && phase >= 0 && phase < n && fix (phase) == phase))
    error ("downsample: PHASE must be an integer between 0 and N-1");
  endif

  if isvector(x)
    y = x(phase + 1:n:end);
  else
    y = x(phase + 1:n:end,:);
  endif

endfunction

%!assert(downsample([],3),[]);
%!assert(downsample([1,2,3,4,5],2),[1,3,5]);
%!assert(downsample([1;2;3;4;5],2),[1;3;5]);
%!assert(downsample([1,2;3,4;5,6;7,8;9,10],2),[1,2;5,6;9,10]);
%!assert(downsample([1,2,3,4,5],2,1),[2,4]);
%!assert(downsample([1,2;3,4;5,6;7,8;9,10],2,1),[3,4;7,8]);
