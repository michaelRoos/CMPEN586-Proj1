function [projected] = worldToCamera(points, externalMatrix)
%WORLDTOCAMERA Transform world coordinates to camera coordinates using
%essential matrix

% Matrix to hold results
projected = zeros(length(points),3);
for i = 1:length(points)
    % Concatonate a 1 to make this a homogenous vector
    worldPoint = horzcat(points(i,:),1)';
    % multiply by essential matrix to transform
    cameraPoint = externalMatrix * worldPoint;
    % Save non-homogenous component
    projected(i,:) = cameraPoint(1:3);     
end

