% to run the tests:
% swipl -g run_tests -t halt tests.pl

:- begin_tests(pas_japonais).


:- use_module('japonais'). 

test('terrain sans personne') :-
    terrain(0,[s]).

test('terrain avec 1 personne de chaque') :-
    terrain(1,[g,s,d]).

test('terrain avec 4 personnes de chaque') :-
    terrain(4,[g,g,g,g,s,d,d,d,d]).


test('apres un coup de gauche vers la droite, le gauche est à droite'):-
    resultat([g,s], marcheDroite, [s,g]).

test('un pas vers la droite') :-
    resultat([_,_,_,_,g,s,_,_], marcheDroite, [_,_,_,_,s,g,_,_]).

test('un pas vers la gauche') :-
    resultat([_,_,_,s,d,_], marcheGauche, [_,_,_,d,s,_]).

test('un saut vers la droite') :-
    resultat([_,_,_,g,_,s,_,_], sauteDroite, [_,_,_,s,_,g,_,_]).

test('un saut vers la gauche') :-
    resultat([_,_,s,_,d,_,_,_], sauteGauche, [_,_,d,_,s,_,_,_]).

test('un coup gagnant') :-
    resultat([g,s],Coup,[s,g]).

test('un chemin gagnant a un coup') :-
    chemin([g,s],Chemin,[s,g]).

test('un chemin gagnant a deux coups') :-
    chemin([g,s,d],Chemin,[d,g,s]).

:- end_tests(pas_japonais).


