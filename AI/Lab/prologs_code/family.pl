parent(john, mary).
parent(mary, anna).
parent(john, david).

grandparent(X, Y) :- parent(X, Z), parent(Z, Y).