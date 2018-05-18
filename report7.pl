%member(A,L)の定義
%単純処理
member(A,List) :- L = [A | _ ].
%再帰処理
member(A,L) :- L = [H | T],
                  A \= H,
                  member(A,T).
%append(X,Y,Z)の定義
%単純処理
append(X,Y,Z) :- X = [],Z = Y.
%再帰処理
append(X,Y,Z) :- X = [H|T],
                append(T,Y,Z1),
                Z = [H|Z1].
%unique(L,S)
%単純処理



%myRev(L,RL)
myRev([],RL) :- RL = []
myRev(L,RL) :- L = [X|T],
              append(Y,T,Z1),
              Z = [H | Z1].
