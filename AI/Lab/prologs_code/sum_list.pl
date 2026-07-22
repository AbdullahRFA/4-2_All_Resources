% Sum of all numbers in a list

sum_list([], 0).

sum_list([H|T], Sum) :-
    sum_list(T, Rest),
    Sum is H + Rest.

start :-
    write('Enter a list (e.g., [1,2,3,4]): '),
    read(List),

    sum_list(List, Sum),

    nl,
    write('Sum of the list = '),
    write(Sum),
    nl.