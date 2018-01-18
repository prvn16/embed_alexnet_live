/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * alexnet_predict_terminate.cu
 *
 * Code generation for function 'alexnet_predict_terminate'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "alexnet_predict.h"
#include "alexnet_predict_terminate.h"
#include "_coder_alexnet_predict_mex.h"
#include "alexnet_predict_data.h"

/* Function Definitions */
void alexnet_predict_atexit()
{
  mexFunctionCreateRootTLS();
  emlrtEnterRtStackR2012b(emlrtRootTLSGlobal);
  emlrtLeaveRtStackR2012b(emlrtRootTLSGlobal);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
}

void alexnet_predict_terminate()
{
  emlrtLeaveRtStackR2012b(emlrtRootTLSGlobal);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
}

/* End of code generation (alexnet_predict_terminate.cu) */
