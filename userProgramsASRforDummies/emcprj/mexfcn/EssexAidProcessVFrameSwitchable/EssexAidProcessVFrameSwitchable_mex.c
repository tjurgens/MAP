/*
 * EssexAidProcessVFrameSwitchable_mex.c
 *
 * Embedded MATLAB Coder code generation for function 'EssexAidProcessVFrameSwitchable'
 *
 * C source code generated on: Fri Feb 10 11:40:58 2012
 *
 */

/* Include files */
#include "mex.h"
#include "EssexAidProcessVFrameSwitchable_api.h"
#include "EssexAidProcessVFrameSwitchable_initialize.h"
#include "EssexAidProcessVFrameSwitchable_terminate.h"

/* Type Definitions */

/* Function Declarations */
static void EssexAidProcessVFrameSwitchable_mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[]);

/* Variable Definitions */
emlrtContext emlrtContextGlobal = { true, false, EMLRT_VERSION_INFO, NULL, "EssexAidProcessVFrameSwitchable", NULL, false };

/* Function Definitions */
static void EssexAidProcessVFrameSwitchable_mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
  /* Temporary copy for mex outputs. */
  mxArray *outputs[16];
  int n = 0;
  int nOutputs = (nlhs < 1 ? 1 : nlhs);
  /* Check for proper number of arguments. */
  if(nrhs != 27) {
    mexErrMsgIdAndTxt("emlcoder:emlmex:WrongNumberOfInputs","27 inputs required for entry-point 'EssexAidProcessVFrameSwitchable'.");
  } else if(nlhs > 16) {
    mexErrMsgIdAndTxt("emlcoder:emlmex:TooManyOutputArguments","Too many output arguments for entry-point 'EssexAidProcessVFrameSwitchable'.");
  }
  /* Module initialization. */
  EssexAidProcessVFrameSwitchable_initialize(&emlrtContextGlobal);
  /* Call the function. */
  EssexAidProcessVFrameSwitchable_api(prhs,(const mxArray**)outputs);
  /* Copy over outputs to the caller. */
  for (n = 0; n < nOutputs; ++n) {
    plhs[n] = emlrtReturnArrayR2009a(outputs[n]);
  }
  /* Module finalization. */
  EssexAidProcessVFrameSwitchable_terminate();
}
void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
  /* Initialize the memory manager. */
  mexAtExit(EssexAidProcessVFrameSwitchable_atexit);
  emlrtClearAllocCount(&emlrtContextGlobal, 0, 0, NULL);
  /* Dispatch the entry-point. */
  EssexAidProcessVFrameSwitchable_mexFunction(nlhs, plhs, nrhs, prhs);
}
/* End of Embedded MATLAB Coder code generation (EssexAidProcessVFrameSwitchable_mex.c) */
