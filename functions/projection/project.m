function [pixelPoints] = project(points, externalMatrix, internalMatrix)
%PROJECT\ Summary of this function goes here
%   Detailed explanation goes here
cameraPoints = worldToCamera(points, externalMatrix);
pixelPoints = cameraToPixel(cameraPoints, internalMatrix);
end

