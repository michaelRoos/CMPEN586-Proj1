function [projected] = cameraToPixel(points, internalMatrix)
%CAMERATOPIXEL Projects camera point to a pixel point

% Matrix to hold result
projected = zeros(length(points),2);
for i = 1:length(points)
    % Use internalMatrix to project to pixels
    pixelPoint = internalMatrix * points(i,:)';
    % Homogenize and save pixel coordinate values
    x = pixelPoint(1) / pixelPoint(3);
    y = pixelPoint(2) / pixelPoint(3);
    projected(i,:) = [x y];     
end
end

