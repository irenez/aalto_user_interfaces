function [data_array] = remove_Outliers(data_array)
%% TODO: IMPLEMENT THIS.
% Remove outliers in movement time. 
% A trial is considered to be an outlier if the observed movement time 
% deviates more than 3 standard deviations from the *median* movement time.
% Important: remove outliers for each configuration separately.
%
% Input: data_array, 1xN cell. 
%        A cell array that contains for each configuration a table with the 
%        observed data. The columns of the table are the variables 
%        'amplitude', 'width', 'endPos' and 'time'.
%
% Output: data_array, 1xN cell. 
%        The modified input, where outlier entries are removed.

end