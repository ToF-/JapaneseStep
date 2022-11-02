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
    resultat([g,s], d1, [s,g]).

test('un pas vers la droite') :-
    resultat([_,_,_,_,g,s,_,_], d1, [_,_,_,_,s,g,_,_]).

test('un pas vers la gauche') :-
    resultat([_,_,_,s,d,_], g1, [_,_,_,d,s,_]).

test('un saut vers la droite') :-
    resultat([_,_,_,g,_,s,_,_], d2, [_,_,_,s,_,g,_,_]).

test('un saut vers la gauche') :-
    resultat([_,_,s,_,d,_,_,_], g2, [_,_,d,_,s,_,_,_]).

test('un coup gagnant') :-
    resultat([g,s],Coup,[s,g]).

:- end_tests(pas_japonais).


