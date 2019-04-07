function [poseMatrices] = inputPoses(path)
%INPUTPOSES Summary of this function goes here
%   Detailed explanation goes here
posesInput = csvread(path);
posesInput = reshape(posesInput,[],7);
[numPictures,~] = size(posesInput);
poseMatrices = zeros(4,4,numPictures);
for i = 1:numPictures
   inputLine = posesInput(i,:);
   rotationQuaternion = inputLine(1:4); 
   translation = inputLine(5:7);
   tx = translation(1); ty = translation(2); tz = translation(3);
   rotationMatrix = quat2rotm(rotationQuaternion);
   poseMatrices(:,:,i) = vertcat(horzcat(rotationMatrix, [tx ty tz]'),[0 0 0 1]);   
    
end
end

