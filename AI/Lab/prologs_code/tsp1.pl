:- use_module(library(lists)).

distance(a,b,10).
distance(a,c,15).
distance(a,d,20).
distance(b,a,10).
distance(b,c,35).
distance(b,d,25).
distance(c,a,15).
distance(c,b,35).
distance(c,d,30).
distance(d,a,20).
distance(d,b,25).
distance(d,c,30).

path_cost([_], 0).
path_cost([A,B|T], Cost) :-
    distance(A,B,C1),
    path_cost([B|T], C2),
    Cost is C1 + C2.

tour_cost(Start, Tour, Cost) :-
    findall(C, (distance(Start,C,_), C \= Start), Cities),
    permutation(Cities, Perm),
    append([Start], Perm, Temp),
    append(Temp, [Start], Tour),
    path_cost(Tour, Cost).

start :-
    write('Enter starting city (a,b,c,d): '),
    read(Start),
    tour_cost(Start, Tour, Cost),
    write('Tour = '), write(Tour), nl,
    write('Cost = '), write(Cost), nl.