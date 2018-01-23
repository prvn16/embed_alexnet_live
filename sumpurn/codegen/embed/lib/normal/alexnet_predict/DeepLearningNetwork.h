//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: DeepLearningNetwork.h
//
// GPU Coder version                    : 1.0
// CUDA/C/C++ source code generated on  : 23-Jan-2018 09:38:17
//
#ifndef DEEPLEARNINGNETWORK_H
#define DEEPLEARNINGNETWORK_H

// Include Files
#include <stddef.h>
#include <stdlib.h>
#include "rtwtypes.h"
#include "alexnet_predict_types.h"

// Type Definitions
#include "cnn_api.hpp"

// Function Declarations
extern void DeepLearningNetwork_predict(b_alexnet *obj, const real_T inputdata
  [154587], real32_T outT[1000]);
extern void DeepLearningNetwork_setup(b_alexnet *obj);

#endif

//
// File trailer for DeepLearningNetwork.h
//
// [EOF]
//
