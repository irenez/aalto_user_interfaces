img = imread('tubemap.jpg');
[X, clr_map] = imread('colormap.png');
ind_img = rgb2ind(img, clr_map);
imagesc(ind_img)
axis off