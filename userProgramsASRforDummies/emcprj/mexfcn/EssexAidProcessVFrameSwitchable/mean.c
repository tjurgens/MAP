/*
 * mean.c
 *
 * Embedded MATLAB Coder code generation for function 'mean'
 *
 * C source code generated on: Fri Feb 10 11:40:58 2012
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "EssexAidProcessVFrameSwitchable.h"
#include "mean.h"
#include "sum.h"
#include "filter.h"
#include "EssexAidProcessVFrameSwitchable_mexutil.h"

/* Type Definitions */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */
static emlrtRSInfo eml_ic_emlrtRSI = { 16, "mean", "C:/2010a/toolbox/eml/lib/matlab/datafun/mean.m" };
static emlrtRSInfo eml_jc_emlrtRSI = { 39, "mean", "C:/2010a/toolbox/eml/lib/matlab/datafun/mean.m" };
static emlrtMCInfo eml_o_emlrtMCI = { 16, 20, "mean", "C:/2010a/toolbox/eml/lib/matlab/datafun/mean.m" };

/* Function Declarations */

/* Function Definitions */
void m_mean(real_T eml_x_data[13824], int32_T eml_x_sizes[2], real_T eml_y_data[6912], int32_T eml_y_sizes[2])
{
    boolean_T eml_p;
    boolean_T eml_b_p;
    int32_T eml_k;
    int32_T eml_exitg1;
    const mxArray *eml_y;
    int32_T eml_iv15[2];
    const mxArray *eml_m7;
    static char_T eml_cv18[32] = { 'E', 'm', 'b', 'e', 'd', 'd', 'e', 'd', 'M', 'A', 'T', 'L', 'A', 'B', ':', 'm', 'e', 'a', 'n', 
                                           ':', 's', 'p', 'e', 'c', 'i', 'a', 'l', 'E', 'm', 'p', 't', 'y' };
    const mxArray *eml_b_y;
    static char_T eml_cv19[64] = { 'M', 'E', 'A', 'N', ' ', 'w', 'i', 't', 'h', ' ', 'o', 'n', 'e', ' ', 'v', 'a', 'r', 'i', 'a', 
                                           'b', 'l', 'e', '-', 's', 'i', 'z', 'e', ' ', 'm', 'a', 't', 'r', 'i', 'x', ' ', 'i', 'n'
                                           , 'p', 'u', 't', ' ', 'o', 'f', ' ', '[', ']', ' ', 'i', 's', ' ', 'n', 'o', 't', ' ', 
                                           's', 'u', 'p', 'p', 'o', 'r', 't', 'e', 'd', '.' };
    int32_T eml_i4;
    eml_p = FALSE;
    eml_b_p = FALSE;
    eml_k = 1;
    do {
        eml_exitg1 = 0U;
        if(eml_k <= 2) {
            if(eml_x_sizes[eml_k - 1] != 0) {
                eml_exitg1 = 1U;
            } else {
                eml_k++;
            }
        } else {
            eml_b_p = TRUE;
            eml_exitg1 = 1U;
        }
    } while(eml_exitg1 == 0U);
    if(eml_b_p) {
        eml_b_p = TRUE;
    } else {
        eml_b_p = FALSE;
    }
    if(!eml_b_p) {
    } else {
        eml_p = TRUE;
    }
    if(!eml_p) {
        eml_b_p = TRUE;
    } else {
        eml_b_p = FALSE;
    }
    if(eml_b_p) {
    } else {
        EMLRTPUSHRTSTACK(&eml_ic_emlrtRSI);
        eml_y = NULL;
        for(eml_k = 0; eml_k < 2; eml_k++) {
            eml_iv15[eml_k] = 1 + 31 * eml_k;
        }
        eml_m7 = mxCreateCharArray(2, eml_iv15);
        emlrtInitCharArray(32, eml_m7, eml_cv18);
        emlrtAssign(&eml_y, eml_m7);
        eml_b_y = NULL;
        for(eml_k = 0; eml_k < 2; eml_k++) {
            eml_iv15[eml_k] = 1 + 63 * eml_k;
        }
        eml_m7 = mxCreateCharArray(2, eml_iv15);
        emlrtInitCharArray(64, eml_m7, eml_cv19);
        emlrtAssign(&eml_b_y, eml_m7);
        m_b_error(eml_y, eml_b_y, &eml_o_emlrtMCI);
        EMLRTPOPRTSTACK(&eml_ic_emlrtRSI);
    }
    EMLRTPUSHRTSTACK(&eml_jc_emlrtRSI);
    m_sum(eml_x_data, eml_x_sizes, eml_y_data, eml_y_sizes);
    eml_y_sizes[0] = 1;
    eml_k = eml_y_sizes[1] - 1;
    for(eml_i4 = 0; eml_i4 <= eml_k; eml_i4++) {
        eml_y_data[eml_i4] /= 2.0;
    }
    EMLRTPOPRTSTACK(&eml_jc_emlrtRSI);
}
/* End of Embedded MATLAB Coder code generation (mean.c) */
