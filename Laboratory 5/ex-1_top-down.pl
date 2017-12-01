parse(C, [Cuvant|S], S) :- cuvant(C, Cuvant).
parse(C, S1, S) :- regula(C, Cs), parse_lista(Cs, S1, S).

parse_lista([C|Cs], S1, S) :- parse(C, S1, S2), parse_lista(Cs, S2, S).
parse_lista([], S, S).

regula(s, [np, vp]).
regula(vp, [v]).
regula(vp, [v, np]).

cuvant(np, 'Colentina').
cuvant(np, 'Dr. Popescu').
cuvant(np, 'pacienti').
cuvant(np, 'surori').
cuvant(v, 'merge').
cuvant(v, 'angajeaza').
