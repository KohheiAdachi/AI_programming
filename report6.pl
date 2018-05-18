%ルートの定義
arc(a,b,2).
arc(a,c,5).
arc(a,d,6).
arc(b,c,3).
arc(b,d,1).
arc(d,c,3).
%中継点なしの時
path(X,Y,C,P) :- arc(X,Y,C),P=[X,Y].
%中継点ありの時
path(X,Y,C,P) :- arc(X,C1,D1),
               path(C1,Y,Ans,P1),
               C is D1 + Ans,
               P = [X|P1].
