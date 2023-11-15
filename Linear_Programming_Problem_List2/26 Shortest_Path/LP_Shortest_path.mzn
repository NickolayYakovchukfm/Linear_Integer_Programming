%DATA
% vertice ids 1 to N
int: N = 9;
% vertex a
%case 1
int: a = 1;
%case 2
%int: a = 2;
%case 3
%int: a = 4;

% vertex b
%case 1
int: b = 9;
%case 2
%int: b = 8;
%case 3
%int: b = 2;

% edge distances matrix 
array[1..N, 1..N] of int: l = 
[|0, 8, 12, -1, -1, -1, -1, -1, -1|
 -1, 0, 13, 25, 9, -1, -1, -1, -1|
 -1, -1, 0, 14, -1, -1, 21, -1, -1|
 -1, -1, -1, 0, 20, 8, 12, 12, 16|
 -1, 9, -1, -1, 0, 19, -1, -1, -1|
 -1, -1, -1, -1, -1, 0, -1, 11, -1|
 -1, -1, -1, -1, -1, -1, 0, -1, 11|
 -1, -1, -1, -1, -1, -1, -1, 0, 9|
 -1, -1, -1, -1, -1, -1, -1, -1, 0|];
% VARIABLES
array[1..N, 1..N] of var 0..1: path;
% array[1..N] of var 0..1: meets_v;
% OBJECTIVE
solve minimize sum(i in 1..N, j in 1..N)(l[i, j] * path[i, j]);
% CONSTRAINTS
% out path doesn't go through vertices with l = -1
constraint forall(i in 1..N, j in 1..N)(l[i, j] * path[i, j] >= 0);
% one edge from a and from b
constraint sum(i in 1..N) (path[a, i]) = 1;
constraint sum(i in 1..N) (path[i, b]) = 1;
constraint forall(i in 1..N, j in 1..N where j != b) (sum (k in 1..N) (path[j, k]) + (1 - path[i, j]) > 0);
% unicity of path
constraint forall(i in 1..N)(sum(j in 1..N)(path[i, j])<=1);
% unicity of backpath
constraint forall(j in 1..N)(sum(i in 1..N)(path[i, j])<=1);
% no loops condition
constraint forall(i in 1..N)(path[i, i] = 0);