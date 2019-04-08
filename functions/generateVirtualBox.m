function [boxLocal,boxWorld] = generateVirtualBox(localToWorldMatrix)
%GENERATEVIRTUALBOX Generates corners of 2x2x1 virtual box and converts to
% world coordinates.

% Local coordinates of box corners.
boxLocal = [-1 -1 0; -1 1 0; 1 1 0; 1 -1 0; -1 -1 1; -1 1 1; 1 1 1; 1 -1 1;]; 
% Matrix to hold result
boxWorld = zeros(size(boxLocal));
for i = 1:length(boxLocal)
   % Convert point into homogenous vector
   localPoint = horzcat(boxLocal(i,:),1)';
   % Transform into world coordinates
   worldPoint = localToWorldMatrix * localPoint;
   % Convert out of homogenous vector and save
   boxWorld(i,:) = worldPoint(1:3) / worldPoint(4);
end
end

