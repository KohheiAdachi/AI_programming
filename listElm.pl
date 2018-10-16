listElm(L,R) :- L = [X|_],
                    X = [_|_],
                    R = [X].
                    % listElm(T,R).
listElm([_|T],R) :- listElm(T,R).
