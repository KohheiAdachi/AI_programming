% read_eng(St) : 単語をスペースで区切り、文末がピリオドまたは？の
% 英文を読み, 単語を要素とするリストをStに返す。
read_eng(ST) :-
	read_sentence(R),conv1(R,ST).

% conv1(In,Out) : 文字アトムのリストInから単語をきりだし、
%  単語を要素とするリストOutを返す。
conv1([],[]) :- !.
conv1(String,[Word|List]) :-
	get_word1(String,Rest,Word_list),
	atom_chars(Word,Word_list),
	conv1(Rest,List).

% get_word1(In,Acc,Word) : 文字アトムのリストInから
%  単語Wordを切り出す。余分なスペースはよみとばす。
get_word1([],[],[]).
get_word1([' '|R],RR,[]) :- !,
	skip_space(R,RR).
get_word1([A|R],RR,[A|L]) :-
	get_word1(R,RR,L).

skip_space([' '|R],RR) :- !,
	skip_space(R,RR).
skip_space(R,R).

% .か?までを１byteずつ読む。
read_sentence(R) :-
	get_char(C),read_st(C,R).

% .か?がきたらおわり。後ろのCRを読み飛ばす。
read_st('.',[]) :- get_char(_),!.
read_st('?',[]) :- get_char(_),!.
read_st(C,R) :- name(C,[10]),!,
	read_sentence(R).
read_st(C,[C|R]) :-
	read_sentence(R).
