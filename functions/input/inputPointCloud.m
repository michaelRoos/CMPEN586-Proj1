function [pointCloud] = inputPointCloud(path)
% Read in point csv, generated from python parsing script
pointCloud = csvread(path);
% Reshape into an nx3 matrix, where each row is a coordinate tuple
pointCloud = reshape(pointCloud,[],3);
end

