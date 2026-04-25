# 7. Write a program using PROLOG or LISP to find out Union and Intersection of two lists

% ----- Intersection -----
intersection([], _, []).
intersection([H|T], L2, [H|R]) :-
    member(H, L2),
    intersection(T, L2, R).
intersection([H|T], L2, R) :-
    \+ member(H, L2),
    intersection(T, L2, R).

% ----- Union -----
union([], L, L).
union([H|T], L2, R) :-
    member(H, L2),
    union(T, L2, R).
union([H|T], L2, [H|R]) :-
    \+ member(H, L2),
    union(T, L2, R).

% ----- Main -----
start :-
    write('Enter first list (end with dot): '), nl,
    read(L1),
    write('Enter second list (end with dot): '), nl,
    read(L2),

    intersection(L1, L2, I),
    union(L1, L2, U),

    write('Intersection: '), write(I), nl,
    write('Union: '), write(U), nl.