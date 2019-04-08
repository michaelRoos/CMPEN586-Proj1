function [] = drawCubeSide(corners, internalMatrix, color)
%DRAWCUBESIDE Takes corners in camera coordinates, and draws the side as a
%filled quadrilateral over the figure.

% Convert camera coordinates to pixel coordinates
corners = cameraToPixel(corners, internalMatrix);
% Idenfity which order is sequential around the shape, necessary for fill
k = convhull(corners);
% Hold the figure, and then draw a filled quadrilatoral
hold on
fill(corners(k,1), corners(k,2), color);
hold off
end

