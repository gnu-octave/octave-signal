/*

Copyright (C) 2018 Mike Miller

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; see the file COPYING.  If not, see
<https://www.gnu.org/licenses/>.

*/

#if ! defined (octave_signal_octave_compat_h)
#define octave_signal_octave_compat_h

#include <octave/lo-mappers.h>
#include <octave/version.h>

#if (! defined (OCTAVE_MAJOR_VERSION) || ! defined (OCTAVE_MINOR_VERSION) \
     || (OCTAVE_MAJOR_VERSION < 4) \
     || ((OCTAVE_MAJOR_VERSION == 4) && (OCTAVE_MINOR_VERSION < 2)))
#  include <octave/gripes.h>
#else
#  include <octave/errwarn.h>
#endif

#if (! defined (OCTAVE_MAJOR_VERSION) || ! defined (OCTAVE_MINOR_VERSION) \
     || (OCTAVE_MAJOR_VERSION < 4) \
     || ((OCTAVE_MAJOR_VERSION == 4) && (OCTAVE_MINOR_VERSION < 2)))

inline void
err_wrong_type_arg (const char *name, const octave_value& tc)
{
  gripe_wrong_type_arg (name, tc);
}

namespace octave
{
  namespace math
  {
    inline int
    nint (double x)
    {
      return NINT (x);
    }
  }
}
#endif

namespace octave
{
  namespace signal
  {

#if (! defined (OCTAVE_MAJOR_VERSION) || ! defined (OCTAVE_MINOR_VERSION) \
     || (OCTAVE_MAJOR_VERSION < 4) \
     || ((OCTAVE_MAJOR_VERSION == 4) && (OCTAVE_MINOR_VERSION < 4)))

    inline bool
    iscomplex (const octave_value& v)
    {
      return v.is_complex_type ();
    }

    inline bool
    isnumeric (const octave_value& v)
    {
      return v.is_numeric_type ();
    }

    inline bool
    isreal (const octave_value& v)
    {
      return v.is_real_type ();
    }

#else

    inline bool
    iscomplex (const octave_value& v)
    {
      return v.iscomplex ();
    }

    inline bool
    isnumeric (const octave_value& v)
    {
      return v.isnumeric ();
    }

    inline bool
    isreal (const octave_value& v)
    {
      return v.isreal ();
    }

#endif
  }
}

#endif
