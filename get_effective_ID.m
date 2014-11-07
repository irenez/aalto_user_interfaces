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

id_e = log( data_array.amplitude ./ data_array.endPos + 1 );

end
