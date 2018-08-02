% p([]) :- write(empty),nl.
% p([A|L]):-write(A),write(','),p(L).
% p(X):-write(X),nl.


p([]) :-!,write(empty),nl.
p([X|Y]):-p(X),p(Y).
p(X):- write(X),nl.
