function [] = drawCubeSide(corners, internalMatrix, color)
%DRAWCUBESIDE Summary of this function goes here
%   Detailed explanation goes here
corners = cameraToPixel(corners, internalMatrix);
k = convhull(corners);
hold on
fill(corners(k,1), corners(k,2), color);
hold off
end

