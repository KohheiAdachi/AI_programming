%ルートの定義
arc(a,b,2).
arc(c,a,5).
arc(a,d,6).
arc(c,b,3).
arc(b,d,1).
arc(d,c,3).

path(X,Y,P,L) :- path(X,Y,[],P,0,L).

path(X,X,P,[X|P],L,L).

path(X,Y,AccP,P,AccL,L) :- arc(Z,Y,L1),\+member(Z,AccP),
                           L2 is AccL+L1,
                           path(X,Z,[Y|AccP],P,L2,L).
	
