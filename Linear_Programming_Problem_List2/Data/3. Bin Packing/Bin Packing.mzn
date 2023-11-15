% BIN PACKING PROBLEM
% There are n items with different weights and m bins with equal capacity. These items should be packed into bins such that 
% total weight of items packed into one bin doesn't exceed capacity of this bin. Find minimal number of required bins. 

% DATA
int: num_stuff;                    % number of things to pack
array[1..num_stuff] of int: stuff; % the weight of the things to pack
int: bin_capacity;                 % all bins have the same capacity
int: num_bins;                     % total number of bins (some of them can be empty)

% VARIABLES
