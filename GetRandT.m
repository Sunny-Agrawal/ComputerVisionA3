function [R, T] = GetRandT(EMat)
%Extract R and T using singular value decomposition on the essential matrix
[U, S, V] = svd(EMat);
T = S(1, 1) * U(1:3, 3);
C1 = -U(1:3, 2);
C2 = U(1:3, 1);
C3 = U(1:3, 3);
R = [C1, C2, C3] * V';
