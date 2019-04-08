function [pointCloud] = inputPointCloud(path)
% INPUTPOINTCLOUD Reads in pointcloud data and formats as an nx3 matrix

pointCloud = csvread(path);
pointCloud = reshape(pointCloud,[],3);
end

