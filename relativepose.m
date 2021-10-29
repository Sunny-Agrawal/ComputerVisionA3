function [R, T] = relativepose(sCoord2D, tCoord2D, K);
%get 3d homogenous coordinates of source and target
sCoord3D = Get3dCoords(sCoord2D, K);
tCoord3D = Get3dCoords(tCoord2D, K);
EMat = EstE(sCoord3D, tCoord3D);
[R, T] = GetRandT(EMat);