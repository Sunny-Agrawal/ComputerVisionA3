function [M] = M_matrix(pixels, X)
%
num = size(pixels, 2);
pixels = [pixels; ones(1,num)];
X = [X; ones(1,num)];
M = zeros(2*num, 12);
for i = 1 : num
    M(2*i-1, 1:4) = X(:,i)';
    M(2*i-1, 9:12) = -X(:,i)'*pixels(1,i);
    M(2*i, 5:8) = -X(:,i)';
    M(2*i, 9:12) = -X(:,i)'*pixels(2,i);
end