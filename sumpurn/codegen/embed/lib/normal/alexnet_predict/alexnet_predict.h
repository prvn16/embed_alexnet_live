//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: alexnet_predict.h
//
// GPU Coder version                    : 1.0
// CUDA/C/C++ source code generated on  : 23-Jan-2018 09:38:17
//
#ifndef ALEXNET_PREDICT_H
#define ALEXNET_PREDICT_H

// Include Files
#include <stddef.h>
#include <stdlib.h>
#include "rtwtypes.h"
#include "alexnet_predict_types.h"

// Function Declarations
extern void alexnet_predict(const real_T in[154587], real32_T out[1000]);
extern void alexnet_predict_init();

#endif

//
// File trailer for alexnet_predict.h
//
// [EOF]
//
