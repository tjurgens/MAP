/*
 * EssexAidProcessVFrameSwitchable.h
 *
 * Embedded MATLAB Coder code generation for function 'EssexAidProcessVFrameSwitchable'
 *
 * C source code generated on: Fri Feb 10 11:40:58 2012
 *
 */

#ifndef __ESSEXAIDPROCESSVFRAMESWITCHABLE_H__
#define __ESSEXAIDPROCESSVFRAMESWITCHABLE_H__
/* Include files */
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include "mwmathutil.h"

#include "tmwtypes.h"
#include "mex.h"
#include "emlrt.h"
#include "blascompat32.h"
#include "rtwtypes.h"
#include "EssexAidProcessVFrameSwitchable_types.h"

/* Type Definitions */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern void EssexAidProcessVFrameSwitchable(real_T eml_frameBufferL[6912], real_T eml_frameBufferR[6912], real_T eml_filterStatesL[3000], real_T eml_filterStatesR[3000], const real_T eml_filterCoeffs[5000], real_T eml_numChannels, real_T eml_numSamples, real_T eml_ARampL[6912], real_T eml_ARampR[6912], real_T eml_ARthresholdPa, real_T eml_filterOrder, const real_T eml_DRNLb[11], const real_T eml_DRNLc[11], const real_T eml_MOCthreshold_dBOP[11], real_T eml_MOCfactor, real_T eml_peakIPL[11], real_T eml_peakOPL[11], real_T eml_rmsIPL[11], real_T eml_rmsOPL[11], real_T eml_peakIPR[11], real_T eml_peakOPR[11], real_T eml_rmsIPR[11], real_T eml_rmsOPR[11], real_T eml_MOCend[11], real_T eml_MOCcontrol[76032], const real_T eml_mainGain[11], boolean_T eml_useGTF);
#endif
/* End of Embedded MATLAB Coder code generation (EssexAidProcessVFrameSwitchable.h) */
