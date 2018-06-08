%アトムを要素とするリストL
%第２パラメータXに与えたアトムがあればその後に第３パラメータYのアトムを挿入した結果を第４パラメータAnsに求めるintertAll(L,X,Y,Ans)

insertAll([],_,_,[]).
insertAll(LL,X,Y,Out) :- LL = [Head|Tail],
                        subinsertAll(Head,X,Y,HeadAns),
                        insertAll(Tail,X,Y,Ans),
                        Out = [HeadAns|Ans].
subinsertAll([],_,_,[]).
subinsertAll(LL,X,Y,Ans) :- LL = [X|Head],
                            subinsertAll(Head,X,Y,Ans1),
                            Ans = [X,Y|Ans1].

subinsertAll(LL,X,Y,Ans) :- LL = [H|Head],
                            H \= X,
                            subinsertAll(Head,X,Y,Ans1),
                            Ans = [H|Ans1].

%数式Expを評価し，値をValに求める
eval(Exp,Val) :- number(Exp),Val=Exp.

eval(add(X,Y),Val) :- eval(X,V1),eval(Y,V2),Val is V1+V2.
eval(minus(X,Y),Val) :- eval(X,V1),eval(Y,V2),Val is V1-V2.
eval(times(X,Y),Val) :- eval(X,V1),eval(Y,V2),Val is V1*V2.
eval(divide(X,Y),Val) :- eval(X,V1),eval(Y,V2),Val is V1/V2.
