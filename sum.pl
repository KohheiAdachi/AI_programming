s([],0).
s(L,S):-
  L = [H|T],
  s(T,R),
  S is H+R.
