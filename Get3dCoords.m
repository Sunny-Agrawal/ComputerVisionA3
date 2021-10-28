function [Coord3D] = Get3dCoords(Coord2D, K)
%Given a set of homogeneous 2D coordinates and intrinsic camera paramters K, get the
%corresponding homogeneous 3D coordinates 

numPoints = size(Coord2D, 2);
%Pad 2d coordinates with a row of 1s
Coord2D = [Coord2D; ones(1,numPoints)];

%Multiply by inverse of K, result should be a matrix of size [3, numpoints]
Coord3D = inv(K)*Coord2D;
