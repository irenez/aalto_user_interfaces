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

data_array = table2array(data_array);
% std_data = std(data_array);
% med_data = median(data_array);
% outliers = find(abs( med_data(4) - data_array(:,4) ) < 3*std_data(4));
% data_array = data_array(outliers,:);

% % -------------------------------------------
% % Solution with cells
% % -------------------------------------------
% data_array = table2cell(data_array);
% std_data = std(cellfun(@std, data_array));
% med_data = median(cellfun(@median, data_array));
% outliers = find(abs( med_data(4) - data_array{:,4} ) > 3*std_data(4));
% data_array = data_array{outliers,:};

end