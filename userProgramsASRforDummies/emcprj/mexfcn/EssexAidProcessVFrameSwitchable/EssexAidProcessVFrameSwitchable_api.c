/*
 * EssexAidProcessVFrameSwitchable_api.c
 *
 * Embedded MATLAB Coder code generation for function 'EssexAidProcessVFrameSwitchable_api'
 *
 * C source code generated on: Fri Feb 10 11:40:58 2012
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "EssexAidProcessVFrameSwitchable.h"
#include "EssexAidProcessVFrameSwitchable_api.h"

/* Type Definitions */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
static void m_b_emlrt_marshallIn(const mxArray *eml_filterStatesL, const char_T *eml_name, real_T eml_y[3000]);
static const mxArray *m_b_emlrt_marshallOut(const real_T eml_u[3000]);
static void m_c_emlrt_marshallIn(const mxArray *eml_filterCoeffs, const char_T *eml_name, real_T eml_y[5000]);
static const mxArray *m_c_emlrt_marshallOut(const real_T eml_u[11]);
static real_T m_d_emlrt_marshallIn(const mxArray *eml_numChannels, const char_T *eml_name);
static const mxArray *m_d_emlrt_marshallOut(const real_T eml_u[76032]);
static void m_e_emlrt_marshallIn(const mxArray *eml_DRNLb, const char_T *eml_name, real_T eml_y[11]);
static void m_emlrt_marshallIn(const mxArray *eml_frameBufferL, const char_T *eml_name, real_T eml_y[6912]);
static const mxArray *m_emlrt_marshallOut(const real_T eml_u[6912]);
static void m_f_emlrt_marshallIn(const mxArray *eml_peakIPL, const char_T *eml_name, real_T eml_y[11]);
static void m_g_emlrt_marshallIn(const mxArray *eml_MOCcontrol, const char_T *eml_name, real_T eml_y[76032]);
static boolean_T m_h_emlrt_marshallIn(const mxArray *eml_useGTF, const char_T *eml_name);
static void m_i_emlrt_marshallIn(const mxArray *eml_src, const char_T *eml_nam, real_T eml_ret[6912]);
static void m_j_emlrt_marshallIn(const mxArray *eml_src, const char_T *eml_nam, real_T eml_ret[3000]);
static void m_k_emlrt_marshallIn(const mxArray *eml_src, const char_T *eml_nam, real_T eml_ret[5000]);
static real_T m_l_emlrt_marshallIn(const mxArray *eml_src, const char_T *eml_nam);
static void m_m_emlrt_marshallIn(const mxArray *eml_src, const char_T *eml_nam, real_T eml_ret[11]);
static void m_n_emlrt_marshallIn(const mxArray *eml_src, const char_T *eml_nam, real_T eml_ret[11]);
static void m_o_emlrt_marshallIn(const mxArray *eml_src, const char_T *eml_nam, real_T eml_ret[76032]);
static boolean_T m_p_emlrt_marshallIn(const mxArray *eml_src, const char_T *eml_nam);

