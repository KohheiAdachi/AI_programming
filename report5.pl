%ルートの定義
arc(a,b,2).
arc(a,c,5).
arc(a,d,6).
arc(b,c,3).
arc(b,d,1).
arc(d,c,3).
%中継点なしの時
cost(X,Y,C) :- arc(X,Y,C).
%中継点ありの時
cost(X,Y,C) :- arc(X,C1,D1),
               cost(C1,Y,Ans),
               C is C1 + Ans.
