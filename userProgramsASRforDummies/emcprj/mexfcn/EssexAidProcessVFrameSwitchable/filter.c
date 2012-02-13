/*
 * filter.c
 *
 * Embedded MATLAB Coder code generation for function 'filter'
 *
 * C source code generated on: Fri Feb 10 11:40:58 2012
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "EssexAidProcessVFrameSwitchable.h"
#include "filter.h"
#include "isfinite.h"
#include "EssexAidProcessVFrameSwitchable_mexutil.h"

/* Type Definitions */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */
static emlrtRSInfo eml_jb_emlrtRSI = { 59, "filter", "C:/2010a/toolbox/eml/lib/matlab/datafun/filter.m" };
static emlrtRSInfo eml_kb_emlrtRSI = { 91, "filter", "C:/2010a/toolbox/eml/lib/matlab/datafun/filter.m" };
static emlrtRSInfo eml_lb_emlrtRSI = { 108, "filter", "C:/2010a/toolbox/eml/lib/matlab/datafun/filter.m" };
static emlrtRSInfo eml_mb_emlrtRSI = { 111, "filter", "C:/2010a/toolbox/eml/lib/matlab/datafun/filter.m" };
static emlrtRSInfo eml_nb_emlrtRSI = { 12, "eml_error", "C:/2010a/toolbox/eml/lib/matlab/eml/eml_error.m" };
static emlrtRSInfo eml_ob_emlrtRSI = { 12, "eml_error", "C:/2010a/toolbox/eml/lib/matlab/eml/eml_error.m" };
static emlrtRSInfo eml_pb_emlrtRSI = { 59, "filter", "C:/2010a/toolbox/eml/lib/matlab/datafun/filter.m" };
static emlrtRSInfo eml_qb_emlrtRSI = { 91, "filter", "C:/2010a/toolbox/eml/lib/matlab/datafun/filter.m" };
static emlrtRSInfo eml_rb_emlrtRSI = { 108, "filter", "C:/2010a/toolbox/eml/lib/matlab/datafun/filter.m" };
static emlrtRSInfo eml_sb_emlrtRSI = { 111, "filter", "C:/2010a/toolbox/eml/lib/matlab/datafun/filter.m" };
static emlrtRSInfo eml_kc_emlrtRSI = { 59, "filter", "C:/2010a/toolbox/eml/lib/matlab/datafun/filter.m" };
static emlrtRSInfo eml_lc_emlrtRSI = { 108, "filter", "C:/2010a/toolbox/eml/lib/matlab/datafun/filter.m" };
static emlrtRSInfo eml_mc_emlrtRSI = { 111, "filter", "C:/2010a/toolbox/eml/lib/matlab/datafun/filter.m" };
static emlrtMCInfo eml_c_emlrtMCI = { 59, 24, "filter", "C:/2010a/toolbox/eml/lib/matlab/datafun/filter.m" };
static emlrtMCInfo eml_d_emlrtMCI = { 91, 20, "filter", "C:/2010a/toolbox/eml/lib/matlab/datafun/filter.m" };
static emlrtMCInfo eml_e_emlrtMCI = { 12, 7, "eml_error", "C:/2010a/toolbox/eml/lib/matlab/eml/eml_error.m" };
static emlrtMCInfo eml_f_emlrtMCI = { 12, 7, "eml_error", "C:/2010a/toolbox/eml/lib/matlab/eml/eml_error.m" };
static emlrtMCInfo eml_g_emlrtMCI = { 59, 24, "filter", "C:/2010a/toolbox/eml/lib/matlab/datafun/filter.m" };
static emlrtMCInfo eml_h_emlrtMCI = { 91, 20, "filter", "C:/2010a/toolbox/eml/lib/matlab/datafun/filter.m" };
static emlrtMCInfo eml_p_emlrtMCI = { 59, 24, "filter", "C:/2010a/toolbox/eml/lib/matlab/datafun/filter.m" };
static emlrtBCInfo eml_emlrtBCI = { -1, -1, 158, 39, "", "filter", "C:/2010a/toolbox/eml/lib/matlab/datafun/filter.m", 0 };
static emlrtBCInfo eml_b_emlrtBCI = { -1, -1, 158, 39, "", "filter", "C:/2010a/toolbox/eml/lib/matlab/datafun/filter.m", 0 };
static emlrtBCInfo eml_c_emlrtBCI = { -1, -1, 163, 9, "", "filter", "C:/2010a/toolbox/eml/lib/matlab/datafun/filter.m", 0 };
static emlrtBCInfo eml_d_emlrtBCI = { -1, -1, 158, 39, "", "filter", "C:/2010a/toolbox/eml/lib/matlab/datafun/filter.m", 0 };
static emlrtBCInfo eml_e_emlrtBCI = { -1, -1, 143, 28, "", "filter", "C:/2010a/toolbox/eml/lib/matlab/datafun/filter.m", 0 };
static emlrtBCInfo eml_f_emlrtBCI = { -1, -1, 158, 39, "", "filter", "C:/2010a/toolbox/eml/lib/matlab/datafun/filter.m", 0 };
static emlrtBCInfo eml_g_emlrtBCI = { -1, -1, 158, 39, "", "filter", "C:/2010a/toolbox/eml/lib/matlab/datafun/filter.m", 0 };
static emlrtBCInfo eml_h_emlrtBCI = { -1, -1, 158, 39, "", "filter", "C:/2010a/toolbox/eml/lib/matlab/datafun/filter.m", 0 };
static emlrtBCInfo eml_i_emlrtBCI = { -1, -1, 163, 9, "", "filter", "C:/2010a/toolbox/eml/lib/matlab/datafun/filter.m", 0 };
static emlrtBCInfo eml_j_emlrtBCI = { -1, -1, 158, 39, "", "filter", "C:/2010a/toolbox/eml/lib/matlab/datafun/filter.m", 0 };
static emlrtBCInfo eml_k_emlrtBCI = { -1, -1, 143, 28, "", "filter", "C:/2010a/toolbox/eml/lib/matlab/datafun/filter.m", 0 };
static emlrtBCInfo eml_l_emlrtBCI = { -1, -1, 158, 39, "", "filter", "C:/2010a/toolbox/eml/lib/matlab/datafun/filter.m", 0 };
static emlrtBCInfo eml_kb_emlrtBCI = { -1, -1, 158, 39, "", "filter", "C:/2010a/toolbox/eml/lib/matlab/datafun/filter.m", 0 };
static emlrtBCInfo eml_lb_emlrtBCI = { -1, -1, 158, 39, "", "filter", "C:/2010a/toolbox/eml/lib/matlab/datafun/filter.m", 0 };
static emlrtBCInfo eml_mb_emlrtBCI = { -1, -1, 163, 9, "", "filter", "C:/2010a/toolbox/eml/lib/matlab/datafun/filter.m", 0 };
static emlrtBCInfo eml_nb_emlrtBCI = { -1, -1, 158, 39, "", "filter", "C:/2010a/toolbox/eml/lib/matlab/datafun/filter.m", 0 };
static emlrtBCInfo eml_ob_emlrtBCI = { -1, -1, 158, 39, "", "filter", "C:/2010a/toolbox/eml/lib/matlab/datafun/filter.m", 0 };

