function [table1, table2, errors] = projectionAndTriangulation(mocapJoints,vue2, vue4, v1, v2)
%Overarching code to calculate 2D from 3D coords and back


mocapSize = size(mocapJoints, 1);
cam1 = zeros(mocapSize, 12, 3); % mocap by 12 by 2 matrix where first dim is each frame, second dim is each joint, 3rd dim is x or y coord
cam2 = zeros(mocapSize, 12, 3);
recoveredMocap = zeros(mocapSize, 12, 3);
min_frame = 29;
max_frame = 5232;
disp('Iterating Over All Points');
for i = 1:size(mocapJoints, 1)
    x = mocapJoints(i,:,1); %array of 12 X coordinates
    y = mocapJoints(i,:,2); % Y coordinates
    z = mocapJoints(i,:,3); % Z coordinates
    conf = mocapJoints(i,:,4); %confidence values

    res1 = zeros(12, 3); % 12 by 3 matrix where each column is x, y, confidence
    res2 = zeros(12, 3); % 12 by 3 matrix where each column is x, y, confidence
    recovered = zeros(size(x,2), 3);
    for j = 1:size(x, 2)
        % Convert world to camera cordinates
        [cam2coords, R2, T2] = worldToCam(x(j), y(j), z(j), vue2);
        [cam4coords, R4, T4] = worldToCam(x(j), y(j), z(j), vue4);
        confidence = conf(j);
        % Project camera to pixel values
        [x1, y1, pixelVec1] = cameraToPixel(cam2coords, vue2);
        [x2, y2, pixelVec2] = cameraToPixel(cam4coords, vue4);
        % Save the pixel values
        res1(j, :) = [x1 y1, confidence];
        res2(j, :) = [x2 y2, confidence];
        % Call triangulation function
        [xx, yy, zz, p1, p2, W, T, sol] = recoverPoints([x1, y1], [x2, y2], vue2, vue4);
        recovered(j, :) = [xx, yy, zz];
%         Display Intermediary Results
        if (i == max_frame || i == min_frame) && j == 1
            if i == max_frame
                disp('Encountered Worst Frame');
            else
                disp('Encountered Best Frame')
            end
            disp(['Examining point with coords (' num2str(x(j)) ',' num2str(y(j)) ',' num2str(z(j)) ')']);
            disp('Calculating Camera 1 coords');
            disp('  Calculated R matrix');
            disp(R2);
            disp('  Calculated T matrix');
            disp(T2);
            disp(['  Converted point to camera 1 coords (' num2str(cam2coords(1)) ',' num2str(cam2coords(2)) ',' num2str(cam2coords(3)) ')']);
            disp('Calculating Camera 1 pixel coords');
            disp(['  Computed Pixel Vector (' num2str(pixelVec1(1)) ',' num2str(pixelVec1(2)) ',' num2str(pixelVec1(3)) ')'])
            disp(['  Converted point to pixel coords (' num2str(x1) ',' num2str(y1) ')']);
            disp('Calculating Camera 2 coords');
            disp('  Calculated R matrix');
            disp(R4);
            disp('  Calculated T matrix');
            disp(T4);
            disp(['  Converted point to camera 2 coords (' num2str(cam4coords(1)) ',' num2str(cam4coords(2)) ',' num2str(cam4coords(3)) ')']);
            disp('Calculating Camera 2 pixel coords');
            disp(['  Computed Pixel Vector (' num2str(pixelVec2(1)) ',' num2str(pixelVec2(2)) ',' num2str(pixelVec2(3)) ')'])
            disp(['  Converted point to pixel coords (' num2str(x2) ',' num2str(y2) ')']);
            disp('Calculating 3D point from pixel coordinates');
            disp(['  Computed Pixel Vectors (' num2str(p1(1)) ',' num2str(p1(2)) ',' num2str(p1(3)) ')' 'and (' num2str(p2(1)) ',' num2str(p2(2)) ',' num2str(p2(3)) ')']);
            disp(['  Computed W vector (' num2str(W(1)) ',' num2str(W(2)) ',' num2str(W(3)) ')' ]);
            disp(['  Computed T vector (' num2str(T(1)) ',' num2str(T(2)) ',' num2str(T(3)) ')' ]);
            disp(['  Computed solution vector (' num2str(sol(1)) ',' num2str(sol(2)) ',' num2str(sol(3)) ')' ]);
            disp(['  Recovered Point (' num2str(recovered(j, 1)) ',' num2str(recovered(j, 2)) ',' num2str(recovered(j, 3)) ')']);
            p = [x(j), y(j), z(j)];
            error = L2_distance(recovered(j, :), p);
            disp(['Calculated error ' num2str(error) ]);
            disp('-----------------------------------------------------------------------------------------------');
        end
    end
    %Save pixel values and triangulated result
    cam1(i, :, :) = res1;
    cam2(i, :, :) = res2;
    recoveredMocap(i, :, :) = recovered;
end

[table1, table2, errors] = evaluateResults(mocapJoints, recoveredMocap);
disp('Overall L2 error');
disp(' ');
disp(table2);
disp('Joint vs L2 error');
disp(' ');
disp(table1);


% Code for displaying intermediate 3d --> 2D projections from both angles
frame100 = 1500;
frame50 = uint32(frame100/2);

video1 = read(v1, frame50);
video2 = read(v2, frame50);
figure(1);
imshow(video1);
hold on;
m = squeeze(cam1(frame100,:,:));
skelify(m);
figure(2);
imshow(video2);
hold on;
m = squeeze(cam2(frame100,:,:));
skelify(m);

% Code for generating 3D reconstruction overlayed on original skeleton
frame = 1505;

figure(3);
hold on;
m = squeeze(recoveredMocap(frame,:,:));
tmp = mocapJoints(frame,:,4)';
m = horzcat(m, tmp);
world = squeeze(mocapJoints(frame,:,:));
skelify3(m,1);
skelify3(world,2);





end

