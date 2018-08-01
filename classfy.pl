% like(a,x).
% like(a,y).
% like(a,z).

like(taro,ruby).

classify(_,[],[],[]).

classify(A,L,Like,Dislike):-
                          L = [H|T],
                          like(A,H),
                          classify(A,T,Like2,Dislike),
                          Like = [H|Like2],!.

classify(A,L,Like,Dislike):-
                          L = [H|T],
                          % like(A,H),
                          classify(A,T,Like,Dislike2),
                          Dislike = [H|Dislike2].
