function [cameraIntrinsic] = inputCameraIntrinsic(path)
%INPUTCAMERAINTRINSIC Summary of this function goes here
%   Detailed explanation goes here
cameraIntrinsic = csvread(path);
cameraIntrinsic = reshape(cameraIntrinsic,3,3);
end

