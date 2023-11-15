% DATA
% number of columns and rows
int: col_num = 9;
int: row_num = 9;
% subgrids
int: exist_nums = 9;
% VARIABLES
array[1..exist_nums, 1..row_num, 1..col_num] of var 0..1: x;
% CONSTRAINTS
% stable elements
constraint x[5, 3, 1] = 1;
constraint x[6, 7, 1] = 1;
constraint x[3, 8, 3] = 1;
constraint x[8, 1, 4] = 1;
constraint x[4, 8, 4] = 1;
constraint x[2, 9, 4] = 1;
constraint x[7, 4, 5] = 1;
constraint x[1, 1, 6] = 1;
constraint x[8, 4, 7] = 1;
constraint x[1, 5, 7] = 1;
constraint x[6, 9, 7] = 1;
constraint x[4, 8, 2] = 1;
constraint x[7, 7, 8] = 1;
constraint x[3, 2, 9] = 1;
constraint x[5, 7, 9] = 1;
% column and row conditions
constraint forall(i in 1..row_num, j in 1..col_num)(
sum(k in 1..exist_nums)(x[k, i, j]) = 1 /\ sum(k in 1..exist_nums)(x[i, k, j]) = 1);
% subgrids condition
constraint forall(i in 0..2, j in 0..2, k in 1..exist_nums)(sum(iter_1 in (3 * i + 1)..(3 * i + 3), 
iter_2 in (3 * i + 1)..(3 * i + 3))(x[k, iter_1, iter_2]) = 1);
% OBJECTIVE
solve satisfy;