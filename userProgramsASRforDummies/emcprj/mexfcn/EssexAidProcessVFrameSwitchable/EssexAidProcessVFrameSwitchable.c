/*
 * EssexAidProcessVFrameSwitchable.c
 *
 * Embedded MATLAB Coder code generation for function 'EssexAidProcessVFrameSwitchable'
 *
 * C source code generated on: Fri Feb 10 11:40:58 2012
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "EssexAidProcessVFrameSwitchable.h"
#include "filter.h"
#include "max.h"
#include "abs.h"
#include "power.h"
#include "mean.h"
#include "log10.h"
#include "sign.h"
#include "find.h"
#include "sqrt.h"
#include "EssexAidProcessVFrameSwitchable_mexutil.h"

/* Type Definitions */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */
static emlrtRSInfo eml_emlrtRSI = { 229, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtRSInfo eml_b_emlrtRSI = { 228, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtRSInfo eml_c_emlrtRSI = { 217, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtRSInfo eml_d_emlrtRSI = { 216, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtRSInfo eml_e_emlrtRSI = { 213, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtRSInfo eml_f_emlrtRSI = { 212, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtRSInfo eml_g_emlrtRSI = { 193, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtRSInfo eml_h_emlrtRSI = { 192, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtRSInfo eml_i_emlrtRSI = { 183, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtRSInfo eml_j_emlrtRSI = { 175, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtRSInfo eml_k_emlrtRSI = { 173, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtRSInfo eml_l_emlrtRSI = { 173, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtRSInfo eml_m_emlrtRSI = { 172, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtRSInfo eml_n_emlrtRSI = { 172, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtRSInfo eml_o_emlrtRSI = { 165, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtRSInfo eml_p_emlrtRSI = { 164, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtRSInfo eml_q_emlrtRSI = { 160, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtRSInfo eml_r_emlrtRSI = { 159, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtRSInfo eml_s_emlrtRSI = { 155, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtRSInfo eml_t_emlrtRSI = { 154, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtRSInfo eml_u_emlrtRSI = { 142, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtRSInfo eml_v_emlrtRSI = { 141, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtRSInfo eml_w_emlrtRSI = { 136, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtRSInfo eml_x_emlrtRSI = { 135, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtRSInfo eml_y_emlrtRSI = { 131, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtRSInfo eml_ab_emlrtRSI = { 130, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtRSInfo eml_bb_emlrtRSI = { 128, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtRSInfo eml_cb_emlrtRSI = { 125, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtRSInfo eml_db_emlrtRSI = { 124, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtRSInfo eml_eb_emlrtRSI = { 122, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtRSInfo eml_fb_emlrtRSI = { 102, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtRSInfo eml_gb_emlrtRSI = { 101, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtRSInfo eml_hb_emlrtRSI = { 10, "rdivide", "C:/2010a/toolbox/eml/lib/matlab/ops/rdivide.m" };
static emlrtRSInfo eml_ib_emlrtRSI = { 12, "eml_div", "C:/2010a/toolbox/eml/lib/matlab/eml/eml_div.m" };
static emlrtRSInfo eml_xb_emlrtRSI = { 12, "log10", "C:/2010a/toolbox/eml/lib/matlab/elfun/log10.m" };
static emlrtRSInfo eml_yb_emlrtRSI = { 12, "eml_error", "C:/2010a/toolbox/eml/lib/matlab/eml/eml_error.m" };
static emlrtRSInfo eml_ac_emlrtRSI = { 238, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtRSInfo eml_bc_emlrtRSI = { 243, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtRSInfo eml_cc_emlrtRSI = { 246, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtRSInfo eml_dc_emlrtRSI = { 247, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtRSInfo eml_ec_emlrtRSI = { 247, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtRSInfo eml_qc_emlrtRSI = { 11, "eml_li_find", "C:/2010a/toolbox/eml/lib/matlab/eml/eml_li_find.m" };
static emlrtRSInfo eml_rc_emlrtRSI = { 14, "eml_li_find", "C:/2010a/toolbox/eml/lib/matlab/eml/eml_li_find.m" };
static emlrtMCInfo eml_emlrtMCI = { 122, 9, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtMCInfo eml_b_emlrtMCI = { 128, 9, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtMCInfo eml_k_emlrtMCI = { 12, 7, "eml_error", "C:/2010a/toolbox/eml/lib/matlab/eml/eml_error.m" };
static emlrtMCInfo eml_r_emlrtMCI = { 14, 5, "eml_li_find", "C:/2010a/toolbox/eml/lib/matlab/eml/eml_li_find.m" };
static emlrtDCInfo eml_emlrtDCI = { 17, 35, "eml_li_find", "C:/2010a/toolbox/eml/lib/matlab/eml/eml_li_find.m", 4 };
static emlrtDCInfo eml_b_emlrtDCI = { 17, 35, "eml_li_find", "C:/2010a/toolbox/eml/lib/matlab/eml/eml_li_find.m", 4 };
static emlrtBCInfo eml_yb_emlrtBCI = { -1, -1, 27, 12, "", "eml_li_find", "C:/2010a/toolbox/eml/lib/matlab/eml/eml_li_find.m", 0 };
static emlrtBCInfo eml_ac_emlrtBCI = { -1, -1, 28, 13, "", "eml_li_find", "C:/2010a/toolbox/eml/lib/matlab/eml/eml_li_find.m", 0 };
static emlrtBCInfo eml_bc_emlrtBCI = { -1, -1, 40, 12, "", "eml_li_find", "C:/2010a/toolbox/eml/lib/matlab/eml/eml_li_find.m", 0 };
static emlrtECInfo eml_emlrtECI = { 2, 102, 14, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtECInfo eml_b_emlrtECI = { 2, 101, 14, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtBCInfo eml_cc_emlrtBCI = { 1, 6912, 83, 14, "frameBufferL", "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m", 0 };
static emlrtBCInfo eml_dc_emlrtBCI = { 1, 6912, 84, 14, "frameBufferR", "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m", 0 };
static emlrtBCInfo eml_ec_emlrtBCI = { 1, 6912, 85, 41, "frameBufferL", "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m", 0 };
static emlrtBCInfo eml_fc_emlrtBCI = { 1, 6912, 85, 1, "frameBufferL", "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m", 0 };
static emlrtECInfo eml_c_emlrtECI = { -1, 85, 1, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtBCInfo eml_gc_emlrtBCI = { 1, 6912, 86, 41, "frameBufferL", "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m", 0 };
static emlrtBCInfo eml_hc_emlrtBCI = { 1, 6912, 86, 1, "frameBufferR", "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m", 0 };
static emlrtECInfo eml_d_emlrtECI = { -1, 86, 1, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtBCInfo eml_ic_emlrtBCI = { 1, 6912, 101, 26, "ARampL", "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m", 0 };
static emlrtBCInfo eml_jc_emlrtBCI = { 1, 6912, 102, 26, "ARampR", "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m", 0 };
static emlrtBCInfo eml_kc_emlrtBCI = { 1, 11, 119, 25, "MOCcontrol", "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m", 0 };
static emlrtBCInfo eml_lc_emlrtBCI = { 1, 6912, 119, 38, "MOCcontrol", "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m", 0 };
static emlrtECInfo eml_e_emlrtECI = { -1, 124, 18, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtECInfo eml_f_emlrtECI = { -1, 125, 18, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtECInfo eml_g_emlrtECI = { -1, 130, 18, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtECInfo eml_h_emlrtECI = { -1, 131, 18, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtECInfo eml_i_emlrtECI = { 2, 149, 10, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtECInfo eml_j_emlrtECI = { 2, 150, 10, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtECInfo eml_k_emlrtECI = { -1, 159, 18, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtECInfo eml_l_emlrtECI = { -1, 160, 18, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtBCInfo eml_mc_emlrtBCI = { 1, 3000, 164, 232, "filterStatesL", "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m", 0 };
static emlrtBCInfo eml_nc_emlrtBCI = { 1, 3000, 164, 232, "filterStatesL", "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m", 0 };
static emlrtBCInfo eml_oc_emlrtBCI = { 1, 3000, 164, 18, "filterStatesL", "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m", 0 };
static emlrtBCInfo eml_pc_emlrtBCI = { 1, 3000, 164, 18, "filterStatesL", "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m", 0 };
static emlrtECInfo eml_m_emlrtECI = { -1, 164, 18, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtBCInfo eml_qc_emlrtBCI = { 1, 3000, 165, 232, "filterStatesR", "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m", 0 };
static emlrtBCInfo eml_rc_emlrtBCI = { 1, 3000, 165, 232, "filterStatesR", "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m", 0 };
static emlrtBCInfo eml_sc_emlrtBCI = { 1, 3000, 165, 18, "filterStatesR", "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m", 0 };
static emlrtBCInfo eml_tc_emlrtBCI = { 1, 3000, 165, 18, "filterStatesR", "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m", 0 };
static emlrtECInfo eml_n_emlrtECI = { -1, 165, 18, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtECInfo eml_o_emlrtECI = { 2, 175, 149, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtBCInfo eml_uc_emlrtBCI = { 1, 6912, 185, 29, "MOCcontrol", "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m", 0 };
static emlrtECInfo eml_p_emlrtECI = { -1, 185, 5, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtECInfo eml_q_emlrtECI = { 2, 203, 34, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtECInfo eml_r_emlrtECI = { -1, 203, 5, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtECInfo eml_s_emlrtECI = { 2, 204, 34, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtECInfo eml_t_emlrtECI = { -1, 204, 5, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtBCInfo eml_vc_emlrtBCI = { 1, 6912, 212, 122, "frameBufferL", "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m", 0 };
static emlrtBCInfo eml_wc_emlrtBCI = { 1, 6912, 213, 122, "frameBufferR", "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m", 0 };
static emlrtBCInfo eml_xc_emlrtBCI = { 1, 6912, 225, 1, "ARampL", "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m", 0 };
static emlrtECInfo eml_u_emlrtECI = { -1, 225, 1, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtBCInfo eml_yc_emlrtBCI = { 1, 6912, 226, 1, "ARampR", "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m", 0 };
static emlrtECInfo eml_v_emlrtECI = { -1, 226, 1, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtBCInfo eml_ad_emlrtBCI = { 1, 6912, 228, 8, "ARampL", "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m", 0 };
static emlrtBCInfo eml_bd_emlrtBCI = { 1, 6912, 229, 8, "ARampR", "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m", 0 };
static emlrtBCInfo eml_cd_emlrtBCI = { 1, 6912, 190, 51, "MOCcontrol", "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m", 0 };
static emlrtECInfo eml_w_emlrtECI = { 2, 247, 10, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtECInfo eml_x_emlrtECI = { -1, 247, 1, "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m" };
static emlrtBCInfo eml_dd_emlrtBCI = { -1, -1, 247, 15, "x", "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m", 0 };
static emlrtBCInfo eml_ed_emlrtBCI = { -1, -1, 247, 29, "abs_x", "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m", 0 };
static emlrtBCInfo eml_fd_emlrtBCI = { -1, -1, 247, 1, "x", "EssexAidProcessVFrameSwitchable", "C:/MAP/userProgramsASRforDummies/EssexAidProcessVFrameSwitchable.m", 0 };

/* Function Declarations */
static void m_c_eml_error(void);
static int32_T m_compute_nones(boolean_T eml_x_data[6912], int32_T eml_x_sizes[2], int32_T eml_n);
static void m_eml_li_find(boolean_T eml_x_data[6912], int32_T eml_x_sizes[2], int32_T eml_y_data[6912], int32_T eml_y_sizes[2]);
static void m_refp1_DRNL_brokenstick_nl(real_T eml_x_data[6912], int32_T eml_x_sizes[2], real_T eml_b, real_T eml_c);

/* Function Definitions */
static void m_c_eml_error(void)
{
    const mxArray *eml_y;
    int32_T eml_i2;
    int32_T eml_iv11[2];
    const mxArray *eml_m5;
    static char_T eml_cv16[32] = { 'E', 'm', 'b', 'e', 'd', 'd', 'e', 'd', 'M', 'A', 'T', 'L', 'A', 'B', ':', 'l', 'o', 'g', '1', 
                                           '0', ':', 'd', 'o', 'm', 'a', 'i', 'n', 'E', 'r', 'r', 'o', 'r' };
    const mxArray *eml_b_y;
    static char_T eml_cv17[78] = { 'D', 'o', 'm', 'a', 'i', 'n', ' ', 'e', 'r', 'r', 'o', 'r', '.', ' ', 'T', 'o', ' ', 'c', 'o', 
                                           'm', 'p', 'u', 't', 'e', ' ', 'c', 'o', 'm', 'p', 'l', 'e', 'x', ' ', 'r', 'e', 's', 'u'
                                           , 'l', 't', 's', ' ', 'f', 'r', 'o', 'm', ' ', 'r', 'e', 'a', 'l', ' ', 'x', ',', ' ', 
                                           'u', 's', 'e', ' ', '\'', 'l', 'o', 'g', '1', '0', '(', 'c', 'o', 'm', 'p', 'l', 'e', 'x'
                                           , '(', 'x', ')', ')', '\'', '.' };
    EMLRTPUSHRTSTACK(&eml_yb_emlrtRSI);
    eml_y = NULL;
    for(eml_i2 = 0; eml_i2 < 2; eml_i2++) {
        eml_iv11[eml_i2] = 1 + 31 * eml_i2;
    }
    eml_m5 = mxCreateCharArray(2, eml_iv11);
    emlrtInitCharArray(32, eml_m5, eml_cv16);
    emlrtAssign(&eml_y, eml_m5);
    eml_b_y = NULL;
    for(eml_i2 = 0; eml_i2 < 2; eml_i2++) {
        eml_iv11[eml_i2] = 1 + 77 * eml_i2;
    }
    eml_m5 = mxCreateCharArray(2, eml_iv11);
    emlrtInitCharArray(78, eml_m5, eml_cv17);
    emlrtAssign(&eml_b_y, eml_m5);
    m_b_error(eml_y, eml_b_y, &eml_k_emlrtMCI);
    EMLRTPOPRTSTACK(&eml_yb_emlrtRSI);
}
static int32_T m_compute_nones(boolean_T eml_x_data[6912], int32_T eml_x_sizes[2], int32_T eml_n)
{
    int32_T eml_k;
    int32_T eml_i;
    eml_k = 0;
    for(eml_i = 1; eml_i <= eml_n; eml_i++) {
        if(eml_x_data[emlrtDynamicBoundsCheck(eml_i, 1, eml_x_sizes[1], &eml_bc_emlrtBCI) - 1]) {
            eml_k++;
        }
    }
    return eml_k;
}
static void m_eml_li_find(boolean_T eml_x_data[6912], int32_T eml_x_sizes[2], int32_T eml_y_data[6912], int32_T eml_y_sizes[2])
{
    int32_T eml_n;
    int32_T eml_k;
    const mxArray *eml_y;
    const mxArray *eml_m10;
    int32_T eml_iv27[2];
    int32_T eml_tmp_sizes[2];
    int32_T eml_i;
    eml_n = eml_x_sizes[1];
    EMLRTPUSHRTSTACK(&eml_qc_emlrtRSI);
    eml_k = m_compute_nones(eml_x_data, eml_x_sizes, eml_n);
    EMLRTPOPRTSTACK(&eml_qc_emlrtRSI);
    if(eml_k <= eml_n) {
    } else {
        EMLRTPUSHRTSTACK(&eml_rc_emlrtRSI);
        eml_y = NULL;
        eml_m10 = mxCreateString("Assertion failed.");
        emlrtAssign(&eml_y, eml_m10);
        m_error(eml_y, &eml_r_emlrtMCI);
        EMLRTPOPRTSTACK(&eml_rc_emlrtRSI);
    }
    emlrtNonNegativeCheckR2009b((real_T)eml_k, &eml_emlrtDCI);
    eml_iv27[0] = 1;
    eml_iv27[1] = (int32_T)emlrtNonNegativeCheckR2009b((real_T)eml_k, &eml_b_emlrtDCI);
    eml_tmp_sizes[0] = 1;
    eml_tmp_sizes[1] = eml_iv27[1];
    for(eml_k = 0; eml_k < 2; eml_k++) {
        eml_y_sizes[eml_k] = eml_tmp_sizes[eml_k];
    }
    eml_k = 1;
    for(eml_i = 1; eml_i <= eml_n; eml_i++) {
        if(eml_x_data[emlrtDynamicBoundsCheck(eml_i, 1, eml_x_sizes[1], &eml_yb_emlrtBCI) - 1]) {
            eml_y_data[emlrtDynamicBoundsCheck(eml_k, 1, eml_y_sizes[1], &eml_ac_emlrtBCI) - 1] = eml_i;
            eml_k++;
        }
    }
}
static void m_refp1_DRNL_brokenstick_nl(real_T eml_x_data[6912], int32_T eml_x_sizes[2], real_T eml_b, real_T eml_c)
{
    int32_T eml_abs_x_sizes[2];
    static real_T eml_abs_x_data[6912];
    real_T eml_compressionThreshold;
    int32_T eml_b_abs_x_sizes[2];
    int32_T eml_loop_ub;
    int32_T eml_i17;
    boolean_T eml_b_abs_x_data[6912];
    int32_T eml_idx_sizes[2];
    static real_T eml_idx_data[6912];
    int32_T eml_b_x_sizes[2];
    static int32_T eml_b_idx_data[6912];
    int32_T eml_tmp_sizes[2];
    int32_T eml_i18;
    static real_T eml_tmp_data[6912];
    int32_T eml_c_abs_x_sizes[2];
    static real_T eml_c_abs_x_data[6912];
    int32_T eml_b_tmp_sizes[2];
    int32_T eml_c_x_sizes[2];
    static int32_T eml_b_tmp_data[6912];
    /* nick modified broken stick function */
    /*  y = sign(x).* min(a*abs_x,  b*abs_x .^ c); */
    /*  This function could be replaced by a lookup table */
    EMLRTPUSHRTSTACK(&eml_ac_emlrtRSI);
    m_abs(eml_x_data, eml_x_sizes, eml_abs_x_data, eml_abs_x_sizes);
    EMLRTPOPRTSTACK(&eml_ac_emlrtRSI);
    /*  linear (low amplitude) response */
    eml_x_sizes[0] = 1;
    /*  compressed high amplitude */
    EMLRTPUSHRTSTACK(&eml_bc_emlrtRSI);
    if(eml_b < 0.0) {
        EMLRTPUSHRTSTACK(&eml_xb_emlrtRSI);
        m_c_eml_error();
        EMLRTPOPRTSTACK(&eml_xb_emlrtRSI);
    }
    eml_compressionThreshold = muDoubleScalarPower(10.0, 1.0 / (1.0 - eml_c) * muDoubleScalarLog10(eml_b));
    EMLRTPOPRTSTACK(&eml_bc_emlrtRSI);
    /*  only values outside the compression threshold */
    /*   need be subject to compression */
    EMLRTPUSHRTSTACK(&eml_cc_emlrtRSI);
    eml_b_abs_x_sizes[0] = 1;
    eml_b_abs_x_sizes[1] = eml_abs_x_sizes[1];
    eml_loop_ub = eml_abs_x_sizes[0] * eml_abs_x_sizes[1] - 1;
    for(eml_i17 = 0; eml_i17 <= eml_loop_ub; eml_i17++) {
        eml_b_abs_x_data[eml_i17] = (eml_abs_x_data[eml_i17] > eml_compressionThreshold);
    }
    m_find(eml_b_abs_x_data, eml_b_abs_x_sizes, eml_idx_data, eml_idx_sizes);
    EMLRTPOPRTSTACK(&eml_cc_emlrtRSI);
    EMLRTPUSHRTSTACK(&eml_dc_emlrtRSI);
    eml_b_x_sizes[0] = 1;
    eml_b_x_sizes[1] = eml_x_sizes[1];
    eml_loop_ub = eml_idx_sizes[1] - 1;
    for(eml_i17 = 0; eml_i17 <= eml_loop_ub; eml_i17++) {
        eml_b_idx_data[eml_i17] = emlrtDynamicBoundsCheck((int32_T)eml_idx_data[eml_idx_sizes[0] * eml_i17], 1, eml_b_x_sizes[1], &
            eml_dd_emlrtBCI);
    }
    eml_b_abs_x_sizes[0] = 1;
    eml_b_abs_x_sizes[1] = eml_idx_sizes[1];
    eml_tmp_sizes[0] = 1;
    eml_tmp_sizes[1] = eml_b_abs_x_sizes[1];
    eml_loop_ub = eml_b_abs_x_sizes[1] - 1;
    for(eml_i17 = 0; eml_i17 <= eml_loop_ub; eml_i17++) {
        for(eml_i18 = 0; eml_i18 <= 0; eml_i18 = 1) {
            eml_tmp_data[eml_i17] = eml_x_data[eml_b_idx_data[eml_i17] - 1];
        }
    }
    m_refp1_sign(eml_tmp_data, eml_tmp_sizes);
    EMLRTPOPRTSTACK(&eml_dc_emlrtRSI);
    EMLRTPUSHRTSTACK(&eml_ec_emlrtRSI);
    eml_c_abs_x_sizes[0] = 1;
    eml_b_abs_x_sizes[0] = 1;
    eml_b_abs_x_sizes[1] = eml_idx_sizes[1];
    eml_c_abs_x_sizes[1] = eml_b_abs_x_sizes[1];
    eml_loop_ub = eml_idx_sizes[1] - 1;
    for(eml_i17 = 0; eml_i17 <= eml_loop_ub; eml_i17++) {
        eml_c_abs_x_data[eml_i17] = eml_abs_x_data[emlrtDynamicBoundsCheck((int32_T)eml_idx_data[eml_i17], 1, eml_abs_x_sizes[1], &
            eml_ed_emlrtBCI) - 1];
    }
    m_power(eml_c_abs_x_data, eml_c_abs_x_sizes, eml_c, eml_abs_x_data, eml_abs_x_sizes);
    eml_abs_x_sizes[0] = 1;
    eml_loop_ub = eml_abs_x_sizes[1] - 1;
    for(eml_i17 = 0; eml_i17 <= eml_loop_ub; eml_i17++) {
        eml_abs_x_data[eml_i17] *= eml_b;
    }
    EMLRTPOPRTSTACK(&eml_ec_emlrtRSI);
    emlrtSizeEqCheckND(eml_tmp_sizes, eml_abs_x_sizes, &eml_w_emlrtECI);
    eml_b_tmp_sizes[0] = 1;
    eml_b_abs_x_sizes[0] = 1;
    eml_b_abs_x_sizes[1] = eml_idx_sizes[1];
    eml_b_tmp_sizes[1] = eml_b_abs_x_sizes[1];
    eml_c_x_sizes[0] = 1;
    eml_c_x_sizes[1] = eml_x_sizes[1];
    eml_loop_ub = eml_idx_sizes[1] - 1;
    for(eml_i17 = 0; eml_i17 <= eml_loop_ub; eml_i17++) {
        eml_b_tmp_data[eml_i17] = emlrtDynamicBoundsCheck((int32_T)eml_idx_data[eml_i17], 1, eml_c_x_sizes[1], &eml_fd_emlrtBCI);
    }
    eml_tmp_sizes[0] = 1;
    eml_loop_ub = eml_tmp_sizes[1];
    eml_loop_ub--;
    for(eml_i17 = 0; eml_i17 <= eml_loop_ub; eml_i17++) {
        eml_tmp_data[eml_i17] *= eml_abs_x_data[eml_i17];
    }
    emlrtSizeEqCheck1D(eml_b_tmp_sizes[1], eml_tmp_sizes[1], &eml_x_emlrtECI);
    eml_loop_ub = eml_tmp_sizes[1] - 1;
    for(eml_i17 = 0; eml_i17 <= eml_loop_ub; eml_i17++) {
        eml_x_data[eml_b_tmp_data[eml_i17] - 1] = eml_tmp_data[eml_i17];
    }
    /* of DRNL_brokenstick_nl */
}
void EssexAidProcessVFrameSwitchable(real_T eml_frameBufferL[6912], real_T eml_frameBufferR[6912], real_T eml_filterStatesL[3000], 
    real_T eml_filterStatesR[3000], const real_T eml_filterCoeffs[5000], real_T eml_numChannels, real_T eml_numSamples, real_T 
    eml_ARampL[6912], real_T eml_ARampR[6912], real_T eml_ARthresholdPa, real_T eml_filterOrder, const real_T eml_DRNLb[11], const 
    real_T eml_DRNLc[11], const real_T eml_MOCthreshold_dBOP[11], real_T eml_MOCfactor, real_T eml_peakIPL[11], real_T eml_peakOPL[
    11], real_T eml_rmsIPL[11], real_T eml_rmsOPL[11], real_T eml_peakIPR[11], real_T eml_peakOPR[11], real_T eml_rmsIPR[11], real_T
     eml_rmsOPR[11], real_T eml_MOCend[11], real_T eml_MOCcontrol[76032], const real_T eml_mainGain[11], boolean_T eml_useGTF)
{
    int32_T eml_loop_ub;
    int32_T eml_hoistedExpr_sizes[1];
    int32_T eml_b_loop_ub;
    static real_T eml_hoistedExpr_data[6912];
    int32_T eml_b_hoistedExpr_sizes[2];
    int32_T eml_A_sizes[2];
    static real_T eml_b_hoistedExpr_data[6912];
    int32_T eml_stapesVelL_sizes[2];
    int32_T eml_y;
    static real_T eml_stapesVelL_data[6912];
    int32_T eml_c_hoistedExpr_sizes[1];
    static real_T eml_c_hoistedExpr_data[6912];
    int32_T eml_stapesVelR_sizes[2];
    static real_T eml_stapesVelR_data[6912];
    int32_T eml_d_hoistedExpr_sizes[1];
    static real_T eml_d_hoistedExpr_data[6912];
    int32_T eml_frameBufferL_sizes[2];
    int16_T eml_iv38[2];
    int32_T eml_e_hoistedExpr_sizes[1];
    static real_T eml_e_hoistedExpr_data[6912];
    int32_T eml_tmp_sizes[2];
    static int32_T eml_tmp_data[6912];
    int32_T eml_y_sizes[2];
    int16_T eml_iv39[2];
    static real_T eml_y_data[6912];
    int32_T eml_f_hoistedExpr_sizes[1];
    static real_T eml_f_hoistedExpr_data[6912];
    int32_T eml_b_frameBufferL_sizes[2];
    int32_T eml_g_hoistedExpr_sizes[1];
    static real_T eml_A_data[6912];
    int32_T eml_h_hoistedExpr_sizes[1];
    static real_T eml_yL_data[6912];
    int32_T eml_i_hoistedExpr_sizes[1];
    static real_T eml_b_yL_data[6912];
    int32_T eml_filterCount;
    int32_T eml_yL_sizes[2];
    static real_T eml_c_yL_data[6912];
    int32_T eml_yR_sizes[2];
    static real_T eml_yR_data[6912];
    int32_T eml_j_hoistedExpr_sizes[1];
    static real_T eml_g_hoistedExpr_data[6912];
    const mxArray *eml_b_y;
    const mxArray *eml_m15;
    static char_T eml_cv24[31] = { 'f', 'i', 'l', 't', 'e', 'r', 'O', 'r', 'd', 'e', 'r', ' ', 'm', 'u', 's', 't', ' ', 'b', 'e', 
                                           ' ', 'l', 'e', 's', 's', ' ', 't', 'h', 'a', 'n', ' ', '5' };
    real_T eml_c_loop_ub;
    real_T eml_A;
    real_T eml_d0;
    int32_T eml_k_hoistedExpr_sizes[1];
    real_T eml_h_hoistedExpr_data[182];
    int32_T eml_b_tmp_sizes[2];
    real_T eml_b_tmp_data[182];
    real_T eml_b_filterCoeffs[2];
    real_T eml_c_filterCoeffs[3];
    int32_T eml_l_hoistedExpr_sizes[2];
    real_T eml_i_hoistedExpr_data[182];
    int32_T eml_filterStatesL_sizes[1];
    real_T eml_filterStatesL_data[190];
    int32_T eml_b_yL_sizes[2];
    real_T eml_d_filterCoeffs[2];
    int32_T eml_m_hoistedExpr_sizes[1];
    real_T eml_j_hoistedExpr_data[182];
    int32_T eml_c_tmp_sizes[2];
    int32_T eml_c_tmp_data[182];
    int32_T eml_n_hoistedExpr_sizes[1];
    real_T eml_k_hoistedExpr_data[182];
    int32_T eml_o_hoistedExpr_sizes[2];
    real_T eml_l_hoistedExpr_data[182];
    int32_T eml_filterStatesR_sizes[1];
    real_T eml_filterStatesR_data[190];
    int32_T eml_b_yR_sizes[2];
    int32_T eml_p_hoistedExpr_sizes[1];
    real_T eml_m_hoistedExpr_data[182];
    boolean_T eml_b3;
    const mxArray *eml_c_y;
    static char_T eml_cv25[26] = { 'f', 'i', 'l', 't', 'e', 'r', 'O', 'r', 'd', 'e', 'r', ' ', 'm', 'u', 's', 't', ' ', 'b', 'e', 
                                           ' ', '2', ' ', 'o', 'r', ' ', '4' };
    real_T eml_nn;
    int32_T eml_q_hoistedExpr_sizes[1];
    real_T eml_n_hoistedExpr_data[180];
    int32_T eml_d_tmp_sizes[2];
    real_T eml_d_tmp_data[180];
    real_T eml_e_filterCoeffs[5];
    real_T eml_f_filterCoeffs[5];
    int32_T eml_r_hoistedExpr_sizes[2];
    real_T eml_o_hoistedExpr_data[180];
    int32_T eml_b_filterStatesL_sizes[1];
    static real_T eml_b_filterStatesL_data[3000];
    int32_T eml_c_yL_sizes[2];
    real_T eml_dv0[4];
    int32_T eml_s_hoistedExpr_sizes[1];
    real_T eml_p_hoistedExpr_data[180];
    int32_T eml_e_tmp_sizes[2];
    int32_T eml_e_tmp_data[180];
    int32_T eml_t_hoistedExpr_sizes[1];
    real_T eml_q_hoistedExpr_data[180];
    int32_T eml_u_hoistedExpr_sizes[2];
    real_T eml_r_hoistedExpr_data[180];
    int32_T eml_b_filterStatesR_sizes[1];
    static real_T eml_b_filterStatesR_data[3000];
    int32_T eml_c_yR_sizes[2];
    int32_T eml_v_hoistedExpr_sizes[1];
    real_T eml_s_hoistedExpr_data[180];
    int32_T eml_w_hoistedExpr_sizes[1];
    real_T eml_t_hoistedExpr_data[190];
    int32_T eml_f_tmp_sizes[2];
    real_T eml_f_tmp_data[190];
    int32_T eml_x_hoistedExpr_sizes[2];
    real_T eml_u_hoistedExpr_data[190];
    int32_T eml_c_filterStatesL_sizes[1];
    real_T eml_c_filterStatesL_data[190];
    int32_T eml_d_yL_sizes[2];
    int32_T eml_y_hoistedExpr_sizes[1];
    real_T eml_v_hoistedExpr_data[190];
    int32_T eml_g_tmp_sizes[2];
    int32_T eml_g_tmp_data[190];
    int32_T eml_ab_hoistedExpr_sizes[1];
    real_T eml_w_hoistedExpr_data[190];
    int32_T eml_bb_hoistedExpr_sizes[2];
    real_T eml_x_hoistedExpr_data[190];
    int32_T eml_c_filterStatesR_sizes[1];
    real_T eml_c_filterStatesR_data[190];
    int32_T eml_d_yR_sizes[2];
    int32_T eml_cb_hoistedExpr_sizes[1];
    real_T eml_y_hoistedExpr_data[190];
    int32_T eml_db_hoistedExpr_sizes[1];
    static real_T eml_ab_hoistedExpr_data[3000];
    int32_T eml_h_tmp_sizes[2];
    static real_T eml_h_tmp_data[3000];
    int32_T eml_eb_hoistedExpr_sizes[2];
    real_T eml_bb_hoistedExpr_data[3000];
    int32_T eml_d_filterStatesL_sizes[1];
    real_T eml_d_filterStatesL_data[3000];
    int32_T eml_e_yL_sizes[2];
    int32_T eml_fb_hoistedExpr_sizes[1];
    real_T eml_cb_hoistedExpr_data[3000];
    int32_T eml_i_tmp_sizes[2];
    int32_T eml_i_tmp_data[3000];
    int32_T eml_gb_hoistedExpr_sizes[1];
    static real_T eml_db_hoistedExpr_data[3000];
    int32_T eml_hb_hoistedExpr_sizes[2];
    real_T eml_eb_hoistedExpr_data[3000];
    int32_T eml_d_filterStatesR_sizes[1];
    real_T eml_d_filterStatesR_data[3000];
    int32_T eml_e_yR_sizes[2];
    int32_T eml_ib_hoistedExpr_sizes[1];
    static real_T eml_fb_hoistedExpr_data[3000];
    int32_T eml_i16;
    int32_T eml_f_yL_sizes[2];
    static real_T eml_d_yL_data[13824];
    int32_T eml_jb_hoistedExpr_sizes[2];
    int32_T eml_kb_hoistedExpr_sizes[2];
    int32_T eml_lb_hoistedExpr_sizes[2];
    int32_T eml_mb_hoistedExpr_sizes[1];
    static real_T eml_gb_hoistedExpr_data[6912];
    int32_T eml_j_tmp_sizes[1];
    static int32_T eml_j_tmp_data[6912];
    int32_T eml_iv40[2];
    int32_T eml_nb_hoistedExpr_sizes[1];
    static real_T eml_hb_hoistedExpr_data[6912];
    int32_T eml_ob_hoistedExpr_sizes[1];
    static real_T eml_ib_hoistedExpr_data[6912];
    int32_T eml_pb_hoistedExpr_sizes[1];
    static real_T eml_jb_hoistedExpr_data[6912];
    int32_T eml_qb_hoistedExpr_sizes[1];
    static real_T eml_kb_hoistedExpr_data[6912];
    int32_T eml_rb_hoistedExpr_sizes[1];
    static real_T eml_lb_hoistedExpr_data[6912];
    int32_T eml_c_frameBufferL_sizes[2];
    static real_T eml_frameBufferL_data[6912];
    int32_T eml_sb_hoistedExpr_sizes[1];
    static real_T eml_mb_hoistedExpr_data[6912];
    int32_T eml_frameBufferR_sizes[2];
    static real_T eml_frameBufferR_data[6912];
    int32_T eml_tb_hoistedExpr_sizes[1];
    static real_T eml_nb_hoistedExpr_data[6912];
    int32_T eml_ub_hoistedExpr_sizes[1];
    static real_T eml_ob_hoistedExpr_data[6912];
    int32_T eml_vb_hoistedExpr_sizes[1];
    static real_T eml_pb_hoistedExpr_data[6912];
    int32_T eml_b_y_sizes[2];
    boolean_T eml_b_y_data[6912];
    int32_T eml_k_tmp_sizes[2];
    static int32_T eml_k_tmp_data[6912];
    int32_T eml_wb_hoistedExpr_sizes[1];
    static real_T eml_qb_hoistedExpr_data[6912];
    int32_T eml_c_y_sizes[2];
    /* ESSEXAIDPROCESSFRAME Essex aid algorithm in frame processing mode */
    /*    This code will look a bit odd to most Matlab programmers. This is */
    /*    because the intended target is a C function that will be called on a */
    /*    sub-millisecond basis. The bizzare enumerations assist the */
    /*    pass-by-reference functionality that allows this function to fly in */
    /*    real-time. This function works on a need to know basis, eliminating any */
    /*    unnecessary data copying or parameter calculation. */
    /*  eml.varsize('frameBuffer', 6192); */
    /* Fake enumeration - must be kept up to date with c++ enum */
    /*  enumC_BPb1 = 8; */
    /*  enumC_BPa1 = 13; */
    /*  enumC_BPb2 = 18; */
    /*  enumC_BPa2 = 23; */
    /*  enumC_BPb3 = 28; */
    /*  enumC_BPa3 = 33; */
    /*  enumC_BPb4 = 38; */
    /*  enumC_BPa4 = 43; */
    /*  enumS_MOC1  = 1; */
    /*  enumS_BPin_1_1 = 2; */
    /*  enumS_BPin_2_1 = 6; */
    /*  enumS_BPout_1_1 = 10; */
    /*  enumS_BPout_2_1 = 14; */
    /*  */
    /*  enumS_MOC2 = 18; */
    /*  enumS_BPin_1_2 = 19; */
    /*  enumS_BPin_2_2 = 23; */
    /*  enumS_BPout_1_2 = 27; */
    /*  enumS_BPout_2_2 = 31; */
    /*  ... */
    /*  rmsLev[0] = iunput RMS from AR smoothed response */
    /* Initial gain */
    /*  frameBuffer(1:numSamples) = frameBuffer(1:numSamples)*ipScalar; */
    /* % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
    /*  Place where conversion to velocity once lived */
    /* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
    /*  tympanic membrane response in meters */
    if(1.0 > eml_numSamples) {
        eml_loop_ub = 0;
    } else {
        eml_loop_ub = emlrtBoundsCheck((int32_T)eml_numSamples, &eml_cc_emlrtBCI);
    }
    eml_hoistedExpr_sizes[0] = eml_loop_ub;
    eml_loop_ub--;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_hoistedExpr_data[eml_b_loop_ub] = 1.0 + (real_T)eml_b_loop_ub;
    }
    eml_b_hoistedExpr_sizes[0] = 1;
    eml_A_sizes[0] = 1;
    eml_A_sizes[1] = eml_hoistedExpr_sizes[0];
    eml_b_hoistedExpr_sizes[1] = eml_A_sizes[1];
    eml_loop_ub = eml_hoistedExpr_sizes[0] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_b_hoistedExpr_data[eml_b_loop_ub] = eml_hoistedExpr_data[eml_b_loop_ub];
    }
    eml_A_sizes[0] = 1;
    eml_A_sizes[1] = eml_b_hoistedExpr_sizes[1];
    eml_stapesVelL_sizes[0] = 1;
    eml_stapesVelL_sizes[1] = eml_A_sizes[1];
    eml_loop_ub = eml_A_sizes[1] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        for(eml_y = 0; eml_y <= 0; eml_y = 1) {
            eml_stapesVelL_data[eml_b_loop_ub] = eml_frameBufferL[(int32_T)eml_b_hoistedExpr_data[eml_b_loop_ub] - 1];
        }
    }
    if(1.0 > eml_numSamples) {
        eml_loop_ub = 0;
    } else {
        eml_loop_ub = emlrtBoundsCheck((int32_T)eml_numSamples, &eml_dc_emlrtBCI);
    }
    eml_c_hoistedExpr_sizes[0] = eml_loop_ub;
    eml_loop_ub--;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_c_hoistedExpr_data[eml_b_loop_ub] = 1.0 + (real_T)eml_b_loop_ub;
    }
    eml_b_hoistedExpr_sizes[0] = 1;
    eml_A_sizes[0] = 1;
    eml_A_sizes[1] = eml_c_hoistedExpr_sizes[0];
    eml_b_hoistedExpr_sizes[1] = eml_A_sizes[1];
    eml_loop_ub = eml_c_hoistedExpr_sizes[0] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_b_hoistedExpr_data[eml_b_loop_ub] = eml_c_hoistedExpr_data[eml_b_loop_ub];
    }
    eml_A_sizes[0] = 1;
    eml_A_sizes[1] = eml_b_hoistedExpr_sizes[1];
    eml_stapesVelR_sizes[0] = 1;
    eml_stapesVelR_sizes[1] = eml_A_sizes[1];
    eml_loop_ub = eml_A_sizes[1] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        for(eml_y = 0; eml_y <= 0; eml_y = 1) {
            eml_stapesVelR_data[eml_b_loop_ub] = eml_frameBufferR[(int32_T)eml_b_hoistedExpr_data[eml_b_loop_ub] - 1];
        }
    }
    if(1.0 > eml_numSamples) {
        eml_loop_ub = 0;
    } else {
        eml_loop_ub = emlrtBoundsCheck((int32_T)eml_numSamples, &eml_ec_emlrtBCI);
    }
    eml_d_hoistedExpr_sizes[0] = eml_loop_ub;
    eml_loop_ub--;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_d_hoistedExpr_data[eml_b_loop_ub] = 1.0 + (real_T)eml_b_loop_ub;
    }
    eml_b_hoistedExpr_sizes[0] = 1;
    eml_A_sizes[0] = 1;
    eml_A_sizes[1] = eml_d_hoistedExpr_sizes[0];
    eml_b_hoistedExpr_sizes[1] = eml_A_sizes[1];
    eml_loop_ub = eml_d_hoistedExpr_sizes[0] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_b_hoistedExpr_data[eml_b_loop_ub] = eml_d_hoistedExpr_data[eml_b_loop_ub];
    }
    eml_A_sizes[0] = 1;
    eml_A_sizes[1] = eml_b_hoistedExpr_sizes[1];
    eml_frameBufferL_sizes[0] = 1;
    eml_frameBufferL_sizes[1] = eml_A_sizes[1];
    for(eml_loop_ub = 0; eml_loop_ub < 2; eml_loop_ub++) {
        eml_iv38[eml_loop_ub] = (int16_T)eml_frameBufferL_sizes[eml_loop_ub];
    }
    if(1.0 > eml_numSamples) {
        eml_loop_ub = 0;
    } else {
        eml_loop_ub = emlrtBoundsCheck((int32_T)eml_numSamples, &eml_fc_emlrtBCI);
    }
    eml_e_hoistedExpr_sizes[0] = eml_loop_ub;
    eml_loop_ub--;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_e_hoistedExpr_data[eml_b_loop_ub] = 1.0 + (real_T)eml_b_loop_ub;
    }
    eml_b_hoistedExpr_sizes[0] = 1;
    eml_A_sizes[0] = 1;
    eml_A_sizes[1] = eml_e_hoistedExpr_sizes[0];
    eml_b_hoistedExpr_sizes[1] = eml_A_sizes[1];
    eml_loop_ub = eml_e_hoistedExpr_sizes[0] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_b_hoistedExpr_data[eml_b_loop_ub] = eml_e_hoistedExpr_data[eml_b_loop_ub];
    }
    eml_tmp_sizes[0] = 1;
    eml_A_sizes[0] = 1;
    eml_A_sizes[1] = eml_b_hoistedExpr_sizes[1];
    eml_tmp_sizes[1] = eml_A_sizes[1];
    eml_loop_ub = eml_b_hoistedExpr_sizes[1] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_tmp_data[eml_b_loop_ub] = (int32_T)eml_b_hoistedExpr_data[eml_b_loop_ub];
    }
    eml_y_sizes[0] = 1;
    eml_iv39[0] = 1;
    eml_iv39[1] = eml_iv38[1];
    eml_y_sizes[1] = eml_iv39[1];
    eml_loop_ub = eml_iv38[1] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_y_data[eml_b_loop_ub] = 0.0;
    }
    emlrtSizeEqCheck1D(eml_tmp_sizes[1], eml_y_sizes[1], &eml_c_emlrtECI);
    eml_loop_ub = eml_y_sizes[1] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_frameBufferL[eml_tmp_data[eml_b_loop_ub] - 1] = 0.0;
    }
    if(1.0 > eml_numSamples) {
        eml_loop_ub = 0;
    } else {
        eml_loop_ub = emlrtBoundsCheck((int32_T)eml_numSamples, &eml_gc_emlrtBCI);
    }
    eml_f_hoistedExpr_sizes[0] = eml_loop_ub;
    eml_loop_ub--;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_f_hoistedExpr_data[eml_b_loop_ub] = 1.0 + (real_T)eml_b_loop_ub;
    }
    eml_b_hoistedExpr_sizes[0] = 1;
    eml_A_sizes[0] = 1;
    eml_A_sizes[1] = eml_f_hoistedExpr_sizes[0];
    eml_b_hoistedExpr_sizes[1] = eml_A_sizes[1];
    eml_loop_ub = eml_f_hoistedExpr_sizes[0] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_b_hoistedExpr_data[eml_b_loop_ub] = eml_f_hoistedExpr_data[eml_b_loop_ub];
    }
    eml_A_sizes[0] = 1;
    eml_A_sizes[1] = eml_b_hoistedExpr_sizes[1];
    eml_b_frameBufferL_sizes[0] = 1;
    eml_b_frameBufferL_sizes[1] = eml_A_sizes[1];
    for(eml_loop_ub = 0; eml_loop_ub < 2; eml_loop_ub++) {
        eml_iv38[eml_loop_ub] = (int16_T)eml_b_frameBufferL_sizes[eml_loop_ub];
    }
    if(1.0 > eml_numSamples) {
        eml_loop_ub = 0;
    } else {
        eml_loop_ub = emlrtBoundsCheck((int32_T)eml_numSamples, &eml_hc_emlrtBCI);
    }
    eml_g_hoistedExpr_sizes[0] = eml_loop_ub;
    eml_loop_ub--;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_A_data[eml_b_loop_ub] = 1.0 + (real_T)eml_b_loop_ub;
    }
    eml_b_hoistedExpr_sizes[0] = 1;
    eml_A_sizes[0] = 1;
    eml_A_sizes[1] = eml_g_hoistedExpr_sizes[0];
    eml_b_hoistedExpr_sizes[1] = eml_A_sizes[1];
    eml_loop_ub = eml_g_hoistedExpr_sizes[0] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_b_hoistedExpr_data[eml_b_loop_ub] = eml_A_data[eml_b_loop_ub];
    }
    eml_tmp_sizes[0] = 1;
    eml_A_sizes[0] = 1;
    eml_A_sizes[1] = eml_b_hoistedExpr_sizes[1];
    eml_tmp_sizes[1] = eml_A_sizes[1];
    eml_loop_ub = eml_b_hoistedExpr_sizes[1] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_tmp_data[eml_b_loop_ub] = (int32_T)eml_b_hoistedExpr_data[eml_b_loop_ub];
    }
    eml_y_sizes[0] = 1;
    eml_iv39[0] = 1;
    eml_iv39[1] = eml_iv38[1];
    eml_y_sizes[1] = eml_iv39[1];
    eml_loop_ub = eml_iv38[1] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_y_data[eml_b_loop_ub] = 0.0;
    }
    emlrtSizeEqCheck1D(eml_tmp_sizes[1], eml_y_sizes[1], &eml_d_emlrtECI);
    eml_loop_ub = eml_y_sizes[1] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_frameBufferR[eml_tmp_data[eml_b_loop_ub] - 1] = 0.0;
    }
    /* % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
    /*  ACOUSTIC REFLEX */
    /* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
    /*  find  rms of smoothed ip signal */
    /*   this will be used to trigger the AR reflex */
    /* 
         % % [yL,  filterStatesL(enumS_AR+1)] = filter(filterCoeffs(enumC_ARb+1:enumC_ARb+2), filterCoeffs(enumC_ARa+1:enumC_ARa+2) , stapesVelL.^2, filterStatesL(enumS_AR+1)); */
    /* 
         % % [yR,  filterStatesR(enumS_AR+1)] = filter(filterCoeffs(enumC_ARb+1:enumC_ARb+2), filterCoeffs(enumC_ARa+1:enumC_ARa+2) , stapesVelR.^2, filterStatesR(enumS_AR+1)); */
    /*  % %  */
    /*  % % % restore Pa scale */
    /*  % % smoothedARrmsL = sqrt(yL);  %confusing name for parameter - it is a short term RMS. */
    /*  % % smoothedARrmsR = sqrt(yR);  %confusing name for parameter - it is a short term RMS. */
    /*  attenuate input (NB cross product used) */
    if(1.0 > eml_numSamples) {
        eml_loop_ub = 0;
    } else {
        eml_loop_ub = emlrtBoundsCheck((int32_T)eml_numSamples, &eml_ic_emlrtBCI);
    }
    eml_h_hoistedExpr_sizes[0] = eml_loop_ub;
    eml_loop_ub--;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_yL_data[eml_b_loop_ub] = 1.0 + (real_T)eml_b_loop_ub;
    }
    eml_b_hoistedExpr_sizes[0] = 1;
    eml_A_sizes[0] = 1;
    eml_A_sizes[1] = eml_h_hoistedExpr_sizes[0];
    eml_b_hoistedExpr_sizes[1] = eml_A_sizes[1];
    eml_loop_ub = eml_h_hoistedExpr_sizes[0] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_b_hoistedExpr_data[eml_b_loop_ub] = eml_yL_data[eml_b_loop_ub];
    }
    EMLRTPUSHRTSTACK(&eml_gb_emlrtRSI);
    eml_A_sizes[0] = 1;
    eml_A_sizes[1] = eml_b_hoistedExpr_sizes[1];
    eml_y_sizes[0] = 1;
    eml_y_sizes[1] = eml_A_sizes[1];
    eml_loop_ub = eml_A_sizes[1] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        for(eml_y = 0; eml_y <= 0; eml_y = 1) {
            eml_y_data[eml_b_loop_ub] = eml_ARampL[(int32_T)eml_b_hoistedExpr_data[eml_b_loop_ub] - 1];
        }
    }
    EMLRTPUSHRTSTACK(&eml_hb_emlrtRSI);
    EMLRTPUSHRTSTACK(&eml_ib_emlrtRSI);
    emlrtSizeEqCheckND(eml_stapesVelL_sizes, eml_y_sizes, &eml_b_emlrtECI);
    eml_stapesVelL_sizes[0] = 1;
    eml_loop_ub = eml_stapesVelL_sizes[1];
    eml_loop_ub--;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_stapesVelL_data[eml_b_loop_ub] /= eml_y_data[eml_b_loop_ub];
    }
    EMLRTPOPRTSTACK(&eml_ib_emlrtRSI);
    EMLRTPOPRTSTACK(&eml_hb_emlrtRSI);
    EMLRTPOPRTSTACK(&eml_gb_emlrtRSI);
    if(1.0 > eml_numSamples) {
        eml_loop_ub = 0;
    } else {
        eml_loop_ub = emlrtBoundsCheck((int32_T)eml_numSamples, &eml_jc_emlrtBCI);
    }
    eml_i_hoistedExpr_sizes[0] = eml_loop_ub;
    eml_loop_ub--;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_b_yL_data[eml_b_loop_ub] = 1.0 + (real_T)eml_b_loop_ub;
    }
    eml_b_hoistedExpr_sizes[0] = 1;
    eml_A_sizes[0] = 1;
    eml_A_sizes[1] = eml_i_hoistedExpr_sizes[0];
    eml_b_hoistedExpr_sizes[1] = eml_A_sizes[1];
    eml_loop_ub = eml_i_hoistedExpr_sizes[0] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_b_hoistedExpr_data[eml_b_loop_ub] = eml_b_yL_data[eml_b_loop_ub];
    }
    EMLRTPUSHRTSTACK(&eml_fb_emlrtRSI);
    eml_A_sizes[0] = 1;
    eml_A_sizes[1] = eml_b_hoistedExpr_sizes[1];
    eml_y_sizes[0] = 1;
    eml_y_sizes[1] = eml_A_sizes[1];
    eml_loop_ub = eml_A_sizes[1] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        for(eml_y = 0; eml_y <= 0; eml_y = 1) {
            eml_y_data[eml_b_loop_ub] = eml_ARampR[(int32_T)eml_b_hoistedExpr_data[eml_b_loop_ub] - 1];
        }
    }
    EMLRTPUSHRTSTACK(&eml_hb_emlrtRSI);
    EMLRTPUSHRTSTACK(&eml_ib_emlrtRSI);
    emlrtSizeEqCheckND(eml_stapesVelR_sizes, eml_y_sizes, &eml_emlrtECI);
    eml_stapesVelR_sizes[0] = 1;
    eml_loop_ub = eml_stapesVelR_sizes[1];
    eml_loop_ub--;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_stapesVelR_data[eml_b_loop_ub] /= eml_y_data[eml_b_loop_ub];
    }
    EMLRTPOPRTSTACK(&eml_ib_emlrtRSI);
    EMLRTPOPRTSTACK(&eml_hb_emlrtRSI);
    EMLRTPOPRTSTACK(&eml_fb_emlrtRSI);
    /*  % % %CALC ARamp FOR NEXT FRAME */
    /*  % % % compare levels in the previous segment with AR threshold */
    /*  % % ARampL(1:numSamples) = smoothedARrmsL/ARthresholdPa; */
    /*  % % ARampR(1:numSamples) = smoothedARrmsR/ARthresholdPa; */
    /*  % % % all sub-treshold values are set to 1 */
    /*  % % ARampL(ARampL(1:numSamples)<1)=1; */
    /*  % % ARampR(ARampR(1:numSamples)<1)=1; */
    /* % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
    /*  DRNL */
    /* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
    eml_filterCount = 1;
    while((real_T)eml_filterCount <= eml_numChannels) {
        eml_yL_sizes[0] = 1;
        eml_yL_sizes[1] = eml_stapesVelL_sizes[1];
        eml_loop_ub = eml_stapesVelL_sizes[1] - 1;
        for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
            eml_c_yL_data[eml_b_loop_ub] = eml_stapesVelL_data[eml_b_loop_ub];
        }
        eml_yR_sizes[0] = 1;
        eml_yR_sizes[1] = eml_stapesVelR_sizes[1];
        eml_loop_ub = eml_stapesVelR_sizes[1] - 1;
        for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
            eml_yR_data[eml_b_loop_ub] = eml_stapesVelR_data[eml_b_loop_ub];
        }
        if(1.0 > eml_numSamples) {
            eml_loop_ub = 0;
        } else {
            eml_loop_ub = emlrtBoundsCheck((int32_T)eml_numSamples, &eml_lc_emlrtBCI);
        }
        eml_j_hoistedExpr_sizes[0] = eml_loop_ub;
        eml_loop_ub--;
        for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
            eml_g_hoistedExpr_data[eml_b_loop_ub] = 1.0 + (real_T)eml_b_loop_ub;
        }
        eml_b_hoistedExpr_sizes[0] = 1;
        eml_A_sizes[0] = 1;
        eml_A_sizes[1] = eml_j_hoistedExpr_sizes[0];
        eml_b_hoistedExpr_sizes[1] = eml_A_sizes[1];
        eml_loop_ub = eml_j_hoistedExpr_sizes[0] - 1;
        for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
            eml_b_hoistedExpr_data[eml_b_loop_ub] = eml_g_hoistedExpr_data[eml_b_loop_ub];
        }
        eml_hoistedExpr_sizes[0] = eml_b_hoistedExpr_sizes[1];
        eml_loop_ub = emlrtBoundsCheck(eml_filterCount, &eml_kc_emlrtBCI) - 1;
        eml_y_sizes[0] = 1;
        eml_y_sizes[1] = eml_hoistedExpr_sizes[0];
        eml_b_loop_ub = eml_hoistedExpr_sizes[0] - 1;
        for(eml_y = 0; eml_y <= eml_b_loop_ub; eml_y++) {
            eml_y_data[eml_y] = eml_MOCcontrol[eml_loop_ub + 11 * ((int32_T)eml_b_hoistedExpr_data[eml_y] - 1)];
        }
        /* syntactic shorthand */
        if(eml_useGTF) {
            if(eml_filterOrder < 5.0) {
            } else {
                EMLRTPUSHRTSTACK(&eml_eb_emlrtRSI);
                eml_b_y = NULL;
                for(eml_loop_ub = 0; eml_loop_ub < 2; eml_loop_ub++) {
                    eml_A_sizes[eml_loop_ub] = 1 + 30 * eml_loop_ub;
                }
                eml_m15 = mxCreateCharArray(2, eml_A_sizes);
                emlrtInitCharArray(31, eml_m15, eml_cv24);
                emlrtAssign(&eml_b_y, eml_m15);
                m_error(eml_b_y, &eml_emlrtMCI);
                EMLRTPOPRTSTACK(&eml_eb_emlrtRSI);
            }
            eml_c_loop_ub = 1.0;
            while(eml_c_loop_ub <= eml_filterOrder) {
                eml_A = ((real_T)(17 * (eml_filterCount - 1)) + 3.0) + (eml_c_loop_ub - 1.0) * 2.0;
                eml_d0 = ((real_T)(17 * (eml_filterCount - 1)) + 4.0) + (eml_c_loop_ub - 1.0) * 2.0;
                if(eml_A > eml_d0) {
                    eml_A = 1.0;
                    eml_d0 = 0.0;
                }
                eml_k_hoistedExpr_sizes[0] = ((int32_T)eml_d0 - (int32_T)eml_A) + 1;
                eml_loop_ub = (int32_T)eml_d0 - (int32_T)eml_A;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_h_hoistedExpr_data[eml_b_loop_ub] = eml_A + (real_T)eml_b_loop_ub;
                }
                eml_b_tmp_sizes[0] = 1;
                eml_A_sizes[0] = 1;
                eml_A_sizes[1] = eml_k_hoistedExpr_sizes[0];
                eml_b_tmp_sizes[1] = eml_A_sizes[1];
                eml_loop_ub = eml_k_hoistedExpr_sizes[0] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_b_tmp_data[eml_b_loop_ub] = eml_h_hoistedExpr_data[eml_b_loop_ub];
                }
                EMLRTPUSHRTSTACK(&eml_db_emlrtRSI);
                eml_loop_ub = 10 * (eml_filterCount - 1);
                eml_y = 10 * (eml_filterCount - 1);
                for(eml_b_loop_ub = 0; eml_b_loop_ub < 2; eml_b_loop_ub++) {
                    eml_b_filterCoeffs[eml_b_loop_ub] = eml_filterCoeffs[(eml_loop_ub + (9 + eml_b_loop_ub)) - 1];
                }
                for(eml_loop_ub = 0; eml_loop_ub < 3; eml_loop_ub++) {
                    eml_c_filterCoeffs[eml_loop_ub] = eml_filterCoeffs[(eml_y + (14 + eml_loop_ub)) - 1];
                }
                eml_A_sizes[0] = 1;
                eml_A_sizes[1] = eml_b_tmp_sizes[1];
                eml_l_hoistedExpr_sizes[0] = 1;
                eml_l_hoistedExpr_sizes[1] = eml_A_sizes[1];
                eml_loop_ub = eml_A_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    for(eml_y = 0; eml_y <= 0; eml_y = 1) {
                        eml_i_hoistedExpr_data[eml_b_loop_ub] = eml_filterStatesL[(int32_T)eml_b_tmp_data[eml_b_loop_ub] - 1];
                    }
                }
                eml_filterStatesL_sizes[0] = eml_l_hoistedExpr_sizes[1];
                eml_loop_ub = eml_l_hoistedExpr_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_filterStatesL_data[eml_b_loop_ub] = eml_i_hoistedExpr_data[eml_b_loop_ub];
                }
                eml_b_yL_sizes[0] = 1;
                eml_b_yL_sizes[1] = eml_yL_sizes[1];
                eml_loop_ub = eml_yL_sizes[0] * eml_yL_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_b_yL_data[eml_b_loop_ub] = eml_c_yL_data[eml_b_loop_ub];
                }
                m_filter(eml_b_filterCoeffs, eml_c_filterCoeffs, eml_b_yL_data, eml_b_yL_sizes, eml_filterStatesL_data, 
                    eml_filterStatesL_sizes, eml_c_yL_data, eml_yL_sizes, eml_d_filterCoeffs);
                EMLRTPOPRTSTACK(&eml_db_emlrtRSI);
                eml_A = ((real_T)(17 * (eml_filterCount - 1)) + 3.0) + (eml_c_loop_ub - 1.0) * 2.0;
                eml_d0 = ((real_T)(17 * (eml_filterCount - 1)) + 4.0) + (eml_c_loop_ub - 1.0) * 2.0;
                if(eml_A > eml_d0) {
                    eml_A = 1.0;
                    eml_d0 = 0.0;
                }
                eml_m_hoistedExpr_sizes[0] = ((int32_T)eml_d0 - (int32_T)eml_A) + 1;
                eml_loop_ub = (int32_T)eml_d0 - (int32_T)eml_A;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_j_hoistedExpr_data[eml_b_loop_ub] = eml_A + (real_T)eml_b_loop_ub;
                }
                eml_b_tmp_sizes[0] = 1;
                eml_A_sizes[0] = 1;
                eml_A_sizes[1] = eml_m_hoistedExpr_sizes[0];
                eml_b_tmp_sizes[1] = eml_A_sizes[1];
                eml_loop_ub = eml_m_hoistedExpr_sizes[0] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_b_tmp_data[eml_b_loop_ub] = eml_j_hoistedExpr_data[eml_b_loop_ub];
                }
                eml_c_tmp_sizes[0] = 1;
                eml_A_sizes[0] = 1;
                eml_A_sizes[1] = eml_b_tmp_sizes[1];
                eml_c_tmp_sizes[1] = eml_A_sizes[1];
                eml_loop_ub = eml_b_tmp_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_c_tmp_data[eml_b_loop_ub] = (int32_T)eml_b_tmp_data[eml_b_loop_ub];
                }
                emlrtSizeEqCheck1D(eml_c_tmp_sizes[1], 2, &eml_e_emlrtECI);
                eml_loop_ub = eml_c_tmp_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    for(eml_y = 0; eml_y <= 0; eml_y = 1) {
                        eml_filterStatesL[eml_c_tmp_data[eml_b_loop_ub] - 1] = eml_d_filterCoeffs[eml_b_loop_ub];
                    }
                }
                eml_A = ((real_T)(17 * (eml_filterCount - 1)) + 3.0) + (eml_c_loop_ub - 1.0) * 2.0;
                eml_d0 = ((real_T)(17 * (eml_filterCount - 1)) + 4.0) + (eml_c_loop_ub - 1.0) * 2.0;
                if(eml_A > eml_d0) {
                    eml_A = 1.0;
                    eml_d0 = 0.0;
                }
                eml_n_hoistedExpr_sizes[0] = ((int32_T)eml_d0 - (int32_T)eml_A) + 1;
                eml_loop_ub = (int32_T)eml_d0 - (int32_T)eml_A;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_k_hoistedExpr_data[eml_b_loop_ub] = eml_A + (real_T)eml_b_loop_ub;
                }
                eml_b_tmp_sizes[0] = 1;
                eml_A_sizes[0] = 1;
                eml_A_sizes[1] = eml_n_hoistedExpr_sizes[0];
                eml_b_tmp_sizes[1] = eml_A_sizes[1];
                eml_loop_ub = eml_n_hoistedExpr_sizes[0] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_b_tmp_data[eml_b_loop_ub] = eml_k_hoistedExpr_data[eml_b_loop_ub];
                }
                EMLRTPUSHRTSTACK(&eml_cb_emlrtRSI);
                eml_loop_ub = 10 * (eml_filterCount - 1);
                eml_y = 10 * (eml_filterCount - 1);
                for(eml_b_loop_ub = 0; eml_b_loop_ub < 2; eml_b_loop_ub++) {
                    eml_b_filterCoeffs[eml_b_loop_ub] = eml_filterCoeffs[(eml_loop_ub + (9 + eml_b_loop_ub)) - 1];
                }
                for(eml_loop_ub = 0; eml_loop_ub < 3; eml_loop_ub++) {
                    eml_c_filterCoeffs[eml_loop_ub] = eml_filterCoeffs[(eml_y + (14 + eml_loop_ub)) - 1];
                }
                eml_A_sizes[0] = 1;
                eml_A_sizes[1] = eml_b_tmp_sizes[1];
                eml_o_hoistedExpr_sizes[0] = 1;
                eml_o_hoistedExpr_sizes[1] = eml_A_sizes[1];
                eml_loop_ub = eml_A_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    for(eml_y = 0; eml_y <= 0; eml_y = 1) {
                        eml_l_hoistedExpr_data[eml_b_loop_ub] = eml_filterStatesR[(int32_T)eml_b_tmp_data[eml_b_loop_ub] - 1];
                    }
                }
                eml_filterStatesR_sizes[0] = eml_o_hoistedExpr_sizes[1];
                eml_loop_ub = eml_o_hoistedExpr_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_filterStatesR_data[eml_b_loop_ub] = eml_l_hoistedExpr_data[eml_b_loop_ub];
                }
                eml_b_yR_sizes[0] = 1;
                eml_b_yR_sizes[1] = eml_yR_sizes[1];
                eml_loop_ub = eml_yR_sizes[0] * eml_yR_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_b_yL_data[eml_b_loop_ub] = eml_yR_data[eml_b_loop_ub];
                }
                m_filter(eml_b_filterCoeffs, eml_c_filterCoeffs, eml_b_yL_data, eml_b_yR_sizes, eml_filterStatesR_data, 
                    eml_filterStatesR_sizes, eml_yR_data, eml_yR_sizes, eml_d_filterCoeffs);
                EMLRTPOPRTSTACK(&eml_cb_emlrtRSI);
                eml_A = ((real_T)(17 * (eml_filterCount - 1)) + 3.0) + (eml_c_loop_ub - 1.0) * 2.0;
                eml_d0 = ((real_T)(17 * (eml_filterCount - 1)) + 4.0) + (eml_c_loop_ub - 1.0) * 2.0;
                if(eml_A > eml_d0) {
                    eml_A = 1.0;
                    eml_d0 = 0.0;
                }
                eml_p_hoistedExpr_sizes[0] = ((int32_T)eml_d0 - (int32_T)eml_A) + 1;
                eml_loop_ub = (int32_T)eml_d0 - (int32_T)eml_A;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_m_hoistedExpr_data[eml_b_loop_ub] = eml_A + (real_T)eml_b_loop_ub;
                }
                eml_b_tmp_sizes[0] = 1;
                eml_A_sizes[0] = 1;
                eml_A_sizes[1] = eml_p_hoistedExpr_sizes[0];
                eml_b_tmp_sizes[1] = eml_A_sizes[1];
                eml_loop_ub = eml_p_hoistedExpr_sizes[0] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_b_tmp_data[eml_b_loop_ub] = eml_m_hoistedExpr_data[eml_b_loop_ub];
                }
                eml_c_tmp_sizes[0] = 1;
                eml_A_sizes[0] = 1;
                eml_A_sizes[1] = eml_b_tmp_sizes[1];
                eml_c_tmp_sizes[1] = eml_A_sizes[1];
                eml_loop_ub = eml_b_tmp_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_c_tmp_data[eml_b_loop_ub] = (int32_T)eml_b_tmp_data[eml_b_loop_ub];
                }
                emlrtSizeEqCheck1D(eml_c_tmp_sizes[1], 2, &eml_f_emlrtECI);
                eml_loop_ub = eml_c_tmp_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    for(eml_y = 0; eml_y <= 0; eml_y = 1) {
                        eml_filterStatesR[eml_c_tmp_data[eml_b_loop_ub] - 1] = eml_d_filterCoeffs[eml_b_loop_ub];
                    }
                }
                eml_c_loop_ub++;
                emlrtBreakCheck();
            }
        } else {
            if((eml_filterOrder == 2.0) || (eml_filterOrder == 4.0)) {
                eml_b3 = TRUE;
            } else {
                eml_b3 = FALSE;
            }
            if(eml_b3) {
            } else {
                EMLRTPUSHRTSTACK(&eml_bb_emlrtRSI);
                eml_c_y = NULL;
                for(eml_loop_ub = 0; eml_loop_ub < 2; eml_loop_ub++) {
                    eml_A_sizes[eml_loop_ub] = 1 + 25 * eml_loop_ub;
                }
                eml_m15 = mxCreateCharArray(2, eml_A_sizes);
                emlrtInitCharArray(26, eml_m15, eml_cv25);
                emlrtAssign(&eml_c_y, eml_m15);
                m_error(eml_c_y, &eml_b_emlrtMCI);
                EMLRTPOPRTSTACK(&eml_bb_emlrtRSI);
            }
            eml_c_loop_ub = eml_filterOrder / 2.0;
            eml_nn = 1.0;
            while(eml_nn <= eml_c_loop_ub) {
                eml_A = ((real_T)(17 * (eml_filterCount - 1)) + 3.0) + (eml_nn - 1.0) * 4.0;
                eml_d0 = ((real_T)(17 * (eml_filterCount - 1)) + 6.0) + (eml_nn - 1.0) * 4.0;
                if(eml_A > eml_d0) {
                    eml_A = 1.0;
                    eml_d0 = 0.0;
                }
                eml_q_hoistedExpr_sizes[0] = ((int32_T)eml_d0 - (int32_T)eml_A) + 1;
                eml_loop_ub = (int32_T)eml_d0 - (int32_T)eml_A;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_n_hoistedExpr_data[eml_b_loop_ub] = eml_A + (real_T)eml_b_loop_ub;
                }
                eml_d_tmp_sizes[0] = 1;
                eml_A_sizes[0] = 1;
                eml_A_sizes[1] = eml_q_hoistedExpr_sizes[0];
                eml_d_tmp_sizes[1] = eml_A_sizes[1];
                eml_loop_ub = eml_q_hoistedExpr_sizes[0] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_d_tmp_data[eml_b_loop_ub] = eml_n_hoistedExpr_data[eml_b_loop_ub];
                }
                EMLRTPUSHRTSTACK(&eml_ab_emlrtRSI);
                eml_loop_ub = 10 * (eml_filterCount - 1);
                eml_y = 10 * (eml_filterCount - 1);
                for(eml_b_loop_ub = 0; eml_b_loop_ub < 5; eml_b_loop_ub++) {
                    eml_e_filterCoeffs[eml_b_loop_ub] = eml_filterCoeffs[(eml_loop_ub + (9 + eml_b_loop_ub)) - 1];
                    eml_f_filterCoeffs[eml_b_loop_ub] = eml_filterCoeffs[(eml_y + (14 + eml_b_loop_ub)) - 1];
                }
                eml_A_sizes[0] = 1;
                eml_A_sizes[1] = eml_d_tmp_sizes[1];
                eml_r_hoistedExpr_sizes[0] = 1;
                eml_r_hoistedExpr_sizes[1] = eml_A_sizes[1];
                eml_loop_ub = eml_A_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    for(eml_y = 0; eml_y <= 0; eml_y = 1) {
                        eml_o_hoistedExpr_data[eml_b_loop_ub] = eml_filterStatesL[(int32_T)eml_d_tmp_data[eml_b_loop_ub] - 1];
                    }
                }
                eml_b_filterStatesL_sizes[0] = eml_r_hoistedExpr_sizes[1];
                eml_loop_ub = eml_r_hoistedExpr_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_b_filterStatesL_data[eml_b_loop_ub] = eml_o_hoistedExpr_data[eml_b_loop_ub];
                }
                eml_c_yL_sizes[0] = 1;
                eml_c_yL_sizes[1] = eml_yL_sizes[1];
                eml_loop_ub = eml_yL_sizes[0] * eml_yL_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_b_yL_data[eml_b_loop_ub] = eml_c_yL_data[eml_b_loop_ub];
                }
                m_b_filter(eml_e_filterCoeffs, eml_f_filterCoeffs, eml_b_yL_data, eml_c_yL_sizes, eml_b_filterStatesL_data, 
                    eml_b_filterStatesL_sizes, eml_c_yL_data, eml_yL_sizes, eml_dv0);
                EMLRTPOPRTSTACK(&eml_ab_emlrtRSI);
                eml_A = ((real_T)(17 * (eml_filterCount - 1)) + 3.0) + (eml_nn - 1.0) * 4.0;
                eml_d0 = ((real_T)(17 * (eml_filterCount - 1)) + 6.0) + (eml_nn - 1.0) * 4.0;
                if(eml_A > eml_d0) {
                    eml_A = 1.0;
                    eml_d0 = 0.0;
                }
                eml_s_hoistedExpr_sizes[0] = ((int32_T)eml_d0 - (int32_T)eml_A) + 1;
                eml_loop_ub = (int32_T)eml_d0 - (int32_T)eml_A;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_p_hoistedExpr_data[eml_b_loop_ub] = eml_A + (real_T)eml_b_loop_ub;
                }
                eml_d_tmp_sizes[0] = 1;
                eml_A_sizes[0] = 1;
                eml_A_sizes[1] = eml_s_hoistedExpr_sizes[0];
                eml_d_tmp_sizes[1] = eml_A_sizes[1];
                eml_loop_ub = eml_s_hoistedExpr_sizes[0] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_d_tmp_data[eml_b_loop_ub] = eml_p_hoistedExpr_data[eml_b_loop_ub];
                }
                eml_e_tmp_sizes[0] = 1;
                eml_A_sizes[0] = 1;
                eml_A_sizes[1] = eml_d_tmp_sizes[1];
                eml_e_tmp_sizes[1] = eml_A_sizes[1];
                eml_loop_ub = eml_d_tmp_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_e_tmp_data[eml_b_loop_ub] = (int32_T)eml_d_tmp_data[eml_b_loop_ub];
                }
                emlrtSizeEqCheck1D(eml_e_tmp_sizes[1], 4, &eml_g_emlrtECI);
                eml_loop_ub = eml_e_tmp_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    for(eml_y = 0; eml_y <= 0; eml_y = 1) {
                        eml_filterStatesL[eml_e_tmp_data[eml_b_loop_ub] - 1] = eml_dv0[eml_b_loop_ub];
                    }
                }
                eml_A = ((real_T)(17 * (eml_filterCount - 1)) + 3.0) + (eml_nn - 1.0) * 4.0;
                eml_d0 = ((real_T)(17 * (eml_filterCount - 1)) + 6.0) + (eml_nn - 1.0) * 4.0;
                if(eml_A > eml_d0) {
                    eml_A = 1.0;
                    eml_d0 = 0.0;
                }
                eml_t_hoistedExpr_sizes[0] = ((int32_T)eml_d0 - (int32_T)eml_A) + 1;
                eml_loop_ub = (int32_T)eml_d0 - (int32_T)eml_A;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_q_hoistedExpr_data[eml_b_loop_ub] = eml_A + (real_T)eml_b_loop_ub;
                }
                eml_d_tmp_sizes[0] = 1;
                eml_A_sizes[0] = 1;
                eml_A_sizes[1] = eml_t_hoistedExpr_sizes[0];
                eml_d_tmp_sizes[1] = eml_A_sizes[1];
                eml_loop_ub = eml_t_hoistedExpr_sizes[0] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_d_tmp_data[eml_b_loop_ub] = eml_q_hoistedExpr_data[eml_b_loop_ub];
                }
                EMLRTPUSHRTSTACK(&eml_y_emlrtRSI);
                eml_loop_ub = 10 * (eml_filterCount - 1);
                eml_b_loop_ub = 10 * (eml_filterCount - 1);
                for(eml_y = 0; eml_y < 5; eml_y++) {
                    eml_e_filterCoeffs[eml_y] = eml_filterCoeffs[(eml_loop_ub + (9 + eml_y)) - 1];
                    eml_f_filterCoeffs[eml_y] = eml_filterCoeffs[(eml_b_loop_ub + (14 + eml_y)) - 1];
                }
                eml_A_sizes[0] = 1;
                eml_A_sizes[1] = eml_d_tmp_sizes[1];
                eml_u_hoistedExpr_sizes[0] = 1;
                eml_u_hoistedExpr_sizes[1] = eml_A_sizes[1];
                eml_loop_ub = eml_A_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    for(eml_y = 0; eml_y <= 0; eml_y = 1) {
                        eml_r_hoistedExpr_data[eml_b_loop_ub] = eml_filterStatesR[(int32_T)eml_d_tmp_data[eml_b_loop_ub] - 1];
                    }
                }
                eml_b_filterStatesR_sizes[0] = eml_u_hoistedExpr_sizes[1];
                eml_loop_ub = eml_u_hoistedExpr_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_b_filterStatesR_data[eml_b_loop_ub] = eml_r_hoistedExpr_data[eml_b_loop_ub];
                }
                eml_c_yR_sizes[0] = 1;
                eml_c_yR_sizes[1] = eml_yR_sizes[1];
                eml_loop_ub = eml_yR_sizes[0] * eml_yR_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_b_yL_data[eml_b_loop_ub] = eml_yR_data[eml_b_loop_ub];
                }
                m_b_filter(eml_e_filterCoeffs, eml_f_filterCoeffs, eml_b_yL_data, eml_c_yR_sizes, eml_b_filterStatesR_data, 
                    eml_b_filterStatesR_sizes, eml_yR_data, eml_yR_sizes, eml_dv0);
                EMLRTPOPRTSTACK(&eml_y_emlrtRSI);
                eml_A = ((real_T)(17 * (eml_filterCount - 1)) + 3.0) + (eml_nn - 1.0) * 4.0;
                eml_d0 = ((real_T)(17 * (eml_filterCount - 1)) + 6.0) + (eml_nn - 1.0) * 4.0;
                if(eml_A > eml_d0) {
                    eml_A = 1.0;
                    eml_d0 = 0.0;
                }
                eml_v_hoistedExpr_sizes[0] = ((int32_T)eml_d0 - (int32_T)eml_A) + 1;
                eml_loop_ub = (int32_T)eml_d0 - (int32_T)eml_A;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_s_hoistedExpr_data[eml_b_loop_ub] = eml_A + (real_T)eml_b_loop_ub;
                }
                eml_d_tmp_sizes[0] = 1;
                eml_A_sizes[0] = 1;
                eml_A_sizes[1] = eml_v_hoistedExpr_sizes[0];
                eml_d_tmp_sizes[1] = eml_A_sizes[1];
                eml_loop_ub = eml_v_hoistedExpr_sizes[0] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_d_tmp_data[eml_b_loop_ub] = eml_s_hoistedExpr_data[eml_b_loop_ub];
                }
                eml_e_tmp_sizes[0] = 1;
                eml_A_sizes[0] = 1;
                eml_A_sizes[1] = eml_d_tmp_sizes[1];
                eml_e_tmp_sizes[1] = eml_A_sizes[1];
                eml_loop_ub = eml_d_tmp_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_e_tmp_data[eml_b_loop_ub] = (int32_T)eml_d_tmp_data[eml_b_loop_ub];
                }
                emlrtSizeEqCheck1D(eml_e_tmp_sizes[1], 4, &eml_h_emlrtECI);
                eml_loop_ub = eml_e_tmp_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    for(eml_y = 0; eml_y <= 0; eml_y = 1) {
                        eml_filterStatesR[eml_e_tmp_data[eml_b_loop_ub] - 1] = eml_dv0[eml_b_loop_ub];
                    }
                }
                eml_nn++;
                emlrtBreakCheck();
            }
        }
        EMLRTPUSHRTSTACK(&eml_x_emlrtRSI);
        m_abs(eml_c_yL_data, eml_yL_sizes, eml_b_hoistedExpr_data, eml_b_hoistedExpr_sizes);
        eml_A = m_max(eml_b_hoistedExpr_data, eml_b_hoistedExpr_sizes);
        eml_A /= 0.00002;
        if(eml_A < 0.0) {
            EMLRTPUSHRTSTACK(&eml_xb_emlrtRSI);
            m_c_eml_error();
            EMLRTPOPRTSTACK(&eml_xb_emlrtRSI);
        }
        eml_peakIPL[eml_filterCount - 1] = 20.0 * muDoubleScalarLog10(eml_A);
        EMLRTPOPRTSTACK(&eml_x_emlrtRSI);
        /* peak in in dB SPL */
        EMLRTPUSHRTSTACK(&eml_w_emlrtRSI);
        m_abs(eml_yR_data, eml_yR_sizes, eml_b_hoistedExpr_data, eml_b_hoistedExpr_sizes);
        eml_A = m_max(eml_b_hoistedExpr_data, eml_b_hoistedExpr_sizes);
        eml_A /= 0.00002;
        if(eml_A < 0.0) {
            EMLRTPUSHRTSTACK(&eml_xb_emlrtRSI);
            m_c_eml_error();
            EMLRTPOPRTSTACK(&eml_xb_emlrtRSI);
        }
        eml_peakIPR[eml_filterCount - 1] = 20.0 * muDoubleScalarLog10(eml_A);
        EMLRTPOPRTSTACK(&eml_w_emlrtRSI);
        /* peak in in dB SPL */
        /*      rmsIPL(filterCount) = 20*log10(  sqrt(mean(yL.^2)) /2e-5 ); %rms in in dB SPL */
        /*      rmsIPR(filterCount) = 20*log10(  sqrt(mean(yR.^2)) /2e-5 ); %rms in in dB SPL */
        EMLRTPUSHRTSTACK(&eml_v_emlrtRSI);
        eml_rmsIPL[eml_filterCount - 1] = 20.0 * muDoubleScalarLog10(muDoubleScalarAbs(eml_c_yL_data[eml_yL_sizes[1] - 1]) / 0.00002
            );
        EMLRTPOPRTSTACK(&eml_v_emlrtRSI);
        /* rms in in dB SPL for GUI (bit of a hack, but it is smoothed in GUI) */
        EMLRTPUSHRTSTACK(&eml_u_emlrtRSI);
        eml_rmsIPR[eml_filterCount - 1] = 20.0 * muDoubleScalarLog10(muDoubleScalarAbs(eml_yR_data[eml_yR_sizes[1] - 1]) / 0.00002);
        EMLRTPOPRTSTACK(&eml_u_emlrtRSI);
        /* rms in in dB SPL   */
        /* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
        /*  compression time */
        /* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
        /*  MOC compression first */
        emlrtSizeEqCheckND(eml_yL_sizes, eml_y_sizes, &eml_i_emlrtECI);
        eml_yL_sizes[0] = 1;
        eml_loop_ub = eml_yL_sizes[1];
        eml_loop_ub--;
        for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
            eml_c_yL_data[eml_b_loop_ub] *= eml_y_data[eml_b_loop_ub];
        }
        emlrtSizeEqCheckND(eml_yR_sizes, eml_y_sizes, &eml_j_emlrtECI);
        eml_yR_sizes[0] = 1;
        eml_loop_ub = eml_yR_sizes[1];
        eml_loop_ub--;
        for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
            eml_yR_data[eml_b_loop_ub] *= eml_y_data[eml_b_loop_ub];
        }
        /*  Instantaneous after */
        EMLRTPUSHRTSTACK(&eml_t_emlrtRSI);
        m_refp1_DRNL_brokenstick_nl(eml_c_yL_data, eml_yL_sizes, eml_DRNLb[eml_filterCount - 1], eml_DRNLc[eml_filterCount - 1]);
        EMLRTPOPRTSTACK(&eml_t_emlrtRSI);
        EMLRTPUSHRTSTACK(&eml_s_emlrtRSI);
        m_refp1_DRNL_brokenstick_nl(eml_yR_data, eml_yR_sizes, eml_DRNLb[eml_filterCount - 1], eml_DRNLc[eml_filterCount - 1]);
        EMLRTPOPRTSTACK(&eml_s_emlrtRSI);
        if(eml_useGTF) {
            eml_c_loop_ub = 1.0;
            while(eml_c_loop_ub <= eml_filterOrder) {
                eml_A = ((real_T)(17 * (eml_filterCount - 1)) + 11.0) + (eml_c_loop_ub - 1.0) * 2.0;
                eml_d0 = ((real_T)(17 * (eml_filterCount - 1)) + 12.0) + (eml_c_loop_ub - 1.0) * 2.0;
                if(eml_A > eml_d0) {
                    eml_A = 1.0;
                    eml_d0 = 0.0;
                }
                eml_w_hoistedExpr_sizes[0] = ((int32_T)eml_d0 - (int32_T)eml_A) + 1;
                eml_loop_ub = (int32_T)eml_d0 - (int32_T)eml_A;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_t_hoistedExpr_data[eml_b_loop_ub] = eml_A + (real_T)eml_b_loop_ub;
                }
                eml_f_tmp_sizes[0] = 1;
                eml_A_sizes[0] = 1;
                eml_A_sizes[1] = eml_w_hoistedExpr_sizes[0];
                eml_f_tmp_sizes[1] = eml_A_sizes[1];
                eml_loop_ub = eml_w_hoistedExpr_sizes[0] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_f_tmp_data[eml_b_loop_ub] = eml_t_hoistedExpr_data[eml_b_loop_ub];
                }
                EMLRTPUSHRTSTACK(&eml_r_emlrtRSI);
                eml_loop_ub = 10 * (eml_filterCount - 1);
                eml_y = 10 * (eml_filterCount - 1);
                for(eml_b_loop_ub = 0; eml_b_loop_ub < 2; eml_b_loop_ub++) {
                    eml_b_filterCoeffs[eml_b_loop_ub] = eml_filterCoeffs[(eml_loop_ub + (9 + eml_b_loop_ub)) - 1];
                }
                for(eml_loop_ub = 0; eml_loop_ub < 3; eml_loop_ub++) {
                    eml_c_filterCoeffs[eml_loop_ub] = eml_filterCoeffs[(eml_y + (14 + eml_loop_ub)) - 1];
                }
                eml_A_sizes[0] = 1;
                eml_A_sizes[1] = eml_f_tmp_sizes[1];
                eml_x_hoistedExpr_sizes[0] = 1;
                eml_x_hoistedExpr_sizes[1] = eml_A_sizes[1];
                eml_loop_ub = eml_A_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    for(eml_y = 0; eml_y <= 0; eml_y = 1) {
                        eml_u_hoistedExpr_data[eml_b_loop_ub] = eml_filterStatesL[(int32_T)eml_f_tmp_data[eml_b_loop_ub] - 1];
                    }
                }
                eml_c_filterStatesL_sizes[0] = eml_x_hoistedExpr_sizes[1];
                eml_loop_ub = eml_x_hoistedExpr_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_c_filterStatesL_data[eml_b_loop_ub] = eml_u_hoistedExpr_data[eml_b_loop_ub];
                }
                eml_d_yL_sizes[0] = 1;
                eml_d_yL_sizes[1] = eml_yL_sizes[1];
                eml_loop_ub = eml_yL_sizes[0] * eml_yL_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_b_yL_data[eml_b_loop_ub] = eml_c_yL_data[eml_b_loop_ub];
                }
                m_filter(eml_b_filterCoeffs, eml_c_filterCoeffs, eml_b_yL_data, eml_d_yL_sizes, eml_c_filterStatesL_data, 
                    eml_c_filterStatesL_sizes, eml_c_yL_data, eml_yL_sizes, eml_d_filterCoeffs);
                EMLRTPOPRTSTACK(&eml_r_emlrtRSI);
                eml_A = ((real_T)(17 * (eml_filterCount - 1)) + 11.0) + (eml_c_loop_ub - 1.0) * 2.0;
                eml_d0 = ((real_T)(17 * (eml_filterCount - 1)) + 12.0) + (eml_c_loop_ub - 1.0) * 2.0;
                if(eml_A > eml_d0) {
                    eml_A = 1.0;
                    eml_d0 = 0.0;
                }
                eml_y_hoistedExpr_sizes[0] = ((int32_T)eml_d0 - (int32_T)eml_A) + 1;
                eml_loop_ub = (int32_T)eml_d0 - (int32_T)eml_A;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_v_hoistedExpr_data[eml_b_loop_ub] = eml_A + (real_T)eml_b_loop_ub;
                }
                eml_f_tmp_sizes[0] = 1;
                eml_A_sizes[0] = 1;
                eml_A_sizes[1] = eml_y_hoistedExpr_sizes[0];
                eml_f_tmp_sizes[1] = eml_A_sizes[1];
                eml_loop_ub = eml_y_hoistedExpr_sizes[0] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_f_tmp_data[eml_b_loop_ub] = eml_v_hoistedExpr_data[eml_b_loop_ub];
                }
                eml_g_tmp_sizes[0] = 1;
                eml_A_sizes[0] = 1;
                eml_A_sizes[1] = eml_f_tmp_sizes[1];
                eml_g_tmp_sizes[1] = eml_A_sizes[1];
                eml_loop_ub = eml_f_tmp_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_g_tmp_data[eml_b_loop_ub] = (int32_T)eml_f_tmp_data[eml_b_loop_ub];
                }
                emlrtSizeEqCheck1D(eml_g_tmp_sizes[1], 2, &eml_k_emlrtECI);
                eml_loop_ub = eml_g_tmp_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    for(eml_y = 0; eml_y <= 0; eml_y = 1) {
                        eml_filterStatesL[eml_g_tmp_data[eml_b_loop_ub] - 1] = eml_d_filterCoeffs[eml_b_loop_ub];
                    }
                }
                eml_A = ((real_T)(17 * (eml_filterCount - 1)) + 11.0) + (eml_c_loop_ub - 1.0) * 2.0;
                eml_d0 = ((real_T)(17 * (eml_filterCount - 1)) + 12.0) + (eml_c_loop_ub - 1.0) * 2.0;
                if(eml_A > eml_d0) {
                    eml_A = 1.0;
                    eml_d0 = 0.0;
                }
                eml_ab_hoistedExpr_sizes[0] = ((int32_T)eml_d0 - (int32_T)eml_A) + 1;
                eml_loop_ub = (int32_T)eml_d0 - (int32_T)eml_A;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_w_hoistedExpr_data[eml_b_loop_ub] = eml_A + (real_T)eml_b_loop_ub;
                }
                eml_f_tmp_sizes[0] = 1;
                eml_A_sizes[0] = 1;
                eml_A_sizes[1] = eml_ab_hoistedExpr_sizes[0];
                eml_f_tmp_sizes[1] = eml_A_sizes[1];
                eml_loop_ub = eml_ab_hoistedExpr_sizes[0] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_f_tmp_data[eml_b_loop_ub] = eml_w_hoistedExpr_data[eml_b_loop_ub];
                }
                EMLRTPUSHRTSTACK(&eml_q_emlrtRSI);
                eml_loop_ub = 10 * (eml_filterCount - 1);
                eml_y = 10 * (eml_filterCount - 1);
                for(eml_b_loop_ub = 0; eml_b_loop_ub < 2; eml_b_loop_ub++) {
                    eml_b_filterCoeffs[eml_b_loop_ub] = eml_filterCoeffs[(eml_loop_ub + (9 + eml_b_loop_ub)) - 1];
                }
                for(eml_loop_ub = 0; eml_loop_ub < 3; eml_loop_ub++) {
                    eml_c_filterCoeffs[eml_loop_ub] = eml_filterCoeffs[(eml_y + (14 + eml_loop_ub)) - 1];
                }
                eml_A_sizes[0] = 1;
                eml_A_sizes[1] = eml_f_tmp_sizes[1];
                eml_bb_hoistedExpr_sizes[0] = 1;
                eml_bb_hoistedExpr_sizes[1] = eml_A_sizes[1];
                eml_loop_ub = eml_A_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    for(eml_y = 0; eml_y <= 0; eml_y = 1) {
                        eml_x_hoistedExpr_data[eml_b_loop_ub] = eml_filterStatesR[(int32_T)eml_f_tmp_data[eml_b_loop_ub] - 1];
                    }
                }
                eml_c_filterStatesR_sizes[0] = eml_bb_hoistedExpr_sizes[1];
                eml_loop_ub = eml_bb_hoistedExpr_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_c_filterStatesR_data[eml_b_loop_ub] = eml_x_hoistedExpr_data[eml_b_loop_ub];
                }
                eml_d_yR_sizes[0] = 1;
                eml_d_yR_sizes[1] = eml_yR_sizes[1];
                eml_loop_ub = eml_yR_sizes[0] * eml_yR_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_b_yL_data[eml_b_loop_ub] = eml_yR_data[eml_b_loop_ub];
                }
                m_filter(eml_b_filterCoeffs, eml_c_filterCoeffs, eml_b_yL_data, eml_d_yR_sizes, eml_c_filterStatesR_data, 
                    eml_c_filterStatesR_sizes, eml_yR_data, eml_yR_sizes, eml_d_filterCoeffs);
                EMLRTPOPRTSTACK(&eml_q_emlrtRSI);
                eml_A = ((real_T)(17 * (eml_filterCount - 1)) + 11.0) + (eml_c_loop_ub - 1.0) * 2.0;
                eml_d0 = ((real_T)(17 * (eml_filterCount - 1)) + 12.0) + (eml_c_loop_ub - 1.0) * 2.0;
                if(eml_A > eml_d0) {
                    eml_A = 1.0;
                    eml_d0 = 0.0;
                }
                eml_cb_hoistedExpr_sizes[0] = ((int32_T)eml_d0 - (int32_T)eml_A) + 1;
                eml_loop_ub = (int32_T)eml_d0 - (int32_T)eml_A;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_y_hoistedExpr_data[eml_b_loop_ub] = eml_A + (real_T)eml_b_loop_ub;
                }
                eml_f_tmp_sizes[0] = 1;
                eml_A_sizes[0] = 1;
                eml_A_sizes[1] = eml_cb_hoistedExpr_sizes[0];
                eml_f_tmp_sizes[1] = eml_A_sizes[1];
                eml_loop_ub = eml_cb_hoistedExpr_sizes[0] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_f_tmp_data[eml_b_loop_ub] = eml_y_hoistedExpr_data[eml_b_loop_ub];
                }
                eml_g_tmp_sizes[0] = 1;
                eml_A_sizes[0] = 1;
                eml_A_sizes[1] = eml_f_tmp_sizes[1];
                eml_g_tmp_sizes[1] = eml_A_sizes[1];
                eml_loop_ub = eml_f_tmp_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_g_tmp_data[eml_b_loop_ub] = (int32_T)eml_f_tmp_data[eml_b_loop_ub];
                }
                emlrtSizeEqCheck1D(eml_g_tmp_sizes[1], 2, &eml_l_emlrtECI);
                eml_loop_ub = eml_g_tmp_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    for(eml_y = 0; eml_y <= 0; eml_y = 1) {
                        eml_filterStatesR[eml_g_tmp_data[eml_b_loop_ub] - 1] = eml_d_filterCoeffs[eml_b_loop_ub];
                    }
                }
                eml_c_loop_ub++;
                emlrtBreakCheck();
            }
        } else {
            eml_c_loop_ub = eml_filterOrder / 2.0;
            eml_nn = 1.0;
            while(eml_nn <= eml_c_loop_ub) {
                eml_A = ((real_T)(17 * (eml_filterCount - 1)) + 11.0) + (eml_nn - 1.0) * 4.0;
                eml_d0 = ((real_T)(17 * (eml_filterCount - 1)) + 14.0) + (eml_nn - 1.0) * 4.0;
                if(eml_A > eml_d0) {
                    eml_y = 1;
                    eml_loop_ub = 0;
                } else {
                    eml_y = emlrtBoundsCheck((int32_T)eml_A, &eml_mc_emlrtBCI);
                    eml_loop_ub = emlrtBoundsCheck((int32_T)eml_d0, &eml_nc_emlrtBCI);
                }
                eml_db_hoistedExpr_sizes[0] = (eml_loop_ub - eml_y) + 1;
                eml_loop_ub -= eml_y;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_ab_hoistedExpr_data[eml_b_loop_ub] = (real_T)eml_y + (real_T)eml_b_loop_ub;
                }
                eml_h_tmp_sizes[0] = 1;
                eml_A_sizes[0] = 1;
                eml_A_sizes[1] = eml_db_hoistedExpr_sizes[0];
                eml_h_tmp_sizes[1] = eml_A_sizes[1];
                eml_loop_ub = eml_db_hoistedExpr_sizes[0] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_h_tmp_data[eml_b_loop_ub] = eml_ab_hoistedExpr_data[eml_b_loop_ub];
                }
                EMLRTPUSHRTSTACK(&eml_p_emlrtRSI);
                eml_loop_ub = 10 * (eml_filterCount - 1);
                eml_b_loop_ub = 10 * (eml_filterCount - 1);
                for(eml_y = 0; eml_y < 5; eml_y++) {
                    eml_e_filterCoeffs[eml_y] = eml_filterCoeffs[(eml_loop_ub + (9 + eml_y)) - 1];
                    eml_f_filterCoeffs[eml_y] = eml_filterCoeffs[(eml_b_loop_ub + (14 + eml_y)) - 1];
                }
                eml_A_sizes[0] = 1;
                eml_A_sizes[1] = eml_h_tmp_sizes[1];
                eml_eb_hoistedExpr_sizes[0] = 1;
                eml_eb_hoistedExpr_sizes[1] = eml_A_sizes[1];
                eml_loop_ub = eml_A_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    for(eml_y = 0; eml_y <= 0; eml_y = 1) {
                        eml_bb_hoistedExpr_data[eml_b_loop_ub] = eml_filterStatesL[(int32_T)eml_h_tmp_data[eml_b_loop_ub] - 1];
                    }
                }
                eml_d_filterStatesL_sizes[0] = eml_eb_hoistedExpr_sizes[1];
                eml_loop_ub = eml_eb_hoistedExpr_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_d_filterStatesL_data[eml_b_loop_ub] = eml_bb_hoistedExpr_data[eml_b_loop_ub];
                }
                eml_e_yL_sizes[0] = 1;
                eml_e_yL_sizes[1] = eml_yL_sizes[1];
                eml_loop_ub = eml_yL_sizes[0] * eml_yL_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_b_yL_data[eml_b_loop_ub] = eml_c_yL_data[eml_b_loop_ub];
                }
                m_b_filter(eml_e_filterCoeffs, eml_f_filterCoeffs, eml_b_yL_data, eml_e_yL_sizes, eml_d_filterStatesL_data, 
                    eml_d_filterStatesL_sizes, eml_c_yL_data, eml_yL_sizes, eml_dv0);
                EMLRTPOPRTSTACK(&eml_p_emlrtRSI);
                eml_A = ((real_T)(17 * (eml_filterCount - 1)) + 11.0) + (eml_nn - 1.0) * 4.0;
                eml_d0 = ((real_T)(17 * (eml_filterCount - 1)) + 14.0) + (eml_nn - 1.0) * 4.0;
                if(eml_A > eml_d0) {
                    eml_y = 1;
                    eml_loop_ub = 0;
                } else {
                    eml_y = emlrtBoundsCheck((int32_T)eml_A, &eml_oc_emlrtBCI);
                    eml_loop_ub = emlrtBoundsCheck((int32_T)eml_d0, &eml_pc_emlrtBCI);
                }
                eml_fb_hoistedExpr_sizes[0] = (eml_loop_ub - eml_y) + 1;
                eml_loop_ub -= eml_y;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_cb_hoistedExpr_data[eml_b_loop_ub] = (real_T)eml_y + (real_T)eml_b_loop_ub;
                }
                eml_h_tmp_sizes[0] = 1;
                eml_A_sizes[0] = 1;
                eml_A_sizes[1] = eml_fb_hoistedExpr_sizes[0];
                eml_h_tmp_sizes[1] = eml_A_sizes[1];
                eml_loop_ub = eml_fb_hoistedExpr_sizes[0] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_h_tmp_data[eml_b_loop_ub] = eml_cb_hoistedExpr_data[eml_b_loop_ub];
                }
                eml_i_tmp_sizes[0] = 1;
                eml_A_sizes[0] = 1;
                eml_A_sizes[1] = eml_h_tmp_sizes[1];
                eml_i_tmp_sizes[1] = eml_A_sizes[1];
                eml_loop_ub = eml_h_tmp_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_i_tmp_data[eml_b_loop_ub] = (int32_T)eml_h_tmp_data[eml_b_loop_ub];
                }
                emlrtSizeEqCheck1D(eml_i_tmp_sizes[1], 4, &eml_m_emlrtECI);
                eml_loop_ub = eml_i_tmp_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    for(eml_y = 0; eml_y <= 0; eml_y = 1) {
                        eml_filterStatesL[eml_i_tmp_data[eml_b_loop_ub] - 1] = eml_dv0[eml_b_loop_ub];
                    }
                }
                eml_A = ((real_T)(17 * (eml_filterCount - 1)) + 11.0) + (eml_nn - 1.0) * 4.0;
                eml_d0 = ((real_T)(17 * (eml_filterCount - 1)) + 14.0) + (eml_nn - 1.0) * 4.0;
                if(eml_A > eml_d0) {
                    eml_y = 1;
                    eml_loop_ub = 0;
                } else {
                    eml_y = emlrtBoundsCheck((int32_T)eml_A, &eml_qc_emlrtBCI);
                    eml_loop_ub = emlrtBoundsCheck((int32_T)eml_d0, &eml_rc_emlrtBCI);
                }
                eml_gb_hoistedExpr_sizes[0] = (eml_loop_ub - eml_y) + 1;
                eml_loop_ub -= eml_y;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_db_hoistedExpr_data[eml_b_loop_ub] = (real_T)eml_y + (real_T)eml_b_loop_ub;
                }
                eml_h_tmp_sizes[0] = 1;
                eml_A_sizes[0] = 1;
                eml_A_sizes[1] = eml_gb_hoistedExpr_sizes[0];
                eml_h_tmp_sizes[1] = eml_A_sizes[1];
                eml_loop_ub = eml_gb_hoistedExpr_sizes[0] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_h_tmp_data[eml_b_loop_ub] = eml_db_hoistedExpr_data[eml_b_loop_ub];
                }
                EMLRTPUSHRTSTACK(&eml_o_emlrtRSI);
                eml_loop_ub = 10 * (eml_filterCount - 1);
                eml_b_loop_ub = 10 * (eml_filterCount - 1);
                for(eml_y = 0; eml_y < 5; eml_y++) {
                    eml_e_filterCoeffs[eml_y] = eml_filterCoeffs[(eml_loop_ub + (9 + eml_y)) - 1];
                    eml_f_filterCoeffs[eml_y] = eml_filterCoeffs[(eml_b_loop_ub + (14 + eml_y)) - 1];
                }
                eml_A_sizes[0] = 1;
                eml_A_sizes[1] = eml_h_tmp_sizes[1];
                eml_hb_hoistedExpr_sizes[0] = 1;
                eml_hb_hoistedExpr_sizes[1] = eml_A_sizes[1];
                eml_loop_ub = eml_A_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    for(eml_y = 0; eml_y <= 0; eml_y = 1) {
                        eml_eb_hoistedExpr_data[eml_b_loop_ub] = eml_filterStatesR[(int32_T)eml_h_tmp_data[eml_b_loop_ub] - 1];
                    }
                }
                eml_d_filterStatesR_sizes[0] = eml_hb_hoistedExpr_sizes[1];
                eml_loop_ub = eml_hb_hoistedExpr_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_d_filterStatesR_data[eml_b_loop_ub] = eml_eb_hoistedExpr_data[eml_b_loop_ub];
                }
                eml_e_yR_sizes[0] = 1;
                eml_e_yR_sizes[1] = eml_yR_sizes[1];
                eml_loop_ub = eml_yR_sizes[0] * eml_yR_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_b_yL_data[eml_b_loop_ub] = eml_yR_data[eml_b_loop_ub];
                }
                m_b_filter(eml_e_filterCoeffs, eml_f_filterCoeffs, eml_b_yL_data, eml_e_yR_sizes, eml_d_filterStatesR_data, 
                    eml_d_filterStatesR_sizes, eml_yR_data, eml_yR_sizes, eml_dv0);
                EMLRTPOPRTSTACK(&eml_o_emlrtRSI);
                eml_A = ((real_T)(17 * (eml_filterCount - 1)) + 11.0) + (eml_nn - 1.0) * 4.0;
                eml_d0 = ((real_T)(17 * (eml_filterCount - 1)) + 14.0) + (eml_nn - 1.0) * 4.0;
                if(eml_A > eml_d0) {
                    eml_y = 1;
                    eml_loop_ub = 0;
                } else {
                    eml_y = emlrtBoundsCheck((int32_T)eml_A, &eml_sc_emlrtBCI);
                    eml_loop_ub = emlrtBoundsCheck((int32_T)eml_d0, &eml_tc_emlrtBCI);
                }
                eml_ib_hoistedExpr_sizes[0] = (eml_loop_ub - eml_y) + 1;
                eml_loop_ub -= eml_y;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_fb_hoistedExpr_data[eml_b_loop_ub] = (real_T)eml_y + (real_T)eml_b_loop_ub;
                }
                eml_h_tmp_sizes[0] = 1;
                eml_A_sizes[0] = 1;
                eml_A_sizes[1] = eml_ib_hoistedExpr_sizes[0];
                eml_h_tmp_sizes[1] = eml_A_sizes[1];
                eml_loop_ub = eml_ib_hoistedExpr_sizes[0] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_h_tmp_data[eml_b_loop_ub] = eml_fb_hoistedExpr_data[eml_b_loop_ub];
                }
                eml_i_tmp_sizes[0] = 1;
                eml_A_sizes[0] = 1;
                eml_A_sizes[1] = eml_h_tmp_sizes[1];
                eml_i_tmp_sizes[1] = eml_A_sizes[1];
                eml_loop_ub = eml_h_tmp_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    eml_i_tmp_data[eml_b_loop_ub] = (int32_T)eml_h_tmp_data[eml_b_loop_ub];
                }
                emlrtSizeEqCheck1D(eml_i_tmp_sizes[1], 4, &eml_n_emlrtECI);
                eml_loop_ub = eml_i_tmp_sizes[1] - 1;
                for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
                    for(eml_y = 0; eml_y <= 0; eml_y = 1) {
                        eml_filterStatesR[eml_i_tmp_data[eml_b_loop_ub] - 1] = eml_dv0[eml_b_loop_ub];
                    }
                }
                eml_nn++;
                emlrtBreakCheck();
            }
        }
        /* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
        /*  Deal with MOC control signal for next frame */
        /* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
        EMLRTPUSHRTSTACK(&eml_n_emlrtRSI);
        m_abs(eml_c_yL_data, eml_yL_sizes, eml_yL_data, eml_b_frameBufferL_sizes);
        EMLRTPOPRTSTACK(&eml_n_emlrtRSI);
        EMLRTPUSHRTSTACK(&eml_m_emlrtRSI);
        eml_loop_ub = eml_b_frameBufferL_sizes[1] - 1;
        for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
            eml_y = eml_b_frameBufferL_sizes[0] - 1;
            for(eml_i16 = 0; eml_i16 <= eml_y; eml_i16++) {
                eml_yL_data[eml_i16 + eml_b_frameBufferL_sizes[0] * eml_b_loop_ub] += 1.5258789062500000E-005;
            }
        }
        eml_b_frameBufferL_sizes[0] = 1;
        eml_loop_ub = eml_b_frameBufferL_sizes[1] - 1;
        for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
            eml_yL_data[eml_b_loop_ub] /= 0.00002;
        }
        m_refp1_log10(eml_yL_data, eml_b_frameBufferL_sizes);
        eml_b_frameBufferL_sizes[0] = 1;
        eml_loop_ub = eml_b_frameBufferL_sizes[1] - 1;
        for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
            eml_yL_data[eml_b_loop_ub] *= 20.0;
        }
        EMLRTPOPRTSTACK(&eml_m_emlrtRSI);
        /* dB peak level with 16 bit offset */
        EMLRTPUSHRTSTACK(&eml_l_emlrtRSI);
        m_abs(eml_yR_data, eml_yR_sizes, eml_A_data, eml_A_sizes);
        EMLRTPOPRTSTACK(&eml_l_emlrtRSI);
        EMLRTPUSHRTSTACK(&eml_k_emlrtRSI);
        eml_loop_ub = eml_A_sizes[1] - 1;
        for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
            eml_y = eml_A_sizes[0] - 1;
            for(eml_i16 = 0; eml_i16 <= eml_y; eml_i16++) {
                eml_A_data[eml_i16 + eml_A_sizes[0] * eml_b_loop_ub] += 1.5258789062500000E-005;
            }
        }
        eml_A_sizes[0] = 1;
        eml_loop_ub = eml_A_sizes[1] - 1;
        for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
            eml_A_data[eml_b_loop_ub] /= 0.00002;
        }
        m_refp1_log10(eml_A_data, eml_A_sizes);
        eml_A_sizes[0] = 1;
        eml_loop_ub = eml_A_sizes[1] - 1;
        for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
            eml_A_data[eml_b_loop_ub] *= 20.0;
        }
        EMLRTPOPRTSTACK(&eml_k_emlrtRSI);
        /* dB peak level with 16 bit offset */
        emlrtDimSizeEqCheck(eml_b_frameBufferL_sizes[1], eml_A_sizes[1], &eml_o_emlrtECI);
        EMLRTPUSHRTSTACK(&eml_j_emlrtRSI);
        eml_f_yL_sizes[0] = 2;
        eml_f_yL_sizes[1] = eml_b_frameBufferL_sizes[1];
        eml_loop_ub = eml_b_frameBufferL_sizes[1] - 1;
        for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
            eml_d_yL_data[eml_b_loop_ub << 1] = eml_yL_data[eml_b_loop_ub] + 6.0;
        }
        eml_loop_ub = eml_A_sizes[1] - 1;
        for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
            eml_d_yL_data[1 + (eml_b_loop_ub << 1)] = eml_A_data[eml_b_loop_ub] + 6.0;
        }
        m_mean(eml_d_yL_data, eml_f_yL_sizes, eml_b_hoistedExpr_data, eml_b_hoistedExpr_sizes);
        for(eml_loop_ub = 0; eml_loop_ub < 2; eml_loop_ub++) {
            eml_b_filterCoeffs[eml_loop_ub] = eml_filterCoeffs[eml_loop_ub + 4];
            eml_d_filterCoeffs[eml_loop_ub] = eml_filterCoeffs[eml_loop_ub + 6];
        }
        eml_jb_hoistedExpr_sizes[0] = 1;
        eml_jb_hoistedExpr_sizes[1] = eml_b_hoistedExpr_sizes[1];
        eml_loop_ub = eml_b_hoistedExpr_sizes[0] * eml_b_hoistedExpr_sizes[1] - 1;
        for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
            eml_b_yL_data[eml_b_loop_ub] = eml_b_hoistedExpr_data[eml_b_loop_ub];
        }
        m_c_filter(eml_b_filterCoeffs, eml_d_filterCoeffs, eml_b_yL_data, eml_jb_hoistedExpr_sizes, eml_filterStatesL[17 * (
            eml_filterCount - 1) + 1], eml_b_hoistedExpr_data, eml_b_hoistedExpr_sizes, &eml_A);
        EMLRTPOPRTSTACK(&eml_j_emlrtRSI);
        eml_filterStatesL[17 * (eml_filterCount - 1) + 1] = eml_A;
        /* 
                 [MOCnow,  filterStatesL(17*(filterCount-1)+2)]=  filter(filterCoeffs(enumC_MOCb+1:enumC_MOCb+2), filterCoeffs(enumC_MOCa+1:enumC_MOCa+2) , mean([yL.^2; yR.^2]), filterStatesL(17*(filterCount-1)+2)); */
        /*      MOCnow = sqrt(MOCnow);    % restore to meaningful scale (meters - not anymore now in velocity mode) */
        /*      MOCnow = 20*log10( MOCnow /  20e-6 ) - MOCthreshold_dBOP(filterCount); */
        eml_kb_hoistedExpr_sizes[0] = 1;
        eml_kb_hoistedExpr_sizes[1] = eml_b_hoistedExpr_sizes[1];
        eml_A = eml_MOCthreshold_dBOP[eml_filterCount - 1];
        eml_loop_ub = eml_b_hoistedExpr_sizes[0] * eml_b_hoistedExpr_sizes[1] - 1;
        for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
            eml_b_yL_data[eml_b_loop_ub] = eml_b_hoistedExpr_data[eml_b_loop_ub] - eml_A;
        }
        m_b_max(eml_b_yL_data, eml_kb_hoistedExpr_sizes, eml_b_hoistedExpr_data, eml_b_hoistedExpr_sizes);
        eml_b_hoistedExpr_sizes[0] = 1;
        eml_loop_ub = eml_b_hoistedExpr_sizes[1] - 1;
        for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
            eml_b_hoistedExpr_data[eml_b_loop_ub] *= eml_MOCfactor;
        }
        /* the tiny offset is due to a crummy Embedded Matlab bug (This caused much misery)! */
        EMLRTPUSHRTSTACK(&eml_i_emlrtRSI);
        eml_b_hoistedExpr_sizes[0] = 1;
        eml_loop_ub = eml_b_hoistedExpr_sizes[1] - 1;
        for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
            eml_b_hoistedExpr_data[eml_b_loop_ub] = -(eml_b_hoistedExpr_data[eml_b_loop_ub] + 1.0E-009);
        }
        eml_lb_hoistedExpr_sizes[0] = 1;
        eml_lb_hoistedExpr_sizes[1] = eml_b_hoistedExpr_sizes[1];
        eml_loop_ub = eml_b_hoistedExpr_sizes[1] - 1;
        for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
            eml_b_yL_data[eml_b_loop_ub] = eml_b_hoistedExpr_data[eml_b_loop_ub] / 20.0;
        }
        m_b_power(eml_b_yL_data, eml_lb_hoistedExpr_sizes, eml_y_data, eml_y_sizes);
        EMLRTPOPRTSTACK(&eml_i_emlrtRSI);
        if(1.0 > eml_numSamples) {
            eml_loop_ub = 0;
        } else {
            eml_loop_ub = emlrtBoundsCheck((int32_T)eml_numSamples, &eml_uc_emlrtBCI);
        }
        eml_mb_hoistedExpr_sizes[0] = eml_loop_ub;
        eml_loop_ub--;
        for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
            eml_gb_hoistedExpr_data[eml_b_loop_ub] = 1.0 + (real_T)eml_b_loop_ub;
        }
        eml_b_hoistedExpr_sizes[0] = 1;
        eml_frameBufferL_sizes[0] = 1;
        eml_frameBufferL_sizes[1] = eml_mb_hoistedExpr_sizes[0];
        eml_b_hoistedExpr_sizes[1] = eml_frameBufferL_sizes[1];
        eml_loop_ub = eml_mb_hoistedExpr_sizes[0] - 1;
        for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
            eml_b_hoistedExpr_data[eml_b_loop_ub] = eml_gb_hoistedExpr_data[eml_b_loop_ub];
        }
        eml_j_tmp_sizes[0] = eml_b_hoistedExpr_sizes[1];
        eml_loop_ub = eml_b_hoistedExpr_sizes[1] - 1;
        for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
            eml_j_tmp_data[eml_b_loop_ub] = (int32_T)eml_b_hoistedExpr_data[eml_b_loop_ub] - 1;
        }
        eml_iv40[0] = 1;
        eml_iv40[1] = eml_j_tmp_sizes[0];
        emlrtSubAssignSizeCheck(eml_iv40, 2, eml_y_sizes, 2, &eml_p_emlrtECI);
        eml_loop_ub = eml_filterCount - 1;
        eml_b_loop_ub = eml_y_sizes[1] - 1;
        for(eml_y = 0; eml_y <= eml_b_loop_ub; eml_y++) {
            eml_MOCcontrol[eml_loop_ub + 11 * eml_j_tmp_data[eml_y]] = eml_y_data[eml_y_sizes[0] * eml_y];
        }
        /* Replace the shortened version     */
        /* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
        /*  SOme calculations for the GUI monitoring */
        /* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
        eml_MOCend[eml_filterCount - 1] = eml_MOCcontrol[(eml_filterCount - 1) + 11 * (emlrtBoundsCheck((int32_T)eml_numSamples, &
            eml_cd_emlrtBCI) - 1)];
        EMLRTPUSHRTSTACK(&eml_h_emlrtRSI);
        m_abs(eml_c_yL_data, eml_yL_sizes, eml_b_hoistedExpr_data, eml_b_hoistedExpr_sizes);
        eml_A = m_max(eml_b_hoistedExpr_data, eml_b_hoistedExpr_sizes);
        eml_A /= 0.00002;
        if(eml_A < 0.0) {
            EMLRTPUSHRTSTACK(&eml_xb_emlrtRSI);
            m_c_eml_error();
            EMLRTPOPRTSTACK(&eml_xb_emlrtRSI);
        }
        eml_peakOPL[eml_filterCount - 1] = 20.0 * muDoubleScalarLog10(eml_A);
        EMLRTPOPRTSTACK(&eml_h_emlrtRSI);
        EMLRTPUSHRTSTACK(&eml_g_emlrtRSI);
        m_abs(eml_yR_data, eml_yR_sizes, eml_b_hoistedExpr_data, eml_b_hoistedExpr_sizes);
        eml_A = m_max(eml_b_hoistedExpr_data, eml_b_hoistedExpr_sizes);
        eml_A /= 0.00002;
        if(eml_A < 0.0) {
            EMLRTPUSHRTSTACK(&eml_xb_emlrtRSI);
            m_c_eml_error();
            EMLRTPOPRTSTACK(&eml_xb_emlrtRSI);
        }
        eml_peakOPR[eml_filterCount - 1] = 20.0 * muDoubleScalarLog10(eml_A);
        EMLRTPOPRTSTACK(&eml_g_emlrtRSI);
        /*      rmsOPL(filterCount) = 20*log10( sqrt(mean(yL.^2)) /2e-5  );  */
        /*      rmsOPR(filterCount) = 20*log10( sqrt(mean(yR.^2)) /2e-5 );  */
        eml_rmsOPL[eml_filterCount - 1] = eml_yL_data[eml_b_frameBufferL_sizes[1] - 1];
        eml_rmsOPR[eml_filterCount - 1] = eml_A_data[eml_A_sizes[1] - 1];
        /*      rmsOPL(filterCount) = 20*log10( abs(yL(end)) /2e-5 );  */
        /*      rmsOPR(filterCount) = 20*log10( abs(yR(end)) /2e-5 );  */
        eml_nb_hoistedExpr_sizes[0] = (int32_T)eml_numSamples;
        eml_loop_ub = (int32_T)eml_numSamples - 1;
        for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
            eml_hb_hoistedExpr_data[eml_b_loop_ub] = 1.0 + (real_T)eml_b_loop_ub;
        }
        eml_b_hoistedExpr_sizes[0] = 1;
        eml_A_sizes[0] = 1;
        eml_A_sizes[1] = eml_nb_hoistedExpr_sizes[0];
        eml_b_hoistedExpr_sizes[1] = eml_A_sizes[1];
        eml_loop_ub = eml_nb_hoistedExpr_sizes[0] - 1;
        for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
            eml_b_hoistedExpr_data[eml_b_loop_ub] = eml_hb_hoistedExpr_data[eml_b_loop_ub];
        }
        eml_A_sizes[0] = 1;
        eml_A_sizes[1] = eml_b_hoistedExpr_sizes[1];
        eml_y_sizes[0] = 1;
        eml_y_sizes[1] = eml_A_sizes[1];
        eml_loop_ub = eml_A_sizes[1] - 1;
        for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
            for(eml_y = 0; eml_y <= 0; eml_y = 1) {
                eml_y_data[eml_b_loop_ub] = eml_frameBufferL[(int32_T)eml_b_hoistedExpr_data[eml_b_loop_ub] - 1];
            }
        }
        eml_A = eml_mainGain[eml_filterCount - 1];
        eml_yL_sizes[0] = 1;
        eml_loop_ub = eml_yL_sizes[1] - 1;
        for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
            eml_c_yL_data[eml_b_loop_ub] *= eml_A;
        }
        emlrtSizeEqCheckND(eml_y_sizes, eml_yL_sizes, &eml_q_emlrtECI);
        eml_ob_hoistedExpr_sizes[0] = (int32_T)eml_numSamples;
        eml_loop_ub = (int32_T)eml_numSamples - 1;
        for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
            eml_ib_hoistedExpr_data[eml_b_loop_ub] = 1.0 + (real_T)eml_b_loop_ub;
        }
        eml_b_hoistedExpr_sizes[0] = 1;
        eml_A_sizes[0] = 1;
        eml_A_sizes[1] = eml_ob_hoistedExpr_sizes[0];
        eml_b_hoistedExpr_sizes[1] = eml_A_sizes[1];
        eml_loop_ub = eml_ob_hoistedExpr_sizes[0] - 1;
        for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
            eml_b_hoistedExpr_data[eml_b_loop_ub] = eml_ib_hoistedExpr_data[eml_b_loop_ub];
        }
        eml_tmp_sizes[0] = 1;
        eml_A_sizes[0] = 1;
        eml_A_sizes[1] = eml_b_hoistedExpr_sizes[1];
        eml_tmp_sizes[1] = eml_A_sizes[1];
        eml_loop_ub = eml_b_hoistedExpr_sizes[1] - 1;
        for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
            eml_tmp_data[eml_b_loop_ub] = (int32_T)eml_b_hoistedExpr_data[eml_b_loop_ub];
        }
        emlrtSizeEqCheck1D(eml_tmp_sizes[1], eml_y_sizes[1], &eml_r_emlrtECI);
        eml_loop_ub = eml_y_sizes[1] - 1;
        for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
            eml_frameBufferL[eml_tmp_data[eml_b_loop_ub] - 1] = eml_y_data[eml_b_loop_ub] + eml_c_yL_data[eml_b_loop_ub];
        }
        eml_pb_hoistedExpr_sizes[0] = (int32_T)eml_numSamples;
        eml_loop_ub = (int32_T)eml_numSamples - 1;
        for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
            eml_jb_hoistedExpr_data[eml_b_loop_ub] = 1.0 + (real_T)eml_b_loop_ub;
        }
        eml_b_hoistedExpr_sizes[0] = 1;
        eml_A_sizes[0] = 1;
        eml_A_sizes[1] = eml_pb_hoistedExpr_sizes[0];
        eml_b_hoistedExpr_sizes[1] = eml_A_sizes[1];
        eml_loop_ub = eml_pb_hoistedExpr_sizes[0] - 1;
        for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
            eml_b_hoistedExpr_data[eml_b_loop_ub] = eml_jb_hoistedExpr_data[eml_b_loop_ub];
        }
        eml_A_sizes[0] = 1;
        eml_A_sizes[1] = eml_b_hoistedExpr_sizes[1];
        eml_y_sizes[0] = 1;
        eml_y_sizes[1] = eml_A_sizes[1];
        eml_loop_ub = eml_A_sizes[1] - 1;
        for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
            for(eml_y = 0; eml_y <= 0; eml_y = 1) {
                eml_y_data[eml_b_loop_ub] = eml_frameBufferR[(int32_T)eml_b_hoistedExpr_data[eml_b_loop_ub] - 1];
            }
        }
        eml_A = eml_mainGain[eml_filterCount - 1];
        eml_yR_sizes[0] = 1;
        eml_loop_ub = eml_yR_sizes[1] - 1;
        for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
            eml_yR_data[eml_b_loop_ub] *= eml_A;
        }
        emlrtSizeEqCheckND(eml_y_sizes, eml_yR_sizes, &eml_s_emlrtECI);
        eml_qb_hoistedExpr_sizes[0] = (int32_T)eml_numSamples;
        eml_loop_ub = (int32_T)eml_numSamples - 1;
        for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
            eml_kb_hoistedExpr_data[eml_b_loop_ub] = 1.0 + (real_T)eml_b_loop_ub;
        }
        eml_b_hoistedExpr_sizes[0] = 1;
        eml_A_sizes[0] = 1;
        eml_A_sizes[1] = eml_qb_hoistedExpr_sizes[0];
        eml_b_hoistedExpr_sizes[1] = eml_A_sizes[1];
        eml_loop_ub = eml_qb_hoistedExpr_sizes[0] - 1;
        for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
            eml_b_hoistedExpr_data[eml_b_loop_ub] = eml_kb_hoistedExpr_data[eml_b_loop_ub];
        }
        eml_tmp_sizes[0] = 1;
        eml_A_sizes[0] = 1;
        eml_A_sizes[1] = eml_b_hoistedExpr_sizes[1];
        eml_tmp_sizes[1] = eml_A_sizes[1];
        eml_loop_ub = eml_b_hoistedExpr_sizes[1] - 1;
        for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
            eml_tmp_data[eml_b_loop_ub] = (int32_T)eml_b_hoistedExpr_data[eml_b_loop_ub];
        }
        emlrtSizeEqCheck1D(eml_tmp_sizes[1], eml_y_sizes[1], &eml_t_emlrtECI);
        eml_loop_ub = eml_y_sizes[1] - 1;
        for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
            eml_frameBufferR[eml_tmp_data[eml_b_loop_ub] - 1] = eml_y_data[eml_b_loop_ub] + eml_yR_data[eml_b_loop_ub];
        }
        eml_filterCount++;
        emlrtBreakCheck();
    }
    /*  BF channel */
    /* % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
    /*  ACOUSTIC REFLEX */
    /* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
    /*  find  rms of smoothed ip signal */
    /*   this will be used to trigger the AR reflex */
    if(1.0 > eml_numSamples) {
        eml_loop_ub = 0;
    } else {
        eml_loop_ub = emlrtBoundsCheck((int32_T)eml_numSamples, &eml_vc_emlrtBCI);
    }
    eml_rb_hoistedExpr_sizes[0] = eml_loop_ub;
    eml_loop_ub--;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_lb_hoistedExpr_data[eml_b_loop_ub] = 1.0 + (real_T)eml_b_loop_ub;
    }
    eml_b_hoistedExpr_sizes[0] = 1;
    eml_A_sizes[0] = 1;
    eml_A_sizes[1] = eml_rb_hoistedExpr_sizes[0];
    eml_b_hoistedExpr_sizes[1] = eml_A_sizes[1];
    eml_loop_ub = eml_rb_hoistedExpr_sizes[0] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_b_hoistedExpr_data[eml_b_loop_ub] = eml_lb_hoistedExpr_data[eml_b_loop_ub];
    }
    EMLRTPUSHRTSTACK(&eml_f_emlrtRSI);
    eml_A_sizes[0] = 1;
    eml_A_sizes[1] = eml_b_hoistedExpr_sizes[1];
    eml_c_frameBufferL_sizes[0] = 1;
    eml_c_frameBufferL_sizes[1] = eml_A_sizes[1];
    eml_loop_ub = eml_A_sizes[1] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        for(eml_y = 0; eml_y <= 0; eml_y = 1) {
            eml_frameBufferL_data[eml_b_loop_ub] = eml_frameBufferL[(int32_T)eml_b_hoistedExpr_data[eml_b_loop_ub] - 1];
        }
    }
    m_c_power(eml_frameBufferL_data, eml_c_frameBufferL_sizes, eml_b_hoistedExpr_data, eml_b_hoistedExpr_sizes);
    for(eml_loop_ub = 0; eml_loop_ub < 2; eml_loop_ub++) {
        eml_b_filterCoeffs[eml_loop_ub] = eml_filterCoeffs[eml_loop_ub];
        eml_d_filterCoeffs[eml_loop_ub] = eml_filterCoeffs[eml_loop_ub + 2];
    }
    m_c_filter(eml_b_filterCoeffs, eml_d_filterCoeffs, eml_b_hoistedExpr_data, eml_b_hoistedExpr_sizes, eml_filterStatesL[0], 
        eml_yL_data, eml_b_frameBufferL_sizes, &eml_A);
    EMLRTPOPRTSTACK(&eml_f_emlrtRSI);
    eml_filterStatesL[0] = eml_A;
    if(1.0 > eml_numSamples) {
        eml_loop_ub = 0;
    } else {
        eml_loop_ub = emlrtBoundsCheck((int32_T)eml_numSamples, &eml_wc_emlrtBCI);
    }
    eml_sb_hoistedExpr_sizes[0] = eml_loop_ub;
    eml_loop_ub--;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_mb_hoistedExpr_data[eml_b_loop_ub] = 1.0 + (real_T)eml_b_loop_ub;
    }
    eml_b_hoistedExpr_sizes[0] = 1;
    eml_A_sizes[0] = 1;
    eml_A_sizes[1] = eml_sb_hoistedExpr_sizes[0];
    eml_b_hoistedExpr_sizes[1] = eml_A_sizes[1];
    eml_loop_ub = eml_sb_hoistedExpr_sizes[0] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_b_hoistedExpr_data[eml_b_loop_ub] = eml_mb_hoistedExpr_data[eml_b_loop_ub];
    }
    EMLRTPUSHRTSTACK(&eml_e_emlrtRSI);
    eml_A_sizes[0] = 1;
    eml_A_sizes[1] = eml_b_hoistedExpr_sizes[1];
    eml_frameBufferR_sizes[0] = 1;
    eml_frameBufferR_sizes[1] = eml_A_sizes[1];
    eml_loop_ub = eml_A_sizes[1] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        for(eml_y = 0; eml_y <= 0; eml_y = 1) {
            eml_frameBufferR_data[eml_b_loop_ub] = eml_frameBufferR[(int32_T)eml_b_hoistedExpr_data[eml_b_loop_ub] - 1];
        }
    }
    m_c_power(eml_frameBufferR_data, eml_frameBufferR_sizes, eml_b_hoistedExpr_data, eml_b_hoistedExpr_sizes);
    for(eml_loop_ub = 0; eml_loop_ub < 2; eml_loop_ub++) {
        eml_b_filterCoeffs[eml_loop_ub] = eml_filterCoeffs[eml_loop_ub];
        eml_d_filterCoeffs[eml_loop_ub] = eml_filterCoeffs[eml_loop_ub + 2];
    }
    m_c_filter(eml_b_filterCoeffs, eml_d_filterCoeffs, eml_b_hoistedExpr_data, eml_b_hoistedExpr_sizes, eml_filterStatesR[0], 
        eml_y_data, eml_y_sizes, &eml_A);
    EMLRTPOPRTSTACK(&eml_e_emlrtRSI);
    eml_filterStatesR[0] = eml_A;
    /*  restore Pa scale */
    EMLRTPUSHRTSTACK(&eml_d_emlrtRSI);
    m_refp1_sqrt(eml_yL_data, eml_b_frameBufferL_sizes);
    EMLRTPOPRTSTACK(&eml_d_emlrtRSI);
    /* confusing name for parameter - it is a short term RMS. */
    EMLRTPUSHRTSTACK(&eml_c_emlrtRSI);
    m_refp1_sqrt(eml_y_data, eml_y_sizes);
    EMLRTPOPRTSTACK(&eml_c_emlrtRSI);
    /* confusing name for parameter - it is a short term RMS. */
    /*  % % % attenuate input (NB cross product used) */
    /*  % % stapesVelL = stapesVelL./ARampL(1:numSamples); */
    /*  % % stapesVelR = stapesVelR./ARampR(1:numSamples); */
    /* CALC ARamp FOR NEXT FRAME */
    /*  compare levels in the previous segment with AR threshold */
    if(1.0 > eml_numSamples) {
        eml_loop_ub = 0;
    } else {
        eml_loop_ub = emlrtBoundsCheck((int32_T)eml_numSamples, &eml_xc_emlrtBCI);
    }
    eml_tb_hoistedExpr_sizes[0] = eml_loop_ub;
    eml_loop_ub--;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_nb_hoistedExpr_data[eml_b_loop_ub] = 1.0 + (real_T)eml_b_loop_ub;
    }
    eml_b_hoistedExpr_sizes[0] = 1;
    eml_A_sizes[0] = 1;
    eml_A_sizes[1] = eml_tb_hoistedExpr_sizes[0];
    eml_b_hoistedExpr_sizes[1] = eml_A_sizes[1];
    eml_loop_ub = eml_tb_hoistedExpr_sizes[0] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_b_hoistedExpr_data[eml_b_loop_ub] = eml_nb_hoistedExpr_data[eml_b_loop_ub];
    }
    eml_tmp_sizes[0] = 1;
    eml_A_sizes[0] = 1;
    eml_A_sizes[1] = eml_b_hoistedExpr_sizes[1];
    eml_tmp_sizes[1] = eml_A_sizes[1];
    eml_loop_ub = eml_b_hoistedExpr_sizes[1] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_tmp_data[eml_b_loop_ub] = (int32_T)eml_b_hoistedExpr_data[eml_b_loop_ub];
    }
    eml_b_frameBufferL_sizes[0] = 1;
    eml_loop_ub = eml_b_frameBufferL_sizes[1] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_yL_data[eml_b_loop_ub] /= eml_ARthresholdPa;
    }
    emlrtSizeEqCheck1D(eml_tmp_sizes[1], eml_b_frameBufferL_sizes[1], &eml_u_emlrtECI);
    eml_loop_ub = eml_b_frameBufferL_sizes[1] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_ARampL[eml_tmp_data[eml_b_loop_ub] - 1] = eml_yL_data[eml_b_loop_ub];
    }
    if(1.0 > eml_numSamples) {
        eml_loop_ub = 0;
    } else {
        eml_loop_ub = emlrtBoundsCheck((int32_T)eml_numSamples, &eml_yc_emlrtBCI);
    }
    eml_ub_hoistedExpr_sizes[0] = eml_loop_ub;
    eml_loop_ub--;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_ob_hoistedExpr_data[eml_b_loop_ub] = 1.0 + (real_T)eml_b_loop_ub;
    }
    eml_b_hoistedExpr_sizes[0] = 1;
    eml_A_sizes[0] = 1;
    eml_A_sizes[1] = eml_ub_hoistedExpr_sizes[0];
    eml_b_hoistedExpr_sizes[1] = eml_A_sizes[1];
    eml_loop_ub = eml_ub_hoistedExpr_sizes[0] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_b_hoistedExpr_data[eml_b_loop_ub] = eml_ob_hoistedExpr_data[eml_b_loop_ub];
    }
    eml_tmp_sizes[0] = 1;
    eml_A_sizes[0] = 1;
    eml_A_sizes[1] = eml_b_hoistedExpr_sizes[1];
    eml_tmp_sizes[1] = eml_A_sizes[1];
    eml_loop_ub = eml_b_hoistedExpr_sizes[1] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_tmp_data[eml_b_loop_ub] = (int32_T)eml_b_hoistedExpr_data[eml_b_loop_ub];
    }
    eml_y_sizes[0] = 1;
    eml_loop_ub = eml_y_sizes[1] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_y_data[eml_b_loop_ub] /= eml_ARthresholdPa;
    }
    emlrtSizeEqCheck1D(eml_tmp_sizes[1], eml_y_sizes[1], &eml_v_emlrtECI);
    eml_loop_ub = eml_y_sizes[1] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_ARampR[eml_tmp_data[eml_b_loop_ub] - 1] = eml_y_data[eml_b_loop_ub];
    }
    /*  all sub-treshold values are set to 1 */
    if(1.0 > eml_numSamples) {
        eml_loop_ub = 0;
    } else {
        eml_loop_ub = emlrtBoundsCheck((int32_T)eml_numSamples, &eml_ad_emlrtBCI);
    }
    eml_vb_hoistedExpr_sizes[0] = eml_loop_ub;
    eml_loop_ub--;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_pb_hoistedExpr_data[eml_b_loop_ub] = 1.0 + (real_T)eml_b_loop_ub;
    }
    eml_b_hoistedExpr_sizes[0] = 1;
    eml_A_sizes[0] = 1;
    eml_A_sizes[1] = eml_vb_hoistedExpr_sizes[0];
    eml_b_hoistedExpr_sizes[1] = eml_A_sizes[1];
    eml_loop_ub = eml_vb_hoistedExpr_sizes[0] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_b_hoistedExpr_data[eml_b_loop_ub] = eml_pb_hoistedExpr_data[eml_b_loop_ub];
    }
    eml_A_sizes[0] = 1;
    eml_A_sizes[1] = eml_b_hoistedExpr_sizes[1];
    eml_y_sizes[0] = 1;
    eml_y_sizes[1] = eml_A_sizes[1];
    eml_loop_ub = eml_A_sizes[1] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        for(eml_y = 0; eml_y <= 0; eml_y = 1) {
            eml_y_data[eml_b_loop_ub] = eml_ARampL[(int32_T)eml_b_hoistedExpr_data[eml_b_loop_ub] - 1];
        }
    }
    EMLRTPUSHRTSTACK(&eml_b_emlrtRSI);
    eml_b_y_sizes[0] = 1;
    eml_b_y_sizes[1] = eml_y_sizes[1];
    eml_loop_ub = eml_y_sizes[1] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_b_y_data[eml_b_loop_ub] = (eml_y_data[eml_b_loop_ub] < 1.0);
    }
    m_eml_li_find(eml_b_y_data, eml_b_y_sizes, eml_tmp_data, eml_tmp_sizes);
    EMLRTPOPRTSTACK(&eml_b_emlrtRSI);
    eml_k_tmp_sizes[0] = 1;
    eml_A_sizes[0] = 1;
    eml_A_sizes[1] = eml_tmp_sizes[1];
    eml_k_tmp_sizes[1] = eml_A_sizes[1];
    eml_loop_ub = eml_tmp_sizes[1] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_k_tmp_data[eml_b_loop_ub] = eml_tmp_data[eml_b_loop_ub];
    }
    eml_loop_ub = eml_k_tmp_sizes[1] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        for(eml_y = 0; eml_y <= 0; eml_y = 1) {
            eml_ARampL[eml_k_tmp_data[eml_b_loop_ub] - 1] = 1.0;
        }
    }
    if(1.0 > eml_numSamples) {
        eml_loop_ub = 0;
    } else {
        eml_loop_ub = emlrtBoundsCheck((int32_T)eml_numSamples, &eml_bd_emlrtBCI);
    }
    eml_wb_hoistedExpr_sizes[0] = eml_loop_ub;
    eml_loop_ub--;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_qb_hoistedExpr_data[eml_b_loop_ub] = 1.0 + (real_T)eml_b_loop_ub;
    }
    eml_b_hoistedExpr_sizes[0] = 1;
    eml_A_sizes[0] = 1;
    eml_A_sizes[1] = eml_wb_hoistedExpr_sizes[0];
    eml_b_hoistedExpr_sizes[1] = eml_A_sizes[1];
    eml_loop_ub = eml_wb_hoistedExpr_sizes[0] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_b_hoistedExpr_data[eml_b_loop_ub] = eml_qb_hoistedExpr_data[eml_b_loop_ub];
    }
    eml_A_sizes[0] = 1;
    eml_A_sizes[1] = eml_b_hoistedExpr_sizes[1];
    eml_y_sizes[0] = 1;
    eml_y_sizes[1] = eml_A_sizes[1];
    eml_loop_ub = eml_A_sizes[1] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        for(eml_y = 0; eml_y <= 0; eml_y = 1) {
            eml_y_data[eml_b_loop_ub] = eml_ARampR[(int32_T)eml_b_hoistedExpr_data[eml_b_loop_ub] - 1];
        }
    }
    EMLRTPUSHRTSTACK(&eml_emlrtRSI);
    eml_c_y_sizes[0] = 1;
    eml_c_y_sizes[1] = eml_y_sizes[1];
    eml_loop_ub = eml_y_sizes[1] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_b_y_data[eml_b_loop_ub] = (eml_y_data[eml_b_loop_ub] < 1.0);
    }
    m_eml_li_find(eml_b_y_data, eml_c_y_sizes, eml_tmp_data, eml_tmp_sizes);
    EMLRTPOPRTSTACK(&eml_emlrtRSI);
    eml_k_tmp_sizes[0] = 1;
    eml_A_sizes[0] = 1;
    eml_A_sizes[1] = eml_tmp_sizes[1];
    eml_k_tmp_sizes[1] = eml_A_sizes[1];
    eml_loop_ub = eml_tmp_sizes[1] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        eml_k_tmp_data[eml_b_loop_ub] = eml_tmp_data[eml_b_loop_ub];
    }
    eml_loop_ub = eml_k_tmp_sizes[1] - 1;
    for(eml_b_loop_ub = 0; eml_b_loop_ub <= eml_loop_ub; eml_b_loop_ub++) {
        for(eml_y = 0; eml_y <= 0; eml_y = 1) {
            eml_ARampR[eml_k_tmp_data[eml_b_loop_ub] - 1] = 1.0;
        }
    }
}
/* End of Embedded MATLAB Coder code generation (EssexAidProcessVFrameSwitchable.c) */
