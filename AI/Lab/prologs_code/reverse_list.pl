% Reverse a list

reverse_list([], []).

reverse_list([H|T], Rev) :-
    reverse_list(T, RevT),
    append(RevT, [H], Rev).

start :-
    write('Enter a list (e.g., [1,2,3,4]): '),
    read(List),

    reverse_list(List, Reversed),

    nl,
    write('Reversed List = '),
    write(Reversed),
    nl.