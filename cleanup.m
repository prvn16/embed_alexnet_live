if isempty(currentFigures), currentFigures = []; end;
close(setdiff(findall(0, 'type', 'figure'), currentFigures))
clear mex
delete *.mexw64
[~,~,~] = rmdir('C:\Sumpurn\gpucoderdemo_alexnet_live\codegen','s');
clear C:\Sumpurn\gpucoderdemo_alexnet_live\alexnet_live.m
delete C:\Sumpurn\gpucoderdemo_alexnet_live\alexnet_live.m
clear C:\Sumpurn\gpucoderdemo_alexnet_live\alexnet_predict.m
delete C:\Sumpurn\gpucoderdemo_alexnet_live\alexnet_predict.m
clear C:\Sumpurn\gpucoderdemo_alexnet_live\getAlexnet.m
delete C:\Sumpurn\gpucoderdemo_alexnet_live\getAlexnet.m
delete C:\Sumpurn\gpucoderdemo_alexnet_live\peppers.png
delete C:\Sumpurn\gpucoderdemo_alexnet_live\peppers_out.png
delete C:\Sumpurn\gpucoderdemo_alexnet_live\synsetWords.txt
clear
load old_workspace
delete old_workspace.mat
delete C:\Sumpurn\gpucoderdemo_alexnet_live\cleanup.m
cd C:\Sumpurn
rmdir('C:\Sumpurn\gpucoderdemo_alexnet_live','s');
