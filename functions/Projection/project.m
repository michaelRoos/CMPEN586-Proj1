function [projected] = project(points, externalMatrix, internalMatrix)
%PROJECT\ Summary of this function goes here
%   Detailed explanation goes here
projected = zeros(length(points),2);
for i = 1:length(points)
    worldPoint = horzcat(points(i,:),1)';
    cameraPoint = externalMatrix * worldPoint;
    pixelPoint = internalMatrix * cameraPoint(1:3);
    x = pixelPoint(1) / pixelPoint(3);
    y = pixelPoint(2) / pixelPoint(3);
    projected(i,:) = [x y];     
end

