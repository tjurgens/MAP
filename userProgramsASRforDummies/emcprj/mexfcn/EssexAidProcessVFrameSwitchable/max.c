/*
 * max.c
 *
 * Embedded MATLAB Coder code generation for function 'max'
 *
 * C source code generated on: Fri Feb 10 11:40:58 2012
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "EssexAidProcessVFrameSwitchable.h"
#include "max.h"
#include "filter.h"
#include "EssexAidProcessVFrameSwitchable_mexutil.h"

/* Type Definitions */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */
static emlrtRSInfo eml_tb_emlrtRSI = { 10, "max", "C:/2010a/toolbox/eml/lib/matlab/datafun/max.m" };
static emlrtRSInfo eml_ub_emlrtRSI = { 25, "eml_min_or_max", "C:/2010a/toolbox/eml/lib/matlab/eml/eml_min_or_max.m" };
static emlrtRSInfo eml_vb_emlrtRSI = { 60, "eml_min_or_max", "C:/2010a/toolbox/eml/lib/matlab/eml/eml_min_or_max.m" };
static emlrtRSInfo eml_wb_emlrtRSI = { 77, "eml_min_or_max", "C:/2010a/toolbox/eml/lib/matlab/eml/eml_min_or_max.m" };
static emlrtRSInfo eml_nc_emlrtRSI = { 48, "eml_min_or_max", "C:/2010a/toolbox/eml/lib/matlab/eml/eml_min_or_max.m" };
static emlrtMCInfo eml_i_emlrtMCI = { 25, 20, "eml_min_or_max", "C:/2010a/toolbox/eml/lib/matlab/eml/eml_min_or_max.m" };
static emlrtMCInfo eml_j_emlrtMCI = { 60, 20, "eml_min_or_max", "C:/2010a/toolbox/eml/lib/matlab/eml/eml_min_or_max.m" };
static emlrtBCInfo eml_q_emlrtBCI = { -1, -1, 229, 41, "", "eml_min_or_max", "C:/2010a/toolbox/eml/lib/matlab/eml/eml_min_or_max.m", 0 };
static emlrtBCInfo eml_r_emlrtBCI = { -1, -1, 229, 41, "", "eml_min_or_max", "C:/2010a/toolbox/eml/lib/matlab/eml/eml_min_or_max.m", 0 };
static emlrtBCInfo eml_s_emlrtBCI = { -1, -1, 229, 41, "", "eml_min_or_max", "C:/2010a/toolbox/eml/lib/matlab/eml/eml_min_or_max.m", 0 };
static emlrtBCInfo eml_t_emlrtBCI = { -1, -1, 230, 24, "", "eml_min_or_max", "C:/2010a/toolbox/eml/lib/matlab/eml/eml_min_or_max.m", 0 };
static emlrtBCInfo eml_u_emlrtBCI = { -1, -1, 252, 16, "", "eml_min_or_max", "C:/2010a/toolbox/eml/lib/matlab/eml/eml_min_or_max.m", 0 };
static emlrtBCInfo eml_v_emlrtBCI = { -1, -1, 253, 28, "", "eml_min_or_max", "C:/2010a/toolbox/eml/lib/matlab/eml/eml_min_or_max.m", 0 };
static emlrtBCInfo eml_pb_emlrtBCI = { -1, -1, 111, 14, "", "eml_min_or_max", "C:/2010a/toolbox/eml/lib/matlab/eml/eml_min_or_max.m", 0 };
static emlrtBCInfo eml_qb_emlrtBCI = { -1, -1, 113, 9, "", "eml_min_or_max", "C:/2010a/toolbox/eml/lib/matlab/eml/eml_min_or_max.m", 0 };
static emlrtBCInfo eml_rb_emlrtBCI = { -1, -1, 111, 14, "", "eml_min_or_max", "C:/2010a/toolbox/eml/lib/matlab/eml/eml_min_or_max.m", 0 };

/* Function Declarations */
static void m_b_eml_scalexp_alloc(real_T eml_varargin_1_data[6912], int32_T eml_varargin_1_sizes[2], real_T eml_z_data[6912], int32_T eml_z_sizes[2]);

