% queen(N,Result): Nクイーンの解をResultに求める.
queen(N,Result):-generate(N,S),queen_acc(N,S,[],Result,[],[]).

% queen_print(N,Result): N クイーンの解Resultを求め端末に印刷する．
queen_print(N,Result) :- generate(N,S),queen_acc(N,S,[],Result,[],[]),disp(Result,N).

% １からNまでの数を要素とするリストを生成する。
% generate(N,S) : Ｎまでの数字のリストがS




% 与えられたリストの中から要素を一つ選ぶ。
% select(S,A,Rest) : リストSの中から一つの要素Aをとり出した残りのリストがRest
%  バックトラックするごとに、別の要素を選択する。



% リストの要素でないことを確認する。
% notmem(A,L) : AがリストＬの要素でない時成功




% クイーンを配置し、取り合う関係にないことを検査する。
% queen_acc(N,S,PosAcc,PosResult,WaListAcc,SaListAcc) :
%  N, S: N 行目に配置するqueenの列番号をS から選ぶ。
%  PosAcc ; queenを配置する列番号用のアキュムレータ
%  PosResult : queenを配置する列番号の最終結果
%  WaListAcc : 行番号と列番号の和を蓄えるためのアキュムレータ。最終結果は返さない。
%  SaListAcc : 行番号と列番号の差を蓄えるためのアキュムレータ。最終結果は返さない。





% 結果を表示する。
% disp(Result,N):Nクイーンの解Resultを表示する.

disp([],_):- nl.
disp([A|X],N):- disp1(A,N),nl,disp(X,N).

disp1(1,Y):- write(' Q'),disp2(Y).
disp1(X,Y):- X > 1,X1 is X-1, Y1 is Y-1, write(' .'), disp1(X1,Y1).

disp2(1).
disp2(X):- X > 1,X1 is X-1, write(' .'), disp2(X1).

