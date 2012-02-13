/*
 * filter.h
 *
 * Embedded MATLAB Coder code generation for function 'filter'
 *
 * C source code generated on: Fri Feb 10 11:40:58 2012
 *
 */

#ifndef __FILTER_H__
#define __FILTER_H__
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
extern void m_b_filter(real_T eml_b[5], real_T eml_a[5], real_T eml_x_data[6912], int32_T eml_x_sizes[2], real_T eml_zi_data[3000], int32_T eml_zi_sizes[1], real_T eml_y_data[6912], int32_T eml_y_sizes[2], real_T eml_zf[4]);
extern void m_c_filter(real_T eml_b[2], real_T eml_a[2], real_T eml_x_data[6912], int32_T eml_x_sizes[2], real_T eml_zi, real_T eml_y_data[6912], int32_T eml_y_sizes[2], real_T *eml_zf);
extern void m_filter(real_T eml_b[2], real_T eml_a[3], real_T eml_x_data[6912], int32_T eml_x_sizes[2], real_T eml_zi_data[190], int32_T eml_zi_sizes[1], real_T eml_y_data[6912], int32_T eml_y_sizes[2], real_T eml_zf[2]);
#endif
/* End of Embedded MATLAB Coder code generation (filter.h) */
