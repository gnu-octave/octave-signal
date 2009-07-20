%% Compute full-width at half maximum (FWHM) for vector or matrix data y,
%% optionally sampled as y(x). If y is a matrix, return fwhm for each column
%% as a row vector.
%%	f = fwhm(y)
%%	f = fwhm(x, y)
%%	f = fwhm(x, y, 'zero')
%%	f = fwhm(x, y, 'min')
%%
%% The default option 'zero' computes fwhm at half maximum, i.e. 0.5*max(y). 
%% The option 'min' computes fwhm at the middle curve, i.e. 0.5*(min(y)+max(y)).
%%
%% Return 0 if FWHM does not exist (e.g. monotonous function or the function
%% does not cut horizontal line at 0.5*max(y) or 0.5(max(y)+min(y)),
%% respectively).

%% Compatibility: Octave 3.x, Matlab
%% Author: Petr Mikulik
%% Version: 20. 7. 2009
%% This program is public domain.


function myfwhm = fwhm (x, y, opt)

    if nargin < 1 || nargin > 3
	error('1, 2 or 3 input arguments required');
    end
    if nargin==1
	y = x;
	x = 1:length(y);
	opt = 'zero';
    elseif nargin==2
	opt = 'zero';
    end

    if ~ischar(opt) || ~any(strcmp(opt, {'zero', 'min'}))
	error('opt must be "zero" or "min"');
    end

    [nr, nc] = size(y);
    if (nr == 1 && nc > 1)
	y = y'; nr = nc; nc = 1;
    end

    if length(x) ~= nr
	error('dimension of input arguments do not match');
    end

    % Shift matrix columns so that y(+-xfwhm) = 0:
    if strcmp(opt, 'zero')
	% case: full-width at half maximum
	y = y - 0.5 * repmat(max(y), nr, 1);
    else
	% case: full-width above background
	y = y - 0.5 * repmat((max(y) + min(y)), nr, 1);
    end

    % Trial for a "vectorizing" calculation of fwhm (i.e. all
    % columns in one shot):
    % myfwhm = zeros(1,nc); % default: 0 for fwhm undefined
    % ind = find (y(1:end-1, :) .* y(2:end, :) <= 0);
    % [r1,c1] = ind2sub(size(y), ind);
    % ... difficult to proceed further.
    % Thus calculate fwhm for each column independently:
    myfwhm = zeros(1,nc); % default: 0 for fwhm undefined
    for n=1:nc
	yy = y(:, n);
	ind = find((yy(1:end-1) .* yy(2:end)) <= 0);
	if length(ind) >= 2 && yy(ind(1)) > 0 % must start ascending
	    ind = ind(2:end);
	end
	[mx, imax] = max(yy); % protection against constant or (almost) monotonous functions
	if length(ind) >= 2 && imax > ind(1) && imax < ind(end)
	    ind1 = ind(1);
	    ind2 = ind1 + 1;
    	    xx1 = x(ind1) - yy(ind1) * (x(ind2) - x(ind1)) / (yy(ind2) - yy(ind1));
	    ind1 = ind(end);
	    ind2 = ind1 + 1;
	    xx2 = x(ind1) - yy(ind1) * (x(ind2) - x(ind1)) / (yy(ind2) - yy(ind1));
	    myfwhm(n) = xx2 - xx1;
	end
    end

%!test
%! x=-pi:0.001:pi; y=cos(x);
%! assert( abs(fwhm(x, y) - 2*pi/3) < 0.01 );
%!
%!test
%! assert( fwhm(-10:10) == 0 );
%!
%!test
%! assert( fwhm(ones(1,50)) == 0 );
%!
%!test
%! x=-20:1:20;
%! y1=-4+zeros(size(x)); y1(4:10)=8;
%! y2=-2+zeros(size(x)); y2(4:11)=2;
%! y3= 2+zeros(size(x)); y3(5:13)=10;
%! assert( max(abs(fwhm(x, [y1;y2;y3]') - [20.0/3,7.5,9.25])) < 0.01 );
%!
%!test
%! x=-10:10; assert( fwhm(x.*x) == 0 );
%!
%!test
%! x=-5:5; assert( abs( fwhm(x, 18-x.*x, 'zero') - 6.0 ) < 0.01);
%!
%!test
%! x=-5:5; assert( abs( fwhm(x, 18-x.*x, 'min') - 7.0 ) < 0.01);
