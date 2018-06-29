% 叙述文
s(X,Z,s(NP,VP),V) :- np(X,Y,NP,SS,N),
		     vp(Y,Z,VP,V,SS,VV),
		     member(N,VV).

np(X,Z,np(Det,N),Obj) :- det(X,Y,Det),
			 n(Y,Z,N,Obj).

np(X,Y,np(PN),SS,N) :- pn(X,Y,PN,SS,N).

vp(X,Z,vp(Vt,NP),V,SS,VV) :- v(X,Y,Vt,V,(SS,Obj),VV),
		 	     np(Y,Z,NP,Obj).

% 疑問文
qs(A,E,qs(Wh,Av,NP,Vt),V) :- what(A,B,Wh,Q),
	         	     av(B,C,Av,List),
			     np(C,D,NP,SS,N),
			     v(D,E,Vt,V,(SS,Q),_),
		      	     member(N,List).

qs(A,D,qs(Av,Np,Vp),V) :- av(A,B,Av,List),
			  np(B,C,Np,SS,N),
			  vp(C,D,Vp,V,SS,_),
			  member(N,List).




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
