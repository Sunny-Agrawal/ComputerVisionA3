function[vec_pi] = pi_vector(M)
%
[eigvecs, eigvals] = eig(M'*M);
eigvals = diag(eigvals)';
vec_pi = eigvecs(:,1);