%% Generate CUDA code and MEX function
% Setup the input for code generation and create a configuration for GPU code
% generation.
% inputImage = imread('peppers.png');
args = "{ones(227,227,3)}";

%% Run Code Generation

rr= RoboNouMiChiClass(1,2);
genCodeOnlyValue = true;
rr.genCode('lib','alexnet_predict','embed','normal',genCodeOnlyValue, args);

