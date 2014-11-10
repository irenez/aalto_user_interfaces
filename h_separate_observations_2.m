function [data] = h_separate_observations_2 (filename)
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