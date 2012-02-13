/*
 * sum.c
 *
 * Embedded MATLAB Coder code generation for function 'sum'
 *
 * C source code generated on: Fri Feb 10 11:40:58 2012
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "EssexAidProcessVFrameSwitchable.h"
#include "sum.h"

/* Type Definitions */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */
static emlrtBCInfo eml_eb_emlrtBCI = { -1, -1, 72, 22, "", "sum", "C:/2010a/toolbox/eml/lib/matlab/datafun/sum.m", 0 };
static emlrtBCInfo eml_fb_emlrtBCI = { -1, -1, 75, 30, "", "sum", "C:/2010a/toolbox/eml/lib/matlab/datafun/sum.m", 0 };
static emlrtBCInfo eml_gb_emlrtBCI = { -1, -1, 72, 22, "", "sum", "C:/2010a/toolbox/eml/lib/matlab/datafun/sum.m", 0 };
static emlrtBCInfo eml_hb_emlrtBCI = { -1, -1, 78, 13, "", "sum", "C:/2010a/toolbox/eml/lib/matlab/datafun/sum.m", 0 };
static emlrtBCInfo eml_ib_emlrtBCI = { -1, -1, 72, 22, "", "sum", "C:/2010a/toolbox/eml/lib/matlab/datafun/sum.m", 0 };
static emlrtBCInfo eml_jb_emlrtBCI = { -1, -1, 75, 30, "", "sum", "C:/2010a/toolbox/eml/lib/matlab/datafun/sum.m", 0 };

/* Function Declarations */

/* Function Definitions */
void m_sum(real_T eml_x_data[13824], int32_T eml_x_sizes[2], real_T eml_y_data[6912], int32_T eml_y_sizes[2])
{
    int32_T eml_b;
    int16_T eml_sz[2];
    int16_T eml_iv16[2];
    int16_T eml_tmp_sizes[2];
    int32_T eml_ix;
    int32_T eml_iy;
    int32_T eml_i;
    int32_T eml_ixstart;
    for(eml_b = 0; eml_b < 2; eml_b++) {
        eml_sz[eml_b] = (int16_T)eml_x_sizes[eml_b];
    }
    eml_sz[0] = 1;
    eml_iv16[0] = 1;
    eml_iv16[1] = eml_sz[1];
    eml_tmp_sizes[0] = 1;
    eml_tmp_sizes[1] = eml_iv16[1];
    for(eml_b = 0; eml_b < 2; eml_b++) {
        eml_y_sizes[eml_b] = eml_tmp_sizes[eml_b];
    }
    if(eml_x_sizes[1] == 0) {
        eml_b = eml_y_sizes[1] - 1;
        for(eml_ix = 0; eml_ix <= eml_b; eml_ix++) {
            eml_iy = eml_y_sizes[0] - 1;
            for(eml_i = 0; eml_i <= eml_iy; eml_i++) {
                eml_y_data[eml_i + eml_y_sizes[0] * eml_ix] = 0.0;
            }
        }
    } else {
        eml_b = eml_x_sizes[1];
        eml_ix = 0;
        eml_iy = 0;
        for(eml_i = 1; eml_i <= eml_b; eml_i++) {
            eml_ixstart = eml_ix + 1;
            emlrtDynamicBoundsCheck(eml_ixstart, 1, eml_x_sizes[1] << 1, &eml_eb_emlrtBCI);
            eml_ix = eml_ixstart + 1;
            emlrtDynamicBoundsCheck(eml_ix, 1, eml_x_sizes[1] << 1, &eml_fb_emlrtBCI);
            emlrtDynamicBoundsCheck(eml_ixstart, 1, eml_x_sizes[1] << 1, &eml_gb_emlrtBCI);
            eml_iy++;
            eml_y_data[emlrtDynamicBoundsCheck(eml_iy, 1, eml_y_sizes[1], &eml_hb_emlrtBCI) - 1] = eml_x_data[
                emlrtDynamicBoundsCheck(eml_ixstart, 1, eml_x_sizes[1] << 1, &eml_ib_emlrtBCI) - 1] + eml_x_data[
                emlrtDynamicBoundsCheck(eml_ix, 1, eml_x_sizes[1] << 1, &eml_jb_emlrtBCI) - 1];
        }
    }
}
/* End of Embedded MATLAB Coder code generation (sum.c) */
