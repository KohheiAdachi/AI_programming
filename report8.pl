%elm(L,E):リストLの要素と偶数番目か奇数番目かを求めるE
elm(L,E) :- L = [A,_|_],E=[A,1].
elm(L,E) :- L = [_,A|_],E=[A,0].
