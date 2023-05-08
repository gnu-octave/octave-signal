/*     mmfir.h: MiniMax FIR filter design per McClellan, Parks & Rabiner
 *        Copyright (c) 2014/15 Rob Sykes <robs@users.sourceforge.net>
 *
 * mmfir is free software; you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation; either version 3 of the License, or (at your option) any later
 * version.
 *
 * mmfir is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
 * A PARTICULAR PURPOSE. See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * this program; if not, see <http://www.gnu.org/licenses/>.                  */

#if !defined mmfir_included
#define mmfir_included



typedef enum {
  mmfirSymmetric,          /* Type I/II (symmetric impulse-response). */
  mmfirAntiSymmetric,      /* Type III/IV (anti-symmetric impulse-response). */
  mmfirDifferentiator      /* Ditto, but with passband error-weighting *= 2/f */
} mmfirFilterClass;



typedef struct {
  double freqL, freqR;     /* Frequency at left & right band-edges. In [0,1] */
  double ampL, ampR;       /* Desired amplitude of response at given edges. */
  double weightL, weightR; /* Error weighting (multiplier) at given edges. */

  /* Internal use only: */
  int ends, weightF, endP, hadRemoval;
  double eAv, ePk;
  double portion0, portion;
} mmfirBandSpec;



typedef enum {
  mmfirSuccess,

  mmfirWarning,            /* Section marker */
  mmfirGaveUp = mmfirWarning,
  mmfirGaveUp1,            /* During first pass. */

/* No filter will be returned: */
  mmfirMissedTarget,
  mmfirError,              /* Section marker */
  mmfirTooFewPeaks = mmfirError,
  mmfirTooManyPeaks,
  mmfirNumericalError,

  mmfirInvocationError,    /* Section marker */
  mmfirOutOfMemory = mmfirInvocationError,
  mmfirInvalidNumBands,
  mmfirInvalidOrder,
  mmfirInvalidFrequency,
  mmfirInvalidWeight,
  mmfirInvalidAmplitude,
  mmfirInvalidDcAmplitude,
  mmfirInvalidNyquistAmplitude,

/* Internal use only: */
  mmfirRuntimeError,
  mmfirOngoing
} mmfirResult;



typedef struct {
  /* Useful stuff: */
  mmfirResult result;      /* As defined above. */
  char const * text;       /* Textual version of result. */
  double minimax;          /* Final approximated minimax weighted error. */

  /* Academic interest: */
  int FEs;                 /* # of Lagrange interp. fn. evaluations made. */
  int iterations;          /* # of Remez iterations made. */

  double controls[3];      /* Allows client to know if these were clamped. */
} mmfirReport;



#if defined __cplusplus
extern "C"
#endif

mmfirReport mmfir(
    double            h[], /* In which to store the N filter coeffiecients. */
    mmfirFilterClass  filterClass,
    int               N, /* = filter order + 1 */
    int               numBands,
    mmfirBandSpec     bandSpecs[/* numBands */], /* N.B. destroyed. */
    double            accuracy,
    double            persistence,
    double            robustness,
    double            target,
    int               flags);



#endif
