function [] = drawCube(corners, externalMatrix, internalMatrix)
%DRAWCUBE Summary of this function goes here
%   Detailed explanation goes here
faces = [1 2 3 4; 1 2 5 6; 1 4 5 8; 2 3 6 7; 5 6 7 8; 3 4 7 8; ];
corners = worldToCamera(corners, externalMatrix);
cubeCentroid = mean(corners);


for i = 1:6
    face = faces(i,:);
    faceCorners = corners(face,:);
    faceCentroid = mean(faceCorners);
    faceNorm = faceCentroid - cubeCentroid;
    if dot(faceNorm, faceCentroid) < 0
       drawCubeSide(faceCorners, internalMatrix, i); 
    end
    
   
end
end

