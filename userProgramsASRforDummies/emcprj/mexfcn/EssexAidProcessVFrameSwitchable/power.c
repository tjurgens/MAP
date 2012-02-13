/*
 * power.c
 *
 * Embedded MATLAB Coder code generation for function 'power'
 *
 * C source code generated on: Fri Feb 10 11:40:58 2012
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "EssexAidProcessVFrameSwitchable.h"
#include "power.h"

/* Type Definitions */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */
static emlrtBCInfo eml_bb_emlrtBCI = { -1, -1, 28, 14, "", "power", "C:/2010a/toolbox/eml/lib/matlab/ops/power.m", 0 };
static emlrtBCInfo eml_cb_emlrtBCI = { -1, -1, 38, 17, "", "power", "C:/2010a/toolbox/eml/lib/matlab/ops/power.m", 0 };
static emlrtBCInfo eml_db_emlrtBCI = { -1, -1, 28, 14, "", "power", "C:/2010a/toolbox/eml/lib/matlab/ops/power.m", 0 };
static emlrtBCInfo eml_sb_emlrtBCI = { -1, -1, 29, 14, "", "power", "C:/2010a/toolbox/eml/lib/matlab/ops/power.m", 0 };
static emlrtBCInfo eml_tb_emlrtBCI = { -1, -1, 38, 17, "", "power", "C:/2010a/toolbox/eml/lib/matlab/ops/power.m", 0 };
static emlrtBCInfo eml_ub_emlrtBCI = { -1, -1, 29, 14, "", "power", "C:/2010a/toolbox/eml/lib/matlab/ops/power.m", 0 };
static emlrtBCInfo eml_vb_emlrtBCI = { -1, -1, 28, 14, "", "power", "C:/2010a/toolbox/eml/lib/matlab/ops/power.m", 0 };
static emlrtBCInfo eml_wb_emlrtBCI = { -1, -1, 38, 17, "", "power", "C:/2010a/toolbox/eml/lib/matlab/ops/power.m", 0 };
static emlrtBCInfo eml_xb_emlrtBCI = { -1, -1, 28, 14, "", "power", "C:/2010a/toolbox/eml/lib/matlab/ops/power.m", 0 };

/* Function Declarations */
static void m_c_eml_scalexp_alloc(real_T eml_varargin_2_data[6912], int32_T eml_varargin_2_sizes[2], real_T eml_z_data[6912], int32_T eml_z_sizes[2]);
static void m_d_eml_scalexp_alloc(real_T eml_varargin_1_data[6912], int32_T eml_varargin_1_sizes[2], real_T eml_z_data[6912], int32_T eml_z_sizes[2]);
static void m_eml_scalexp_alloc(real_T eml_varargin_1_data[6912], int32_T eml_varargin_1_sizes[2], real_T eml_z_data[6912], int32_T eml_z_sizes[2]);