/* Function Definitions */
static void m_b_emlrt_marshallIn(const mxArray *eml_filterStatesL, const char_T *eml_name, real_T eml_y[3000])
{
    m_j_emlrt_marshallIn(emlrtAlias(eml_filterStatesL), eml_name, eml_y);
    emlrtDestroyArray(&eml_filterStatesL);
}
static const mxArray *m_b_emlrt_marshallOut(const real_T eml_u[3000])
{
    const mxArray *eml_y;
    static int32_T eml_iv29[1] = { 3000 };
    const mxArray *eml_m12;
    real_T *eml_pData;
    int32_T eml_i;
    eml_y = NULL;
    eml_m12 = mxCreateNumericArray(1, (int32_T *)eml_iv29, mxDOUBLE_CLASS, mxREAL);
    eml_pData = mxGetPr(eml_m12);
    for(eml_i = 0; eml_i < 3000; eml_i++) {
        eml_pData[eml_i] = eml_u[eml_i];
    }
    emlrtAssign(&eml_y, eml_m12);
    return eml_y;
}
static void m_c_emlrt_marshallIn(const mxArray *eml_filterCoeffs, const char_T *eml_name, real_T eml_y[5000])
{
    m_k_emlrt_marshallIn(emlrtAlias(eml_filterCoeffs), eml_name, eml_y);
    emlrtDestroyArray(&eml_filterCoeffs);
}
static const mxArray *m_c_emlrt_marshallOut(const real_T eml_u[11])
{
    const mxArray *eml_y;
    static int32_T eml_iv30[1] = { 11 };
    const mxArray *eml_m13;
    real_T *eml_pData;
    int32_T eml_i;
    eml_y = NULL;
    eml_m13 = mxCreateNumericArray(1, (int32_T *)eml_iv30, mxDOUBLE_CLASS, mxREAL);
    eml_pData = mxGetPr(eml_m13);
    for(eml_i = 0; eml_i < 11; eml_i++) {
        eml_pData[eml_i] = eml_u[eml_i];
    }
    emlrtAssign(&eml_y, eml_m13);
    return eml_y;
}
static real_T m_d_emlrt_marshallIn(const mxArray *eml_numChannels, const char_T *eml_name)
{
    real_T eml_y;
    eml_y = m_l_emlrt_marshallIn(emlrtAlias(eml_numChannels), eml_name);
    emlrtDestroyArray(&eml_numChannels);
    return eml_y;
}
static const mxArray *m_d_emlrt_marshallOut(const real_T eml_u[76032])
{
    const mxArray *eml_y;
    static int32_T eml_iv31[2] = { 11, 6912 };
    const mxArray *eml_m14;
    real_T *eml_pData;
    int32_T eml_i;
    eml_y = NULL;
    eml_m14 = mxCreateNumericArray(2, (int32_T *)eml_iv31, mxDOUBLE_CLASS, mxREAL);
    eml_pData = mxGetPr(eml_m14);
    for(eml_i = 0; eml_i < 76032; eml_i++) {
        eml_pData[eml_i] = eml_u[eml_i];
    }
    emlrtAssign(&eml_y, eml_m14);
    return eml_y;
}
static void m_e_emlrt_marshallIn(const mxArray *eml_DRNLb, const char_T *eml_name, real_T eml_y[11])
{
    m_m_emlrt_marshallIn(emlrtAlias(eml_DRNLb), eml_name, eml_y);
    emlrtDestroyArray(&eml_DRNLb);
}
static void m_emlrt_marshallIn(const mxArray *eml_frameBufferL, const char_T *eml_name, real_T eml_y[6912])
{
    m_i_emlrt_marshallIn(emlrtAlias(eml_frameBufferL), eml_name, eml_y);
    emlrtDestroyArray(&eml_frameBufferL);
}
static const mxArray *m_emlrt_marshallOut(const real_T eml_u[6912])
{
    const mxArray *eml_y;
    static int32_T eml_iv28[2] = { 1, 6912 };
    const mxArray *eml_m11;
    real_T *eml_pData;
    int32_T eml_i;
    eml_y = NULL;
    eml_m11 = mxCreateNumericArray(2, (int32_T *)eml_iv28, mxDOUBLE_CLASS, mxREAL);
    eml_pData = mxGetPr(eml_m11);
    for(eml_i = 0; eml_i < 6912; eml_i++) {
        eml_pData[eml_i] = eml_u[eml_i];
    }
    emlrtAssign(&eml_y, eml_m11);
    return eml_y;
}
static void m_f_emlrt_marshallIn(const mxArray *eml_peakIPL, const char_T *eml_name, real_T eml_y[11])
{
    m_n_emlrt_marshallIn(emlrtAlias(eml_peakIPL), eml_name, eml_y);
    emlrtDestroyArray(&eml_peakIPL);
}
static void m_g_emlrt_marshallIn(const mxArray *eml_MOCcontrol, const char_T *eml_name, real_T eml_y[76032])
{
    m_o_emlrt_marshallIn(emlrtAlias(eml_MOCcontrol), eml_name, eml_y);
    emlrtDestroyArray(&eml_MOCcontrol);
}
static boolean_T m_h_emlrt_marshallIn(const mxArray *eml_useGTF, const char_T *eml_name)
{
    boolean_T eml_y;
    eml_y = m_p_emlrt_marshallIn(emlrtAlias(eml_useGTF), eml_name);
    emlrtDestroyArray(&eml_useGTF);
    return eml_y;
}
static void m_i_emlrt_marshallIn(const mxArray *eml_src, const char_T *eml_nam, real_T eml_ret[6912])
{
    int32_T eml_i9;
    int32_T eml_iv32[2];
    for(eml_i9 = 0; eml_i9 < 2; eml_i9++) {
        eml_iv32[eml_i9] = 1 + 6911 * eml_i9;
    }
    emlrtCheckBuiltIn(eml_nam, eml_src, "double", FALSE, 2U, eml_iv32);
    for(eml_i9 = 0; eml_i9 < 6912; eml_i9++) {
        eml_ret[eml_i9] = (*((real_T (*)[6912])mxGetData(eml_src)))[eml_i9];
    }
    emlrtDestroyArray(&eml_src);
}
static void m_j_emlrt_marshallIn(const mxArray *eml_src, const char_T *eml_nam, real_T eml_ret[3000])
{
    int32_T eml_iv33[1];
    int32_T eml_i10;
    eml_iv33[0] = 3000;
    emlrtCheckBuiltIn(eml_nam, eml_src, "double", FALSE, 1U, eml_iv33);
    for(eml_i10 = 0; eml_i10 < 3000; eml_i10++) {
        eml_ret[eml_i10] = (*((real_T (*)[3000])mxGetData(eml_src)))[eml_i10];
    }
    emlrtDestroyArray(&eml_src);
}
static void m_k_emlrt_marshallIn(const mxArray *eml_src, const char_T *eml_nam, real_T eml_ret[5000])
{
    int32_T eml_iv34[1];
    int32_T eml_i11;
    eml_iv34[0] = 5000;
    emlrtCheckBuiltIn(eml_nam, eml_src, "double", FALSE, 1U, eml_iv34);
    for(eml_i11 = 0; eml_i11 < 5000; eml_i11++) {
        eml_ret[eml_i11] = (*((real_T (*)[5000])mxGetData(eml_src)))[eml_i11];
    }
    emlrtDestroyArray(&eml_src);
}
static real_T m_l_emlrt_marshallIn(const mxArray *eml_src, const char_T *eml_nam)
{
    real_T eml_ret;
    emlrtCheckBuiltIn(eml_nam, eml_src, "double", FALSE, 0U, 0);
    eml_ret = *((real_T *)mxGetData(eml_src));
    emlrtDestroyArray(&eml_src);
    return eml_ret;
}
static void m_m_emlrt_marshallIn(const mxArray *eml_src, const char_T *eml_nam, real_T eml_ret[11])
{
    int32_T eml_i12;
    int32_T eml_iv35[2];
    for(eml_i12 = 0; eml_i12 < 2; eml_i12++) {
        eml_iv35[eml_i12] = 1 + 10 * eml_i12;
    }
    emlrtCheckBuiltIn(eml_nam, eml_src, "double", FALSE, 2U, eml_iv35);
    for(eml_i12 = 0; eml_i12 < 11; eml_i12++) {
        eml_ret[eml_i12] = (*((real_T (*)[11])mxGetData(eml_src)))[eml_i12];
    }
    emlrtDestroyArray(&eml_src);
}
static void m_n_emlrt_marshallIn(const mxArray *eml_src, const char_T *eml_nam, real_T eml_ret[11])
{
    int32_T eml_iv36[1];
    int32_T eml_i13;
    eml_iv36[0] = 11;
    emlrtCheckBuiltIn(eml_nam, eml_src, "double", FALSE, 1U, eml_iv36);
    for(eml_i13 = 0; eml_i13 < 11; eml_i13++) {
        eml_ret[eml_i13] = (*((real_T (*)[11])mxGetData(eml_src)))[eml_i13];
    }
    emlrtDestroyArray(&eml_src);
}
static void m_o_emlrt_marshallIn(const mxArray *eml_src, const char_T *eml_nam, real_T eml_ret[76032])
{
    int32_T eml_i14;
    int32_T eml_iv37[2];
    int32_T eml_i15;
    for(eml_i14 = 0; eml_i14 < 2; eml_i14++) {
        eml_iv37[eml_i14] = 11 + 6901 * eml_i14;
    }
    emlrtCheckBuiltIn(eml_nam, eml_src, "double", FALSE, 2U, eml_iv37);
    for(eml_i14 = 0; eml_i14 < 6912; eml_i14++) {
        for(eml_i15 = 0; eml_i15 < 11; eml_i15++) {
            eml_ret[eml_i15 + 11 * eml_i14] = (*((real_T (*)[76032])mxGetData(eml_src)))[eml_i15 + 11 * eml_i14];
        }
    }
    emlrtDestroyArray(&eml_src);
}
static boolean_T m_p_emlrt_marshallIn(const mxArray *eml_src, const char_T *eml_nam)
{
    boolean_T eml_ret;
    emlrtCheckBuiltIn(eml_nam, eml_src, "logical", FALSE, 0U, 0);
    eml_ret = *mxGetLogicals(eml_src);
    emlrtDestroyArray(&eml_src);
    return eml_ret;
}
void EssexAidProcessVFrameSwitchable_api(const mxArray *const eml_prhs[27], const mxArray *eml_plhs[16])
{
    static real_T eml_frameBufferL[6912];
    static real_T eml_frameBufferR[6912];
    static real_T eml_filterStatesL[3000];
    static real_T eml_filterStatesR[3000];
    static real_T eml_filterCoeffs[5000];
    real_T eml_numChannels;
    real_T eml_numSamples;
    static real_T eml_ARampL[6912];
    static real_T eml_ARampR[6912];
    real_T eml_ARthresholdPa;
    real_T eml_filterOrder;
    real_T eml_DRNLb[11];
    real_T eml_DRNLc[11];
    real_T eml_MOCthreshold_dBOP[11];
    real_T eml_MOCfactor;
    real_T eml_peakIPL[11];
    real_T eml_peakOPL[11];
    real_T eml_rmsIPL[11];
    real_T eml_rmsOPL[11];
    real_T eml_peakIPR[11];
    real_T eml_peakOPR[11];
    real_T eml_rmsIPR[11];
    real_T eml_rmsOPR[11];
    real_T eml_MOCend[11];
    static real_T eml_MOCcontrol[76032];
    real_T eml_mainGain[11];
    boolean_T eml_useGTF;
    /* Marshall function inputs */
    m_emlrt_marshallIn(emlrtAliasP(eml_prhs[0]), "frameBufferL", eml_frameBufferL);
    m_emlrt_marshallIn(emlrtAliasP(eml_prhs[1]), "frameBufferR", eml_frameBufferR);
    m_b_emlrt_marshallIn(emlrtAliasP(eml_prhs[2]), "filterStatesL", eml_filterStatesL);
    m_b_emlrt_marshallIn(emlrtAliasP(eml_prhs[3]), "filterStatesR", eml_filterStatesR);
    m_c_emlrt_marshallIn(emlrtAliasP(eml_prhs[4]), "filterCoeffs", eml_filterCoeffs);
    eml_numChannels = m_d_emlrt_marshallIn(emlrtAliasP(eml_prhs[5]), "numChannels");
    eml_numSamples = m_d_emlrt_marshallIn(emlrtAliasP(eml_prhs[6]), "numSamples");
    m_emlrt_marshallIn(emlrtAliasP(eml_prhs[7]), "ARampL", eml_ARampL);
    m_emlrt_marshallIn(emlrtAliasP(eml_prhs[8]), "ARampR", eml_ARampR);
    eml_ARthresholdPa = m_d_emlrt_marshallIn(emlrtAliasP(eml_prhs[9]), "ARthresholdPa");
    eml_filterOrder = m_d_emlrt_marshallIn(emlrtAliasP(eml_prhs[10]), "filterOrder");
    m_e_emlrt_marshallIn(emlrtAliasP(eml_prhs[11]), "DRNLb", eml_DRNLb);
    m_e_emlrt_marshallIn(emlrtAliasP(eml_prhs[12]), "DRNLc", eml_DRNLc);
    m_e_emlrt_marshallIn(emlrtAliasP(eml_prhs[13]), "MOCthreshold_dBOP", eml_MOCthreshold_dBOP);
    eml_MOCfactor = m_d_emlrt_marshallIn(emlrtAliasP(eml_prhs[14]), "MOCfactor");
    m_f_emlrt_marshallIn(emlrtAliasP(eml_prhs[15]), "peakIPL", eml_peakIPL);
    m_f_emlrt_marshallIn(emlrtAliasP(eml_prhs[16]), "peakOPL", eml_peakOPL);
    m_f_emlrt_marshallIn(emlrtAliasP(eml_prhs[17]), "rmsIPL", eml_rmsIPL);
    m_f_emlrt_marshallIn(emlrtAliasP(eml_prhs[18]), "rmsOPL", eml_rmsOPL);
    m_f_emlrt_marshallIn(emlrtAliasP(eml_prhs[19]), "peakIPR", eml_peakIPR);
    m_f_emlrt_marshallIn(emlrtAliasP(eml_prhs[20]), "peakOPR", eml_peakOPR);
    m_f_emlrt_marshallIn(emlrtAliasP(eml_prhs[21]), "rmsIPR", eml_rmsIPR);
    m_f_emlrt_marshallIn(emlrtAliasP(eml_prhs[22]), "rmsOPR", eml_rmsOPR);
    m_f_emlrt_marshallIn(emlrtAliasP(eml_prhs[23]), "MOCend", eml_MOCend);
    m_g_emlrt_marshallIn(emlrtAliasP(eml_prhs[24]), "MOCcontrol", eml_MOCcontrol);
    m_e_emlrt_marshallIn(emlrtAliasP(eml_prhs[25]), "mainGain", eml_mainGain);
    eml_useGTF = m_h_emlrt_marshallIn(emlrtAliasP(eml_prhs[26]), "useGTF");
    /* Invoke the target function */
    EssexAidProcessVFrameSwitchable(eml_frameBufferL, eml_frameBufferR, eml_filterStatesL, eml_filterStatesR, eml_filterCoeffs, 
        eml_numChannels, eml_numSamples, eml_ARampL, eml_ARampR, eml_ARthresholdPa, eml_filterOrder, eml_DRNLb, eml_DRNLc, 
        eml_MOCthreshold_dBOP, eml_MOCfactor, eml_peakIPL, eml_peakOPL, eml_rmsIPL, eml_rmsOPL, eml_peakIPR, eml_peakOPR, eml_rmsIPR
        , eml_rmsOPR, eml_MOCend, eml_MOCcontrol, eml_mainGain, eml_useGTF);
    /* Marshall function outputs */
    eml_plhs[0] = m_emlrt_marshallOut(eml_frameBufferL);
    eml_plhs[1] = m_emlrt_marshallOut(eml_frameBufferR);
    eml_plhs[2] = m_b_emlrt_marshallOut(eml_filterStatesL);
    eml_plhs[3] = m_b_emlrt_marshallOut(eml_filterStatesR);
    eml_plhs[4] = m_emlrt_marshallOut(eml_ARampL);
    eml_plhs[5] = m_emlrt_marshallOut(eml_ARampR);
    eml_plhs[6] = m_c_emlrt_marshallOut(eml_MOCend);
    eml_plhs[7] = m_c_emlrt_marshallOut(eml_peakIPL);
    eml_plhs[8] = m_c_emlrt_marshallOut(eml_peakOPL);
    eml_plhs[9] = m_c_emlrt_marshallOut(eml_rmsIPL);
    eml_plhs[10] = m_c_emlrt_marshallOut(eml_rmsOPL);
    eml_plhs[11] = m_c_emlrt_marshallOut(eml_peakIPR);
    eml_plhs[12] = m_c_emlrt_marshallOut(eml_peakOPR);
    eml_plhs[13] = m_c_emlrt_marshallOut(eml_rmsIPR);
    eml_plhs[14] = m_c_emlrt_marshallOut(eml_rmsOPR);
    eml_plhs[15] = m_d_emlrt_marshallOut(eml_MOCcontrol);
}
/* End of Embedded MATLAB Coder code generation (EssexAidProcessVFrameSwitchable_api.c) */
