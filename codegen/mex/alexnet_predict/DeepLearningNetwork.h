/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * DeepLearningNetwork.h
 *
 * Code generation for function 'DeepLearningNetwork'
 *
 */

#ifndef DEEPLEARNINGNETWORK_H
#define DEEPLEARNINGNETWORK_H

/* Include files */
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "tmwtypes.h"
#include "mex.h"
#include "emlrt.h"
#include "rtwtypes.h"
#include "alexnet_predict_types.h"

/* Type Definitions */
#include "cnn_api.hpp"

/* Function Declarations */
extern void DeepLearningNetwork_predict(b_alexnet *obj, const real_T inputdata
  [154587], real32_T outT[1000]);
extern void DeepLearningNetwork_setup(b_alexnet *obj);

#endif

/* End of code generation (DeepLearningNetwork.h) */
