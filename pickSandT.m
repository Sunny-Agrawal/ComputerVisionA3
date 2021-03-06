function [sCoord2D, tCoord2D] = pickSandT(sImg, tImg)
numPoints = 8;
sCoord2D = zeros(2, numPoints);
tCoord2D = zeros(2, numPoints);
bothImg = [sImg, tImg];
imshow(bothImg);
hold on;
for i = 1 : numPoints
    [sx,sy] = ginput(1);
    plot(sx,sy, '+', 'color', 'y', 'markersize', 10);
    [tx,ty] = ginput(1);
    plot(tx,ty, '+', 'color', 'y', 'markersize', 10);
    plot([sx,tx],[sy,ty], 'color', 'y');
    sCoord2D(1, i) = sx;
    sCoord2D(2, i) = sy;
    tCoord2D(1, i) = tx/2;
    tCoord2D(2, i) = ty;
end
