% SINGLE MACHINE SCHEDULING
% There are n tasks which should be processed by a single machine for the time interval [0,..,T]. We consider only discrete time moments.
% Each task has release time, processing time and deadline. Only one task can be processed by the machine at each time moment. 
% Makespan of given schedule is the completion time of the latest task. Find a minimal makespan schedule.

% DATA
int: T;                  % time horizon
int: n;                  % num tasks
array[1..n] of int: r;   % release times
array[1..n] of int: p;   % processing times
array[1..n] of int: d;   % deadlines

% VARIABLES