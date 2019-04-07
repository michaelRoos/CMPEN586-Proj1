function [worldToLocalMatrix] = worldToLocal(normVector, planeBasis, centroid)
%WORLDTOLOCAL Summary of this function goes here
%   Detailed explanation goes here
worldToLocalMatrix = inv(localToWorld(normVector, planeBasis, centroid));
end

