# Write a program using PROLOG or LISP to solve 4-queen problem

% Check safe placement

safe([]).
safe([Q|Qs]) :-
    safe(Qs),
    noattack(Q, Qs, 1).

noattack(_, [], _).
noattack(Q, [Q1|Qs], D) :-
    Q =\= Q1,
    abs(Q - Q1) =\= D,
    D1 is D + 1,
    noattack(Q, Qs, D1).

% Generate permutation of list
perm([], []).
perm(L, [H|T]) :-
    select(H, L, R),
    perm(R, T).

% Solve N-Queen
queens(N, Solution) :-
    numlist(1, N, L),
    perm(L, Solution),
    safe(Solution).

% Main program with input
start :-
    write('Enter value of N: '), nl,
    read(N),
    queens(N, Sol),
    write('Solution: '), write(Sol), nl,
    fail.
start.