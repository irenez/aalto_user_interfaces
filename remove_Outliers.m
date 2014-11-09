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

 for i = 1:length(data_array)
    std_data = std(data_array{i}.time);
    med_data = median(data_array{i}.time);
    dev_data = data_array{i}.time - med_data;
    outliers = find( abs(dev_data) < 3*std_data);
    data_array{i} = data_array{i}(outliers,:);
 end
% data = table2cell(data_array{:});
% std_data = std(cellfun(@std, data));
% med_data = median(cellfun(@median, data));
% dev_data = gsubtract(data(:,4), med_data(4)) ;
% outliers = find(cellfun(@abs, dev_data) > 3*std_data(4));
% data_array (:,outliers) = [];


end