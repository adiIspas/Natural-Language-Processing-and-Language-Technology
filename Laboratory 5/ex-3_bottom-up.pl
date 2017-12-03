% Laboratory 5

parse(Sir, Rezultat) :- depl_red(Sir, [], Rezultat).

% Predicatul depl_red(S, Stiva, Rezultat) analizeaza sirul de intrare S, unde
% Stiva este lista categoriilor analizate pana la momentul curent. Atunci cand
% Sirul de intrare devine vid, inseamna ca toate cuvintele au fost deplasate in
% stiva si reduse, deci stiva contine chiar rezultatul.
% Predicatul depl_red se defineste recusiv astfel:

depl_red(Sir, Stiva, Rezultat) :-
	deplasare(Stiva, Sir, StivaNoua, SirRedus),
	reducere(StivaNoua, StivaRedusa),
	depl_red(SirRedus, StivaRedusa, Rezultat).

depl_red([], Rezultat, Rezultat).


% OBSERVATIE: predicatul deplasare esueaza daca sirul de intrare este vid, Sirul
% de intrare devine vid atunci cand toate cuvintele sale au fost deplasate in
% stiva si reduse, deci in cazul tratat de clauza depl_red anterioara.
% Astfel, in cazul general, predicatul deplasare se defineste astfel:

deplasare(Stiva, [Cuvant|SirRamas], [Cuvant|Stiva], SirRamas).


% Predicatul reducere(Stiva, StivaNoua) reducere in mod repetat varful stivei,
% pentru a forma constituenti mai putini, dar mai ampli. Definitia recusiva este:

reducere(Stiva, StivaRedusa) :-
	iregula(Stiva, Stiva1),
	reducere(Stiva1, StivaRedusa).

reducere(Stiva, Stiva).


% Definita a tinut cont de cazul cand nu exista nici o iregula, deci nu se poate
% efectua nici o reducere. La clauza reducere(Stiva, Stiva) se ajunge atunci
% cand nu se poate aplica o iregula si stiva ramane neschimbata.

% Regulile PS ale gramaticii se memoreaza tot inapoi.

iregula([vp, np|X], [s|X]).
iregula([v|X], [vp|X]).
iregula([np, v|X], [vp|X]).

% Pentru ca lexiconul sa poata fi utilizat este nevoie, in plus, de specificarea
% urmatoarei reguli inapoi:

iregula([Cuvant|X], [Categorie|X]) :- cuvant(Categorie, Cuvant).

% Lexiconul este:
cuvant(np, 'Dr. Popescu').
cuvant(np, 'Colentina').
cuvant(np, surori).
cuvant(np, pacienti).
cuvant(v, ingrijesc).
cuvant(v, angajeaza).

general_parse(X) :- parse(X, [s]).
