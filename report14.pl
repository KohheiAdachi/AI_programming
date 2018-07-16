:- dynamic have/2.
% conv読み込み
:- con('conv_st')
% 叙述文
s(X,Z,s(NP,VP),V) :- np(X,Y,NP,SS,N),
		     vp(Y,Z,VP,V,SS,VV),
		     member(N,VV).

np(X,Z,np(Det,N),Obj) :- det(X,Y,Det),
			 n(Y,Z,N,Obj).

np(X,Y,np(PN),SS,N) :- pn(X,Y,PN,SS,N).

np(X,Y,np(N),Obj):-n(X,Y,N,Obj).

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

%一文入力ごとの処理
simple_qa :- repeat,read_eng(Input),
						 (Input = [exit];(translate(Input,Meaning,DQ)->proc(Meaning,DQ),
						 write('意味が分かりません'),fail).



%平叙文解析
translate(In,Meaning,dec) :- s(In,[],_,Meaning),!.
%疑問文解析
translate(In,Meaning,ques) :- qs(In,[],_,Meaning).

%平叙文
proc(Meaning,dec) :- Meaning,!,wirte('すでに知っています。'),nl.
proc(Meaning,dec) :- assert(Meaning),write(Meaning),write('を知識ベースに追加しました。'),nl.

%疑問文
%\+ \+ P :- 否定の否定（パラメータに値が残らず成功失敗だけ分かる）
proc(Meaning,ques) :- \+ isdo(Meaning),
		      (\+ \+ Meaning -> all_ans(Meaning);write('知りません'),nl).
proc(Meaning,ques) :- isdo(Meaning),
		      (Meaning -> write('Yes'),nl;write('No'),nl).

all_ans(Meaning) :- Meaning,
							    s(Output,[],_,Meaning),
							    write(Output),nl,fail.
all_ans(_).

% Term = ..List :- リスト変換
% var(X) :- 自由変数かどうか
isdo(Meaning) :- Meaning =..Dolist,judge(Dolist).
judge([]).
judge([H|T]) :- \+ var(H),judge(T).



s(X,Z):-np(X,Y),vp(Y,Z).
np(X,Z):-det(X,Y),n(Y,Z).
np(X,Y):-n(X,Y).
np(X,Y):-pn(X,Y).
vp(X,Z):-v(X,Y),np(Y,Z).
%冠詞
det([a|X],X,det(a)).

n([book|X],X,n(book),book).
n([pen|X],X,n(pen),pen).
n([dogs|X],X,n(dogs),dogs).
n([cats|X],X,n(cats),cats).
pn([taro|X],X,pn(taro),taro,s3).
pn([yuki|X],X,pn(yuki),yuki,s3).
pn([cats|X],X,pn(cats),cats,p3).
pn([hukuoka|X],X,pn(hukuoka),hukuoka,s3).
pn([jiro|X],X,pn(jiro),jiro,s3).
pn([dogs|X],X,pn(dogs),dogs,s3).
%動詞
v([has|X],X,v(has),have(S,O),(S,O),[s3]).
v([like|X],X,v(like),like(S,O),(S,O),[s1,s2,p1,p2,p3]).
v([likes|X],X,v(likes),likes(S,O),(S,O),[s3]).
v([lives|X],X,v(lives),lives(S,O),(S,O),[s3]).
v([have|X],X,v(have),have(S,O),(S,O),[s1,s2,p1,p2,p3]).
%疑問詞
what([what|X],X,what(what),_).
av([do|X],X,(do),[s1,s2,p1,p2,p3]).
av([does|X],X,(does),[s3]).
