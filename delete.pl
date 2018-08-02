
delEach([],_,[]).

delEach(L1,L2,R) :- L1 = [H|T],
                    delEach(T,L2,R2),
                    del(H,L2,R1),
                    R = [R1|R2].
% del(_,[],[]).
% del(A,[A|B],R)-:!,
%                   del(A,B,R).
%
% del(X,[A|B],[A|R]) :-
%                   del(X,B,R).
del(_,[],[]).

del(H,[H|T],R) :- !,del(H,T,R).

del(X,[H|T],R):- del(X,T,R1),
                 R = [H|R1].
