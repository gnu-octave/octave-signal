%% -*- texinfo -*-
%% @deftypefn {Function File} {} fwhm (@var{f})
%% @deftypefnx{Function File} {} fwhm (@var{x}, @var{f})
%% Return the full width at half maximum if a given signal.
%%
%% The full width at half maximum is an expression of the extent of a signal,
%% defined as the difference between the two extremal points of the signal where
%% it equals half of its maximum value.
%%
%% The signal is given by the vector @var{f} with optional @math{x}-values
%% @var{x}. If the latter is not given, it defaults to the indexes of @var{f}.
%%
%% If the full width at half maximum is not defined, the function returns 0.
%% @seealso{std}
%% @end deftypefn

%% This program is public domain.
%% Author: Christophe Cossou

function retval = fwhm (x, f)
  %% Check input
  if (nargin == 0)
    error ('fwhm: not enough input arguments');
  elseif (nargin == 1)
    f = x;
    x = 1:length (f);
  end

  if (numel (x) != numel (f))
    error ('fwhm: number of elements does not match');
  end

  %% Locate maximum
  fmax = max (f);
  f_renorm = f - 0.5 * fmax;

  ind = find (f_renorm(1:end-1) .* f_renorm (2:end) <= 0);

  %% If the product is negative, this means that the 'half-maximum' is between
  %% theses two values
  if (length (ind) == 2)
    %% We make a linear regression between the two values to get a more precise
    %% estimation of the fwhm. 
    x1 = (0.5 * fmax - f (ind (1) + 1)) * (x (ind (1) + 1) - x (ind (1))) ...
       / (f (ind (1) + 1) - f (ind (1))) + x (ind (1) + 1);
    x2 = (0.5 * fmax - f (ind (end) + 1)) * (x (ind (end) + 1) - x (ind (end))) ...
       / (f (ind (end) + 1) - f (ind (end))) + x (ind (end) + 1);
    retval = x2 - x1;
  else
    % warning ('fwhm: full width at half maximum is not defined. FWHM is set to 0');
    retval = 0;
  end

