/*
 * sign.c
 *
 * Embedded MATLAB Coder code generation for function 'sign'
 *
 * C source code generated on: Fri Feb 10 11:40:58 2012
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "EssexAidProcessVFrameSwitchable.h"
#include "sign.h"

/* Type Definitions */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */
static emlrtBCInfo eml_gd_emlrtBCI = { -1, -1, 11, 28, "", "sign", "C:/2010a/toolbox/eml/lib/matlab/elfun/sign.m", 0 };
static emlrtBCInfo eml_hd_emlrtBCI = { -1, -1, 11, 5, "", "sign", "C:/2010a/toolbox/eml/lib/matlab/elfun/sign.m", 0 };

/* Function Declarations */

/* Function Definitions */
void m_refp1_sign(real_T eml_x_data[6912], int32_T eml_x_sizes[2])
{
    int32_T eml_b_x_sizes[2];
    int32_T eml_loop_ub;
    int32_T eml_k;
    int32_T eml_c_x_sizes[2];
    real_T eml_x;
    int32_T eml_d_x_sizes[2];
    eml_b_x_sizes[0] = 1;
    eml_b_x_sizes[1] = eml_x_sizes[1];
    eml_loop_ub = eml_b_x_sizes[1];
    for(eml_k = 1; eml_k <= eml_loop_ub; eml_k++) {
        eml_c_x_sizes[0] = 1;
        eml_c_x_sizes[1] = eml_x_sizes[1];
        eml_x = eml_x_data[emlrtDynamicBoundsCheck(eml_k, 1, eml_c_x_sizes[1], &eml_gd_emlrtBCI) - 1];
        if(muDoubleScalarIsNaN(eml_x)) {
            eml_x = rtNaN;
        } else if(eml_x > 0.0) {
            eml_x = 1.0;
        } else if(eml_x < 0.0) {
            eml_x = -1.0;
        } else {
            eml_x = 0.0;
        }
        eml_d_x_sizes[0] = 1;
        eml_d_x_sizes[1] = eml_x_sizes[1];
        eml_x_data[emlrtDynamicBoundsCheck(eml_k, 1, eml_d_x_sizes[1], &eml_hd_emlrtBCI) - 1] = eml_x;
    }
}
/* End of Embedded MATLAB Coder code generation (sign.c) */
