# Write a program using PROLOG or LISP to solve Tower of Hanoi problem
% -------- Tower of Hanoi --------

% Base case
hanoi(1, Source, Target, _) :-
    write('Move disk from '), write(Source),
    write(' to '), write(Target), nl.

% Recursive case
hanoi(N, Source, Target, Aux) :-
    N > 1,
    N1 is N - 1,
    hanoi(N1, Source, Aux, Target),
    hanoi(1, Source, Target, Aux),
    hanoi(N1, Aux, Target, Source).

% -------- Main --------
start :-
    write('Enter number of disks: '), nl,
    read(N),
    write('Moves are:'), nl,
    hanoi(N, 'A', 'C', 'B').