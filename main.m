pointCloud = inputPointCloud('Results/XYZ.csv');
cameraIntrinsic = inputCameraIntrinsic('Results/CameraIntrinsic.csv');
[poses, positions]= inputPoses('Results/Pose.csv');

[normVector, inliers, planeBasis, centroid] = ransac(pointCloud);


localToWorldMatrix = localToWorld(normVector, planeBasis, centroid);
worldToLocalMatrix = worldToLocal(normVector, planeBasis, centroid);

projected = project(pointCloud, poses(:,:,1), cameraIntrinsic);









% %# create x,y
% [xx,yy]=ndgrid(1:30,1:30);
% 
% %# calculate corresponding z
% z = (-normVector(1)*xx - normVector(2)*yy + dot(normVector,centroid))/normVector(3);
% 
% %# plot the surface
% figure
% hold on
% surf(xx,yy,z)
% %scatter3(pointCloud(:,1),pointCloud(:,2),pointCloud(:,3))
% scatter3(inliers(:,1),inliers(:,2),inliers(:,3), 'r')
% scatter3(centroid(1),centroid(2),centroid(3), 'g')
% hold off
% rotate3d on
