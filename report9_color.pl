%色の定義
color(red).
color(while).
color(blue).
color(yellow).
%接している領域の定義
conn(a,e).
conn(a,d).
conn(a,c).
conn(a,b).
conn(d,a).
conn(d,c).
conn(d,b).
conn(e,b).
conn(b,c).
%逆説対応
border(X,Y) :- conn(X,Y).
border(Y,X) :- conn(X,Y).
%関数本体
paint([],[]).
paint(In,Re) :- In = [H|T],
                paint(T,Re1),
                subpaint(Re1,H,C)).
                Re = [[H,C]|Re1].
%sub_paint
subpaint([],_,C) :- color(C).
subpaint([[HH,HT]|T],In,C):-
                          subpaint(T,In,C1),
                          border(In,HH),
                          C1 \== HT,
                          C = C1.

subpaint([[HH,_]|T],In,C) :- subpaint(T,In,C1),
                            \+border(In,HH),
                            C=C1.
