function [K,R,T] = pi_matrix_decomp(vec_pi)
%
mat_pi = reshape(vec_pi, [4,3])';
KR = mat_pi(:,1:3);
% QR decomposition to to get the K and R matrices
v1 = KR(1,:);
v2 = KR(2,:);
v3 = KR(3,:);
k33 = norm(v3);
r3 = v3/k33;
k23 = r3*v2';
r2 = v2 - k23*r3;
k22 = norm(r2);
r2 = r2/k22;
k13 = r3*v1';
k12 = r2*v1';
r1 = v1 - k13*r3 - k12*r2;
k11 = norm(r1);
r1 = r1/k11;
R = [r1; r2; r3];
K = [k11, k12, k13; 0, k22, k23; 0,0,k33];
T = inv(K)*mat_pi(:,4);