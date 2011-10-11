/**
 * gammatone.h
 *
 * implements one branch of the gammatone filterbank as an
 * 4 times iterated complex bandpass filter of first order
 * (remark: this is a basic version, no special data types
 * (e.g. complex or structs are used)
 *
 * copyright: University of Oldenburg 1998
 * author   : vh
 * date     : Sept 1998
 */

/**
 *definitions
 *
 * filter order
 */
#define GAMMA_ORDER 4
#define GAMMA_LIMIT 24.7
#define GAMMA_Q 9.265

/**
 * declarations
 *
 * calculates gain and real and imaginary part of filter coefficient from
 * center frequency, 3 dB full bandwidth and sampling frequency in Hertz
 * (maximum gain of the filter at center frequency is set to be 0 dB)
 */
void gamma_calc_coefficent(float* pcoeff, float cf, float bw, float fs);

/**
 * calculate one branch of gammatone filterbank
 * output sample array (real and imaginary part) is calculated from
 * real input sample array using the given filter coefficients
 * (pcoeff[0]: gain, pcoeff[1]: real part, pcoeff[2]: imag. part)
 * The filter state is kept in two arrays of length GAMMA_ORDER.
 * The state must be initialized with 0 and must not be deleted or
 * changed while the filter branch calculates output.
 * (remark: call by reference is used, because parameters for many filter
 * branches can be stored in matrices and calling multiple branches with
 * many input samples gets easier)
 */
void gamma_filterbranch(double* pinsample, unsigned int inlen, float* poutsample, float* pcoeff, float* pstate_real, float* pstate_imag);

