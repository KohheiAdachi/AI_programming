select_list([],[],[]).

select_list([[]|T],[[]|[L]],O) :- !,
                          select_list(T,L,O).

select_list([[A|B]|T],[[A|B]|L],O) :- !,
                          select_list(T,L,O).
select_list([H|T],L,[H|O]) :- !,select_list(T,L,O).

node_n([],0).

node_n([H|T],N):-H=[_|_],!,node_n(H,N1),node_n(T,N2),N is N1+N2.

node_n([_|T],N):-!,node_n(T,N1),N is N1+1.


