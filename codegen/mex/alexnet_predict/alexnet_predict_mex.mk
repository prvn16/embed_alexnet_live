START_DIR = C:\Sumpurn\GP5CF1~1

MATLAB_ROOT = C:\PROGRA~1\MATLAB\R2017b
MAKEFILE = alexnet_predict_mex.mk

include alexnet_predict_mex.mki


SRC_FILES =  \
	alexnet_predict_data.cu \
	alexnet_predict_initialize.cu \
	alexnet_predict_terminate.cu \
	alexnet_predict.cu \
	DeepLearningNetwork.cu \
	_coder_alexnet_predict_info.cu \
	_coder_alexnet_predict_api.cu \
	_coder_alexnet_predict_mex.cu \
	cnn_api.cu \
	cpp_mexapi_version.cpp

MEX_FILE_NAME_WO_EXT = alexnet_predict_mex
MEX_FILE_NAME = $(MEX_FILE_NAME_WO_EXT).mexw64
TARGET = $(MEX_FILE_NAME)

_LIBS = "C:\Users\Krishna Bhatia\Downloads\cudnn-8.0-windows10-x64-v5.1\cuda\lib\x64\cudnn.lib" 
SYS_LIBS = $(_LIBS) 


#
#====================================================================
# gmake makefile fragment for building MEX functions using MSVC
# Copyright 2007-2016 The MathWorks, Inc.
#====================================================================
#
SHELL = cmd
OBJEXT = obj
CC = $(COMPILER)
#LD = $(LINKER)
.SUFFIXES: .$(OBJEXT) .cu

OBJLISTC = $(SRC_FILES:.c=.$(OBJEXT))
OBJLISTCPP  = $(OBJLISTC:.cpp=.$(OBJEXT))
OBJLIST  = $(OBJLISTCPP:.cu=.$(OBJEXT))

TARGETMT = $(TARGET).manifest
MEX = $(TARGETMT)
STRICTFP = /fp:strict

target: $(MEX)

MATLAB_INCLUDES = -I "$(MATLAB_ROOT)\simulink\include"
MATLAB_INCLUDES+= -I "$(MATLAB_ROOT)\toolbox\shared\simtargets"
SYS_INCLUDE = $(MATLAB_INCLUDES)

# Additional includes

SYS_INCLUDE += -I "$(START_DIR)\codegen\mex\alexnet_predict"
SYS_INCLUDE += -I "$(START_DIR)"
SYS_INCLUDE += -I ".\interface"
SYS_INCLUDE += -I "$(MATLAB_ROOT)\extern\include"
SYS_INCLUDE += -I "C:\Users\KRISHN~1\DOWNLO~1\CUDNN-~1.1\cuda\include"
SYS_INCLUDE += -I "."

CUDA_LIBS = -L"$(CUDA_PATH)\lib\x64" cuda.lib cudart.lib cublas.lib cusolver.lib cufft.lib
SYS_LIBS += $(CUDA_LIBS) $(CLIBS)

COMMA=,
DIRECTIVES = $(MEX_FILE_NAME_WO_EXT)_mex.arf
COMP_FLAGS = $(COMPFLAGS) $(OMPFLAGS)
LINK_FLAGS = $(filter-out /export:mexFunction, $(LINKFLAGS))
LINK_FLAGSX = $(patsubst /LIBPATH:%,-L%, $(LINKFLAGS))
LINK_FLAGS = $(patsubst /%,-Xlinker /%, $(LINK_FLAGSX))
LINK_FLAGS += -Xnvlink -w  -Wno-deprecated-gpu-targets
LINK_FLAGS += -Xlinker /NODEFAULTLIB:libcmt.lib

ifeq ($(EMC_CONFIG),optim)
  COMP_FLAGS += $(OPTIMFLAGS) $(STRICTFP)
  LINK_FLAGS += $(LINKOPTIMFLAGS)
else
  COMP_FLAGS += $(DEBUGFLAGS)
  LINK_FLAGS += $(LINKDEBUGFLAGS)
endif
LINK_FLAGS += $(OMPLINKFLAGS)
LINK_FLAGS += -o $(TARGET)
LINK_FLAGS += 

CFLAGS = $(COMP_FLAGS)   $(USER_INCLUDE) $(SYS_INCLUDE)
CPPFLAGS = $(COMP_FLAGS)   $(USER_INCLUDE) $(SYS_INCLUDE)
NVCCFLAGS =  $(CUDA_FLAGS)   -arch sm_35 $(USER_INCLUDE) $(SYS_INCLUDE)

%.$(OBJEXT) : %.c
	$(CC) $(CFLAGS) "$<"

%.$(OBJEXT) : %.cpp
	$(CC) $(CPPFLAGS) "$<"

# Additional sources

%.$(OBJEXT) : /%.cu
	$(NVCC) $(NVCCFLAGS) "$<"
%.$(OBJEXT) : $(START_DIR)/%.cu
	$(NVCC) $(NVCCFLAGS) "$<"
%.$(OBJEXT) : $(START_DIR)\codegen\mex\alexnet_predict/%.cu
	$(NVCC) $(NVCCFLAGS) "$<"
%.$(OBJEXT) : interface/%.cu
	$(NVCC) $(NVCCFLAGS) "$<"


%.$(OBJEXT) : /%.c
	$(NVCC) $(NVCCFLAGS) "$<"
%.$(OBJEXT) : $(START_DIR)/%.c
	$(NVCC) $(NVCCFLAGS) "$<"
%.$(OBJEXT) : $(START_DIR)\codegen\mex\alexnet_predict/%.c
	$(NVCC) $(NVCCFLAGS) "$<"
%.$(OBJEXT) : interface/%.c
	$(NVCC) $(NVCCFLAGS) "$<"


%.$(OBJEXT) : /%.cpp
	$(CC) $(CPPFLAGS) "$<"
%.$(OBJEXT) : $(START_DIR)/%.cpp
	$(CC) $(CPPFLAGS) "$<"
%.$(OBJEXT) : $(START_DIR)\codegen\mex\alexnet_predict/%.cpp
	$(CC) $(CPPFLAGS) "$<"
%.$(OBJEXT) : interface/%.cpp
	$(CC) $(CPPFLAGS) "$<"



$(TARGET): $(OBJLIST) $(MAKEFILE)
	$(LD) $(LINK_FLAGS) $(OBJLIST) $(USER_LIBS) $(SYS_LIBS) -Xlinker $(MAPLIBS)
	@cmd /C "echo Build completed using compiler $(EMC_COMPILER)"

$(TARGETMT): $(TARGET)
	mt -outputresource:"$(TARGET);2" -manifest "$(TARGET).manifest"

#====================================================================
