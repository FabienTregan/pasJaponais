
depart(N,  Rs) :-
    even(N),
    N2 is N/2,
    fill(regarde_a_droite, N2, Ds),
    fill(regarde_a_gauche, N2, Gs),
    append(Ds, [vide|Gs], Rs).

arrivee(N, Rs) :-
    depart(N, Xs),
    reverse(Xs, Rs).

marche(L, N, Rs) :-
    V is N + 1,
    nth1(N, L, regarde_a_droite),
    nth1(V, L, vide),

    LA is N - 1,
    take(LA, L, As),

    drop(V, L, Bs),

    append(As, [vide | [ regarde_a_droite | Bs]], Rs).

%-----------%
%   Tests   %
%-----------%

% Find all failing tests with : ?- red(X).
% Find all passing tests with : ?- green(X).

test("position de départ à 2 joueurs", depart(2, [regarde_a_droite, vide, regarde_a_gauche])).
test("position de départ à 4 joueurs", depart(4, [regarde_a_droite, regarde_a_droite, vide, regarde_a_gauche, regarde_a_gauche])).
test("position d'arrivée à 2 joueurs", arrivee(2, [regarde_a_gauche, vide, regarde_a_droite])).
test("position d'arrivée à 4 joueurs", arrivee(4, [regarde_a_gauche, regarde_a_gauche, vide, regarde_a_droite, regarde_a_droite])).
test("Marche droite", marche([regarde_a_droite, vide, regarde_a_gauche], 1, [vide, regarde_a_droite, regarde_a_gauche])).

red(X) :-
    test(X, T),
    not(call(T)).

green(X) :-
    test(X, T),
    call(T).

%-----------%
%  helpers  %
%-----------%

even(X) :-
    0 is mod(X, 2).

fill(X, 0, []).

fill(X, N, [X|Xs]) :-
    succ(N0, N),
    fill(X, N0, Xs).

drop(0, R, R).
drop(N, [_|H], R) :-
    succ(N1, N),
    drop(N1, H, R).

take(0, _, []) :- !.
take(N, [H|TA], [H|TB]) :-
	N > 0,
	N2 is N - 1,
	take(N2, TA, TB).



