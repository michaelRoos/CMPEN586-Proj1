function [poseMatrices, positions] = inputPoses(path)
%INPUTPOSES Summary of this function goes here
%   Detailed explanation goes here
posesInput = csvread(path);
posesInput = reshape(posesInput,[],7);
[numPictures,~] = size(posesInput);
poseMatrices = zeros(3,3,numPictures);
positions = zeros(3, numPictures);
for i = 1:numPictures
   inputLine = posesInput(i,:);
   rotationQuaternion = inputLine(1:4); 
   translation = inputLine(5:7);
   tx = translation(1); ty = translation(2); tz = translation(3);
   rotationMatrix = quat2rotm(rotationQuaternion);
   translationMatrix = [0 -tz ty;tz 0 -tx;-ty tx 0];

   poseMatrices(:,:,i) = rotationMatrix * translationMatrix;
   positions(:,i) = [tx ty tz];
    
end
end

