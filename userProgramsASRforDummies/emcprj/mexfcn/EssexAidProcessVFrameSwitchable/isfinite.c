/*
 * isfinite.c
 *
 * Embedded MATLAB Coder code generation for function 'isfinite'
 *
 * C source code generated on: Fri Feb 10 11:40:58 2012
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "EssexAidProcessVFrameSwitchable.h"
#include "isfinite.h"

/* Type Definitions */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */

/* Function Definitions */
boolean_T m_isfinite(real_T eml_x)
{
    return (!muDoubleScalarIsInf(eml_x)) && (!muDoubleScalarIsNaN(eml_x));
}
/* End of Embedded MATLAB Coder code generation (isfinite.c) */
