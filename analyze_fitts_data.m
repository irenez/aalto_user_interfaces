function analyze_fitts_data(filename)
%% DO NOT MODIFY. This is the main file. It reads the data and calls the methods for analyzing it. Your task is to implement those methods in their separate files. 

%% NOTHING TO DO HERE. 
% data_array is a cell array that contains for each *single* target a table 
% with the observed data. The columns of the table are the variables 
% 'amplitude', 'width', 'endPos' and 'time'.

%     filename = 'experiment_data.txt';
    data_array = h_separate_observations(filename);

% Tip: use the function cellfun to apply a function to every element of a
% cell array.    
%% (1) TODO. Remove outliers.
    data_array = remove_Outliers(data_array);

%% (2a) TODO. Compute regular ID for each configuration.
    id = get_ID(data_array);

%% (2b) TODO. Compute effective ID for each configuration.
    id_e = get_effective_ID(data_array);
    
%% (3) TODO. Average the movement time for each configuration. 
    mt = get_avg_movement_time(data_array, id);
    
%% Remark: make sure that id, id_e and mt contain the data in the same
% order. That is, the id of a trial x given by id(x) or id_e(x) corresponds 
% to the average movement time given by mt(x).     
    
%% NOTHING TO DO HERE. 
    % Fit linear model .
    if(~isempty(id) && ~isempty(mt))
        mdl_designed_id = fitlm(id, mt);
    end
    if(~isempty(id_e) && ~isempty(mt))
        mdl_effective_id = fitlm(id_e, mt);
    end
    
    mdl_designed_id, mdl_effective_id
    
%% (4) TODO. Plot original data and model. 
    figure(1)
    if(~isempty(id) && ~isempty(mt))
        plot_model_originalData(mdl_designed_id, id, mt, 'designed ID');
    end
    figure(2)
    if(~isempty(id_e) && ~isempty(mt))
        plot_model_originalData(mdl_effective_id, id_e, mt, 'effective ID');
    end
    
%% (5) TODO. Display throughput    
    disp(['Throughput designed: ' num2str(get_throughput(id,mt))]);
    disp(['Throughput effective: ' num2str(get_throughput(id_e,mt))]);   
end





%% Helper function
function [data] = h_separate_observations (filename)
% Read the data of the logfile. Create a separate table with the 
% observations of one target configuration. Note that one configuration has 
% two targets that strictly alternate. Store all in one cell array.
    
    allData = readtable(filename,'FileType', 'text',...
        'Delimiter', '\t',...
        'Format', '%f%f%f%f'); 
    
    amplitudes = unique(allData.amplitude);
    widths = unique(allData.width);
    
    data = cell(1,length(amplitudes)* length(widths)*2);
    for i=1:length(amplitudes)
        for j=1:length(widths)
            indices = allData.amplitude==amplitudes(i) & allData.width==widths(j);
            indicesFirst = zeros(1,length(indices));
            indicesFirst(1:2:length(indices))= indices(1:2:length(indices));
            indicesSecond = zeros(1,length(indices));
            indicesSecond(2:2:length(indices))= indices(2:2:length(indices));
            data{(i-1)*length(widths)*2+(j-1)*2+1} = allData(find(indicesFirst),:);
            data{(i-1)*length(widths)*2+(j-1)*2+2} = allData(find(indicesSecond),:);
        end
    end
end