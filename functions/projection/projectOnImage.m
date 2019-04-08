function [] = projectOnImage(pointCloud, cameraExternal, cameraIntrinsic, pointColor)
%PROJECTONIMAGE Summary of this function goes here
%   Detailed explanation goes here
projected = project(pointCloud, cameraExternal, cameraIntrinsic);
hold on
scatter(projected(:,1), projected(:,2), pointColor);
hold off
end

