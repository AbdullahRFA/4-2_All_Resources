# Write a program using PROLOG or LISP to solve 8-puzzle problem using breadth first search (BFS)
% ---------- 8-PUZZLE (BFS) ----------

% Goal check
goal(G, G).

% Valid moves (swap 0 with neighbor)
move(S, S2) :- swap(S, 1,2,S2).
move(S, S2) :- swap(S, 2,3,S2).
move(S, S2) :- swap(S, 4,5,S2).
move(S, S2) :- swap(S, 5,6,S2).
move(S, S2) :- swap(S, 7,8,S2).
move(S, S2) :- swap(S, 8,9,S2).
move(S, S2) :- swap(S, 1,4,S2).
move(S, S2) :- swap(S, 2,5,S2).
move(S, S2) :- swap(S, 3,6,S2).
move(S, S2) :- swap(S, 4,7,S2).
move(S, S2) :- swap(S, 5,8,S2).
move(S, S2) :- swap(S, 6,9,S2).

swap(S, I, J, S2) :-
    nth1(I, S, 0), nth1(J, S, X), X \= 0,
    replace(S, I, X, T), replace(T, J, 0, S2).
swap(S, I, J, S2) :-
    nth1(J, S, 0), nth1(I, S, X), X \= 0,
    replace(S, J, X, T), replace(T, I, 0, S2).

replace([_|T], 1, X, [X|T]).
replace([H|T], I, X, [H|R]) :-
    I > 1, I1 is I-1, replace(T, I1, X, R).

% BFS
bfs([[S|Path]|_], Goal, [S|Path]) :- goal(S, Goal).
bfs([[S|Path]|Rest], Goal, Sol) :-
    findall([N,S|Path],
            (move(S,N), \+ member(N,[S|Path])),
            Next),
    append(Rest, Next, Q),
    bfs(Q, Goal, Sol).

% Print nicely
print_path([]).
print_path([H|T]) :-
    write(H), nl,
    print_path(T).

% ---------- Main ----------
start :-
    write('Enter initial state (e.g. [1,2,3,4,0,5,6,7,8]): '), nl,
    read(Init),
    write('Enter goal state (e.g. [1,2,3,4,5,6,7,8,0]): '), nl,
    read(Goal),
    bfs([[Init]], Goal, RevPath),
    reverse(RevPath, Path),
    write('Solution path:'), nl,
    print_path(Path).