/* Function Definitions */
static void m_c_eml_scalexp_alloc(real_T eml_varargin_2_data[6912], int32_T eml_varargin_2_sizes[2], real_T eml_z_data[6912], 
    int32_T eml_z_sizes[2])
{
    int32_T eml_i6;
    int16_T eml_iv22[2];
    int16_T eml_iv23[2];
    int16_T eml_tmp_sizes[2];
    if(!(eml_varargin_2_sizes[1] == 1)) {
        for(eml_i6 = 0; eml_i6 < 2; eml_i6++) {
            eml_iv22[eml_i6] = (int16_T)eml_varargin_2_sizes[eml_i6];
        }
        eml_iv23[0] = 1;
        eml_iv23[1] = eml_iv22[1];
        eml_tmp_sizes[0] = 1;
        eml_tmp_sizes[1] = eml_iv23[1];
        for(eml_i6 = 0; eml_i6 < 2; eml_i6++) {
            eml_z_sizes[eml_i6] = eml_tmp_sizes[eml_i6];
        }
    } else {
        for(eml_i6 = 0; eml_i6 < 2; eml_i6++) {
            eml_z_sizes[eml_i6] = 1;
        }
    }
}
static void m_d_eml_scalexp_alloc(real_T eml_varargin_1_data[6912], int32_T eml_varargin_1_sizes[2], real_T eml_z_data[6912], 
    int32_T eml_z_sizes[2])
{
    int32_T eml_i7;
    int16_T eml_iv24[2];
    int16_T eml_iv25[2];
    int16_T eml_tmp_sizes[2];
    if(!(eml_varargin_1_sizes[1] == 1)) {
        for(eml_i7 = 0; eml_i7 < 2; eml_i7++) {
            eml_iv24[eml_i7] = (int16_T)eml_varargin_1_sizes[eml_i7];
        }
        eml_iv25[0] = 1;
        eml_iv25[1] = eml_iv24[1];
        eml_tmp_sizes[0] = 1;
        eml_tmp_sizes[1] = eml_iv25[1];
        for(eml_i7 = 0; eml_i7 < 2; eml_i7++) {
            eml_z_sizes[eml_i7] = eml_tmp_sizes[eml_i7];
        }
    } else {
        for(eml_i7 = 0; eml_i7 < 2; eml_i7++) {
            eml_z_sizes[eml_i7] = 1;
        }
    }
}
static void m_eml_scalexp_alloc(real_T eml_varargin_1_data[6912], int32_T eml_varargin_1_sizes[2], real_T eml_z_data[6912], int32_T 
    eml_z_sizes[2])
{
    int32_T eml_i3;
    int16_T eml_iv13[2];
    int16_T eml_iv14[2];
    int16_T eml_tmp_sizes[2];
    if(!(eml_varargin_1_sizes[1] == 1)) {
        for(eml_i3 = 0; eml_i3 < 2; eml_i3++) {
            eml_iv13[eml_i3] = (int16_T)eml_varargin_1_sizes[eml_i3];
        }
        eml_iv14[0] = 1;
        eml_iv14[1] = eml_iv13[1];
        eml_tmp_sizes[0] = 1;
        eml_tmp_sizes[1] = eml_iv14[1];
        for(eml_i3 = 0; eml_i3 < 2; eml_i3++) {
            eml_z_sizes[eml_i3] = eml_tmp_sizes[eml_i3];
        }
    } else {
        for(eml_i3 = 0; eml_i3 < 2; eml_i3++) {
            eml_z_sizes[eml_i3] = 1;
        }
    }
}
void m_b_power(real_T eml_b_data[6912], int32_T eml_b_sizes[2], real_T eml_y_data[6912], int32_T eml_y_sizes[2])
{
    int32_T eml_loop_ub;
    int32_T eml_k;
    m_c_eml_scalexp_alloc(eml_b_data, eml_b_sizes, eml_y_data, eml_y_sizes);
    eml_loop_ub = eml_y_sizes[1];
    for(eml_k = 1; eml_k <= eml_loop_ub; eml_k++) {
        emlrtDynamicBoundsCheck(eml_k, 1, eml_b_sizes[1], &eml_sb_emlrtBCI);
        eml_y_data[emlrtDynamicBoundsCheck(eml_k, 1, eml_y_sizes[1], &eml_tb_emlrtBCI) - 1] = muDoubleScalarPower(10.0, eml_b_data[
            emlrtDynamicBoundsCheck(eml_k, 1, eml_b_sizes[1], &eml_ub_emlrtBCI) - 1]);
    }
}
void m_c_power(real_T eml_a_data[6912], int32_T eml_a_sizes[2], real_T eml_y_data[6912], int32_T eml_y_sizes[2])
{
    int32_T eml_loop_ub;
    int32_T eml_k;
    m_d_eml_scalexp_alloc(eml_a_data, eml_a_sizes, eml_y_data, eml_y_sizes);
    eml_loop_ub = eml_y_sizes[1];
    for(eml_k = 1; eml_k <= eml_loop_ub; eml_k++) {
        emlrtDynamicBoundsCheck(eml_k, 1, eml_a_sizes[1], &eml_vb_emlrtBCI);
        eml_y_data[emlrtDynamicBoundsCheck(eml_k, 1, eml_y_sizes[1], &eml_wb_emlrtBCI) - 1] = muDoubleScalarPower(eml_a_data[
            emlrtDynamicBoundsCheck(eml_k, 1, eml_a_sizes[1], &eml_xb_emlrtBCI) - 1], 2.0);
    }
}
void m_power(real_T eml_a_data[6912], int32_T eml_a_sizes[2], real_T eml_b, real_T eml_y_data[6912], int32_T eml_y_sizes[2])
{
    int32_T eml_loop_ub;
    int32_T eml_k;
    m_eml_scalexp_alloc(eml_a_data, eml_a_sizes, eml_y_data, eml_y_sizes);
    eml_loop_ub = eml_y_sizes[1];
    for(eml_k = 1; eml_k <= eml_loop_ub; eml_k++) {
        emlrtDynamicBoundsCheck(eml_k, 1, eml_a_sizes[1], &eml_bb_emlrtBCI);
        eml_y_data[emlrtDynamicBoundsCheck(eml_k, 1, eml_y_sizes[1], &eml_cb_emlrtBCI) - 1] = muDoubleScalarPower(eml_a_data[
            emlrtDynamicBoundsCheck(eml_k, 1, eml_a_sizes[1], &eml_db_emlrtBCI) - 1], eml_b);
    }
}
/* End of Embedded MATLAB Coder code generation (power.c) */
