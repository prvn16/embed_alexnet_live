@echo off
set MATLAB=C:\PROGRA~1\MATLAB\R2017b
set MATLAB_ARCH=win64
set MATLAB_BIN="C:\Program Files\MATLAB\R2017b\bin"
set ENTRYPOINT=mexFunction
set OUTDIR=.\
set LIB_NAME=alexnet_predict_mex
set MEX_NAME=alexnet_predict_mex
set MEX_EXT=.mexw64
call setEnv.bat
echo # Make settings for alexnet_predict > alexnet_predict_mex.mki
echo COMPILER=%COMPILER%>> alexnet_predict_mex.mki
echo COMPFLAGS=%COMPFLAGS%>> alexnet_predict_mex.mki
echo OPTIMFLAGS=%OPTIMFLAGS%>> alexnet_predict_mex.mki
echo DEBUGFLAGS=%DEBUGFLAGS%>> alexnet_predict_mex.mki
echo LINKER=%LINKER%>> alexnet_predict_mex.mki
echo LINKFLAGS=%LINKFLAGS%>> alexnet_predict_mex.mki
echo LINKOPTIMFLAGS=%LINKOPTIMFLAGS%>> alexnet_predict_mex.mki
echo LINKDEBUGFLAGS=%LINKDEBUGFLAGS%>> alexnet_predict_mex.mki
echo MATLAB_ARCH=%MATLAB_ARCH%>> alexnet_predict_mex.mki
echo BORLAND=%BORLAND%>> alexnet_predict_mex.mki
echo NVCC=nvcc >> alexnet_predict_mex.mki
echo CUDA_FLAGS= -c -rdc=true -Xcompiler "/wd 4819" -Xcudafe "--diag_suppress=unsigned_compare_with_zero --diag_suppress=useless_type_qualifier_on_return_type" -D_GNU_SOURCE -DMATLAB_MEX_FILE >> alexnet_predict_mex.mki
echo LD=nvcc >> alexnet_predict_mex.mki
echo MAPLIBS=libemlrt.lib,libcovrt.lib,libut.lib,libmwmathutil.lib,/export:mexFunction,/export:emlrtMexFcnProperties >> alexnet_predict_mex.mki
echo OMPFLAGS= >> alexnet_predict_mex.mki
echo OMPLINKFLAGS= >> alexnet_predict_mex.mki
echo EMC_COMPILER=msvcpp140>> alexnet_predict_mex.mki
echo EMC_CONFIG=optim>> alexnet_predict_mex.mki
"C:\Program Files\MATLAB\R2017b\bin\win64\gmake" -B -f alexnet_predict_mex.mk
