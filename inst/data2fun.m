## Copyright (C) 2020 Juan Pablo Carbajal
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; see the file COPYING. If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn  {Function File} {[@var{fhandle}, @var{fullname}] =} data2fun (@var{ti}, @var{yi})
## @deftypefnx {Function File} {[@dots{}] =} data2fun (@dots{}, @var{property}, @var{value})
## Create a vectorized function based on data samples using interpolation.
##
## The values given in @var{yi} (N-by-k matrix) correspond to evaluations of the
## function y(t) at the points @var{ti} (N-by-1 matrix).
## The data is interpolated and the function handle to the generated interpolant
## is returned.
##
## The function accepts @var{property}-@var{value} pairs described below.
##
## @table @samp
## @item file
## Code is generated and .m file is created. The @var{value} contains the name
## of the function. The returned function handle is a handle to that file. If
## @var{value} is empty, then a name is automatically generated using
## @code{tempname} and the file is created in the current directory. @var{value}
## must not have an extension, since .m will be appended.
## Numerical values used in the function are stored in a .mat file with the same
## name as the function.
##
## @item interp
## Type of interpolation. See @code{interp1}.
## @end table
##
## @seealso{interp1}
## @end deftypefn

function [fhandle, fullfname] = data2fun (t, y, varargin)

  if (nargin < 2 || mod (nargin, 2) != 0)
    print_usage ();
  endif

  ## Check input arguments
  interp_args = {"spline"};
  given = struct ("file", false);

  if (! isempty (varargin))
    ## Arguments
    interp_args = varargin;

    opt_args = fieldnames (given);
    [tf, idx] = ismember (opt_args, varargin);
    for i=1:numel (opt_args)
      given.(opt_args{i}) = tf(i);
    endfor

    if (given.file)
      ## FIXME: check that file will be in the path. Otherwise fhandle(0) fails.

      if (! isempty (varargin{idx(1)+1}))
        [dir, fname] = fileparts (varargin{idx(1)+1});
      else
        [dir, fname] = fileparts (tempname (pwd (), "agen_"));
      endif

      interp_args(idx(1) + [0, 1]) = [];
    endif

    if (isempty (interp_args))
      interp_args = {"spline"};
    endif

  endif

  pp = interp1 (t, y, interp_args{end}, "pp");

  if (given.file)
    fullfname = fullfile (dir, [fname, ".m"]);
    save ("-binary", [fullfname(1:end-2), ".mat"], "pp");

    bodystr = ["  persistent pp\n" ...
               "  if (isempty (pp))\n" ...
               "    pp = load ([mfilename(), \".mat\"]).pp;\n" ...
               "  endif\n\n" ...
               "  z = ppval (pp, x);"];

    strfunc = generate_function_str (fname, {"z"}, {"x"}, bodystr);

    fid = fopen (fullfile (dir, [fname, ".m"]), "w");
    fprintf (fid, "%s", strfunc);
    fclose (fid);

    fhandle = eval (["@", fname]);
  else
    fullfname = "";
    fhandle = @(t_) ppval (pp, t_);
  endif

endfunction

function str = generate_function_str (name, oargs, iargs, bodystr)

  striargs = cell2mat (cellfun (@(x) [x ", "], iargs, "UniformOutput", false));
  striargs = striargs(1:end-2);

  stroargs = cell2mat (cellfun (@(x) [x ", "], oargs, "UniformOutput", false));
  stroargs = stroargs(1:end-2);

  if (! isempty (stroargs))
    str = ["function [" stroargs "] = " name " (" striargs ")\n\n" ...
           bodystr "\n\nendfunction"];
  else
    str = ["function " name " (" striargs ")\n\n" ...
           bodystr "\n\nendfunction"];
  endif

endfunction

%!shared t, y
%! t = linspace (0, 1, 10);
%! y = t.^2 - 2*t + 1;

%!test
%! fhandle = data2fun (t, y);
%! assert (y, fhandle (t));

%!test
%! unwind_protect
%!   # Change to temporary folder in case tester cannot write current folder
%!   olddir = pwd();
%!   cd(tempdir());
%!
%!   [fhandle fname] = data2fun (t, y, "file", "testdata2fun");
%!   yt = testdata2fun (t);
%!   assert (y, yt);
%!   assert (y, fhandle (t));
%! unwind_protect_cleanup
%!   unlink (fname);
%!   unlink ([fname(1:end-2) ".mat"]);
%!   cd(olddir)
%! end_unwind_protect

%!test
%! unwind_protect
%!   # Change to temporary folder in case tester cannot write current folder
%!   olddir = pwd();
%!   cd(tempdir());
%!
%!   [fhandle fname] = data2fun (t, y, "file", "");
%!   # generate commmand to execute using random file name
%!   cmd = sprintf ("yt = %s(t);", nthargout (2, @fileparts, fname));
%!   eval (cmd);
%!   assert (y, yt);
%!   assert (y, fhandle (t));
%! unwind_protect_cleanup
%!   unlink (fname);
%!   unlink ([fname(1:end-2) ".mat"]);
%!   cd(olddir)
%! end_unwind_protect

%!test
%! unwind_protect
%!   # Change to temporary folder in case tester cannot write current folder
%!   olddir = pwd();
%!   cd(tempdir());
%!   [fhandle fname] = data2fun (t, y, "file", "testdata2fun", "interp", "linear");
%!   yt = testdata2fun (t);
%!   assert (y, yt);
%!   assert (y, fhandle (t));
%! unwind_protect_cleanup
%!   unlink (fname);
%!   unlink ([fname(1:end-2) ".mat"]);
%!   cd(olddir)
%! end_unwind_protect

## Test input validation
%!error data2fun ()
%!error data2fun (1)
%!error data2fun (1, 2, "file")
