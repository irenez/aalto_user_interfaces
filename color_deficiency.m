img = imread('tubemap.jpg');
X = importdata('colormap.png')
ind_img = rgb2ind(img, X.colormap);
imagesc(ind_img)
axis off