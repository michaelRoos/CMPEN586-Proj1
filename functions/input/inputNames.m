function [names] = inputNames(path)
%INPUTNAMES Read in image names and format as a list of strings

data = fileread(path);
names = strsplit(data);
names = cellstr(names);
end