/* Function Definitions */
static void m_b_eml_scalexp_alloc(real_T eml_varargin_1_data[6912], int32_T eml_varargin_1_sizes[2], real_T eml_z_data[6912], 
    int32_T eml_z_sizes[2])
{
    int32_T eml_i5;
    int16_T eml_iv20[2];
    int16_T eml_iv21[2];
    int16_T eml_tmp_sizes[2];
    if(!(eml_varargin_1_sizes[1] == 1)) {
        for(eml_i5 = 0; eml_i5 < 2; eml_i5++) {
            eml_iv20[eml_i5] = (int16_T)eml_varargin_1_sizes[eml_i5];
        }
        eml_iv21[0] = 1;
        eml_iv21[1] = eml_iv20[1];
        eml_tmp_sizes[0] = 1;
        eml_tmp_sizes[1] = eml_iv21[1];
        for(eml_i5 = 0; eml_i5 < 2; eml_i5++) {
            eml_z_sizes[eml_i5] = eml_tmp_sizes[eml_i5];
        }
    } else {
        for(eml_i5 = 0; eml_i5 < 2; eml_i5++) {
            eml_z_sizes[eml_i5] = 1;
        }
    }
}
void m_b_max(real_T eml_varargin_1_data[6912], int32_T eml_varargin_1_sizes[2], real_T eml_maxval_data[6912], int32_T 
    eml_maxval_sizes[2])
{
    int32_T eml_loop_ub;
    int32_T eml_k;
    EMLRTPUSHRTSTACK(&eml_nc_emlrtRSI);
    m_b_eml_scalexp_alloc(eml_varargin_1_data, eml_varargin_1_sizes, eml_maxval_data, eml_maxval_sizes);
    eml_loop_ub = eml_maxval_sizes[1];
    for(eml_k = 1; eml_k <= eml_loop_ub; eml_k++) {
        emlrtDynamicBoundsCheck(eml_k, 1, eml_varargin_1_sizes[1], &eml_pb_emlrtBCI);
        eml_maxval_data[emlrtDynamicBoundsCheck(eml_k, 1, eml_maxval_sizes[1], &eml_qb_emlrtBCI) - 1] = muDoubleScalarMax(
            eml_varargin_1_data[emlrtDynamicBoundsCheck(eml_k, 1, eml_varargin_1_sizes[1], &eml_rb_emlrtBCI) - 1], 0.0);
    }
    EMLRTPOPRTSTACK(&eml_nc_emlrtRSI);
}
real_T m_max(real_T eml_varargin_1_data[6912], int32_T eml_varargin_1_sizes[2])
{
    real_T eml_maxval;
    boolean_T eml_searchingForNonNaN;
    const mxArray *eml_y;
    int32_T eml_itmp;
    int32_T eml_iv10[2];
    const mxArray *eml_m4;
    static char_T eml_cv12[52] = { 'E', 'm', 'b', 'e', 'd', 'd', 'e', 'd', 'M', 'A', 'T', 'L', 'A', 'B', ':', 'e', 'm', 'l', '_', 
                                           'm', 'i', 'n', '_', 'o', 'r', '_', 'm', 'a', 'x', ':', 'a', 'u', 't', 'o', 'D', 'i', 'm'
                                           , 'I', 'n', 'c', 'o', 'm', 'p', 'a', 't', 'i', 'b', 'i', 'l', 'i', 't', 'y' };
    const mxArray *eml_b_y;
    static char_T eml_cv13[191] = { 'T', 'h', 'e', ' ', 'w', 'o', 'r', 'k', 'i', 'n', 'g', ' ', 'd', 'i', 'm', 'e', 'n', 's', 'i', 
                                            'o', 'n', ' ', 'w', 'a', 's', ' ', 's', 'e', 'l', 'e', 'c', 't', 'e', 'd', ' ', 'a', 'u'
                                            , 't', 'o', 'm', 'a', 't', 'i', 'c', 'a', 'l', 'l', 'y', ',', ' ', 'i', 's', ' ', 'v', 
                                            'a', 'r', 'i', 'a', 'b', 'l', 'e', '-', 'l', 'e', 'n', 'g', 't', 'h', ',', ' ', 'a', 'n'
                                            , 'd', ' ', 'h', 'a', 's', ' ', 'l', 'e', 'n', 'g', 't', 'h', ' ', '1', ' ', 'a', 't', 
                                            ' ', 'r', 'u', 'n', '-', 't', 'i', 'm', 'e', '.', ' ', 'T', 'h', 'i', 's', ' ', 'i', 's'
                                            , ' ', 'n', 'o', 't', ' ', 's', 'u', 'p', 'p', 'o', 'r', 't', 'e', 'd', '.', ' ', 'M', 
                                            'a', 'n', 'u', 'a', 'l', 'l', 'y', ' ', 's', 'e', 'l', 'e', 'c', 't', ' ', 't', 'h', 'e'
                                            , ' ', 'w', 'o', 'r', 'k', 'i', 'n', 'g', ' ', 'd', 'i', 'm', 'e', 'n', 's', 'i', 'o', 
                                            'n', ' ', 'b', 'y', ' ', 's', 'u', 'p', 'p', 'l', 'y', 'i', 'n', 'g', ' ', 't', 'h', 'e'
                                            , ' ', 'D', 'I', 'M', ' ', 'a', 'r', 'g', 'u', 'm', 'e', 'n', 't', '.' };
    const mxArray *eml_c_y;
    static char_T eml_cv14[40] = { 'E', 'm', 'b', 'e', 'd', 'd', 'e', 'd', 'M', 'A', 'T', 'L', 'A', 'B', ':', 'e', 'm', 'l', '_', 
                                           'm', 'i', 'n', '_', 'o', 'r', '_', 'm', 'a', 'x', ':', 'v', 'a', 'r', 'D', 'i', 'm', 'Z'
                                           , 'e', 'r', 'o' };
    const mxArray *eml_d_y;
    static char_T eml_cv15[102] = { 'I', 'f', ' ', 't', 'h', 'e', ' ', 'w', 'o', 'r', 'k', 'i', 'n', 'g', ' ', 'd', 'i', 'm', 'e', 
                                            'n', 's', 'i', 'o', 'n', ' ', 'o', 'f', ' ', 'M', 'A', 'X', ' ', 'o', 'r', ' ', 'M', 'I'
                                            , 'N', ' ', 'i', 's', ' ', 'v', 'a', 'r', 'i', 'a', 'b', 'l', 'e', ' ', 'i', 'n', ' ', 
                                            'l', 'e', 'n', 'g', 't', 'h', ',', ' ', 'i', 't', ' ', 'm', 'u', 's', 't', ' ', 'n', 'o'
                                            , 't', ' ', 'h', 'a', 'v', 'e', ' ', 'z', 'e', 'r', 'o', ' ', 'l', 'e', 'n', 'g', 't', 
                                            'h', ' ', 'a', 't', ' ', 'r', 'u', 'n', 't', 'i', 'm', 'e', '.' };
    int32_T eml_n;
    int32_T eml_ix;
    boolean_T eml_guard1 = FALSE;
    int32_T eml_k;
    boolean_T eml_exitg1;
    EMLRTPUSHRTSTACK(&eml_tb_emlrtRSI);
    if((eml_varargin_1_sizes[1] == 1) || (eml_varargin_1_sizes[1] != 1)) {
        eml_searchingForNonNaN = TRUE;
    } else {
        eml_searchingForNonNaN = FALSE;
    }
    if(eml_searchingForNonNaN) {
    } else {
        EMLRTPUSHRTSTACK(&eml_ub_emlrtRSI);
        eml_y = NULL;
        for(eml_itmp = 0; eml_itmp < 2; eml_itmp++) {
            eml_iv10[eml_itmp] = 1 + 51 * eml_itmp;
        }
        eml_m4 = mxCreateCharArray(2, eml_iv10);
        emlrtInitCharArray(52, eml_m4, eml_cv12);
        emlrtAssign(&eml_y, eml_m4);
        eml_b_y = NULL;
        for(eml_itmp = 0; eml_itmp < 2; eml_itmp++) {
            eml_iv10[eml_itmp] = 1 + 190 * eml_itmp;
        }
        eml_m4 = mxCreateCharArray(2, eml_iv10);
        emlrtInitCharArray(191, eml_m4, eml_cv13);
        emlrtAssign(&eml_b_y, eml_m4);
        m_b_error(eml_y, eml_b_y, &eml_i_emlrtMCI);
        EMLRTPOPRTSTACK(&eml_ub_emlrtRSI);
    }
    if(eml_varargin_1_sizes[1] > 0) {
    } else {
        EMLRTPUSHRTSTACK(&eml_vb_emlrtRSI);
        eml_c_y = NULL;
        for(eml_itmp = 0; eml_itmp < 2; eml_itmp++) {
            eml_iv10[eml_itmp] = 1 + 39 * eml_itmp;
        }
        eml_m4 = mxCreateCharArray(2, eml_iv10);
        emlrtInitCharArray(40, eml_m4, eml_cv14);
        emlrtAssign(&eml_c_y, eml_m4);
        eml_d_y = NULL;
        for(eml_itmp = 0; eml_itmp < 2; eml_itmp++) {
            eml_iv10[eml_itmp] = 1 + 101 * eml_itmp;
        }
        eml_m4 = mxCreateCharArray(2, eml_iv10);
        emlrtInitCharArray(102, eml_m4, eml_cv15);
        emlrtAssign(&eml_d_y, eml_m4);
        m_b_error(eml_c_y, eml_d_y, &eml_j_emlrtMCI);
        EMLRTPOPRTSTACK(&eml_vb_emlrtRSI);
    }
    EMLRTPUSHRTSTACK(&eml_wb_emlrtRSI);
    eml_n = eml_varargin_1_sizes[1];
    eml_maxval = eml_varargin_1_data[0];
    eml_itmp = 1;
    if(eml_n == 1) {
    } else {
        eml_ix = 1;
        eml_guard1 = FALSE;
        if(muDoubleScalarIsNaN(eml_maxval)) {
            eml_searchingForNonNaN = TRUE;
            eml_k = 2;
            eml_exitg1 = 0U;
            while((eml_exitg1 == 0U) && (eml_k <= eml_n)) {
                eml_ix++;
                emlrtDynamicBoundsCheck(eml_ix, 1, eml_varargin_1_sizes[1], &eml_q_emlrtBCI);
                emlrtDynamicBoundsCheck(eml_ix, 1, eml_varargin_1_sizes[1], &eml_r_emlrtBCI);
                if(!muDoubleScalarIsNaN(eml_varargin_1_data[emlrtDynamicBoundsCheck(eml_ix, 1, eml_varargin_1_sizes[1], &
                    eml_s_emlrtBCI) - 1])) {
                    eml_maxval = eml_varargin_1_data[emlrtDynamicBoundsCheck(eml_ix, 1, eml_varargin_1_sizes[1], &eml_t_emlrtBCI) - 
                        1];
                    eml_itmp = eml_k;
                    eml_searchingForNonNaN = FALSE;
                    eml_exitg1 = 1U;
                } else {
                    eml_k++;
                }
            }
            if(eml_searchingForNonNaN) {
            } else {
                eml_guard1 = TRUE;
            }
        } else {
            eml_guard1 = TRUE;
        }
        if(eml_guard1 == TRUE) {
            for(eml_itmp++; eml_itmp <= eml_n; eml_itmp++) {
                eml_ix++;
                if(eml_varargin_1_data[emlrtDynamicBoundsCheck(eml_ix, 1, eml_varargin_1_sizes[1], &eml_u_emlrtBCI) - 1] > 
                    eml_maxval) {
                    eml_maxval = eml_varargin_1_data[emlrtDynamicBoundsCheck(eml_ix, 1, eml_varargin_1_sizes[1], &eml_v_emlrtBCI) - 
                        1];
                }
            }
        }
    }
    EMLRTPOPRTSTACK(&eml_wb_emlrtRSI);
    EMLRTPOPRTSTACK(&eml_tb_emlrtRSI);
    return eml_maxval;
}
/* End of Embedded MATLAB Coder code generation (max.c) */
