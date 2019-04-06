function [pixelX,pixelY, pixelVector] = cameraToPixel(cameraPixel, vue)
%FILMTOPIXEL projects camera vector to pixel coordinates
internalMatrix = vue.Kmat;

pixelVector = internalMatrix * cameraPixel;

pixelX = pixelVector(1) / pixelVector(3);
pixelY = pixelVector(2) / pixelVector(3);

end
