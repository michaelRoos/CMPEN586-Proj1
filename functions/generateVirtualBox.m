function [boxLocal,boxWorld] = generateVirtualBox(localToWorldMatrix)
%GENERATEVIRTUALBOX Summary of this function goes here
%   Detailed explanation goes here
boxLocal = [-1 -1 0; -1 1 0; 1 1 0; 1 -1 0; -1 -1 1; -1 1 1; 1 1 1; 1 -1 1;]; 
boxWorld = zeros(size(boxLocal));
for i = 1:8
   worldPoint = localToWorldMatrix * vertcat(boxLocal(i,:)',1);
   wx = worldPoint(1) / worldPoint(4);
   wy = worldPoint(2) / worldPoint(4);
   wz = worldPoint(3) / worldPoint(4);
   boxWorld(i,:) = [wx,wy, wz];
end
end

