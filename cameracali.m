function[K] = cameracali(Coord2d, Coord3d)

M = M_matrix(Coord2d, Coord3d);
vec_pi = pi_vector(M);
[K,R,T] = pi_matrix_decomp(vec_pi);