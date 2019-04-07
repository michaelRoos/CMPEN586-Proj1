function [names] = inputNames(path)
%INPUTNAMES Summary of this function goes here
%   Detailed explanation goes here
data = fileread(path);
names = strsplit(data);
names = cellstr(names);
end

