/*
 * abs.c
 *
 * Embedded MATLAB Coder code generation for function 'abs'
 *
 * C source code generated on: Fri Feb 10 11:40:58 2012
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "EssexAidProcessVFrameSwitchable.h"
#include "abs.h"

/* Type Definitions */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */
static emlrtBCInfo eml_m_emlrtBCI = { -1, -1, 17, 27, "", "abs", "C:/2010a/toolbox/eml/lib/matlab/elfun/abs.m", 0 };
static emlrtBCInfo eml_n_emlrtBCI = { -1, -1, 17, 27, "", "abs", "C:/2010a/toolbox/eml/lib/matlab/elfun/abs.m", 0 };
static emlrtBCInfo eml_o_emlrtBCI = { -1, -1, 17, 5, "", "abs", "C:/2010a/toolbox/eml/lib/matlab/elfun/abs.m", 0 };
static emlrtBCInfo eml_p_emlrtBCI = { -1, -1, 17, 27, "", "abs", "C:/2010a/toolbox/eml/lib/matlab/elfun/abs.m", 0 };

/* Function Declarations */

/* Function Definitions */
void m_abs(real_T eml_x_data[6912], int32_T eml_x_sizes[2], real_T eml_y_data[6912], int32_T eml_y_sizes[2])
{
    int32_T eml_loop_ub;
    int16_T eml_iv8[2];
    int16_T eml_iv9[2];
    int16_T eml_tmp_sizes[2];
    int32_T eml_k;
    for(eml_loop_ub = 0; eml_loop_ub < 2; eml_loop_ub++) {
        eml_iv8[eml_loop_ub] = (int16_T)eml_x_sizes[eml_loop_ub];
    }
    eml_iv9[0] = 1;
    eml_iv9[1] = eml_iv8[1];
    eml_tmp_sizes[0] = 1;
    eml_tmp_sizes[1] = eml_iv9[1];
    for(eml_loop_ub = 0; eml_loop_ub < 2; eml_loop_ub++) {
        eml_y_sizes[eml_loop_ub] = eml_tmp_sizes[eml_loop_ub];
    }
    eml_loop_ub = eml_x_sizes[1];
    for(eml_k = 1; eml_k <= eml_loop_ub; eml_k++) {
        emlrtDynamicBoundsCheck(eml_k, 1, eml_x_sizes[1], &eml_m_emlrtBCI);
        emlrtDynamicBoundsCheck(eml_k, 1, eml_x_sizes[1], &eml_n_emlrtBCI);
        eml_y_data[emlrtDynamicBoundsCheck(eml_k, 1, eml_y_sizes[1], &eml_o_emlrtBCI) - 1] = muDoubleScalarAbs(eml_x_data[
            emlrtDynamicBoundsCheck(eml_k, 1, eml_x_sizes[1], &eml_p_emlrtBCI) - 1]);
    }
}
/* End of Embedded MATLAB Coder code generation (abs.c) */
