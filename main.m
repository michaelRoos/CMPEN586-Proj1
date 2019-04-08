pointCloud = inputPointCloud('Results/XYZ.csv');
cameraIntrinsic = inputCameraIntrinsic('Results/CameraIntrinsic.csv');
[cameraExternal]= inputPoses('Results/Pose.csv');
imgNames = inputNames('Results/Names.txt');

[normVector, inliers, planeBasis, centroid] = ransac(pointCloud);


localToWorldMatrix = localToWorld(normVector, planeBasis, centroid);
worldToLocalMatrix = worldToLocal(normVector, planeBasis, centroid);


 
[boxLocal, boxWorld] = generateVirtualBox(localToWorldMatrix);


i = 5;
name = char(imgNames(i));
imgPath = strcat('Source Images/',name);
imshow(imgPath);
% projectOnImage(pointCloud, cameraExternal(:,:,i), cameraIntrinsic, 'b');
drawCube(boxWorld, cameraExternal(:,:,i), cameraIntrinsic);

% projectOnImage(boxWorld, cameraExternal(:,:,i), cameraIntrinsic,'b');
% projectOnImage([0 0 0;0 0 0; 0 0 0], cameraExternal(:,:,i), cameraIntrinsic,'r');

% %# plot the surface
% figure
% hold on
% scatter3(pointCloud(:,1),pointCloud(:,2),pointCloud(:,3),'b')
% scatter3(boxWorld(:,1),boxWorld(:,2),boxWorld(:,3),'r')
% hold off
% rotate3d on


% %# create x,y
% [xx,yy]=ndgrid(-10:10,-10:10);
% 
% %# calculate corresponding z
% z = (-normVector(1)*xx - normVector(2)*yy + dot(normVector,centroid))/normVector(3);
% 
% %# plot the surface
% figure
% hold on
% surf(xx,yy,z)
% scatter3(pointCloud(:,1),pointCloud(:,2),pointCloud(:,3),'b')
% scatter3(inliers(:,1),inliers(:,2),inliers(:,3), 'r')
% % scatter3(centroid(1),centroid(2),centroid(3), 'g')
% hold off
% rotate3d on
