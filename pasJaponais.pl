use_module(library(clpfd)).

moyenne(A, B, C, Resultat) :-
    Resultat is (A+B+C) / 3.

testMoyenne([A, B, C], SortieAttendue) :-
    moyenne(A, B, C, SortieAttendue).

test("La moyenne de 1, 2 et 3 est 2", [moyenne, 1, 2, 3, 2]).
test("La moyenne de 2, 2 et 2 est 2", [moyenne, 2, 2, 2, 2]).
test("La moyenne de 2, 2 et 2 est 4", [moyenne, 2, 2, 2, 4]).

green(Name) :-
    test(Name,  Test),
    L =.. Test,
    call(L).

red(Name) :-
    test(Name,  Test),
    L =.. Test,
    not(call(L)).
