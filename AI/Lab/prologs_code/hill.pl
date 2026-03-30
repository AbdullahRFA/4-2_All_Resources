% ==============================
% Heuristic values
% ==============================
value(a, 3).
value(b, 5).
value(c, 4).
value(d, 7).
value(e, 6).
value(f, 2).

% ==============================
% Graph edges
% ==============================
edge(a, b).
edge(a, c).
edge(b, d).
edge(b, e).
edge(c, f).

% ==============================
% Hill Climbing Start
% ==============================
hill_climb(Start) :-
    climb(Start).

% ==============================
% Main climbing logic
% ==============================
climb(Node) :-
    value(Node, V),
    write('Current Node: '), write(Node),
    write('  Value: '), write(V), nl,

    findall((Next, V2),
            (edge(Node, Next), value(Next, V2)),
            Neighbors),

    best_neighbor(Neighbors, Node, V, BestNode, BestValue),

    ( BestValue > V ->
        climb(BestNode)
    ;
        write('Reached Local Maximum at '),
        write(Node),
        write(' with value '),
        write(V), nl
    ).

% ==============================
% Find best neighbor
% ==============================
best_neighbor([], Node, V, Node, V).

best_neighbor([(N,VN)|T], _, V, BestNode, BestValue) :-
    best_neighbor(T, N, VN, TempNode, TempValue),
    (TempValue > VN ->
        BestNode = TempNode,
        BestValue = TempValue
    ;
        BestNode = N,
        BestValue = VN
    ).