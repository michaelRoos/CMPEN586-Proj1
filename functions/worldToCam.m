% Function that takes world cordinates, and converts them to camera
% coordinates
function [cameraCoords,R,T] = worldToCam(x3,y3,z3, Rmat, Pmat, position)
    R = vertcat( horzcat(Rmat, [0; 0; 0]), [0 0 0 1] );
    T = vertcat( horzcat( eye(3), position') , [0 0 0 1] );
    uvw1 = [x3; y3; z3; 1];
    cameraCoords = Pmat * uvw1; %x y z 1 matrix
end
