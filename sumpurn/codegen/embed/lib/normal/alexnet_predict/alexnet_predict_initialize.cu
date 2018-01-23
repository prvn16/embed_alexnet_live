//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: alexnet_predict_initialize.cu
//
// GPU Coder version                    : 1.0
// CUDA/C/C++ source code generated on  : 23-Jan-2018 09:38:17
//

// Include Files
#include "rt_nonfinite.h"
#include "alexnet_predict.h"
#include "alexnet_predict_initialize.h"

// Function Definitions

//
// Arguments    : void
// Return Type  : void
//
void alexnet_predict_initialize()
{
  rt_InitInfAndNaN(8U);
  alexnet_predict_init();
}

//
// File trailer for alexnet_predict_initialize.cu
//
// [EOF]
//
