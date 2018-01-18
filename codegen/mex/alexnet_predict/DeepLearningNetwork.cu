/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * DeepLearningNetwork.cu
 *
 * Code generation for function 'DeepLearningNetwork'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "alexnet_predict.h"
#include "DeepLearningNetwork.h"

/* Type Definitions */
#include "cnn_api.hpp"

/* Function Declarations */
static __global__ void c_DeepLearningNetwork_predict_k(const real_T *inputdata,
  real32_T *b_inputdata);
static __global__ void d_DeepLearningNetwork_predict_k(real32_T *inputdata,
  real32_T *inputT);
static __global__ void e_DeepLearningNetwork_predict_k(real32_T *out, real32_T
  *outT);

/* Function Definitions */
static __global__ __launch_bounds__(512, 1) void c_DeepLearningNetwork_predict_k
  (const real_T *inputdata, real32_T *b_inputdata)
{
  int32_T i0;
  ;
  ;
  i0 = (int32_T)(((((gridDim.x * gridDim.y * blockIdx.z + gridDim.x * blockIdx.y)
                    + blockIdx.x) * (blockDim.x * blockDim.y * blockDim.z) +
                   threadIdx.z * blockDim.x * blockDim.y) + threadIdx.y *
                  blockDim.x) + threadIdx.x);
  if (!(int32_T)(i0 >= 154587)) {
    b_inputdata[i0] = (real32_T)inputdata[i0];
  }
}

static __global__ __launch_bounds__(512, 1) void d_DeepLearningNetwork_predict_k
  (real32_T *inputdata, real32_T *inputT)
{
  uint32_T threadId;
  int32_T i0;
  int32_T i1;
  int32_T p;
  ;
  ;
  threadId = ((((gridDim.x * gridDim.y * blockIdx.z + gridDim.x * blockIdx.y) +
                blockIdx.x) * (blockDim.x * blockDim.y * blockDim.z) +
               threadIdx.z * blockDim.x * blockDim.y) + threadIdx.y * blockDim.x)
    + threadIdx.x;
  p = (int32_T)(threadId / 51529U);
  i1 = (int32_T)((threadId - (uint32_T)p * 51529U) / 227U);
  i0 = (int32_T)((threadId - (uint32_T)i1 * 227U) - (uint32_T)p * 51529U);
  if (((int32_T)((!(int32_T)(i0 >= 227)) && (!(int32_T)(i1 >= 227)))) &&
      (!(int32_T)(p >= 3))) {
    inputT[(i0 + 227 * i1) + 51529 * p] = inputdata[(i1 + 227 * i0) + 51529 * p];
  }
}

static __global__ __launch_bounds__(512, 1) void e_DeepLearningNetwork_predict_k
  (real32_T *out, real32_T *outT)
{
  int32_T i0;
  ;
  ;
  i0 = (int32_T)(((((gridDim.x * gridDim.y * blockIdx.z + gridDim.x * blockIdx.y)
                    + blockIdx.x) * (blockDim.x * blockDim.y * blockDim.z) +
                   threadIdx.z * blockDim.x * blockDim.y) + threadIdx.y *
                  blockDim.x) + threadIdx.x);
  if (!(int32_T)(i0 >= 1000)) {
    outT[i0] = out[i0];
  }
}

