function [pixelPoints] = project(points, externalMatrix, internalMatrix)
%PROJECT Top level function to convert world coords to pixel coords

% Convert world coordinates to camera coordinates
cameraPoints = worldToCamera(points, externalMatrix);
% Project camera coordinates to pixel coordinates
pixelPoints = cameraToPixel(cameraPoints, internalMatrix);
end

