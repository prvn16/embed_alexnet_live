/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * alexnet_predict_initialize.cu
 *
 * Code generation for function 'alexnet_predict_initialize'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "alexnet_predict.h"
#include "alexnet_predict_initialize.h"
#include "_coder_alexnet_predict_mex.h"
#include "alexnet_predict_data.h"

/* Function Declarations */
static void alexnet_predict_once();

/* Function Definitions */
static void alexnet_predict_once()
{
  alexnet_predict_init();
}

void alexnet_predict_initialize()
{
  mexFunctionCreateRootTLS();
  emlrtClearAllocCountR2012b(emlrtRootTLSGlobal, false, 0U, 0);
  emlrtEnterRtStackR2012b(emlrtRootTLSGlobal);
  if (emlrtFirstTimeR2012b(emlrtRootTLSGlobal)) {
    alexnet_predict_once();
  }
}

/* End of code generation (alexnet_predict_initialize.cu) */
