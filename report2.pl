%%parent(X,Y):X is parent of Y
parent(jiro,taro).
parent(jiro,mariko).
parent(haruo,jiro).
parent(haruo,kohei).

%% parent(X,Y): X is parent of Y
parent(hanako,ichiro).
parent(hanako,mariko).
parent(kiyoko,hanako).
parent(kiyoko,nanako).

%% male(X): X is male
male(jiro).
male(taro).
male(haruo).
male(kohei).

%% female(X) : X is female
female(mariko).
female(hanako).
female(kiyoko).
 
%% father(X,Y):X is father of Y
father(X,Y) :- parent(X,Y),male(X).

%% mother(X,Y): X is mother of Y.
mother(X,Y) :- parent(X,Y),female(X).

%% brother(X,Z): X is brother of Z.
brother(Y,Z) :- parent(X,Y),parent(X,Z),male(Y),male(Z).

%% sister(X,Z): X is sister of Z.
sister(Y,Z) :- parent(X,Y),parent(X,Z),female(Y),female(Z).



