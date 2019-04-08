function [localToWorldMatrix] = localToWorld(normVector, planeBasis, centroid)
%LOCALTOWORLD Creates transform from reference space centerd around the
%plane back to the world coordinates.

% X and Y map to the plane basis. Z is the plane normal. Transform is the
% centroid, and then it is converted to accept homogenous vectors.
localToWorldMatrix = vertcat(horzcat(planeBasis,normVector,centroid'),[0 0 0 1]);
end

