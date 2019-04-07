function [] = projectOnImage(pointCloud, cameraExternal, cameraIntrinsic)
%PROJECTONIMAGE Summary of this function goes here
%   Detailed explanation goes here
projected = project(pointCloud, cameraExternal, cameraIntrinsic);
scatter(projected(:,1), projected(:,2))
end

