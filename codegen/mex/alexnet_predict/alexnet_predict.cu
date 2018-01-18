/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * alexnet_predict.cu
 *
 * Code generation for function 'alexnet_predict'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "alexnet_predict.h"
#include "DeepLearningNetwork.h"

/* Variable Definitions */
static b_alexnet mynet;
static boolean_T mynet_not_empty;

/* Function Definitions */
void alexnet_predict(const real_T in[154587], real32_T out[1000])
{
  /*  Copyright 2017 The MathWorks, Inc. */
  /*  A persistent object mynet is used to load the series network object. */
  /*  At the first call to this function, the persistent object is constructed and */
  /*  setup. When the function is called subsequent times, the same object is reused  */
  /*  to call predict on inputs, thus avoiding reconstructing and reloading the */
  /*  network object. */
  if (!mynet_not_empty) {
    DeepLearningNetwork_setup(&mynet);
    mynet_not_empty = true;
  }

  /*  pass in input    */
  DeepLearningNetwork_predict(&mynet, in, out);
}

void alexnet_predict_init()
{
  mynet_not_empty = false;
}

/* End of code generation (alexnet_predict.cu) */
