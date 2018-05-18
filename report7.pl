%member(A,L)の定義
%単純処理
my_member(A,List) :- L = [A | _ ].
%再帰処理
my_member(A,L) :- L = [H | T],
                  A \= H,
                  member(A,T).
%append(X,Y,Z)の定義
%単純処理
my_append(X,Y,Z) :- X = [],Z = Y.
%再帰処理
my_append(X,Y,Z) :- X = [H|T],
                append(T,Y,Z1),
                Z = [H|Z1].
%unique(L,S)
%単純処理
unique(L,S) :- L =[A | []],S = [A].
%再帰処理
unique(L,S) :- L = [H|T],
	       unique(T,S1),
	       \+member(H,S1),
	       S = [H|S1].
unique(L,S) :- L = [H|T],
               unique(T,S1),
	             member(H,S1),
	             S = S1.

intersec(X,Y,Z) :- X = [H | T],
                   member(H,Z1),
                   Z = Z1.
intersec(X,Y,Z) :- X = [H | T],
                   \+member(H,Z1),
                   Z = [H|Z1].


%myRev(L,RL)
myRev([],RL) :- RL = [].
myRev(L,RL) :- L = [H|T],
              myRev(T,RL1),
              my_append(RL1,[H],RL).
