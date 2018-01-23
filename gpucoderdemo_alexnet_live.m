%% Code Generation for Deep Learning Networks
% 
% This example demonstrates code generation for an image classification application 
% that uses deep learning. It uses the |codegen| command to generate a MEX 
% function that runs prediction on a SeriesNetwork object
% for AlexNet, a popular deep learning network for image classification.
%
%   Copyright 2017 The MathWorks, Inc.
%% Prerequisites
% * CUDA-enabled NVIDIA(R) GPU with compute capability 3.0 or higher.
% * CUDA toolkit 8.0 and driver.
% * NVIDIA cuDNN 5.0 library.
% * Environment variables for the compilers and libraries. For more 
% information see 
% <matlab:web(fullfile(docroot,'gpucoder/gs/setting-up-the-toolchain.html'))
% Environment Variables>.
% * Neural Network Toolbox(TM) to use a SeriesNetwork object.
% * Image Processing Toolbox(TM) for reading and displaying images.
%% Setup NVCC Path
% Write your own |setup_nvcc| function to set up the environment variables 
% for the NVIDIA compilers (nvcc) and libraries on your system. You can use
% the MATLAB(R) <matlab:doc('setenv') setenv> function to set the 
% environment variables. If you have already set these variables, delete 
% this line of code before proceeding.
setup_nvcc;
%% Create a New Folder and Copy Relevant Files
% 
% The following code will create a folder in your current
% working folder (pwd). The new folder will contain only the files
% that are relevant for this example. If you do not want to affect the
% current folder (or if you cannot generate files in this folder),
% change your working folder.
%
%%
% 
gpucoderdemo_setup('gpucoderdemo_alexnet_live');
%% About the 'alexnet_predict' Function
% 
% The <matlab:edit(fullfile(matlabroot,'toolbox','gpucoder','gpucoderdemos','gpucoderdemo_alexnet_live','alexnet_predict.m')) alexnet_predict.m>
% function takes an image input and runs prediction on the image using the
% deep learning network saved in alexnet.mat file.
% The function loads the network object from alexnet.mat into a persistent
% variable _mynet_ . On subsequent calls to the function, the persistent object is reused for
% prediction.  
%
type('alexnet_predict.m')

%% Get the Pre-trained SeriesNetwork
%
% Download AlexNet network and save to alexnet.mat if it does not already exist.
getAlexnet();
%%
%
% The saved network contains 25 layers including convolution, fully connected and the
% classification output layers.
load('alexnet.mat');
disp(nnet.Layers);
%% Run MEX Code-generation for 'alexnet_predict' Function 
%
% Generate CUDA code from design file 
% <matlab:edit(fullfile(matlabroot,'toolbox','gpucoder','gpucoderdemos','gpucoderdemo_alexnet_live','alexnet_predict.m')) alexnet_predict.m>
%
% Create a GPU Configuration object for MEX target setting target language to C++. 
% Run the |codegen| command specifying an input of size
% [227,227,3]. This corresponds to the input layer size of AlexNet network.
cfg = coder.gpuConfig('mex');
cfg.TargetLang = 'C++';
codegen -config cfg alexnet_predict -args {ones(227,227,3)} -report
%%
% A warning is thrown regarding non-coalesced access to inpudata variable.
% This is because |codegen| command generates column major code. This needs
% to be transposed to row-major format to call the underlying cuDNN
% library. To avoid this transpose, use the 
% <matlab:doc('cnncodegen') cnncodegen command>
% for standalone code generation. This generates row-major code without any
% transposes.
%% Generated Code Description
%
% The Series Network is generated as a C++ class containing an array of 25 layer
% classes.
%
%   class b_alexnet
%   {
%      public:
%        int32_T batchSize;
%        int32_T numLayers;
%        real32_T *inputData;
%        real32_T *outputData;
%        MWCNNLayer *layers[25];
%      private:
%        cublasHandle_t cublasHandle;
%        cudnnHandle_t cudnnHandle;
%        uint32_T workSpaceSize;
%        real32_T *workSpace;
%      public:
%        b_alexnet();
%        void setup();
%        void predict();
%        void cleanup();
%        ~b_alexnet();
%   };
%
% The setup() method of the class sets up handles and allocates memory for
% each layer of the network object.
% The predict() method invokes prediction for each of the 25 layers in the network.
%% 
%
% The entry-point function alexnet_predict() in the generated code file
% alexnet_predict.cu constructs a static object of _b_alexnet_ class type and 
% invokes setup and predict on this network object.  
%% 
%
%   static b_alexnet mynet;
%   static boolean_T mynet_not_empty;
%   /* Function Definitions */
%   void alexnet_predict(alexnet_predictStackData *SD, const real_T in[154587],
%                     real32_T out[1000])
%   {
%      if (!mynet_not_empty) {
%        DeepLearningNetwork_setup(&mynet);
%        mynet_not_empty = true;
%      }
%
%      DeepLearningNetwork_predict(SD, &mynet, in, out);
%   }
%% Binary Files for Network Parameters
%
% Binary files are exported for layers with parameters such as 
% fully connected and convolution layers in the network. For instance,
% files cnn_alexnet_conv*_w and cnn_alexnet_conv*_b correspond to weights and 
% bias parameters for the convolution layers in the network. 
%%
%
dir(fullfile(pwd, 'codegen', 'mex', 'alexnet_predict'))
%% Run Generated MEX 
%
% Load an input image.
im = imread('peppers.png');
imshow(im);
%% 
% Call AlexNet predict on the input image.
im = imresize(im, [227,227]);
predict_scores = alexnet_predict_mex(double(im));
%% 
% Map top 5 prediction scores to words in the synset dictionary.
fid = fopen('synsetWords.txt');
synsetOut = textscan(fid,'%s', 'delimiter', '\n');
synsetOut = synsetOut{1};
fclose(fid);

[val,indx] = sort(predict_scores, 'descend');
scores = val(1:5)*100;
labels = synsetOut(indx(1:5)); 
%%
% Display top 5 classification labels.
imshow('peppers_out.png');
%% Classification on a Video
%
% The included demo file 
% <matlab:edit(fullfile(matlabroot,'toolbox','gpucoder','gpucoderdemos','gpucoderdemo_alexnet_live','alexnet_live.m')) alexnet_live.m>
% grabs frames from a webcam, invokes prediction and displays the classification results on each of the captured video frames.
% Note: This demo uses webcam function which is supported through a
% MATLAB Support Package for USB Webcams(TM).
% You can download and install the support package through the
% <matlab:supportPackageInstaller Support Package Installer>.
%%
% 
%    camera = webcam; 
%    while true
%       % Take a picture
%       ipicture = camera.snapshot;       
%    
%       % Resize and cast the picture to single        
%       picture = imresize(ipicture,[227,227]);  
%    
%       % Call MEX function for AlexNet prediction
%       tic;    
%       pout = alexnet_predict(single(picture));
%       newt = toc;
%       
%       % fps 
%       fps = .9*fps + .1*(1/newt);
%    
%       % top 5 scores
%       [top5labels, scores] = getTopFive(pout, synsetOut);
%    
%       % display
%       dispResults(ax, imfull, picture, top5labels, scores, fps);   
%    end
%% Run Command: Cleanup
%
% Clear mex to clear the static network object loaded in memory. 
%% 
%
clear mex;
cleanup

displayEndOfDemoMessage(mfilename)
