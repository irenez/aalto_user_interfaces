bigram = load('bigram_frequencies.mat');
numIter = 10;

alphabet = bigram_frequencies.Properties.VariableNames;
keyboard = char(alphabet)';
performance = compute_average_wpm(keyboard);

for i = 1:numIter
    idx = randperm(length(alphabet));
    keyboard = char(alphabet(idx))';
    performance = compute_average_wpm(keyboard);
    score{i} = {keyboard, performance};
    dim(i) = score{:,i}(2);
end

[sorted, idx_srt] = sort(cell2mat(dim), 'descend');
score = score(idx_srt);      % sort score 

for i = ceil(length(score)/2)+1 : length(score)
    score{:,i} = [];
end

for i = 1:ceil(length(score)/2)
    optKeyboard(i) = score{:,i}(1);
end
optKeyboard