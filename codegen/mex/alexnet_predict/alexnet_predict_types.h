/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * alexnet_predict_types.h
 *
 * Code generation for function 'alexnet_predict'
 *
 */

#ifndef ALEXNET_PREDICT_TYPES_H
#define ALEXNET_PREDICT_TYPES_H

/* Include files */
#include "rtwtypes.h"

/* Type Definitions */
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

/* End of code generation (alexnet_predict_types.h) */
