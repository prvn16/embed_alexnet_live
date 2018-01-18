/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_alexnet_predict_api.cu
 *
 * Code generation for function '_coder_alexnet_predict_api'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "alexnet_predict.h"
#include "_coder_alexnet_predict_api.h"
#include "alexnet_predict_data.h"

/* Function Declarations */
static real_T (*b_emlrt_marshallIn(const mxArray *u, const emlrtMsgIdentifier
  *parentId))[154587];
static real_T (*c_emlrt_marshallIn(const mxArray *src, const emlrtMsgIdentifier *
  msgId))[154587];
static real_T (*emlrt_marshallIn(const mxArray *in, const char_T *identifier))
  [154587];
static const mxArray *emlrt_marshallOut(const real32_T u[1000]);

/* Function Definitions */
static real_T (*b_emlrt_marshallIn(const mxArray *u, const emlrtMsgIdentifier
  *parentId))[154587]
{
  real_T (*y)[154587];
  y = c_emlrt_marshallIn(emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}
  static real_T (*c_emlrt_marshallIn(const mxArray *src, const
  emlrtMsgIdentifier *msgId))[154587]
{
  real_T (*ret)[154587];
  static const int32_T dims[3] = { 227, 227, 3 };

  emlrtCheckBuiltInR2012b(emlrtRootTLSGlobal, msgId, src, "double", false, 3U,
    dims);
  ret = (real_T (*)[154587])emlrtMxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}

static real_T (*emlrt_marshallIn(const mxArray *in, const char_T *identifier))
  [154587]
{
  real_T (*y)[154587];
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = const_cast<const char *>(identifier);
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  y = b_emlrt_marshallIn(emlrtAlias(in), &thisId);
  emlrtDestroyArray(&in);
  return y;
}
  static const mxArray *emlrt_marshallOut(const real32_T u[1000])
{
  const mxArray *y;
  const mxArray *m0;
  static const int32_T iv0[2] = { 0, 0 };

  static const int32_T iv1[2] = { 1, 1000 };

  y = NULL;
  m0 = emlrtCreateNumericArray(2, iv0, mxSINGLE_CLASS, mxREAL);
  emlrtMxSetData((mxArray *)m0, (void *)&u[0]);
  emlrtSetDimensions((mxArray *)m0, *(int32_T (*)[2])&iv1[0], 2);
  emlrtAssign(&y, m0);
  return y;
}

void alexnet_predict_api(const mxArray * const prhs[1], const mxArray *plhs[1])
{
  real32_T (*out)[1000];
  real_T (*in)[154587];
  out = (real32_T (*)[1000])mxMalloc(sizeof(real32_T [1000]));

  /* Marshall function inputs */
  in = emlrt_marshallIn(emlrtAlias((const mxArray *)prhs[0]), "in");

  /* Invoke the target function */
  alexnet_predict(*in, *out);

  /* Marshall function outputs */
  plhs[0] = emlrt_marshallOut(*out);
}

/* End of code generation (_coder_alexnet_predict_api.cu) */
