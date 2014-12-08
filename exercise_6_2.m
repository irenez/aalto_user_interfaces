close all

data = importdata('posture_data.csv');
x = data.data(:,5:end);     % dropping IDs and time columns

[n,m] = size(x);

% dimensionality reduction d=3 for plotting
d = 3;

min_silh = n;
for k=2:20
    [clusters, silh] = kmeans_clustering(x, k, d);
    if (numel(find(silh<0)) < min_silh)
        min_silh = numel(find(silh<0));
        k_opt = k
    end
end
[clusters, silh] = kmeans_clustering(x, k_opt, d);

sample = x(randperm(n),:);  % randomize the observations for each feature
n_sample = 2500;
y1 = self_organizing_map(sample(1:n_sample,:), 16);