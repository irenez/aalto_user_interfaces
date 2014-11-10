function [keyboard] = swap_keys(keyboard)
    
%% This functions swaps two keys of a keyboard and outputs the new keyboard
%% INPUT: Cell array of strings, MxN dimensions
%% OUTPUT: Character array, MxN dimensions

    keyboard = char(keyboard);
    [n,m] = size(keyboard);
    for i = 1:n
        idx_1 = randi(m);
        idx_2 = randi(m);
        if (idx_1 == idx_2)
            idx_2 = randi(m);
        else
            temp = keyboard(i,idx_1);
            keyboard(i,idx_1) = keyboard(i,idx_2);
            keyboard(i,idx_2) = temp;
        end
    end
    
end