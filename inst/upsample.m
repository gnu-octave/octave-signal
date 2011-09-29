## Author: Paul Kienzle <pkienzle@users.sf.net>
## This function is public domain

## -*- texinfo -*-
## @deftypefn {Function File} @var{y} = upsample(@var{x},@var{n})
## Upsample the signal, inserting n-1 zeros between every element.  
## If @var{x} is a matrix, upsample every column.
##
## @deftypefnx {Function File} @var{y} = upsample(@var{x},@var{n},@var{offset})
## Control the position of the inserted sample in the block of n zeros.
## @end deftypefn
## @seealso{decimate, downsample, interp, resample, upfirdn}

function y = upsample(x,n,phase)
  if nargin<2 || nargin>3, usage('upsample(x,n,[phase]'); end
  if nargin==2, phase = 0; end

  if phase > n - 1
    warning("This is incompatible with Matlab (phase = 0:n-1). See\
    octave-forge signal package release notes for details." )
  end

  [nr,nc] = size(x);
  if any([nr,nc]==1),
    y = zeros(n*nr*nc,1);
    y(phase + 1:n:end) = x;
    if nr==1, y = y.'; end
  else
    y = zeros(n*nr,nc);
    y(phase + 1:n:end,:) = x;
  end
end

%!assert(upsample([1,3,5],2),[1,0,3,0,5,0]);
%!assert(upsample([1;3;5],2),[1;0;3;0;5;0]);
%!assert(upsample([1,2;5,6;9,10],2),[1,2;0,0;5,6;0,0;9,10;0,0]);
%!assert(upsample([2,4],2,1),[0,2,0,4]);
%!assert(upsample([3,4;7,8],2,1),[0,0;3,4;0,0;7,8]);

