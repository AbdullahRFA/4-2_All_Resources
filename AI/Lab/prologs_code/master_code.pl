% ----------- START PROGRAM -----------
start :-
    menu.

% ----------- MENU -----------
menu :-
    nl,
    write('========= PROLOG MENU ========='), nl,
    write('1. Count number of elements in a list'), nl,
    write('2. Even/Odd checking'), nl,
    write('3. Reverse a list'), nl,
    write('4. Fibonacci series (N terms)'), nl,
    write('5. Exit'), nl,
    write('Enter your choice (1-5): '),
    read(Choice),
    process(Choice).

% ----------- PROCESS CHOICE -----------

% --- Option 1: Count elements ---
process(1) :-
    write('Enter a list (e.g., [1,2,3]): '),
    read(L),
    count(L, N),
    write('Number of elements: '), write(N), nl,
    menu.

% --- Option 2: Even/Odd ---
process(2) :-
    even_odd_loop,
    menu.

% --- Option 3: Reverse list ---
process(3) :-
    write('Enter a list (e.g., [1,2,3]): '),
    read(L),
    reverse_list(L, R),
    write('Reversed list: '), write(R), nl,
    menu.

% --- Option 4: Fibonacci SERIES ---
process(4) :-
    write('Enter N (number of terms): '),
    read(N),
    write('Fibonacci series: '),
    fib_series(N),
    nl,
    menu.

% --- Option 5: Exit ---
process(5) :-
    write('Program terminated.'), nl.

% --- Invalid choice ---
process(_) :-
    write('Invalid choice! Try again.'), nl,
    menu.

% ----------- COUNT ELEMENTS -----------
count([], 0).
count([_|T], N) :-
    count(T, N1),
    N is N1 + 1.

% ----------- EVEN/ODD LOOP -----------
even_odd_loop :-
    write('Enter a number: '),
    read(X),
    ( 0 is X mod 2 ->
        write('Even'), nl
    ;
        write('Odd'), nl
    ),
    write('Check another? (y/n): '),
    read(Ans),
    ( Ans = y ->
        even_odd_loop
    ;
        true
    ).

% ----------- REVERSE LIST -----------
reverse_list([], []).
reverse_list([H|T], R) :-
    reverse_list(T, RT),
    append(RT, [H], R).

% ----------- FIBONACCI SERIES -----------

fib_series(N) :-
    fib_series_helper(0, 1, N).

fib_series_helper(_, _, 0).
fib_series_helper(A, B, N) :-
    N > 0,
    write(A), write(' '),
    Next is A + B,
    N1 is N - 1,
    fib_series_helper(B, Next, N1).