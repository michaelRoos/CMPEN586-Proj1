function [cameraIntrinsic] = inputCameraIntrinsic(path)
%inputCameraIntrinsic Read in camera intrinsic data and format as a 3x3
%matrix

cameraIntrinsic = csvread(path);
cameraIntrinsic = reshape(cameraIntrinsic,3,3);
end

