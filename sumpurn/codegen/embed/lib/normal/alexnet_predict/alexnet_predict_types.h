//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: alexnet_predict_types.h
//
// GPU Coder version                    : 1.0
// CUDA/C/C++ source code generated on  : 23-Jan-2018 09:38:17
//
#ifndef ALEXNET_PREDICT_TYPES_H
#define ALEXNET_PREDICT_TYPES_H

// Include Files
#include "rtwtypes.h"

// Type Definitions
#include "cnn_api.hpp"

class b_alexnet
{
 public:
  int32_T batchSize;
  int32_T numLayers;
  real32_T *inputData;
  real32_T *outputData;
  MWCNNLayer *layers[25];
 private:
  cublasHandle_t *cublasHandle;
  cudnnHandle_t *cudnnHandle;
  uint32_T workSpaceSize;
  real32_T *workSpace;
 public:
  b_alexnet();
  void setup();
  void predict();
  void cleanup();
  ~b_alexnet();
};

#endif

//
// File trailer for alexnet_predict_types.h
//
// [EOF]
//
