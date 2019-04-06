pointCloud = inputPointCloud('Results/XYZ.csv');
cameraIntrinsic = inputCameraIntrinsic('Results/CameraIntrinsic.csv');

plane = ransac(pointCloud);

%# create x,y
[xx,yy]=ndgrid(1:10,1:10);

%# calculate corresponding z
z = (-plane(1)*xx - plane(2)*yy - plane(4))/plane(3);

%# plot the surface
figure
hold on
surf(xx,yy,z)
scatter3(pointCloud(:,1),pointCloud(:,2),pointCloud(:,3))
hold off
rotate3d on


    # Create rotation matrix
    quat = Quat((qw,qx,qy,qz))
    rotMatrix = quat.transform()
    # Create translation matrix of the following form
    # | 0   -tz ty  |
    # | tz  0   -tx |
    # | -ty tx  0   |
    tranMatrix = np.array([
        [0,     -tz,    ty],
        [tz,    0,      -tx],
        [-ty,   tx,     0],
    ])
    essentialMatrix = np.matmul(rotMatrix,transMatrix)
