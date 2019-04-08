function [] = drawCube(corners, externalMatrix, internalMatrix)
%DRAWCUBE Takes given corners in world coordinates and draws 3d projected
% cube.

% Mapping of which corners lie on corresponing sides
faces = [1 2 3 4; 1 2 5 6; 1 4 5 8; 2 3 6 7; 5 6 7 8; 3 4 7 8; ];
% Convert world coordinate corners into camera coordinates
corners = worldToCamera(corners, externalMatrix);
% Identify the center of the corner
cubeCentroid = mean(corners);

% Loop through each face to draw
for i = 1:6
    face = faces(i,:);
    faceCorners = corners(face,:);
    faceCentroid = mean(faceCorners);
    % Identify the norm vector leaving the face
    faceNorm = faceCentroid - cubeCentroid;
    % If the dot product of face norm and viewing vector is negative, then
    % the face is visible to the camera, and is drawn
    if dot(faceNorm, faceCentroid) < 0
        % Draw face on top of figure
        drawCubeSide(faceCorners, internalMatrix, i); 
    end   
end
end

