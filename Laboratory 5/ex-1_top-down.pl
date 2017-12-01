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

cuvant(np, singular, 'Ana').
cuvant(np, singular, 'fruct').
cuvant(np, plural, 'pere').
cuvant(np, plural, 'mere').
cuvant(v, singular, 'are').

parse_s(X, Arbore) :- parse(s, _, X, [], Arbore).
generate_all(L) :- findall(X, parse_s(X, _), L).
