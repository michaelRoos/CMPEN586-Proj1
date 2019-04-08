function [projected] = worldToCamera(points, externalMatrix)
%WORLDTOCAMERA Summary of this function goes here
%   Detailed explanation goes here
projected = zeros(length(points),3);
for i = 1:length(points)
    worldPoint = horzcat(points(i,:),1)';
    cameraPoint = externalMatrix * worldPoint;
    projected(i,:) = cameraPoint(1:3);     
end

