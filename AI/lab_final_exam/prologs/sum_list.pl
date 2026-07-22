sum_list([], 0).

sum_list([H|T], Sum) :-
    sum_list(T, Rest),
    Sum is H + Rest.



search_element([Element|_], Element, 0).

search_element([_|T], Element, Index) :-
    search_element(T, Element, RestIndex),
    Index is RestIndex + 1.



start :-
    % Input list
    write('Enter a list (e.g., [1,2,3,4]): '),
    read(List),

    % Sum
    sum_list(List, Sum),
    nl,
    write('Sum of the list = '),
    write(Sum),
    nl,

    % Search
    write('Enter element to search: '),
    read(Element),

    ( search_element(List, Element, Index) ->
        write('True. Element found at index: '),
        write(Index),
        nl
    ;
        write('False. Element not found.'),
        nl
    ).