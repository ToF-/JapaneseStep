:- module(japonais,[terrain/2,resultat/3, chemin/3]).
    
pion(g).
pion(d).

coup(marcheDroite).
coup(sauteDroite).
coup(marcheGauche).
coup(sauteGauche).

terrain(0, [s]).
terrain(N, Resultat) :-
    append([g],CompleteADroite, Resultat),
    append(Initiale, [d], CompleteADroite),
    Nminus1 is N - 1,
    terrain(Nminus1, Initiale).


resultat(Terrain, marcheDroite, Resultat) :-
    append(Gauche, [g,s|Droite], Terrain),
    append(Gauche, [s,g|Droite], Resultat).

resultat(Terrain, marcheGauche, Resultat) :-
    append(Gauche, [s,d|Droite], Terrain),
    append(Gauche, [d,s|Droite], Resultat).

resultat(Terrain, sauteDroite, Resultat) :-
    append(Gauche, [g,X,s|Droite], Terrain),
    append(Gauche, [s,X,g|Droite], Resultat).

resultat(Terrain, sauteGauche, Resultat) :-
    append(Gauche, [s,X,d|Droite], Terrain),
    append(Gauche, [d,X,s|Droite], Resultat).

chemin(Terrain, [X], Resultat) :-
    resultat(Terrain, X, Resultat).
chemin(Terrain, [X|ResteChemin], Resultat) :-
    chemin(Terrain, ResteChemin, ResultatIntermediaire),
    resultat(ResultatIntermediaire, X, Resultat).



