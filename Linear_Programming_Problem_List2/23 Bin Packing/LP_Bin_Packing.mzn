% BIN PACKING PROBLEM
% There are n items with different weights and m bins with equal capacity. These items should be packed into bins such that 
% total weight of items packed into one bin doesn't exceed capacity of this bin. Find minimal number of required bins. 

% DATA
int: num_stuff;                    % number of things to pack
array[1..num_stuff] of int: stuff; % the weight of the things to pack
int: bin_capacity;                 % all bins have the same capacity
int: num_bins;                     % total number of bins (some of them can be empty)
% VARIABLES
% indicator, show that if i'th bin was filled array[i] = 1, else array[i] = 0
array[1..num_bins] of var 0..1: bin_indicator;
% indicator_matrix, show that if j'th item was placed in i'th bin array[j][i] will be equal 1, else equal 0
array[1..num_stuff, 1..num_bins] of var 0..1: indicator_matrix;
% OBJECTIVE
solve minimize sum(i in 1..num_bins)(bin_indicator[i]);
% CONSTRAINTS
% constraint for using maximum capacity of all bins
constraint forall(i in 1..num_bins)(sum(j in 1..num_stuff)(stuff[j] * indicator_matrix[j, i]) <= bin_capacity);
% out bucket of things should be empty
constraint sum(i in 1..num_stuff, j in 1..num_bins)(indicator_matrix[i, j]) = num_stuff;
constraint forall(i in 1..num_bins)(bin_indicator[i] * num_stuff >= sum(j in 1..num_stuff)(indicator_matrix[j, i]));