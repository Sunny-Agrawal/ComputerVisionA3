function [EMat] = EstE(sCoord3D, tCoord3D)
%estimate the essential matrix given 2 sets of corresponding 3D homogeneous
%coordinates

numConstraints = size(sCoord3D, 2);
AMatTranspose = zeros(numConstraints, 9);

for(i = 1 : numConstraints)
    sx = sCoord3D(1, i);
    sy = sCoord3D(2, i);
    sz = sCoord3D(3, i);
    
    tx = tCoord3D(1, i);
    ty = tCoord3D(2, i);
    tz = tCoord3D(3, i);
    
    AMatTranspose(i, 1:9) = [sx*tx, sy*tx, sz*tx, sx*ty, sy*ty, sz*ty, sx*tz, sy*tz, sz*tz]; 
end

AMat = AMatTranspose';
[eigvecs, eigvals] = eig(AMat*AMat');
eigvals = diag(eigvals)';
EVec = eigvecs(:,1);
EMat = reshape(EVec, [3,3])';