p([A]) :- write(A),nl.
p([A|L]) :- write(A),write(','),p(L).
p(X):-write(X),nl.
