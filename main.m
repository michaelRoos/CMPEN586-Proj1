pointCloud = inputPointCloud('Results/XYZ.csv');
cameraIntrinsic = inputCameraIntrinsic('Results/CameraIntrinsic.csv');
poses = inputPoses('Results/Pose.csv');

plane = ransac(pointCloud);

