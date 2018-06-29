s(X,Z):-np(X,Y),vp(Y,Z).

np(X,Z):-det(X,Y),n(Y,Z).
np(X,Y):-pn(X,Y).
vp(X,Z):-v(X,Y),np(Y,Z).

det([a|X],X,det(a)).
n([book|X],X,n(book),book).
n([pen|X],X,n(pen),pen).
pn([taro|X],X,pn(taro),taro,s3).
v([has|X],X,v(has),have(S,O),(S,O),[s3]).
v([have|X],X,v(have),have(S,O),(S,O),[s1,s2,s3,p1,p2,p3]).
what([what|X],X,what(what),?).
av([do|X],X,(do),[s1,s2,p1,p2,p3]).
av([does|X],X,(does),[s3]).
