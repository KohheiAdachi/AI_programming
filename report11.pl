%select_list(In,L,O) 任意のデータを要素とするリストを与えられた時に，リストである要素とリスト以外の要素に分ける
select_list([],[],[]).

select_list([[]|T],[[]|[L]],O) :- !,
                          select_list(T,L,O).

select_list([[A|B]|T],[[A|B]|L],O) :- !,
                          select_list(T,L,O).
select_list([H|T],L,[H|O]) :- !,select_list(T,L,O).

%node_n(In,N) 木を表現するリストを第１パラメータに与え，葉ノードの数を第２パラメータに与える．
node_n([],0).

node_n([H|T],N):-H=[_|_],!,node_n(H,N1),node_n(T,N2),N is N1+N2.

node_n([_|T],N):-!,node_n(T,N1),N is N1+1.
