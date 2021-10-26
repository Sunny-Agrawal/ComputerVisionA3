function [M] = M_matrix(pixels, X)
numKeypoints = size(X, 2);
%let capital X, Y, and Z be the 3d coordinates of a keypoint
%let lowercase x, and y be 2d pixel coordinates
%for every 3d keypoint, we pad an extra 1 for the matrix mulitplication
X = [X; ones(1,numKeypoints)];


M = zeros(2*numKeypoints, 12);
for i = 1 : numKeypoints
    %the M-matrix has two rows per point
    %row 1 handles the x constraint, i.e. the negative of the 2d x value is multiplied by
    %every 3d coordinate (and the padded 1)
    %row 1 = [Xi, Yi, Zi, 1, 0, 0, 0, 0, -xi*Xi, -xi*Yi, -xi*Zi, -xi*1]
    %row 2 handles the y constraint, i.e. the negative of the 2d x value is
    %multiplied by every 3d coordinate (and the padded 1)
    %row 2 = [0, 0, 0, 0, Xi, Yi, Zi, 1, -yi*Xi, -yi*Yi, -yi*Zi, -yi*1]
    Xi = X(1, i);
    Yi = X(2, i);
    Zi = X(3, i);
    xi = pixels(1, i);
    yi = pixels(2, i);
    %row1
    M(2*i-1, 1:12) = [Xi, Yi, Zi, 1, 0, 0, 0, 0, -xi*Xi, -xi*Yi, -xi*Zi, -xi*1];
    %row2
    M(2*i, 1:12) = [0, 0, 0, 0, Xi, Yi, Zi, 1, -yi*Xi, -yi*Yi, -yi*Zi, -yi*1];
end