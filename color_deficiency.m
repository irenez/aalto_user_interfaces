img = double(imread('tubemap.jpg'));
[X, map] = imread('colorma.png', 'png');

[idxImg, clrmap] = rgb2ind(img, map);

image(idxImg)