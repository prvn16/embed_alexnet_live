/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * alexnet_predict.h
 *
 * Code generation for function 'alexnet_predict'
 *
 */

#ifndef ALEXNET_PREDICT_H
#define ALEXNET_PREDICT_H

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

/* Function Declarations */
extern void alexnet_predict(const real_T in[154587], real32_T out[1000]);
extern void alexnet_predict_init();

#endif

/* End of code generation (alexnet_predict.h) */
