% Laboratory 5

parse(C, S1, S, Numar) :- cuvant(W, Numar, S1, S2),P=..[W, C, S2, S, Numar],call(P).

% Reguli PS si clauze de terminare

s(s, X, X, _).
vp(vp, X, X, _).
n(n, X, X, _).
pp(pp, X, X, _).
conj(conj, X, X, _).

% S --> NP VP
np(C, S1, S, Numar) :- parse(vp, S1, S2, Numar), s(C, S2, S, Numar).

% NP --> NP Conj NP
np(C, S1, S, Numar) :- parse(conj, S1, S2, Numar), parse(np, S2, S3, Numar), np(C, S3, S, plural).
np(np, X, X, _).

% NP --> Det N
det(C, S1, S, Numar) :- parse(n, S1, S2, Numar), np(C, S2, S, Numar).
det(det, X, X, _).

% VP --> V NP
v(C, S1, S, Numar) :- parse(np, S1, S2, _), vp(C, S2, S, Numar).

% VP --> V NP PP
v(C, S1, S, Numar) :- parse(np, S1, S2, _), parse(pp, S2, S3, _), vp(C, S3, S, Numar).
v(v, X, X, _).

% PP --> P NP
p(C, S1, S, _) :- parse(np, S1, S2, Numar), pp(C, S2, S, Numar).
p(p, X, X, _).

% Lexicon
cuvant(det, _, [the|X], X).
cuvant(det, plural, [all|X], X).
cuvant(det, singular, [every|X], X).
cuvant(p, _, [near|X], X).
cuvant(conj, _, [and|X], X).
cuvant(n, singular, [dog|X], X).
cuvant(n, plural, [dogs|X], X).
cuvant(n, singular, [cat|X], X).
cuvant(n, plural, [cats|X], X).
cuvant(n, singular, [elephant|X], X).
cuvant(n, plural, [elephants|X], X).
cuvant(v, singular, [chase|X], X).
cuvant(v, plural, [chases|X], X).
cuvant(v, singular, [see|X], X).
cuvant(v, plural, [sees|X], X).
cuvant(v, singular, [amuse|X], X).
cuvant(v, plural, [amuses|X], X).

% Exemplu apel: parse_sentence([the, dog, see, the, cat]). - propozitia
% trebuie sa fie conforma cu gramatica pentru un raspuns yes.
parse_sentence(S) :- parse(s, S, [], _).
