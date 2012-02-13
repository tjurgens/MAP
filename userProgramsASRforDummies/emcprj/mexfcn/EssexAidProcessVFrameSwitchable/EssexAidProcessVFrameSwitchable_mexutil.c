/*
 * EssexAidProcessVFrameSwitchable_mexutil.c
 *
 * Embedded MATLAB Coder code generation for function 'EssexAidProcessVFrameSwitchable_mexutil'
 *
 * C source code generated on: Fri Feb 10 11:40:58 2012
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "EssexAidProcessVFrameSwitchable.h"
#include "EssexAidProcessVFrameSwitchable_mexutil.h"

/* Type Definitions */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */

/* Function Definitions */
void m_b_error(const mxArray *eml_b, const mxArray *eml_c, emlrtMCInfo *eml_location)
{
    const mxArray *eml_pArrays[2];
    eml_pArrays[0] = eml_b;
    eml_pArrays[1] = eml_c;
    emlrtCallMATLAB(0, NULL, 2, eml_pArrays, "error", TRUE, eml_location);
}
void m_error(const mxArray *eml_b, emlrtMCInfo *eml_location)
{
    const mxArray *eml_pArray;
    eml_pArray = eml_b;
    emlrtCallMATLAB(0, NULL, 1, &eml_pArray, "error", TRUE, eml_location);
}
/* End of Embedded MATLAB Coder code generation (EssexAidProcessVFrameSwitchable_mexutil.c) */
