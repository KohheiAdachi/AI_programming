select_list([],[],[]).

select_list([H|T],L,O) :- H = [_|_],!,
                          select_list(T,L1,O),
                          L = [H|O1].

select_list([H|T],L,O) :- H = [[]|T],!,
                          select_list(T,L,O1),
                          O = [[]|O1].
