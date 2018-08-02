append([],X,X).
append([A|X],Y,[A|Z]) :- !,append(X,Y,Z).
