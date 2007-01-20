## -*- texinfo -*-
## @deftypefn {Function File} @var{y} = downsample(@var{x},@var{n})
## Downsample the signal, selecting every nth element.  If @var{x}
## is a matrix, downsample every column.
##
## For most signals you will want to use decimate() instead since
## it prefilters the high frequency components of the signal and
## avoids aliasing effects.
##
## @deftypefnx {Function File} @var{y} = downsample(@var{x},@var{n},@var{phase})
## Select every nth element starting at sample @var{phase}.
## @end deftypefn
## @seealso{decimate, interp, resample, upfirdn, upsample}

## Author: Paul Kienzle
## This function is public domain

function y = downsample(x,n,phase)
  if nargin<2 || nargin>3, usage('downsample(x,n,[phase]'); end
  if nargin==2, phase = 1; end

  if isvector(x)
    y = x(phase:n:end);
  else
    y = x(phase:n:end,:);
  end
end

%!assert(downsample([1,2,3,4,5],2),[1,3,5]);
%!assert(downsample([1;2;3;4;5],2),[1;3;5]);
%!assert(downsample([1,2;3,4;5,6;7,8;9,10],2),[1,2;5,6;9,10]);
%!assert(downsample([1,2,3,4,5],2,2),[2,4]);
%!assert(downsample([1,2;3,4;5,6;7,8;9,10],2,2),[3,4;7,8]);

