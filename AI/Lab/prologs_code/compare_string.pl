% Compare two strings

start :-
    write('Enter first string (e.g., ''hello''): '),
    read(Str1),

    write('Enter second string (e.g., ''world''): '),
    read(Str2),

    ( Str1 == Str2 ->
        write('Both strings are equal.')
    ;
        write('Strings are different.')
    ),
    nl.