% Input data from Colmap. Uses python preprocessing script, and Matlab
% input functions
pointCloud = inputPointCloud('Colmap/parsed/XYZ.csv');
cameraIntrinsic = inputCameraIntrinsic('Colmap/parsed/CameraIntrinsic.csv');
[cameraExternal]= inputPoses('Colmap/parsed/Pose.csv');
imgNames = inputNames('Colmap/parsed/Names.txt');

% Run a ransac algorithm on the points to identify the dominiant plane
%   *In World Coordinates*
[normVector, inliers, planeBasis, centroid] = ransac(pointCloud);

% Creates a mapping between world coordinates and a reference frame
% centered around the plane.
localToWorldMatrix = localToWorld(normVector, planeBasis, centroid);


% Generates a 2x2x1 box placed on the plance centered around the centroid.
%   *In World Coordinates*
[boxLocal, boxWorld] = generateVirtualBox(localToWorldMatrix);

% Loop through each image and project the box
for i = 1:length(imgNames)
    % Get name of ith image
    name = char(imgNames(i));
    imgPath = strcat('Source Images/',name);
    % Show Image in figure
    imshow(imgPath);
    % Draw 3d box on top of image
    drawCube(boxWorld, cameraExternal(:,:,i), cameraIntrinsic);
end



