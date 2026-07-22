% Tic-Tac-Toe (Simple Version)

:- dynamic cell/3.

% Initialize board
init :-
    retractall(cell(_,_,_)),
    forall(between(1,3,R),
           forall(between(1,3,C),
                  assert(cell(R,C,'-')))).

% Display board
show_board :-
    nl,
    forall(between(1,3,R),
        (
            forall(between(1,3,C),
                (
                    cell(R,C,V),
                    write(V), write(' ')
                )
            ),
            nl
        )
    ).

% Make a move
move(Player) :-
    write('Enter Row (1-3): '),
    read(Row),
    write('Enter Column (1-3): '),
    read(Col),

    ( cell(Row,Col,'-') ->
        retract(cell(Row,Col,'-')),
        assert(cell(Row,Col,Player))
    ;
        write('Cell already occupied! Try again.'), nl,
        move(Player)
    ).

% Main game (9 turns only)
play :-
    init,
    show_board,

    move('X'), show_board,
    move('O'), show_board,
    move('X'), show_board,
    move('O'), show_board,
    move('X'), show_board,
    move('O'), show_board,
    move('X'), show_board,
    move('O'), show_board,
    move('X'), show_board,

    write('Game Over!'), nl.