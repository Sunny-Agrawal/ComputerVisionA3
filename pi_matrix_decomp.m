function [K,R,T] = pi_matrix_decomp(vec_pi)

mat_pi = reshape(vec_pi, [4,3])';
% Follow GSO in CS356_Lecture_15_note
u1 = mat_pi(1, 1:3)';
u2 = mat_pi(2, 1:3)';
u3 = mat_pi(3, 1:3)';
k33 = norm(u3);
r3 = u3/k33;
k23 = u2'*r3;
k22 = norm(u2 - k23*r3);
r2 = (u2 - k23*r3)/k22;
k13 = u1'*r3;
k12 = u1'*r2;
k11 = norm(u1 - k12*r2 - k13*r3);
r1 = (u1 - k12*r2 - k13*r3)/k11;
R = [r1'; r2'; r3'];
K = [k11, k12, k13; 0, k22, k23; 0,0,k33];
T = inv(K)*mat_pi(:,4);
