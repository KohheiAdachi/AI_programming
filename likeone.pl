like(taro,car).
like(taro,panda).



% likeone(_,[],[]).
%
% likeone(X,L,R) :- L=[H|T],
%                   like(X,H),
%                   likeone(X,T,R),
%                   R = [H|R1].
%
% likeone(X,[_|T],R) :- likeone(X,T,R).

likeone(X,[R|_],R) :- like(X,R).
likeone(X,[_|T],R) :- likeone(X,T,R).
