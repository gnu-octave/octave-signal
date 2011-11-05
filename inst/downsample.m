## Copyright (C) 2007 Paul Kienzle <pkienzle@users.sf.net>
## This function is public domain

## -*- texinfo -*-
## @deftypefn {Function File} @var{y} = downsample(@var{x},@var{n})
## Downsample the signal, selecting every nth element.  If @var{x}
## is a matrix, downsample every column.
##
## For most signals you will want to use decimate() instead since
## it prefilters the high frequency components of the signal and
## avoids aliasing effects.
##
## @deftypefnx {Function File} @var{y} = downsample(@var{x},@var{n},@var{offset})
## Select every nth element starting at sample @var{offset}.
## @end deftypefn
## @seealso{decimate, interp, resample, upfirdn, upsample}

function y = downsample(x,n,phase)
  if nargin<2 || nargin>3, usage('downsample(x,n,[offset]'); end
  if nargin==2, phase = 0; end

  if phase > n - 1
    warning("This is incompatible with Matlab (phase = 0:n-1). See\
    octave-forge signal package release notes for details." )
  end

  if isvector(x)
    y = x(phase + 1:n:end);
  else
    y = x(phase + 1:n:end,:);
  end
end

%!assert(downsample([1,2,3,4,5],2),[1,3,5]);
%!assert(downsample([1;2;3;4;5],2),[1;3;5]);
%!assert(downsample([1,2;3,4;5,6;7,8;9,10],2),[1,2;5,6;9,10]);
%!assert(downsample([1,2,3,4,5],2,1),[2,4]);
%!assert(downsample([1,2;3,4;5,6;7,8;9,10],2,1),[3,4;7,8]);
