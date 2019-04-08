function [boxLocal,boxWorld] = generateVirtualBox(localToWorldMatrix)
%GENERATEVIRTUALBOX Summary of this function goes here
%   Detailed explanation goes here

% 
% x = -1:.05:1;
% y = -1:.05:1;
% z = -1:.05:0;
% [X,Y,Z] = meshgrid(x,y,z);
% 
% X = reshape(X,[],1);
% Y = reshape(Y,[],1);
% Z = reshape(Z,[],1);
% 
% boxLocal = horzcat(X,Y,Z);

boxLocal = [-1 -1 0; -1 1 0; 1 1 0; 1 -1 0; -1 -1 1; -1 1 1; 1 1 1; 1 -1 1;]; 

boxWorld = zeros(size(boxLocal));
for i = 1:length(boxLocal)
   localPoint = horzcat(boxLocal(i,:),1)';
   worldPoint = localToWorldMatrix * localPoint;
   wx = worldPoint(1) / worldPoint(4);
   wy = worldPoint(2) / worldPoint(4);
   wz = worldPoint(3) / worldPoint(4);
   boxWorld(i,:) = [wx,wy, wz];
end
end