/* Function Declarations */
static void m_b_eml_error(void);
static void m_eml_error(void);

/* Function Definitions */
static void m_b_eml_error(void)
{
    const mxArray *eml_y;
    int32_T eml_i1;
    int32_T eml_iv4[2];
    const mxArray *eml_m2;
    static char_T eml_cv6[49] = { 'M', 'A', 'T', 'L', 'A', 'B', ':', 'f', 'i', 'l', 't', 'e', 'r', ':', 'f', 'i', 'r', 's', 't', 'E'
                                          , 'l', 'e', 'm', 'e', 'n', 't', 'O', 'f', 'D', 'e', 'n', 'o', 'm', 'i', 'n', 'a', 't', 'o'
                                          , 'r', 'F', 'i', 'l', 't', 'e', 'r', 'Z', 'e', 'r', 'o' };
    const mxArray *eml_b_y;
    static char_T eml_cv7[54] = { 'F', 'i', 'r', 's', 't', ' ', 'd', 'e', 'n', 'o', 'm', 'i', 'n', 'a', 't', 'o', 'r', ' ', 'f', 'i'
                                          , 'l', 't', 'e', 'r', ' ', 'c', 'o', 'e', 'f', 'f', 'i', 'c', 'i', 'e', 'n', 't', ' ', 'm'
                                          , 'u', 's', 't', ' ', 'b', 'e', ' ', 'n', 'o', 'n', '-', 'z', 'e', 'r', 'o', '.' };
    EMLRTPUSHRTSTACK(&eml_ob_emlrtRSI);
    eml_y = NULL;
    for(eml_i1 = 0; eml_i1 < 2; eml_i1++) {
        eml_iv4[eml_i1] = 1 + 48 * eml_i1;
    }
    eml_m2 = mxCreateCharArray(2, eml_iv4);
    emlrtInitCharArray(49, eml_m2, eml_cv6);
    emlrtAssign(&eml_y, eml_m2);
    eml_b_y = NULL;
    for(eml_i1 = 0; eml_i1 < 2; eml_i1++) {
        eml_iv4[eml_i1] = 1 + 53 * eml_i1;
    }
    eml_m2 = mxCreateCharArray(2, eml_iv4);
    emlrtInitCharArray(54, eml_m2, eml_cv7);
    emlrtAssign(&eml_b_y, eml_m2);
    m_b_error(eml_y, eml_b_y, &eml_f_emlrtMCI);
    EMLRTPOPRTSTACK(&eml_ob_emlrtRSI);
}
static void m_eml_error(void)
{
    const mxArray *eml_y;
    int32_T eml_i0;
    int32_T eml_iv3[2];
    const mxArray *eml_m1;
    static char_T eml_cv4[54] = { 'M', 'A', 'T', 'L', 'A', 'B', ':', 'f', 'i', 'l', 't', 'e', 'r', ':', 'f', 'i', 'r', 's', 't', 'E'
                                          , 'l', 'e', 'm', 'e', 'n', 't', 'O', 'f', 'D', 'e', 'n', 'o', 'm', 'i', 'n', 'a', 't', 'o'
                                          , 'r', 'F', 'i', 'l', 't', 'e', 'r', 'N', 'o', 't', 'F', 'i', 'n', 'i', 't', 'e' };
    const mxArray *eml_b_y;
    static char_T eml_cv5[52] = { 'F', 'i', 'r', 's', 't', ' ', 'd', 'e', 'n', 'o', 'm', 'i', 'n', 'a', 't', 'o', 'r', ' ', 'f', 'i'
                                          , 'l', 't', 'e', 'r', ' ', 'c', 'o', 'e', 'f', 'f', 'i', 'c', 'i', 'e', 'n', 't', ' ', 'm'
                                          , 'u', 's', 't', ' ', 'b', 'e', ' ', 'f', 'i', 'n', 'i', 't', 'e', '.' };
    EMLRTPUSHRTSTACK(&eml_nb_emlrtRSI);
    eml_y = NULL;
    for(eml_i0 = 0; eml_i0 < 2; eml_i0++) {
        eml_iv3[eml_i0] = 1 + 53 * eml_i0;
    }
    eml_m1 = mxCreateCharArray(2, eml_iv3);
    emlrtInitCharArray(54, eml_m1, eml_cv4);
    emlrtAssign(&eml_y, eml_m1);
    eml_b_y = NULL;
    for(eml_i0 = 0; eml_i0 < 2; eml_i0++) {
        eml_iv3[eml_i0] = 1 + 51 * eml_i0;
    }
    eml_m1 = mxCreateCharArray(2, eml_iv3);
    emlrtInitCharArray(52, eml_m1, eml_cv5);
    emlrtAssign(&eml_b_y, eml_m1);
    m_b_error(eml_y, eml_b_y, &eml_e_emlrtMCI);
    EMLRTPOPRTSTACK(&eml_nb_emlrtRSI);
}
void m_b_filter(real_T eml_b[5], real_T eml_a[5], real_T eml_x_data[6912], int32_T eml_x_sizes[2], real_T eml_zi_data[3000], int32_T
     eml_zi_sizes[1], real_T eml_y_data[6912], int32_T eml_y_sizes[2], real_T eml_zf[4])
{
    boolean_T eml_b1;
    const mxArray *eml_y;
    int32_T eml_k;
    int32_T eml_iv5[2];
    const mxArray *eml_m3;
    static char_T eml_cv8[44] = { 'E', 'm', 'b', 'e', 'd', 'd', 'e', 'd', 'M', 'A', 'T', 'L', 'A', 'B', ':', 'f', 'i', 'l', 't', 'e'
                                          , 'r', ':', 'a', 'u', 't', 'o', 'D', 'i', 'm', 'I', 'n', 'c', 'o', 'm', 'p', 'a', 't', 'i'
                                          , 'b', 'i', 'l', 'i', 't', 'y' };
    const mxArray *eml_b_y;
    static char_T eml_cv9[191] = { 'T', 'h', 'e', ' ', 'w', 'o', 'r', 'k', 'i', 'n', 'g', ' ', 'd', 'i', 'm', 'e', 'n', 's', 'i', 
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
    static char_T eml_cv10[38] = { 'M', 'A', 'T', 'L', 'A', 'B', ':', 'f', 'i', 'l', 't', 'e', 'r', ':', 'i', 'n', 'v', 'a', 'l', 
                                           'i', 'd', 'I', 'n', 'i', 't', 'i', 'a', 'l', 'C', 'o', 'n', 'd', 'i', 't', 'i', 'o', 'n'
                                           , 's' };
    const mxArray *eml_d_y;
    static char_T eml_cv11[200] = { 'I', 'n', 'i', 't', 'i', 'a', 'l', ' ', 'c', 'o', 'n', 'd', 'i', 't', 'i', 'o', 'n', 's', ' ', 
                                            'm', 'u', 's', 't', ' ', 'b', 'e', ' ', 'a', ' ', 'v', 'e', 'c', 't', 'o', 'r', ' ', 'o'
                                            , 'f', ' ', 'l', 'e', 'n', 'g', 't', 'h', ' ', 'm', 'a', 'x', '(', 'l', 'e', 'n', 'g', 
                                            't', 'h', '(', 'a', ')', ',', 'l', 'e', 'n', 'g', 't', 'h', '(', 'b', ')', ')', '-', '1'
                                            , ',', '\\', 'n', 'o', 'r', ' ', 'a', 'n', ' ', 'a', 'r', 'r', 'a', 'y', ' ', 'w', 'i', 
                                            't', 'h', ' ', 't', 'h', 'e', ' ', 'l', 'e', 'a', 'd', 'i', 'n', 'g', ' ', 'd', 'i', 'm'
                                            , 'e', 'n', 's', 'i', 'o', 'n', ' ', 'o', 'f', ' ', 's', 'i', 'z', 'e', ' ', 'm', 'a', 
                                            'x', '(', 'l', 'e', 'n', 'g', 't', 'h', '(', 'a', ')', ',', 'l', 'e', 'n', 'g', 't', 'h'
                                            , '(', 'b', ')', ')', '-', '1', '\\', 'n', 'a', 'n', 'd', ' ', 'w', 'i', 't', 'h', ' ', 
                                            'r', 'e', 'm', 'a', 'i', 'n', 'i', 'n', 'g', ' ', 'd', 'i', 'm', 'e', 'n', 's', 'i', 'o'
                                            , 'n', 's', ' ', 'm', 'a', 't', 'c', 'h', 'i', 'n', 'g', ' ', 't', 'h', 'o', 's', 'e', 
                                            ' ', 'o', 'f', ' ', 'x', '.' };
    real_T eml_a1;
    int16_T eml_iv6[2];
    int16_T eml_iv7[2];
    int16_T eml_tmp_sizes[2];
    int32_T eml_nx;
    real_T eml_dbuffer[5];
    int32_T eml_j;
    if((eml_x_sizes[1] == 1) || (eml_x_sizes[1] != 1)) {
        eml_b1 = TRUE;
    } else {
        eml_b1 = FALSE;
    }
    if(eml_b1) {
    } else {
        EMLRTPUSHRTSTACK(&eml_pb_emlrtRSI);
        eml_y = NULL;
        for(eml_k = 0; eml_k < 2; eml_k++) {
            eml_iv5[eml_k] = 1 + 43 * eml_k;
        }
        eml_m3 = mxCreateCharArray(2, eml_iv5);
        emlrtInitCharArray(44, eml_m3, eml_cv8);
        emlrtAssign(&eml_y, eml_m3);
        eml_b_y = NULL;
        for(eml_k = 0; eml_k < 2; eml_k++) {
            eml_iv5[eml_k] = 1 + 190 * eml_k;
        }
        eml_m3 = mxCreateCharArray(2, eml_iv5);
        emlrtInitCharArray(191, eml_m3, eml_cv9);
        emlrtAssign(&eml_b_y, eml_m3);
        m_b_error(eml_y, eml_b_y, &eml_g_emlrtMCI);
        EMLRTPOPRTSTACK(&eml_pb_emlrtRSI);
    }
    if(eml_zi_sizes[0] == 4) {
    } else {
        EMLRTPUSHRTSTACK(&eml_qb_emlrtRSI);
        eml_c_y = NULL;
        for(eml_k = 0; eml_k < 2; eml_k++) {
            eml_iv5[eml_k] = 1 + 37 * eml_k;
        }
        eml_m3 = mxCreateCharArray(2, eml_iv5);
        emlrtInitCharArray(38, eml_m3, eml_cv10);
        emlrtAssign(&eml_c_y, eml_m3);
        eml_d_y = NULL;
        for(eml_k = 0; eml_k < 2; eml_k++) {
            eml_iv5[eml_k] = 1 + 199 * eml_k;
        }
        eml_m3 = mxCreateCharArray(2, eml_iv5);
        emlrtInitCharArray(200, eml_m3, eml_cv11);
        emlrtAssign(&eml_d_y, eml_m3);
        m_b_error(eml_c_y, eml_d_y, &eml_h_emlrtMCI);
        EMLRTPOPRTSTACK(&eml_qb_emlrtRSI);
    }
    eml_a1 = eml_a[0];
    if(!m_isfinite(eml_a1)) {
        EMLRTPUSHRTSTACK(&eml_rb_emlrtRSI);
        m_eml_error();
        EMLRTPOPRTSTACK(&eml_rb_emlrtRSI);
    } else if(eml_a1 == 0.0) {
        EMLRTPUSHRTSTACK(&eml_sb_emlrtRSI);
        m_b_eml_error();
        EMLRTPOPRTSTACK(&eml_sb_emlrtRSI);
    } else {
        if(eml_a1 != 1.0) {
            for(eml_k = 0; eml_k < 5; eml_k++) {
                eml_b[eml_k] /= eml_a1;
            }
            for(eml_k = 2; eml_k < 6; eml_k++) {
                eml_a[eml_k - 1] /= eml_a1;
            }
            eml_a[0] = 1.0;
        }
    }
    for(eml_k = 0; eml_k < 2; eml_k++) {
        eml_iv6[eml_k] = (int16_T)eml_x_sizes[eml_k];
    }
    eml_iv7[0] = 1;
    eml_iv7[1] = eml_iv6[1];
    eml_tmp_sizes[0] = 1;
    eml_tmp_sizes[1] = eml_iv7[1];
    for(eml_k = 0; eml_k < 2; eml_k++) {
        eml_y_sizes[eml_k] = eml_tmp_sizes[eml_k];
    }
    eml_nx = eml_x_sizes[1];
    for(eml_k = 0; eml_k < 4; eml_k++) {
        eml_dbuffer[eml_k + 1] = eml_zi_data[emlrtDynamicBoundsCheck(eml_k + 1, 1, eml_zi_sizes[0], &eml_k_emlrtBCI) - 1];
    }
    for(eml_j = 1; eml_j <= eml_nx; eml_j++) {
        for(eml_k = 0; eml_k < 4; eml_k++) {
            eml_dbuffer[eml_k] = eml_dbuffer[eml_k + 1];
        }
        eml_dbuffer[4] = 0.0;
        for(eml_k = 0; eml_k < 5; eml_k++) {
            emlrtDynamicBoundsCheck(eml_j, 1, eml_x_sizes[1], &eml_g_emlrtBCI);
            emlrtDynamicBoundsCheck(eml_j, 1, eml_x_sizes[1], &eml_h_emlrtBCI);
            emlrtDynamicBoundsCheck(eml_j, 1, eml_x_sizes[1], &eml_j_emlrtBCI);
            eml_dbuffer[eml_k] += eml_x_data[emlrtDynamicBoundsCheck(eml_j, 1, eml_x_sizes[1], &eml_l_emlrtBCI) - 1] * eml_b[eml_k];
        }
        for(eml_k = 2; eml_k < 6; eml_k++) {
            eml_dbuffer[eml_k - 1] -= eml_dbuffer[0] * eml_a[eml_k - 1];
        }
        eml_y_data[emlrtDynamicBoundsCheck(eml_j, 1, eml_y_sizes[1], &eml_i_emlrtBCI) - 1] = eml_dbuffer[0];
    }
    for(eml_k = 0; eml_k < 4; eml_k++) {
        eml_zf[eml_k] = eml_dbuffer[eml_k + 1];
    }
}
void m_c_filter(real_T eml_b[2], real_T eml_a[2], real_T eml_x_data[6912], int32_T eml_x_sizes[2], real_T eml_zi, real_T eml_y_data[
    6912], int32_T eml_y_sizes[2], real_T *eml_zf)
{
    boolean_T eml_b2;
    const mxArray *eml_y;
    int32_T eml_k;
    int32_T eml_iv17[2];
    const mxArray *eml_m8;
    static char_T eml_cv20[44] = { 'E', 'm', 'b', 'e', 'd', 'd', 'e', 'd', 'M', 'A', 'T', 'L', 'A', 'B', ':', 'f', 'i', 'l', 't', 
                                           'e', 'r', ':', 'a', 'u', 't', 'o', 'D', 'i', 'm', 'I', 'n', 'c', 'o', 'm', 'p', 'a', 't'
                                           , 'i', 'b', 'i', 'l', 'i', 't', 'y' };
    const mxArray *eml_b_y;
    static char_T eml_cv21[191] = { 'T', 'h', 'e', ' ', 'w', 'o', 'r', 'k', 'i', 'n', 'g', ' ', 'd', 'i', 'm', 'e', 'n', 's', 'i', 
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
    real_T eml_a1;
    int16_T eml_iv18[2];
    int16_T eml_iv19[2];
    int16_T eml_tmp_sizes[2];
    real_T eml_dbuffer[2];
    int32_T eml_j;
    int32_T eml_b_k;
    if((eml_x_sizes[1] == 1) || (eml_x_sizes[1] != 1)) {
        eml_b2 = TRUE;
    } else {
        eml_b2 = FALSE;
    }
    if(eml_b2) {
    } else {
        EMLRTPUSHRTSTACK(&eml_kc_emlrtRSI);
        eml_y = NULL;
        for(eml_k = 0; eml_k < 2; eml_k++) {
            eml_iv17[eml_k] = 1 + 43 * eml_k;
        }
        eml_m8 = mxCreateCharArray(2, eml_iv17);
        emlrtInitCharArray(44, eml_m8, eml_cv20);
        emlrtAssign(&eml_y, eml_m8);
        eml_b_y = NULL;
        for(eml_k = 0; eml_k < 2; eml_k++) {
            eml_iv17[eml_k] = 1 + 190 * eml_k;
        }
        eml_m8 = mxCreateCharArray(2, eml_iv17);
        emlrtInitCharArray(191, eml_m8, eml_cv21);
        emlrtAssign(&eml_b_y, eml_m8);
        m_b_error(eml_y, eml_b_y, &eml_p_emlrtMCI);
        EMLRTPOPRTSTACK(&eml_kc_emlrtRSI);
    }
    eml_a1 = eml_a[0];
    if(!m_isfinite(eml_a1)) {
        EMLRTPUSHRTSTACK(&eml_lc_emlrtRSI);
        m_eml_error();
        EMLRTPOPRTSTACK(&eml_lc_emlrtRSI);
    } else if(eml_a1 == 0.0) {
        EMLRTPUSHRTSTACK(&eml_mc_emlrtRSI);
        m_b_eml_error();
        EMLRTPOPRTSTACK(&eml_mc_emlrtRSI);
    } else {
        if(eml_a1 != 1.0) {
            for(eml_k = 0; eml_k < 2; eml_k++) {
                eml_b[eml_k] /= eml_a1;
            }
            eml_a[1] /= eml_a1;
            eml_a[0] = 1.0;
        }
    }
    for(eml_k = 0; eml_k < 2; eml_k++) {
        eml_iv18[eml_k] = (int16_T)eml_x_sizes[eml_k];
    }
    eml_iv19[0] = 1;
    eml_iv19[1] = eml_iv18[1];
    eml_tmp_sizes[0] = 1;
    eml_tmp_sizes[1] = eml_iv19[1];
    for(eml_k = 0; eml_k < 2; eml_k++) {
        eml_y_sizes[eml_k] = eml_tmp_sizes[eml_k];
    }
    eml_k = eml_x_sizes[1];
    eml_dbuffer[1] = eml_zi;
    for(eml_j = 1; eml_j <= eml_k; eml_j++) {
        eml_dbuffer[0] = eml_dbuffer[1];
        eml_dbuffer[1] = 0.0;
        for(eml_b_k = 0; eml_b_k < 2; eml_b_k++) {
            emlrtDynamicBoundsCheck(eml_j, 1, eml_x_sizes[1], &eml_kb_emlrtBCI);
            emlrtDynamicBoundsCheck(eml_j, 1, eml_x_sizes[1], &eml_lb_emlrtBCI);
            emlrtDynamicBoundsCheck(eml_j, 1, eml_x_sizes[1], &eml_nb_emlrtBCI);
            eml_dbuffer[eml_b_k] += eml_x_data[emlrtDynamicBoundsCheck(eml_j, 1, eml_x_sizes[1], &eml_ob_emlrtBCI) - 1] * eml_b[
                eml_b_k];
        }
        eml_dbuffer[1] -= eml_dbuffer[0] * eml_a[1];
        eml_y_data[emlrtDynamicBoundsCheck(eml_j, 1, eml_y_sizes[1], &eml_mb_emlrtBCI) - 1] = eml_dbuffer[0];
    }
    *eml_zf = eml_dbuffer[1];
}
void m_filter(real_T eml_b[2], real_T eml_a[3], real_T eml_x_data[6912], int32_T eml_x_sizes[2], real_T eml_zi_data[190], int32_T 
    eml_zi_sizes[1], real_T eml_y_data[6912], int32_T eml_y_sizes[2], real_T eml_zf[2])
{
    boolean_T eml_b0;
    const mxArray *eml_y;
    int32_T eml_k;
    int32_T eml_iv0[2];
    const mxArray *eml_m0;
    static char_T eml_cv0[44] = { 'E', 'm', 'b', 'e', 'd', 'd', 'e', 'd', 'M', 'A', 'T', 'L', 'A', 'B', ':', 'f', 'i', 'l', 't', 'e'
                                          , 'r', ':', 'a', 'u', 't', 'o', 'D', 'i', 'm', 'I', 'n', 'c', 'o', 'm', 'p', 'a', 't', 'i'
                                          , 'b', 'i', 'l', 'i', 't', 'y' };
    const mxArray *eml_b_y;
    static char_T eml_cv1[191] = { 'T', 'h', 'e', ' ', 'w', 'o', 'r', 'k', 'i', 'n', 'g', ' ', 'd', 'i', 'm', 'e', 'n', 's', 'i', 
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
    static char_T eml_cv2[38] = { 'M', 'A', 'T', 'L', 'A', 'B', ':', 'f', 'i', 'l', 't', 'e', 'r', ':', 'i', 'n', 'v', 'a', 'l', 'i'
                                          , 'd', 'I', 'n', 'i', 't', 'i', 'a', 'l', 'C', 'o', 'n', 'd', 'i', 't', 'i', 'o', 'n', 's'
         };
    const mxArray *eml_d_y;
    static char_T eml_cv3[200] = { 'I', 'n', 'i', 't', 'i', 'a', 'l', ' ', 'c', 'o', 'n', 'd', 'i', 't', 'i', 'o', 'n', 's', ' ', 
                                           'm', 'u', 's', 't', ' ', 'b', 'e', ' ', 'a', ' ', 'v', 'e', 'c', 't', 'o', 'r', ' ', 'o'
                                           , 'f', ' ', 'l', 'e', 'n', 'g', 't', 'h', ' ', 'm', 'a', 'x', '(', 'l', 'e', 'n', 'g', 
                                           't', 'h', '(', 'a', ')', ',', 'l', 'e', 'n', 'g', 't', 'h', '(', 'b', ')', ')', '-', '1'
                                           , ',', '\\', 'n', 'o', 'r', ' ', 'a', 'n', ' ', 'a', 'r', 'r', 'a', 'y', ' ', 'w', 'i', 
                                           't', 'h', ' ', 't', 'h', 'e', ' ', 'l', 'e', 'a', 'd', 'i', 'n', 'g', ' ', 'd', 'i', 'm'
                                           , 'e', 'n', 's', 'i', 'o', 'n', ' ', 'o', 'f', ' ', 's', 'i', 'z', 'e', ' ', 'm', 'a', 
                                           'x', '(', 'l', 'e', 'n', 'g', 't', 'h', '(', 'a', ')', ',', 'l', 'e', 'n', 'g', 't', 'h'
                                           , '(', 'b', ')', ')', '-', '1', '\\', 'n', 'a', 'n', 'd', ' ', 'w', 'i', 't', 'h', ' ', 
                                           'r', 'e', 'm', 'a', 'i', 'n', 'i', 'n', 'g', ' ', 'd', 'i', 'm', 'e', 'n', 's', 'i', 'o'
                                           , 'n', 's', ' ', 'm', 'a', 't', 'c', 'h', 'i', 'n', 'g', ' ', 't', 'h', 'o', 's', 'e', 
                                           ' ', 'o', 'f', ' ', 'x', '.' };
    real_T eml_a1;
    int16_T eml_iv1[2];
    int16_T eml_iv2[2];
    int16_T eml_tmp_sizes[2];
    int32_T eml_nx;
    real_T eml_dbuffer[3];
    int32_T eml_j;
    if((eml_x_sizes[1] == 1) || (eml_x_sizes[1] != 1)) {
        eml_b0 = TRUE;
    } else {
        eml_b0 = FALSE;
    }
    if(eml_b0) {
    } else {
        EMLRTPUSHRTSTACK(&eml_jb_emlrtRSI);
        eml_y = NULL;
        for(eml_k = 0; eml_k < 2; eml_k++) {
            eml_iv0[eml_k] = 1 + 43 * eml_k;
        }
        eml_m0 = mxCreateCharArray(2, eml_iv0);
        emlrtInitCharArray(44, eml_m0, eml_cv0);
        emlrtAssign(&eml_y, eml_m0);
        eml_b_y = NULL;
        for(eml_k = 0; eml_k < 2; eml_k++) {
            eml_iv0[eml_k] = 1 + 190 * eml_k;
        }
        eml_m0 = mxCreateCharArray(2, eml_iv0);
        emlrtInitCharArray(191, eml_m0, eml_cv1);
        emlrtAssign(&eml_b_y, eml_m0);
        m_b_error(eml_y, eml_b_y, &eml_c_emlrtMCI);
        EMLRTPOPRTSTACK(&eml_jb_emlrtRSI);
    }
    if(eml_zi_sizes[0] == 2) {
    } else {
        EMLRTPUSHRTSTACK(&eml_kb_emlrtRSI);
        eml_c_y = NULL;
        for(eml_k = 0; eml_k < 2; eml_k++) {
            eml_iv0[eml_k] = 1 + 37 * eml_k;
        }
        eml_m0 = mxCreateCharArray(2, eml_iv0);
        emlrtInitCharArray(38, eml_m0, eml_cv2);
        emlrtAssign(&eml_c_y, eml_m0);
        eml_d_y = NULL;
        for(eml_k = 0; eml_k < 2; eml_k++) {
            eml_iv0[eml_k] = 1 + 199 * eml_k;
        }
        eml_m0 = mxCreateCharArray(2, eml_iv0);
        emlrtInitCharArray(200, eml_m0, eml_cv3);
        emlrtAssign(&eml_d_y, eml_m0);
        m_b_error(eml_c_y, eml_d_y, &eml_d_emlrtMCI);
        EMLRTPOPRTSTACK(&eml_kb_emlrtRSI);
    }
    eml_a1 = eml_a[0];
    if(!m_isfinite(eml_a1)) {
        EMLRTPUSHRTSTACK(&eml_lb_emlrtRSI);
        m_eml_error();
        EMLRTPOPRTSTACK(&eml_lb_emlrtRSI);
    } else if(eml_a1 == 0.0) {
        EMLRTPUSHRTSTACK(&eml_mb_emlrtRSI);
        m_b_eml_error();
        EMLRTPOPRTSTACK(&eml_mb_emlrtRSI);
    } else {
        if(eml_a1 != 1.0) {
            for(eml_k = 0; eml_k < 2; eml_k++) {
                eml_b[eml_k] /= eml_a1;
            }
            for(eml_k = 2; eml_k < 4; eml_k++) {
                eml_a[eml_k - 1] /= eml_a1;
            }
            eml_a[0] = 1.0;
        }
    }
    for(eml_k = 0; eml_k < 2; eml_k++) {
        eml_iv1[eml_k] = (int16_T)eml_x_sizes[eml_k];
    }
    eml_iv2[0] = 1;
    eml_iv2[1] = eml_iv1[1];
    eml_tmp_sizes[0] = 1;
    eml_tmp_sizes[1] = eml_iv2[1];
    for(eml_k = 0; eml_k < 2; eml_k++) {
        eml_y_sizes[eml_k] = eml_tmp_sizes[eml_k];
    }
    eml_nx = eml_x_sizes[1];
    for(eml_k = 0; eml_k < 2; eml_k++) {
        eml_dbuffer[eml_k + 1] = eml_zi_data[emlrtDynamicBoundsCheck(eml_k + 1, 1, eml_zi_sizes[0], &eml_e_emlrtBCI) - 1];
    }
    for(eml_j = 1; eml_j <= eml_nx; eml_j++) {
        for(eml_k = 0; eml_k < 2; eml_k++) {
            eml_dbuffer[eml_k] = eml_dbuffer[eml_k + 1];
        }
        eml_dbuffer[2] = 0.0;
        for(eml_k = 0; eml_k < 2; eml_k++) {
            emlrtDynamicBoundsCheck(eml_j, 1, eml_x_sizes[1], &eml_emlrtBCI);
            emlrtDynamicBoundsCheck(eml_j, 1, eml_x_sizes[1], &eml_b_emlrtBCI);
            emlrtDynamicBoundsCheck(eml_j, 1, eml_x_sizes[1], &eml_d_emlrtBCI);
            eml_dbuffer[eml_k] += eml_x_data[emlrtDynamicBoundsCheck(eml_j, 1, eml_x_sizes[1], &eml_f_emlrtBCI) - 1] * eml_b[eml_k];
        }
        for(eml_k = 2; eml_k < 4; eml_k++) {
            eml_dbuffer[eml_k - 1] -= eml_dbuffer[0] * eml_a[eml_k - 1];
        }
        eml_y_data[emlrtDynamicBoundsCheck(eml_j, 1, eml_y_sizes[1], &eml_c_emlrtBCI) - 1] = eml_dbuffer[0];
    }
    for(eml_k = 0; eml_k < 2; eml_k++) {
        eml_zf[eml_k] = eml_dbuffer[eml_k + 1];
    }
}
/* End of Embedded MATLAB Coder code generation (filter.c) */
