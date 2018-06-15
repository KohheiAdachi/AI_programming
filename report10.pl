%ルートの定義
arc(a,b,2).
arc(a,c,5).
arc(a,d,6).
arc(b,c,3).
arc(b,d,1).
arc(d,c,3).

%中継点なしの時
path(X,Y,P,L):-path(X,Y,[],P,0,L).
path(X,Y,AccP,P,AccL,L) :- arc(X,Y,L1),
                           append(AccL,[X,Y],P),
                           L is AccL + L1.

%中継点ありの時
path(X,Y,C,P) :- arc(X,C1,L1),
                 Y \= C1,
                 \+member(C1,AccP),
                 append(AccP,[X],AccPP),
                 AccLL is AccL + L1,
                 path(C,B,AccPP,P,AccLL,L).
