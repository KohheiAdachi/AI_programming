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
