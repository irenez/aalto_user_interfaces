clear all

load('bigram_frequencies.mat')
numIter = 50;
n = numIter; 

% intialize keyboard layout
spaces = ['_'; '_'; '_'; '_'; '_'];
alphabet = [bigram_frequencies.Properties.VariableNames spaces];
keyboard = char(alphabet)';
performance = compute_average_wpm(keyboard);
optLayout = cell(1,floor(log(numIter)/log(2)));

for c = 1 : floor(log(numIter)/log(2))
    
    % create a score with random keyboard layouts
    for i = 1:n
        idx = randperm(length(alphabet));
        keyboard = char(alphabet(idx))';
        performance = compute_average_wpm(keyboard);
        score{i} = {keyboard, performance};         % save layout & performance
        dim(i) = score{i}(2);             % will help to sort w.r.t. performance
    end
    
    dim = dim(1:length(score));
    [sorted, idx_srt] = sort(cell2mat(dim), 'descend');
    score = score(idx_srt);      % sort score 

    % discard the keyboards with lower performance
    score = score(1:floor(length(score)/2));
    for i = 1:length(score)
        newKeyboard(i) = score{:,i}(1);
    end
    optLayout{:,c} = score;     % saves the keyboards with best performance

% create new layout by swapping two keys
    keyboard = swap_keys(newKeyboard);
   
    for i = 1:length(score)
        performance = compute_average_wpm(keyboard(i,:));
        score{i} = {keyboard, performance};
    end
    n = length(score);
    c = c+1;
end

k=1;
for i = 1:length(optLayout)
    for j = 1:length(optLayout{i})
        opt_perf(k) = optLayout{i}{j}{2};
        opt_layout(k,:) = optLayout{i}{j}{1};
        k = k+1;
    end
end

optimum_wpm = max(opt_perf)
opt_idx = find(optimum_wpm);
optimum_layout = opt_layout(opt_idx,:)

qwerty = 'qwertyuiop_asdfghjklOAzxcvbnm____';
qwerty_wpm = compute_average_wpm(qwerty)
