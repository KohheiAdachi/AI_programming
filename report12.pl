s(X,Z):-np(X,Y),vp(Y,Z).
np(X,Z):-det(X,Y),n(Y,Z).
np(X,Y):-pn(X,Y).
vp(X,Z):-v(X,Y),np(Y,Z).
det(a[X],X).
n([book|X],X).
n([pen|X],X).
pn([taro|X],X).
v([has|X],X).
v([have|X],X).