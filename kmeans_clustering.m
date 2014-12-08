function [cluster, silh, h] = kmeans_clustering(data, k, d)

% dimensionality reduction
coeff = pca(data);
reduced = data * coeff(:, 1:d);

cluster = kmeans(reduced, k);

figure(1);
colormap jet
scatter3(reduced(:,1), reduced(:,2), reduced(:,3), 3, cluster, 'filled')
figure(2);
[silh, h] = silhouette(reduced, cluster);
h = gca;
h.Children.EdgeColor = [.8 .8 1];

end