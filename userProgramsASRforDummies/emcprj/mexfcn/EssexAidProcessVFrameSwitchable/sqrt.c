/*
 * sqrt.c
 *
 * Embedded MATLAB Coder code generation for function 'sqrt'
 *
 * C source code generated on: Fri Feb 10 11:40:58 2012
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "EssexAidProcessVFrameSwitchable.h"
#include "sqrt.h"
#include "filter.h"
#include "EssexAidProcessVFrameSwitchable_mexutil.h"

/* Type Definitions */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */
static emlrtRSInfo eml_oc_emlrtRSI = { 12, "sqrt", "C:/2010a/toolbox/eml/lib/matlab/elfun/sqrt.m" };
static emlrtRSInfo eml_pc_emlrtRSI = { 12, "eml_error", "C:/2010a/toolbox/eml/lib/matlab/eml/eml_error.m" };
static emlrtMCInfo eml_q_emlrtMCI = { 12, 7, "eml_error", "C:/2010a/toolbox/eml/lib/matlab/eml/eml_error.m" };
static emlrtBCInfo eml_md_emlrtBCI = { -1, -1, 18, 28, "", "sqrt", "C:/2010a/toolbox/eml/lib/matlab/elfun/sqrt.m", 0 };
static emlrtBCInfo eml_nd_emlrtBCI = { -1, -1, 18, 5, "", "sqrt", "C:/2010a/toolbox/eml/lib/matlab/elfun/sqrt.m", 0 };
static emlrtBCInfo eml_od_emlrtBCI = { -1, -1, 18, 28, "", "sqrt", "C:/2010a/toolbox/eml/lib/matlab/elfun/sqrt.m", 0 };
static emlrtBCInfo eml_pd_emlrtBCI = { -1, -1, 11, 12, "", "sqrt", "C:/2010a/toolbox/eml/lib/matlab/elfun/sqrt.m", 0 };

/* Function Declarations */
static void m_d_eml_error(void);

/* Function Definitions */
static void m_d_eml_error(void)
{
    const mxArray *eml_y;
    int32_T eml_i8;
    int32_T eml_iv26[2];
    const mxArray *eml_m9;
    static char_T eml_cv22[31] = { 'E', 'm', 'b', 'e', 'd', 'd', 'e', 'd', 'M', 'A', 'T', 'L', 'A', 'B', ':', 's', 'q', 'r', 't', 
                                           ':', 'd', 'o', 'm', 'a', 'i', 'n', 'E', 'r', 'r', 'o', 'r' };
    const mxArray *eml_b_y;
    static char_T eml_cv23[77] = { 'D', 'o', 'm', 'a', 'i', 'n', ' ', 'e', 'r', 'r', 'o', 'r', '.', ' ', 'T', 'o', ' ', 'c', 'o', 
                                           'm', 'p', 'u', 't', 'e', ' ', 'c', 'o', 'm', 'p', 'l', 'e', 'x', ' ', 'r', 'e', 's', 'u'
                                           , 'l', 't', 's', ' ', 'f', 'r', 'o', 'm', ' ', 'r', 'e', 'a', 'l', ' ', 'x', ',', ' ', 
                                           'u', 's', 'e', ' ', '\'', 's', 'q', 'r', 't', '(', 'c', 'o', 'm', 'p', 'l', 'e', 'x', '('
                                           , 'x', ')', ')', '\'', '.' };
    EMLRTPUSHRTSTACK(&eml_pc_emlrtRSI);
    eml_y = NULL;
    for(eml_i8 = 0; eml_i8 < 2; eml_i8++) {
        eml_iv26[eml_i8] = 1 + 30 * eml_i8;
    }
    eml_m9 = mxCreateCharArray(2, eml_iv26);
    emlrtInitCharArray(31, eml_m9, eml_cv22);
    emlrtAssign(&eml_y, eml_m9);
    eml_b_y = NULL;
    for(eml_i8 = 0; eml_i8 < 2; eml_i8++) {
        eml_iv26[eml_i8] = 1 + 76 * eml_i8;
    }
    eml_m9 = mxCreateCharArray(2, eml_iv26);
    emlrtInitCharArray(77, eml_m9, eml_cv23);
    emlrtAssign(&eml_b_y, eml_m9);
    m_b_error(eml_y, eml_b_y, &eml_q_emlrtMCI);
    EMLRTPOPRTSTACK(&eml_pc_emlrtRSI);
}
void m_refp1_sqrt(real_T eml_x_data[6912], int32_T eml_x_sizes[2])
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
        if(eml_x_data[emlrtDynamicBoundsCheck(eml_k, 1, eml_c_x_sizes[1], &eml_pd_emlrtBCI) - 1] < 0.0) {
            EMLRTPUSHRTSTACK(&eml_oc_emlrtRSI);
            m_d_eml_error();
            EMLRTPOPRTSTACK(&eml_oc_emlrtRSI);
        }
    }
    eml_d_x_sizes[0] = 1;
    eml_d_x_sizes[1] = eml_x_sizes[1];
    eml_loop_ub = eml_d_x_sizes[1];
    for(eml_k = 1; eml_k <= eml_loop_ub; eml_k++) {
        eml_e_x_sizes[0] = 1;
        eml_e_x_sizes[1] = eml_x_sizes[1];
        emlrtDynamicBoundsCheck(eml_k, 1, eml_e_x_sizes[1], &eml_md_emlrtBCI);
        eml_f_x_sizes[0] = 1;
        eml_f_x_sizes[1] = eml_x_sizes[1];
        eml_g_x_sizes[0] = 1;
        eml_g_x_sizes[1] = eml_x_sizes[1];
        eml_x_data[emlrtDynamicBoundsCheck(eml_k, 1, eml_f_x_sizes[1], &eml_nd_emlrtBCI) - 1] = muDoubleScalarSqrt(eml_x_data[
            emlrtDynamicBoundsCheck(eml_k, 1, eml_g_x_sizes[1], &eml_od_emlrtBCI) - 1]);
    }
}
/* End of Embedded MATLAB Coder code generation (sqrt.c) */
