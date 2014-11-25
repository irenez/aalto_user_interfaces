function [idx] = color_cluttering(filename)

% Input: image filename
% Output: 

img = imread(filename);
% Convert RGB image into CIELab
lab = rgb2lab(img);

% Decompose  luminance (L) and chrominance (a,b)
L = lab(:,:,1);
a = lab(:,:,2);
b = lab(:,:,3);

pyr_L = genPyr(L, 'gaussian', 3);
pyr_a = genPyr(a, 'gaussian', 3);
pyr_b = genPyr(b, 'gaussian', 3);

sum_L=0;
sum_a=0; sum_b=0;

% Compute the shannon entropy 
for i=1:3
    entropy_L{i} = wentropy(pyr_L{:,i},'shannon');
    entropy_a{i} = wentropy(pyr_a{:,i},'shannon');
    entropy_b{i} = wentropy(pyr_b{:,i},'shannon');

    % and sum the subband entropies
    sum_L = sum_L +  entropy_L{i};
    sum_a = sum_a +  entropy_a{i};
    sum_b = sum_b +  entropy_b{i};
end

idx = [0.84.*sum_L 0.08*sum_a 0.08*sum_b]

end