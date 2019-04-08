function [normVector, inliers, planeBasis, centroid] = ransac(points)
%RANSAC Identify most dominant plane in the image
%   Use ransac to find the plane that contains the most amount of points
maxNormVector = [0,0,0];maxD=0;
maxInliers = 0;
% Experimentally determined threshold
t = .5;
    for n = 1:5000
        % Randomly sample 3 unique points
        sampledPoints = datasample(points,3,'Replace',false);
        p1 = sampledPoints(1,:);
        p2 = sampledPoints(2,:);
        p3 = sampledPoints(3,:);
        
        % Create two vectors in the plane
        v1 = p3 - p1;
        v2 = p2 - p1;

        % Identify the plane norm as the cross product of two internal vectos
        normVector = cross(v1, v2);
        normVector = normVector / norm(normVector);
        % Calculate d
        d = -1 * dot(normVector, p3);
        
        % Identify the number of inliers
        inlierCount = 0;
        for pointIndex = 1:length(points)
           point = points(pointIndex,:);
           if abs( dot(point,normVector) + d ) < t
               inlierCount = inlierCount + 1;
           end
        end
        % Update best found plane
        if inlierCount > maxInliers
           maxInliers = inlierCount;
           maxNormVector = normVector;
           maxD = d;
       end
    end
    
    % Find all inliers of the best plane
    inliers = zeros(maxInliers,3);
    index = 1;
    for pointIndex = 1:length(points)
        point = points(pointIndex,:);
        if abs( dot(point,maxNormVector) + maxD ) < t
            inliers(index,:) = point;
            index = index + 1;
        end
    end
    % Use pre-existing function to get best fit plane for increased accuracy
    [normVector,planeBasis,centroid] = fitPlane(inliers);
end

