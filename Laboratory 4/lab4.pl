% Laboratory 4

% Auxiliary functions.
% ----------
% Check if a element is member in a list.
% X - element to check
% L - list for check
isMemberInList(X, [X|_]).
isMemberInList(X, [_|L]) :- isMemberInList(X, L).

% Define table of game.
% line/column
tableOfGame([1/_, 2/_, 3/_, 4/_, 5/_, 6/_, 7/_, 8/_]).

% Define absolute difference between two numbers.
% N1 - first number
% N2 - second number
% ABS - absolute difference
absDifference(N1, N2, ABS) :- ABS is N1 - N2, N1 - N2 >= 0.
absDifference(N1, N2, ABS) :- ABS is -(N1 - N2), N1 - N2 < 0.

% Main functions.
% ----------
% Check if a space on the table is free
% L - line
% C - column
% S - previous solutions
% TL - temp line
% TC - temp column
freeSpace(_, []).
freeSpace(L/C, [TL/TC|S]) :- C =\= TC,
                             L =\= TL,
                             absDifference(TC, C, ABS1),
                             absDifference(TL, L, ABS2),
                             ABS1 =\= ABS2,
                             freeSpace(L/C, S).

% Find solutions on the table.
% L - line
% C - column
% S - solution on the table
findSolutions([]).
findSolutions([L/C|S]) :- findSolutions(S), isMemberInList(C, [1, 2, 3, 4, 5, 6, 7, 8]), freeSpace(L/C, S).
