function [projected] = cameraToPixel(points, internalMatrix)
%CAMERATOPIXEL Summary of this function goes here
%   Detailed explanation goes here
projected = zeros(length(points),2);
for i = 1:length(points)
    pixelPoint = internalMatrix * points(i,:)';
    x = pixelPoint(1) / pixelPoint(3);
    y = pixelPoint(2) / pixelPoint(3);
    projected(i,:) = [x y];     
end
end