void DeepLearningNetwork_predict(b_alexnet *obj, const real_T inputdata[154587],
  real32_T outT[1000])
{
  real32_T *gpu_inputT;
  real32_T *gpu_out;
  real_T *gpu_inputdata;
  real32_T *b_gpu_inputdata;
  real32_T *gpu_outT;
  cudaMalloc(&gpu_outT, 4000ULL);
  cudaMalloc(&gpu_out, 4000ULL);
  cudaMalloc(&gpu_inputT, 618348ULL);
  cudaMalloc(&b_gpu_inputdata, 618348ULL);
  cudaMalloc(&gpu_inputdata, 1236696ULL);
  cudaMemcpy((void *)gpu_inputdata, (void *)&inputdata[0], 1236696ULL,
             cudaMemcpyHostToDevice);
  c_DeepLearningNetwork_predict_k<<<dim3(302U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (gpu_inputdata, b_gpu_inputdata);
  d_DeepLearningNetwork_predict_k<<<dim3(302U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (b_gpu_inputdata, gpu_inputT);
  cudaMemcpy(obj->inputData, gpu_inputT, 154587ULL * sizeof(real32_T),
             cudaMemcpyDeviceToDevice);
  obj->predict();
  cudaMemcpy(gpu_out, obj->outputData, 1000ULL * sizeof(real32_T),
             cudaMemcpyDeviceToDevice);
  e_DeepLearningNetwork_predict_k<<<dim3(2U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (gpu_out, gpu_outT);
  cudaMemcpy((void *)&outT[0], (void *)gpu_outT, 4000ULL, cudaMemcpyDeviceToHost);
  cudaFree(gpu_inputdata);
  cudaFree(b_gpu_inputdata);
  cudaFree(gpu_inputT);
  cudaFree(gpu_out);
  cudaFree(gpu_outT);
}

void DeepLearningNetwork_setup(b_alexnet *obj)
{
  obj->setup();
  obj->batchSize = 1;
}

b_alexnet::b_alexnet()
{
  this->numLayers = 25;
  this->cublasHandle = 0;
  this->cudnnHandle = 0;
  this->workSpace = 0;
  this->layers[0] = new MWInputLayer;
  this->layers[1] = new MWConvLayer;
  this->layers[2] = new MWReLULayer;
  this->layers[3] = new MWNormLayer;
  this->layers[4] = new MWMaxPoolingLayer;
  this->layers[5] = new MWConvLayer;
  this->layers[6] = new MWReLULayer;
  this->layers[7] = new MWNormLayer;
  this->layers[8] = new MWMaxPoolingLayer;
  this->layers[9] = new MWConvLayer;
  this->layers[10] = new MWReLULayer;
  this->layers[11] = new MWConvLayer;
  this->layers[12] = new MWReLULayer;
  this->layers[13] = new MWConvLayer;
  this->layers[14] = new MWReLULayer;
  this->layers[15] = new MWMaxPoolingLayer;
  this->layers[16] = new MWFCLayer;
  this->layers[17] = new MWReLULayer;
  this->layers[18] = new MWPassthroughLayer;
  this->layers[19] = new MWFCLayer;
  this->layers[20] = new MWReLULayer;
  this->layers[21] = new MWPassthroughLayer;
  this->layers[22] = new MWFCLayer;
  this->layers[23] = new MWSoftmaxLayer;
  this->layers[24] = new MWOutputLayer;
}

b_alexnet::~b_alexnet()
{
  int32_T idx;
  this->cleanup();
  for (idx = 0; idx < 25; idx++) {
    delete this->layers[idx];
  }
}

void b_alexnet::cleanup()
{
  int32_T idx;
  for (idx = 0; idx < 25; idx++) {
    this->layers[idx]->cleanup();
  }

  if (this->workSpace) {
    cudaFree(this->workSpace);
  }

  if (this->cublasHandle) {
    cublasDestroy(*this->cublasHandle);
  }

  if (this->cudnnHandle) {
    cudnnDestroy(*this->cudnnHandle);
  }
}

void b_alexnet::predict()
{
  int32_T idx;
  for (idx = 0; idx < 25; idx++) {
    this->layers[idx]->predict();
  }
}

void b_alexnet::setup()
{
  int32_T idx_handles;
  int32_T idx_ws;
  this->cublasHandle = new cublasHandle_t;
  cublasCreate(this->cublasHandle);
  this->cudnnHandle = new cudnnHandle_t;
  cudnnCreate(this->cudnnHandle);
  for (idx_handles = 0; idx_handles < 25; idx_handles++) {
    this->layers[idx_handles]->setCublasHandle(this->cublasHandle);
    this->layers[idx_handles]->setCudnnHandle(this->cudnnHandle);
  }

  this->layers[0]->createInputLayer(1, 227, 227, 3, 1);
  this->layers[0]->loadAvg(
    "C:\\Sumpurn\\gpucoderdemo_alexnet_live\\codegen\\mex\\alexnet_predict\\cnn_alexnet_avg");
  this->layers[1]->createConvLayer(this->layers[0], 11, 11, 3, 96, 4, 4, 0, 0, 1);
  this->layers[1]->loadWeights(
    "C:\\Sumpurn\\gpucoderdemo_alexnet_live\\codegen\\mex\\alexnet_predict\\cnn_alexnet_conv1_w");
  this->layers[1]->loadBias(
    "C:\\Sumpurn\\gpucoderdemo_alexnet_live\\codegen\\mex\\alexnet_predict\\cnn_alexnet_conv1_b");
  this->layers[2]->createReLULayer(this->layers[1]);
  this->layers[3]->createNormLayer(this->layers[2], 5, 0.0001, 0.75, 1.0);
  this->layers[4]->createMaxPoolingLayer(this->layers[3], 3, 3, 2, 2, 0, 0);
  this->layers[5]->createConvLayer(this->layers[4], 5, 5, 48, 128, 1, 1, 2, 2, 2);
  this->layers[5]->loadWeights(
    "C:\\Sumpurn\\gpucoderdemo_alexnet_live\\codegen\\mex\\alexnet_predict\\cnn_alexnet_conv2_w");
  this->layers[5]->loadBias(
    "C:\\Sumpurn\\gpucoderdemo_alexnet_live\\codegen\\mex\\alexnet_predict\\cnn_alexnet_conv2_b");
  this->layers[6]->createReLULayer(this->layers[5]);
  this->layers[7]->createNormLayer(this->layers[6], 5, 0.0001, 0.75, 1.0);
  this->layers[8]->createMaxPoolingLayer(this->layers[7], 3, 3, 2, 2, 0, 0);
  this->layers[9]->createConvLayer(this->layers[8], 3, 3, 256, 384, 1, 1, 1, 1,
    1);
  this->layers[9]->loadWeights(
    "C:\\Sumpurn\\gpucoderdemo_alexnet_live\\codegen\\mex\\alexnet_predict\\cnn_alexnet_conv3_w");
  this->layers[9]->loadBias(
    "C:\\Sumpurn\\gpucoderdemo_alexnet_live\\codegen\\mex\\alexnet_predict\\cnn_alexnet_conv3_b");
  this->layers[10]->createReLULayer(this->layers[9]);
  this->layers[11]->createConvLayer(this->layers[10], 3, 3, 192, 192, 1, 1, 1, 1,
    2);
  this->layers[11]->loadWeights(
    "C:\\Sumpurn\\gpucoderdemo_alexnet_live\\codegen\\mex\\alexnet_predict\\cnn_alexnet_conv4_w");
  this->layers[11]->loadBias(
    "C:\\Sumpurn\\gpucoderdemo_alexnet_live\\codegen\\mex\\alexnet_predict\\cnn_alexnet_conv4_b");
  this->layers[12]->createReLULayer(this->layers[11]);
  this->layers[13]->createConvLayer(this->layers[12], 3, 3, 192, 128, 1, 1, 1, 1,
    2);
  this->layers[13]->loadWeights(
    "C:\\Sumpurn\\gpucoderdemo_alexnet_live\\codegen\\mex\\alexnet_predict\\cnn_alexnet_conv5_w");
  this->layers[13]->loadBias(
    "C:\\Sumpurn\\gpucoderdemo_alexnet_live\\codegen\\mex\\alexnet_predict\\cnn_alexnet_conv5_b");
  this->layers[14]->createReLULayer(this->layers[13]);
  this->layers[15]->createMaxPoolingLayer(this->layers[14], 3, 3, 2, 2, 0, 0);
  this->layers[16]->createFCLayer(this->layers[15], 9216, 4096);
  this->layers[16]->loadWeights(
    "C:\\Sumpurn\\gpucoderdemo_alexnet_live\\codegen\\mex\\alexnet_predict\\cnn_alexnet_fc6_w");
  this->layers[16]->loadBias(
    "C:\\Sumpurn\\gpucoderdemo_alexnet_live\\codegen\\mex\\alexnet_predict\\cnn_alexnet_fc6_b");
  this->layers[17]->createReLULayer(this->layers[16]);
  this->layers[18]->createPassthroughLayer(this->layers[17]);
  this->layers[19]->createFCLayer(this->layers[18], 4096, 4096);
  this->layers[19]->loadWeights(
    "C:\\Sumpurn\\gpucoderdemo_alexnet_live\\codegen\\mex\\alexnet_predict\\cnn_alexnet_fc7_w");
  this->layers[19]->loadBias(
    "C:\\Sumpurn\\gpucoderdemo_alexnet_live\\codegen\\mex\\alexnet_predict\\cnn_alexnet_fc7_b");
  this->layers[20]->createReLULayer(this->layers[19]);
  this->layers[21]->createPassthroughLayer(this->layers[20]);
  this->layers[22]->createFCLayer(this->layers[21], 4096, 1000);
  this->layers[22]->loadWeights(
    "C:\\Sumpurn\\gpucoderdemo_alexnet_live\\codegen\\mex\\alexnet_predict\\cnn_alexnet_fc8_w");
  this->layers[22]->loadBias(
    "C:\\Sumpurn\\gpucoderdemo_alexnet_live\\codegen\\mex\\alexnet_predict\\cnn_alexnet_fc8_b");
  this->layers[23]->createSoftmaxLayer(this->layers[22]);
  this->layers[24]->createOutputLayer(this->layers[23]);
  this->layers[24]->createWorkSpace((&this->workSpace));
  for (idx_ws = 0; idx_ws < 25; idx_ws++) {
    this->layers[idx_ws]->setWorkSpace(this->workSpace);
  }

  this->inputData = this->layers[0]->getData();
  this->outputData = this->layers[24]->getData();
}

/* End of code generation (DeepLearningNetwork.cu) */
