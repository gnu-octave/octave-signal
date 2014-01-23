// Copyright (c) 2013 Rob Sykes <robs@users.sourceforge.net>
//
// This program is free software; you can redistribute it and/or modify it under
// the terms of the GNU General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later
// version.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
// FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
// details.
//
// You should have received a copy of the GNU General Public License along with
// this program; if not, see <http://www.gnu.org/licenses/>.

#include <octave/oct.h>
#define NDEBUG
#include "ultrwin.c"

DEFUN_DLD (__ultrwin__, args, ,
  "-*- texinfo -*-\n\
@deftypefn {Loadable Function} {} __ultrwin__ (@var{l}, @var{mu}, @var{par}, @var{par_type}, @var{norm})\n\
Undocumented internal function.\n\
@end deftypefn")
{
  octave_value_list retval;

  int nargin = args.length ();

  if (nargin != 5)
    {
      print_usage ();
      return retval;
    }

  for (octave_idx_type i = 0; i < nargin; i++)
    if (! args(i).is_real_scalar ())
      {
        print_usage ();
        return retval;
      }

  int L = args(0).scalar_value ();
  double mu = args(1).scalar_value ();
  double par = args(2).scalar_value ();
  uswpt_t par_type = static_cast<uswpt_t> (args(3).scalar_value ());
  int even_norm = args(4).scalar_value ();
  double xmu;
  double *w = ultraspherical_window (L, mu, par, par_type, even_norm, &xmu);

  if (!w)
    {
      error ("ultrwin: parameter(s) out of range");
      return retval;
    }

  ColumnVector ww (L);
  for (octave_idx_type i = 0; i < L; i++)
    ww(i) = w[i];
  free (w);

  retval(0) = ww;
  retval(1) = xmu;

  return retval;
}
