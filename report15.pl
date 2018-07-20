
% 経路の定義
arc(a,b,2).
arc(a,d,6).
arc(b,d,1).
arc(c,a,5).
arc(c,b,3).
arc(d,c,3).

path(a,c,C,P) :- arc(a,c,C),
                 P = [a,c].

path(a,c,C,P) :- arc(a,b,C1),
                 path(b,c,C2,P1),
                 C = C1 + C2.
                 P = [a|P1].

prolog((G,Gs),Max) :- !,prolog(G,Max),prolog(Gs,Max).

prolog(G,_) :- predicate_property(G,built_in),!,G.

prolog(G,Max) :- Max>0,
		    Max1 is Max - 1,
		    clause(G,Body),
		    prolog(Body,Max1).
