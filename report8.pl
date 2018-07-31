%elm(L,E):リストLの要素と偶数番目か奇数番目かを求めるE
elm(L,E) :- L = [A|_],E=[A,1].
elm(L,E) :- L = [_,A|_],E=[A,0].
elm(L,E) :- L = [_,_|A],elm(A,E).

%combination(S,X):集合Sの要素の組み合わせXを求める
combination([],[]).
combination([A|B],[A|C]) :- combination(B,C).
combination([_|B],C) :- combination(B,C).


% combination([],[]).
% combination(X,[H|T]) :- combination(Z,T),
%                         X = [H|Z].
% combination(X,[_|T]) :- combination(Z,T),
%                         X = Z.
