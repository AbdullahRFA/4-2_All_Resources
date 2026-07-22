% Graph definition
edge(a,b).
edge(a,c).
edge(b,d).
edge(b,e).
edge(c,f).
edge(e,g).
edge(f,g).

%findall(Template, Goal, List)
% BFS Search
bfs([[Goal|Path]|_], Goal, [Goal|Path]).

bfs([[Node|Path]|Queue], Goal, Result) :-
    findall([Next,Node|Path],
            (edge(Node,Next),
             \+ member(Next,[Node|Path])),
            NewPaths),
    append(Queue, NewPaths, UpdatedQueue),
    bfs(UpdatedQueue, Goal, Result).

% Start predicate
start :-
    write('Enter Start Node (a,b,c,d,e,f,g): '),
    read(Start),

    write('Enter Goal Node (a,b,c,d,e,f,g): '),
    read(Goal),

    ( bfs([[Start]], Goal, Path) ->
        reverse(Path, FinalPath),
        nl,
        write('Path Found: '),
        write(FinalPath),
        nl
    ;
        write('No Path Found.'),
        nl
    ).