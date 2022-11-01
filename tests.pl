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


test('coups possibles sans personne') :-
    coups_possibles([s], []).
test('gauche peut avancer') :-
    coups_possibles([g,s], [1]).

test('gauche peut sauter') :-
    coups_possibles([g,d,s], [1]).

test('un gauche peut sauter ou un gauche peut avancer') :-
    coups_possibles([g,g,s], [1,2]).

test('droite peut avancer') :-
    coups_possibles([s,d], [2]).

test('droite peut sauter') :-
    coups_possibles([s,g,d], [3]).

test('un droite peut sauter ou un droite peut avancer') :-
    coups_possibles([s,d,d], [2,3]).
test('avant dernier gauche peut sauter ou dernier gauche peut avancer') :-
    coups_possibles([g,g,g,g,s], R),
    R = [3,4].
:- end_tests(pas_japonais).


