
%結果
fact(N,Result) :- N = 0,Result = 1.

%条件
fact(N,Result) :- N = 0,Result = 1.
fact(N,Result) :- N > 0,
                  N1 is N-1,
                  fact(N1,Ans),
                  Result is N * Ans.
