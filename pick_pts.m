function [pixels] = pick_pts(img)
imshow(img);
hold on;
for i = 1 : 6
    [x,y] = ginput(1);
    plot(x,y, '+', 'color', 'y', 'markersize', 10);
    pixels(1, i) = x;
    pixels(2, i) = y;
end
