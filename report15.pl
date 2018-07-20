
% 経路の定義
arc(a,b,2).
arc(a,d,6).
arc(b,d,1).
arc(c,a,5).
arc(c,b,3).
arc(d,c,3).

path(X,Y,C,P) :- arc(X,Y,C),
                 P = [X,Y].

path(X,Y,C,P) :- arc(X,Z,C1),
                 path(Z,Y,C2,P1),
                 C is C1 + C2.
                 P = [X|P1].

prolog((G,Gs),Max) :- !,prolog(G,Max),prolog(Gs,Max).

prolog(G,_) :- predicate_property(G,built_in),!,G.

prolog(G,Max) :- Max>0,
		    Max1 is Max - 1,
		    clause(G,Body),
		    prolog(Body,Max1).
