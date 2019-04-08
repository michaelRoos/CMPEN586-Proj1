function [poseMatrices] = inputPoses(path)
%INPUTPOSES Reads in pose data, calculates translation and rotation
%componants, and combines into essential matrix for each image

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

