:- module(japonais,[terrain/2,coups_possibles/2]).

terrain(0, [s]).
terrain(N, Resultat) :-
    append([g],CompleteADroite, Resultat),
    append(Initiale, [d], CompleteADroite),
    Nminus1 is N - 1,
    terrain(Nminus1, Initiale).

coups_possibles([],[]).
coups_possibles([s], []).
coups_possibles([g,s], [1]).
coups_possibles([g,d,s], [1]).
coups_possibles([g,g,s], [1,2]).
coups_possibles([s,d], [2]).
coups_possibles([s,d,g|_], [2]).
coups_possibles([s,g,d], [3]).
coups_possibles([s,d,d|_], [2,3]).
coups_possibles([X|Situation], [Aplus1,Bplus1]) :-
    coups_possibles(Situation, [A,B]),
    Aplus1 is A + 1,
    Bplus1 is B + 1.
coups_possibles([g,g,s,d,d,d,d], Resultat) :-
    append(AGauche, [s|ADroite], [g,g,s,d,d,d,d]),
    append(AGauche, [s], SituationGauche),
    length(AGauche, LG),
    append([s],Adroite, SituationDroite),
    coups_possibles(SituationGauche, ResultatGauche),
    coups_possibles(SituationDroite, ResultatDroite),
    maplist([X,Y]>>(integer(X), Y is X + LG + 1), ResultatDroite, ResultatDroiteAugmente),
    append(ResultatGauche, ResultatDroiteAugmente, Resultat).


% ggs    [1,2]
% ggsdddd  [3,4]
%



