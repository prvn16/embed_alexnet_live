/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_alexnet_predict_mex.cu
 *
 * Code generation for function '_coder_alexnet_predict_mex'
 *
 */

/* Include files */
#include "alexnet_predict.h"
#include "_coder_alexnet_predict_mex.h"
#include "alexnet_predict_terminate.h"
#include "_coder_alexnet_predict_api.h"
#include "alexnet_predict_initialize.h"
#include "alexnet_predict_data.h"

/* Function Declarations */
static void alexnet_predict_mexFunction(int32_T nlhs, mxArray *plhs[1], int32_T
  nrhs, const mxArray *prhs[1]);

/* Function Definitions */
static void alexnet_predict_mexFunction(int32_T nlhs, mxArray *plhs[1], int32_T
  nrhs, const mxArray *prhs[1])
{
  int32_T n;
  const mxArray *inputs[1];
  const mxArray *outputs[1];
  int32_T b_nlhs;

  /* Check for proper number of arguments. */
  if (nrhs != 1) {
    emlrtErrMsgIdAndTxt(emlrtRootTLSGlobal, "EMLRT:runTime:WrongNumberOfInputs",
                        5, 12, 1, 4, 15, "alexnet_predict");
  }

  if (nlhs > 1) {
    emlrtErrMsgIdAndTxt(emlrtRootTLSGlobal,
                        "EMLRT:runTime:TooManyOutputArguments", 3, 4, 15,
                        "alexnet_predict");
  }

  /* Temporary copy for mex inputs. */
  for (n = 0; n < nrhs; n++) {
    inputs[n] = prhs[n];
  }

  /* Call the function. */
  alexnet_predict_api(inputs, outputs);

  /* Copy over outputs to the caller. */
  if (nlhs < 1) {
    b_nlhs = 1;
  } else {
    b_nlhs = nlhs;
  }

  emlrtReturnArrays(b_nlhs, plhs, outputs);

  /* Module termination. */
  alexnet_predict_terminate();
}

void mexFunction(int32_T nlhs, mxArray *plhs[], int32_T nrhs, const mxArray
                 *prhs[])
{
  mexAtExit(alexnet_predict_atexit);

  /* Initialize the memory manager. */
  /* Module initialization. */
  alexnet_predict_initialize();

  /* Dispatch the entry-point. */
  alexnet_predict_mexFunction(nlhs, plhs, nrhs, prhs);
}

emlrtCTX mexFunctionCreateRootTLS()
{
  emlrtCreateRootTLS(&emlrtRootTLSGlobal, &emlrtContextGlobal, NULL, 1);
  return emlrtRootTLSGlobal;
}

/* End of code generation (_coder_alexnet_predict_mex.cu) */
