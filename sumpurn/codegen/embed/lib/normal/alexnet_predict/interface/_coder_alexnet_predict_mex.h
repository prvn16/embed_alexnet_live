/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_alexnet_predict_mex.h
 *
 * GPU Coder version                    : 1.0
 * CUDA/C/C++ source code generated on  : 23-Jan-2018 09:38:17
 */

#ifndef _CODER_ALEXNET_PREDICT_MEX_H
#define _CODER_ALEXNET_PREDICT_MEX_H

/* Include Files */
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include "tmwtypes.h"
#include "mex.h"
#include "emlrt.h"
#include "_coder_alexnet_predict_api.h"

/* Function Declarations */
extern void mexFunction(int32_T nlhs, mxArray *plhs[], int32_T nrhs, const
  mxArray *prhs[]);
extern emlrtCTX mexFunctionCreateRootTLS(void);

#endif

/*
 * File trailer for _coder_alexnet_predict_mex.h
 *
 * [EOF]
 */
