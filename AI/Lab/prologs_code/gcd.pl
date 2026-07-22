% Program to find the GCD of two numbers

gcd(X, 0, X).

gcd(X, Y, G) :-
    Y > 0,
    R is X mod Y,
    gcd(Y, R, G).

start :-
    write('Enter first positive integer: '),
    read(X),

    write('Enter second positive integer: '),
    read(Y),

    gcd(X, Y, G),

    nl,
    write('Greatest Common Divisor (GCD) = '),
    write(G),
    nl.