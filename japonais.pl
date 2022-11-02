:- module(japonais,[terrain/2,resultat/3, chemin/3]).

coup(d1).
coup(d2).
coup(g1).
coup(g2).

terrain(0, [s]).
terrain(N, Resultat) :-
    append([g],CompleteADroite, Resultat),
    append(Initiale, [d], CompleteADroite),
    Nminus1 is N - 1,
    terrain(Nminus1, Initiale).


resultat(Terrain, d1, Resultat) :-
    append(Gauche, [g,s|Droite], Terrain),
    append(Gauche, [s,g|Droite], Resultat).

resultat(Terrain, g1, Resultat) :-
    append(Gauche, [s,d|Droite], Terrain),
    append(Gauche, [d,s|Droite], Resultat).

resultat(Terrain, d2, Resultat) :-
    append(Gauche, [g,X,s|Droite], Terrain),
    append(Gauche, [s,X,g|Droite], Resultat).

resultat(Terrain, g2, Resultat) :-
    append(Gauche, [s,X,d|Droite], Terrain),
    append(Gauche, [d,X,s|Droite], Resultat).

