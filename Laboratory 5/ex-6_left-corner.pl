% Laboratory 5

parse(Categorie, [Cuvant | SirRamas], Sir, Arbore) :-
 cuvant(Subcategorie, Cuvant),
 completeaza(Subcategorie, Categorie, SirRamas, Sir, [Subcategorie, [Cuvant]], Arbore).

parse_lista([Categorie | Categorii], Sir1, Sir, [Arbore1 | Arbore]) :-
 parse(Categorie, Sir1, Sir2 , Arbore1),
 parse_lista(Categorii, Sir2, Sir, Arbore).

parse_lista([], Sir, Sir, []).

completeaza(Subcategorie, Subcategorie, Sir, Sir, Arbore, Arbore).
completeaza(Subcategorie, Categorie, Sir1, Sir, Arbore, ArboreRedus) :-
 regula(Parinte, [Subcategorie | Rest]),
 parse_lista(Rest, Sir1, Sir2, Arbore1),
 completeaza(Parinte, Categorie, Sir2, Sir, [Parinte, [Arbore | Arbore1]], ArboreRedus).

regula(s, [np, vp]).
regula(np, [det, n]).
regula(np, [np, conj, np]).
regula(vp, [v, np]).
regula(vp, [v, np, pp]).
regula(pp, [p, np]).

cuvant(det, the).
cuvant(det, all).
cuvant(det, every).
cuvant(p, near).
cuvant(conj, and).
cuvant(n, dog).
cuvant(n, dogs).
cuvant(n, cat).
cuvant(n, cats).
cuvant(n, elephant).
cuvant(n, elephants).
cuvant(v, chase).
cuvant(v, chases).
cuvant(v, see).
cuvant(v, sees).
cuvant(v, amuse).
cuvant(v, amuses).

% Exemplu apel: parse_sentence([all, dogs, sees, the, cat], A). - propozitia
% trebuie sa fie conforma cu gramatica pentru un raspuns yes.
parse_sentence(X, A) :- parse(s, X, [], A).
