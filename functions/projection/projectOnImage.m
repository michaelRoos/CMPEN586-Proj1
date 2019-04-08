function [] = projectOnImage(pointCloud, cameraExternal, cameraIntrinsic, pointColor)
%PROJECTONIMAGE Top level function to take world coordinates and draw them
% the current figure

% Convert world coordinates to pixel coordinates
projected = project(pointCloud, cameraExternal, cameraIntrinsic);
% Hold the image to draw points ontop without loosing the old figure
hold on
% Plots all coordinates as the given color
scatter(projected(:,1), projected(:,2), pointColor);
% Release the hold on the figure
hold off
end

