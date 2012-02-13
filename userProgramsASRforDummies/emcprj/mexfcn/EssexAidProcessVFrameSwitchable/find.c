/*
 * find.c
 *
 * Embedded MATLAB Coder code generation for function 'find'
 *
 * C source code generated on: Fri Feb 10 11:40:58 2012
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "EssexAidProcessVFrameSwitchable.h"
#include "find.h"
#include "EssexAidProcessVFrameSwitchable_mexutil.h"

/* Type Definitions */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */
static emlrtRSInfo eml_hc_emlrtRSI = { 211, "find", "C:/2010a/toolbox/eml/lib/matlab/elmat/find.m" };
static emlrtMCInfo eml_n_emlrtMCI = { 211, 9, "find", "C:/2010a/toolbox/eml/lib/matlab/elmat/find.m" };
static emlrtBCInfo eml_w_emlrtBCI = { -1, -1, 221, 17, "", "find", "C:/2010a/toolbox/eml/lib/matlab/elmat/find.m", 0 };
static emlrtBCInfo eml_x_emlrtBCI = { -1, -1, 221, 17, "", "find", "C:/2010a/toolbox/eml/lib/matlab/elmat/find.m", 0 };
static emlrtBCInfo eml_y_emlrtBCI = { -1, -1, 203, 33, "", "find", "C:/2010a/toolbox/eml/lib/matlab/elmat/find.m", 0 };
static emlrtBCInfo eml_ab_emlrtBCI = { -1, -1, 205, 17, "", "find", "C:/2010a/toolbox/eml/lib/matlab/elmat/find.m", 0 };

/* Function Declarations */

/* Function Definitions */
void m_find(boolean_T eml_x_data[6912], int32_T eml_x_sizes[2], real_T eml_i_data[6912], int32_T eml_i_sizes[2])
{
    int32_T eml_nx;
    int32_T eml_idx;
    int32_T eml_iv12[2];
    int32_T eml_tmp_sizes[2];
    int32_T eml_ii;
    boolean_T eml_exitg1;
    boolean_T eml_guard1 = FALSE;
    const mxArray *eml_y;
    const mxArray *eml_m6;
    int32_T eml_hoistedExpr_sizes[1];
    static real_T eml_hoistedExpr_data[6912];
    int32_T eml_b_tmp_sizes[2];
    static real_T eml_tmp_data[6912];
    int32_T eml_b_i_sizes[2];
    static int32_T eml_b_i_data[6912];
    eml_nx = eml_x_sizes[1];
    eml_idx = 0;
    eml_iv12[0] = 1;
    eml_iv12[1] = eml_nx;
    eml_tmp_sizes[0] = 1;
    eml_tmp_sizes[1] = eml_iv12[1];
    for(eml_ii = 0; eml_ii < 2; eml_ii++) {
        eml_i_sizes[eml_ii] = eml_tmp_sizes[eml_ii];
    }
    eml_ii = 1;
    eml_exitg1 = 0U;
    while((eml_exitg1 == 0U) && (eml_ii <= eml_nx)) {
        eml_guard1 = FALSE;
        if(eml_x_data[emlrtDynamicBoundsCheck(eml_ii, 1, eml_x_sizes[1], &eml_y_emlrtBCI) - 1]) {
            eml_idx++;
            eml_i_data[emlrtDynamicBoundsCheck(eml_idx, 1, eml_i_sizes[1], &eml_ab_emlrtBCI) - 1] = (real_T)eml_ii;
            if(eml_idx >= eml_nx) {
                eml_exitg1 = 1U;
            } else {
                eml_guard1 = TRUE;
            }
        } else {
            eml_guard1 = TRUE;
        }
        if(eml_guard1 == TRUE) {
            eml_ii++;
        }
    }
    if(eml_idx <= eml_nx) {
    } else {
        EMLRTPUSHRTSTACK(&eml_hc_emlrtRSI);
        eml_y = NULL;
        eml_m6 = mxCreateString("Assertion failed.");
        emlrtAssign(&eml_y, eml_m6);
        m_error(eml_y, &eml_n_emlrtMCI);
        EMLRTPOPRTSTACK(&eml_hc_emlrtRSI);
    }
    if(eml_nx == 1) {
        if(eml_idx == 0) {
            eml_i_sizes[0] = 1;
            eml_i_sizes[1] = 0;
            /* Empty Loop. */
        }
    } else {
        if(1 > eml_idx) {
            eml_ii = 0;
        } else {
            eml_ii = eml_i_sizes[1];
            emlrtDynamicBoundsCheck(1, 1, eml_ii, &eml_x_emlrtBCI);
            eml_ii = emlrtDynamicBoundsCheck(eml_idx, 1, eml_ii, &eml_w_emlrtBCI);
        }
        eml_hoistedExpr_sizes[0] = eml_ii;
        eml_ii--;
        for(eml_nx = 0; eml_nx <= eml_ii; eml_nx++) {
            eml_hoistedExpr_data[eml_nx] = 1.0 + (real_T)eml_nx;
        }
        eml_b_tmp_sizes[0] = 1;
        eml_iv12[0] = 1;
        eml_iv12[1] = eml_hoistedExpr_sizes[0];
        eml_b_tmp_sizes[1] = eml_iv12[1];
        eml_ii = eml_hoistedExpr_sizes[0] - 1;
        for(eml_nx = 0; eml_nx <= eml_ii; eml_nx++) {
            eml_tmp_data[eml_nx] = eml_hoistedExpr_data[eml_nx];
        }
        eml_iv12[0] = 1;
        eml_iv12[1] = eml_b_tmp_sizes[1];
        eml_b_i_sizes[0] = 1;
        eml_b_i_sizes[1] = eml_iv12[1];
        eml_nx = eml_iv12[1] - 1;
        for(eml_ii = 0; eml_ii <= eml_nx; eml_ii++) {
            for(eml_idx = 0; eml_idx <= 0; eml_idx = 1) {
                eml_b_i_data[eml_ii] = (int32_T)eml_i_data[(int32_T)eml_tmp_data[eml_ii] - 1];
            }
        }
        eml_i_sizes[0] = 1;
        eml_i_sizes[1] = eml_b_i_sizes[1];
        eml_ii = eml_b_i_sizes[1] - 1;
        for(eml_nx = 0; eml_nx <= eml_ii; eml_nx++) {
            eml_i_data[eml_nx] = (real_T)eml_b_i_data[eml_nx];
        }
    }
}
/* End of Embedded MATLAB Coder code generation (find.c) */
