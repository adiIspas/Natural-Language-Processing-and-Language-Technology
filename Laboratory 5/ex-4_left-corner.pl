% Laboratory 5

% parse(Categorie, [Cuvant | SirRamas], Sir) :-
	% cuvant(Subcategorie, Cuvant),
	% completeaza(Subcategorie, Categorie, SirRamas, Sir).

% parse_lista([Categorie | Categorii], Sir1, Sir) :-
	% parse(Categorie, Sir1, Sir2),
	% parse_lista(Categorii, Sir2, Sir).

% parse_lista([], Sir, Sir).

% completeaza(Subcategorie, Subcategorie, Sir, Sir).
% completeaza(Subcategorie, Categorie, Sir1, Sir) :-
	% regula(Parinte, [Subcategorie | Rest]),
	% parse_lista(Rest, Sir1, Sir2),
	% completeaza(Parinte, Categorie, Sir2, Sir).

% regula(s, [np, vp]).
% regula(np, [det, n]).
% regula(np, [np, conj, np]).
% regula(vp, [v, np]).
% regula(vp, [v, np, pp]).
% regula(pp, [p, np]).

% cuvant(det, the).
% cuvant(det, all).
% cuvant(det, every).
% cuvant(p, near).
% cuvant(conj, and).
% cuvant(n, dog).
% cuvant(n, dogs).
% cuvant(n, cat).
% cuvant(n, cats).
% cuvant(n, elephant).
% cuvant(n, elephants).
% cuvant(v, chase).
% cuvant(v, chases).
% cuvant(v, see).
% cuvant(v, sees).
% cuvant(v, amuse).
% cuvant(v, amuses).

parse(C, [Cuvant|S2], S) :- cuvant(W, Cuvant), completeaza(W,C,S2,S).

parse_lista([C|Cs], S1, S) :- parse(C, S1, S2), parse_lista(Cs, S2, S).
parse_lista([], S, S).

completeaza(C,C,S,S).
completeaza(W,C,S1,S):-regula(P,[W|Rest]),parse_lista(Rest,S1,S2),completeaza(P,C,S2,S).

regula(s, [np, vp]).
regula(vp, [v, np]).
regula(np, [det, n]).

cuvant(det, un).
cuvant(det, niste).
cuvant(det, o).
cuvant(n, elev).
cuvant(n, elevi).
cuvant(n, carte).
cuvant(v, iubeste).
cuvant(v, iubesc).

% Exemplu apel: general_parse([niste, elevi, iubesc, o, carte]). - propozitia
% trebuie sa fie conforma cu gramatica pentru un raspuns yes.
general_parse(X) :- parse(s, X, []).
