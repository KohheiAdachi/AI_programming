%アトムを要素とするリストL
%第２パラメータXに与えたアトムがあればその後に第３パラメータYのアトムを挿入した結果を第４パラメータAnsに求めるintertAll(L,X,Y,Ans)

insertAll([],_,_,[]).
insertAll(LL,X,Y,Out) :- LL = [Head|Tail],
                        subinsertAll(Head,X,Y,HeadAns),
                        intertAll(Tail,X,Y,Ans),
                        Out = [X,Y|Ans].
subinsertAll(LL,X,Y,Ans1) :- LL = [X|Head],
                            subinsertAll(Head,X,Y,Ans1),
                            Ans = [X,Y|Ans1].

subinsertAll(LL,X,Y,Ans1) :- LL = [H|Head],
                            H \= X,
                            subinsertAll(Head,X,Y,Ans1),
                            Ans = [H|Ans1].
