% Laboratory 5

parse(Cateorie, Numar, [Cuvant|S], S, [Cateorie,[Cuvant]]) :-
	cuvant(Cateorie, Numar, Cuvant).

parse(Cateorie, Numar, S1, S, [Cateorie, Arbore]) :-
	regula(Cateorie, Numar, NumereFii, Fii),
	parse_lista(Fii, NumereFii, S1, S, Arbore).

parse_lista([C|Categorii], [N|Numere], S1, S, [A|Arbore]) :-
	parse(C, N, S1, S2, A),
	parse_lista(Categorii, Numere, S2, S, Arbore).
parse_lista([], [], S, S, []).

regula(s, _, [Numar, Numar], [np, vp]).
regula(vp, Numar, [Numar], [v]).
regula(vp, Numar, [Numar, _], [v, np]).
regula(np, Numar, [Numar], [n]).

cuvant(n, singular, ana).
cuvant(n, plural, mere).
cuvant(n, plural, baietii).
cuvant(v, singular, are).
cuvant(v, plural, au).

general_parse(X, Arbore) :- parse(s, _, X, [], Arbore).
generate_all(L) :- findall(X, general_parse(X, _), L).
