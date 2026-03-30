% ==============================
% Graph edges
% ==============================
edge(a,b).
edge(a,c).
edge(b,d).
edge(b,e).
edge(c,f).

% ==============================
% DFS traversal
% ==============================
dfs(Start) :-
    dfs_util(Start, []).

% ==============================
% DFS utility predicate
% ==============================
dfs_util(Node, Visited) :-
    \+ member(Node, Visited),          % if not visited
    write('Visited: '), write(Node), nl,
    findall(Next, edge(Node, Next), Neighbors),
    dfs_list(Neighbors, [Node|Visited]).

% ==============================
% Process neighbor list
% ==============================
dfs_list([], _).
dfs_list([H|T], Visited) :-
    dfs_util(H, Visited),
    dfs_list(T, Visited).

% ==============================
% Prevent revisiting
% ==============================
dfs_util(Node, Visited) :-
    member(Node, Visited).