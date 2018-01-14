% Top-down cu harta si agenda.

:- dynamic muchie / 5 .

init_agenda([], _, []).
init_agenda([Cuvant|Cuvinte], V0, Agenda) :-
  V1 is V0 + 1,
  findall(muchie(V0, V1, Categorie, [], [Cuvant, Categorie]), cuvant(Categorie, Cuvant), Agenda1),
  init_agenda(Cuvinte, V1, Agenda2),
  append(Agenda1, Agenda2, Agenda).

extinde_muchii([], Harta, Harta).
extinde_muchii([Muchie|Agenda1], Harta1, Harta2) :-
  membru(Muchie, Harta1), !,
  extinde_muchii(Agenda1, Harta1, Harta2).
extinde_muchii([Muchie|Agenda1], Harta1, Harta3) :-
  Harta2 = [Muchie|Harta1],
  muchii_noi(Muchie,Harta2,Muchii),
  adauga_muchii(Muchii,Agenda1,Agenda2),
  extinde_muchii(Agenda2,Harta2,Harta3).

membru(X,[X|_]).
membru(X,[_|Y]) :- membru(X,Y).

adauga_muchie(Muchie,Muchii,Muchii) :-
  membru(Muchie, Muchii),!.
adauga_muchie(Muchie,Muchii,[Muchie|Muchii]).

adauga_muchii([],Muchii,Muchii).
adauga_muchii([Muchie|Muchii],Muchii1,Muchii3) :-
  adauga_muchie(Muchie,Muchii1,Muchii2),
  adauga_muchii(Muchii,Muchii2,Muchii3).

init_activ(Categorie,Varf,Muchii) :-
  findall(muchie(Varf,Varf,Categorie,Categorii,[Categorie]),regula(Categorie,Categorii),Muchii).

muchii_noi(muchie(V1,V2,Categorie1,[],Analiza),Harta,Muchii) :-
  findall(muchie(V0,V2,Categorie2,Categorii,[Analiza|Analize]), membru(muchie(V0,V1,Categorie2,[Categorie1|Categorii],Analize),Harta),Muchii).
muchii_noi(muchie(V1,V2,Categorie1,[Categorie2|Categorii],Analize),Harta,Muchii) :-
  init_activ(Categorie2, V2, Muchii1),
  findall(muchie(V1,V3,Categorie1,Categorii,[Analiza|Analize]),membru(muchie(V2,V3,Categorie2,[],Analiza),Harta),Muchii2),
  append(Muchii1,Muchii2,Muchii).

parse(Cat,Sir) :-
  init_agenda(Sir,0,Harta1),
  init_activ(Cat,0,Agenda),
  extinde_muchii(Agenda,Harta1,Harta2),
  membru(muchie(0,M,Cat,[],Analiza),Harta2),
  mwrite(Analiza),
  N is M+1,
  \+(membru(muchie(_,N,_,_),Harta2)).

regula(s,[np,vp]).
regula(vp,[v,np]).
regula(np,[det,n]).

cuvant(det,un).
cuvant(det,niste).
cuvant(det,o).
cuvant(n,elev).
cuvant(n,elevi).
cuvant(n,carte).
cuvant(v,iubeste).
cuvant(v,iubesc).

mwrite(Arbore) :- oglinda(Arbore, Imagine), print(Imagine), nl.

oglinda([],[]) :- !.
oglinda(Atom,Atom) :- atomic(Atom).
oglinda([X1|X2],Imagine) :- oglinda(X1,Y2),
  oglinda(X2,Y1),
  append(Y1,[Y2],Imagine).
