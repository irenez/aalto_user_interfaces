aalto_user_interfaces
==============================

ELEC-E7850 User Interfaces
Autumn 2014

Exercise 2.2 - Keyboard Optimization

In this exercise you will optimize a keyboard layout for typing Finnish text with 1 finger or stylus, for example on a smartphone. The grid here is annotated with the standard QWERTY layout used to write finish language. For simplicity, we omit å and space and consider only lower case letters. ö and ä are written as O and A to allow for easier implementation in MATLAB.

Note: A layout for a fixed grid can be encoded as one string. The layout above would be encoded as: ‘qwertyuiop_asdfghjklöäzxcvbnm____’
where ‘_’ denotes an empty key. The position in the string determines the linear index of a letter.

The folder “2_2_Optimization” in the additional material contains:
1. bigram_frequencies.mat: a MATLAB table.
	The value in the cell bigram_frequencies(i,j) gives you the probability that letter i is followed by letter j.
2. compute_avg_wpm.m: a MATBLAB function that computes for a given layout the average typing performance achievable with that layout (think of it as a performance score). The performance is given in words per minute, where one word is defined to have 5 characters.
	Note: This is the objective function that you need to optimize.
3. predict_MT.m: a MATBLAB function that takes two keys and predicts the time it takes to move from one key to the other, based on a Fitts’ Law model. The keys are specified by their linear index as described above.

Your task is to implement an optimization method that explores the huge amount of different keyboard layouts and finds one that maximizes the objective function given by compute_avg_wpm.m.

=========================================================
IMPLEMENTATION: 
Genetic Algorithm: http://mathematicalmulticore.wordpress.com/2009/08/07/optimized-evolutionary-algorithm-for-keyboard-design-part-1/