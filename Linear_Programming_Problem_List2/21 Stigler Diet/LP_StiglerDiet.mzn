%DATA
% planning horizon
int: T = 365;
% food ids: 1 to F
int: F = 77;
% nutrient ids: 1 to N
int: N = 9;
% allowed violation of nutrition target
float: delta = 0.1;
% nutrition target per day
array[1..N] of float: k;
% food nutrition per 1$ (1939)
array[1..F, 1..N] of float: s;
% VARIABLES
array[1..F] of var float: x;
% OBJECTIVE - MINIMIZE TOTAL COST
solve minimize sum(j in 1..F)(x[j]);
% CONSTRAINTS
% positive defined
constraint forall (j in 1..F)(x[j]>=0);
% nutrients consuming in [1-delta, 1+delta]
constraint forall (i in 1..N)(sum(j in 1..F)((s[j, i] * x[j]) / k[i]) / T >= 1 - delta /\ sum(j in 1..F)((s[j, i] * x[j]) / k[i]) / T <= 1 + delta);