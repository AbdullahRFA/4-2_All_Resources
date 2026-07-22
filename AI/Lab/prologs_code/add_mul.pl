% Program to add and multiply two numbers

start :-
    write('Enter first number: '),
    read(X),

    write('Enter second number: '),
    read(Y),

    Sum is X + Y,
    Product is X * Y,

    nl,
    write('Addition = '),
    write(Sum),

    nl,
    write('Multiplication = '),
    write(Product),
    nl.