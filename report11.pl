select_list([],[],[]).

select_list([H|T],O,L) :- H = [_|_],!,
                          select_list(T,O1,L),
                          O = [H|O1].

select_list([H|T],O,L) :- H = [[]|_],!,
                          select_list(T,O,L1),
                          L = [H|L1]. 
