% Check whether an element is a member of a list

is_member(X, [X|_]).
is_member(X, [_|T]) :-
    is_member(X, T).

start :-
    write('Enter a list (e.g., [1,2,3,4]): '),
    read(List),

    write('Enter the element to search: '),
    read(Element),

    ( is_member(Element, List) ->
        write('Element is present in the list.')
    ;
        write('Element is NOT present in the list.')
    ),
    nl.