/*
 * log10.c
 *
 * Embedded MATLAB Coder code generation for function 'log10'
 *
 * C source code generated on: Fri Feb 10 11:40:58 2012
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "EssexAidProcessVFrameSwitchable.h"
#include "log10.h"

/* Type Definitions */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */
static emlrtBCInfo eml_id_emlrtBCI = { -1, -1, 18, 29, "", "log10", "C:/2010a/toolbox/eml/lib/matlab/elfun/log10.m", 0 };
static emlrtBCInfo eml_jd_emlrtBCI = { -1, -1, 11, 12, "", "log10", "C:/2010a/toolbox/eml/lib/matlab/elfun/log10.m", 0 };
static emlrtBCInfo eml_kd_emlrtBCI = { -1, -1, 18, 5, "", "log10", "C:/2010a/toolbox/eml/lib/matlab/elfun/log10.m", 0 };
static emlrtBCInfo eml_ld_emlrtBCI = { -1, -1, 18, 29, "", "log10", "C:/2010a/toolbox/eml/lib/matlab/elfun/log10.m", 0 };

/* Function Declarations */

/* Function Definitions */
void m_refp1_log10(real_T eml_x_data[6912], int32_T eml_x_sizes[2])
{
    int32_T eml_b_x_sizes[2];
    int32_T eml_loop_ub;
    int32_T eml_k;
    int32_T eml_c_x_sizes[2];
    int32_T eml_d_x_sizes[2];
    int32_T eml_e_x_sizes[2];
    int32_T eml_f_x_sizes[2];
    int32_T eml_g_x_sizes[2];
    eml_b_x_sizes[0] = 1;
    eml_b_x_sizes[1] = eml_x_sizes[1];
    eml_loop_ub = eml_b_x_sizes[1];
    for(eml_k = 1; eml_k <= eml_loop_ub; eml_k++) {
        eml_c_x_sizes[0] = 1;
        eml_c_x_sizes[1] = eml_x_sizes[1];
        emlrtDynamicBoundsCheck(eml_k, 1, eml_c_x_sizes[1], &eml_jd_emlrtBCI);
    }
    eml_d_x_sizes[0] = 1;
    eml_d_x_sizes[1] = eml_x_sizes[1];
    eml_loop_ub = eml_d_x_sizes[1];
    for(eml_k = 1; eml_k <= eml_loop_ub; eml_k++) {
        eml_e_x_sizes[0] = 1;
        eml_e_x_sizes[1] = eml_x_sizes[1];
        emlrtDynamicBoundsCheck(eml_k, 1, eml_e_x_sizes[1], &eml_id_emlrtBCI);
        eml_f_x_sizes[0] = 1;
        eml_f_x_sizes[1] = eml_x_sizes[1];
        eml_g_x_sizes[0] = 1;
        eml_g_x_sizes[1] = eml_x_sizes[1];
        eml_x_data[emlrtDynamicBoundsCheck(eml_k, 1, eml_f_x_sizes[1], &eml_kd_emlrtBCI) - 1] = muDoubleScalarLog10(eml_x_data[
            emlrtDynamicBoundsCheck(eml_k, 1, eml_g_x_sizes[1], &eml_ld_emlrtBCI) - 1]);
    }
}
/* End of Embedded MATLAB Coder code generation (log10.c) */
