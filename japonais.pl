:- module(japonais,[terrain/2,coups_possibles/2]).

terrain(0, [s]).
terrain(N, Resultat) :-
    append([g],CompleteADroite, Resultat),
    append(Initiale, [d], CompleteADroite),
    Nminus1 is N - 1,
    terrain(Nminus1, Initiale).

coups_possibles([s], []).
coups_possibles([g,s], [1]).
coups_possibles([g,d,s], [1]).
coups_possibles([g,g,s], [1,2]).
coups_possibles([s,d], [2]).
coups_possibles([s,g,d], [3]).
coups_possibles([s,d,d], [2,3]).
coups_possibles([X|Situation], [Aplus1,Bplus1]) :-
    coups_possibles(Situation, [A,B]),
    Aplus1 is A + 1,
    Bplus1 is B + 1.



