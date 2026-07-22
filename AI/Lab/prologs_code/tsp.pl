% Distance between cities

distance(a, b, 10).
distance(a, c, 15).
distance(a, d, 20).

distance(b, a, 10).
distance(b, c, 35).
distance(b, d, 25).

distance(c, a, 15).
distance(c, b, 35).
distance(c, d, 30).

distance(d, a, 20).
distance(d, b, 25).
distance(d, c, 30).

start :-
    write('Enter starting city (a,b,c,d): '),
    read(Start),

    write('Enter destination city (a,b,c,d): '),
    read(End),

    ( distance(Start, End, Cost) ->
        nl,
        write('Distance = '),
        write(Cost),
        nl
    ;
        write('No direct path exists.'),
        nl
    ).