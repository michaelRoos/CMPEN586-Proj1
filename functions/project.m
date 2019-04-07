function [projected] = project(points, externalMatrix, internalMatrix)
%PROJECT\ Summary of this function goes here
%   Detailed explanation goes here
projected = zeros(length(points),2);
for i = 1:length(points)
    point = points(i,:);
    nonhomogenousPoint = internalMatrix * externalMatrix * point';
    x = nonhomogenousPoint(1) / nonhomogenousPoint(3);
    y = nonhomogenousPoint(2) / nonhomogenousPoint(3);
    projected(i,:) = [x y];  
end

