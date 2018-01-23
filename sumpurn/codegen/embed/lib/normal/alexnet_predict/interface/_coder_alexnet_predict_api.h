/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_alexnet_predict_api.h
 *
 * GPU Coder version                    : 1.0
 * CUDA/C/C++ source code generated on  : 23-Jan-2018 09:38:17
 */

#ifndef _CODER_ALEXNET_PREDICT_API_H
#define _CODER_ALEXNET_PREDICT_API_H

/* Include Files */
#include "tmwtypes.h"
#include "mex.h"
#include "emlrt.h"
#include <stddef.h>
#include <stdlib.h>
#include "_coder_alexnet_predict_api.h"

/* Variable Declarations */
extern emlrtCTX emlrtRootTLSGlobal;
extern emlrtContext emlrtContextGlobal;

/* Function Declarations */
extern void alexnet_predict(real_T in[154587], real32_T out[1000]);
extern void alexnet_predict_api(const mxArray * const prhs[1], const mxArray
  *plhs[1]);
extern void alexnet_predict_atexit(void);
extern void alexnet_predict_initialize(void);
extern void alexnet_predict_terminate(void);
extern void alexnet_predict_xil_terminate(void);

#endif

/*
 * File trailer for _coder_alexnet_predict_api.h
 *
 * [EOF]
 */
