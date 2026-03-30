% ---- Take input list from user ----
start :-
    write('Enter a list (example: [1,2,3,4]): '),
    read(List),

    % Find length
    length(List, Len),
    write('Length of the list: '), write(Len), nl,

    % Check odd/even
    write('Odd/Even check:'), nl,
    check_list(List).

% ---- Recursive check for each element ----
check_list([]).
check_list([H|T]) :-
    ( 0 is H mod 2 ->
        write(H), write(' is Even'), nl
    ;
        write(H), write(' is Odd'), nl
    ),
    check_list(T).