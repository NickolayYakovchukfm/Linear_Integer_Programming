%DATA
% num of vertices
int: n;
% graph_matrix, it includes ones in places that i and j vertices have an general path
array[1..n, 1..n] of var 0..1: graph_matrix;
% OBJECTIVE
solve maximize sum(i in 1..n, j in 1..n)(graph_matrix[i, j]);
% CONSTAINTS
% no cycles with len 4, btw if we have 5(or more)-cycle, we have an 4-cycle, so we need max len of cycle less then 4
constraint forall(i in 1..n, j in 1..n, k in 1..n, l in 1..n)(graph_matrix[i, j] + graph_matrix[j, k] + graph_matrix[k, l] + graph_matrix[l, i] < 4);
% no loops condition
constraint forall(point in 1..n)(graph_matrix[point, point] = 0);
% undirected condition
constraint forall(point_1 in 1..n, point_2 in 1..n)(graph_matrix[point_1, point_2] = graph_matrix[point_2, point_1]);