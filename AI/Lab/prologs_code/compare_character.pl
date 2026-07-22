% Compare two characters

start :-
    write('Enter first character (e.g., a.): '),
    read(Char1),

    write('Enter second character (e.g., b.): '),
    read(Char2),

    ( Char1 == Char2 ->
        write('Both characters are equal.')
    ;
        write('Characters are different.')
    ),
    nl.