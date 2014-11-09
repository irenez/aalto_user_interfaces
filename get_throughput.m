function [throughput] = get_throughput(id, mt)
%% TODO: IMPLEMENT THIS.
% Compute the effective index of difficulty. For each taregt compute  
% the ID according to the Shannon formulation with the effective target
% width (not adjusted!).
%
% Input: id, 1xN vector. 
%        A vector containing the ID for each target.
%
%        mt, 1xN vector. 
%        A vector containing the average movement time for each target.
%
% Output: id_e, 1xN array. 
%        The throughput as given in the lecture and averaged over all
%        targets

throughput = id ./ mt ;

end

