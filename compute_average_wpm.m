function [ wpm ] = compute_average_wpm( keyboard )
%Computes the average input speed in words per minute for a given keyboard
%layout of a 3x11 grid.
%   Input: keyboard, string
%           The keyboard layout as a single string. For the 3x11 grid the
%           Finnish version of the Qwerty keyboard would be encoded as 
%           'qwertyuiop_asdfghjklöäzxcvbnm____' where '_' contains an empty
%           or omitted character (such as å). For somplicity, we also omit
%           the space bar.
% 
%   Output: wpm, double
%           the average words per minute achievable with this keyboard, 
%           as predicted by Fitts Law. 
%           Note: a word is assumed to have 5 characters
%           

load('bigram_frequencies.mat');

alphabet=bigram_frequencies.Properties.VariableNames;

avg_mt=0;
for i=1:height(bigram_frequencies)
    for j=1:height(bigram_frequencies)
        %linear indices of corresponding keys
        key1 = strfind(keyboard, alphabet{i});
        key2 = strfind(keyboard, alphabet{j});
        
        %predict time to move from key1 to key2
        mt = predict_MT(key1, key2);
        
        %weight by probability and add up
        avg_mt = avg_mt + bigram_frequencies{i,j} * mt;
    end
end

wpm = 60 / (5*avg_mt);
end



