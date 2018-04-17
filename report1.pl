% father(X,Y):X is father of Y
father(jiro,taro).
father(jiro,mariko).
father(haruo,jiro).
father(haruo,kohei).

% mother(X,Y): X is mother of Y
mother(hanako,ichiro).
mother(hanako,mariko).
mother(kiyoko,hanako).
mother(kiyoko,kohei).
% grandfather(X,Z): X is grandfather of Z
grandfather(X,Z) :- father(X,Y),father(Y,Z).
grandfather(X,Z) :- father(X,Y),mother(Y,Z).
% grandmother(X,Z): X is grandmother of Z
grandmother(X,Z) :- mother(X,Y),father(Y,Z).
grandmother(X,Z) :- mother(X,Y),mother(Y,Z).

