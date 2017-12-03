% Laboratory 5

parse(Cateorie, [Cuvant|S], S, [Cateorie,[Cuvant]]) :-
	cuvant(Cateorie, Cuvant).

parse(Cateorie, S1, S, [Cateorie, Arbore]) :-
	regula(Cateorie, Fii),
	parse_lista(Fii, S1, S, Arbore).

parse_lista([C|Categorii], S1, S, [A|Arbore]) :-
	parse(C, S1, S2, A),
	parse_lista(Categorii, S2, S, Arbore).
parse_lista([], S, S, []).

regula(s, [np, vp]).
regula(vp, [v]).
regula(vp, [v, np]).
regula(np, [n]).

cuvant(n, ana).
cuvant(n, mere).
cuvant(n, baietii).
cuvant(v, are).
cuvant(v, au).

general_parse(X, Arbore) :- parse(s, X, [], Arbore).
generate_all(L) :- findall(X, general_parse(X, _), L).
