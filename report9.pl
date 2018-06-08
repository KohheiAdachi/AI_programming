%アトムを要素とするリストL
%第２パラメータXに与えたアトムがあればその後に第３パラメータYのアトムを挿入した結果を第４パラメータAnsに求めるintertAll(L,X,Y,Ans)

insertAll([],_,_,[]).
insertAll(LL,X,Y,Ans) :- LL = [Head|Tail],
                        subinsertAll(Head,X,Y,HeadOut),
                        intertAll(Tail,X,Y,Out),
                        Ans = [HeadOut|Out].
