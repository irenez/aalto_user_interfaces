function [id_e] = get_effective_ID(data_array)
%% TODO: IMPLEMENT THIS.
% Compute the effective index of difficulty. For each taregt compute  
% the ID according to the Shannon formulation with the effective target
% width (not adjusted!).
%
% Input: data_array, 1xN cell. 
%        A cell array that contains for each configuration a table with the 
%        observed data. The columns of the table are the variables 
%        'amplitude', 'width', 'endPos' and 'time'.
%
% Output: id_e, 1xN array. 
%        The effective ID of each configuration as given by the Shannon 
%        formulation and respecting the effective target width.

for i = 1:length(data_array)
    w_e(i) = 4.133 * std(data_array{i}.endPos);
    id_e(i) = log2( data_array{i}.amplitude(1) ./ w_e(i) + 1 );
end
% data = table2cell(data_array{:});
% id_e = cellfun(@rdivide, data(:,1), data(:,3));
% id_e = log(id_e + 1);

end
