:- use_module(library(lists)).
:- use_module(library(random)).
:- use_module(library(clpfd)).
:- use_module(library(samsort)).

config_file('/Users/Eduardo Reis/Documents/PLOG/PLOG/config.pl').

read_config :-
    config_file(F),
    open(F, read, Str),
    read_file(Str, _),
    close(Str).

read_file(Stream, []) :-
    at_end_of_stream(Stream).
read_file(Stream, [X|L]) :-
    \+ at_end_of_stream(Stream),
    read(Stream, X),
    assert(X),
    read_file(Stream, L).

listas(ListPreco) :-
        sopa(A, P1),
        prato(B, P2),
        sobremesa(C, P3),
        append([], [P1, P2, P3], ListPreco).

mais_baratinho(Lista, W) :-
        samsort(Lista, [X|Y]),
        W is X.

teste :-
	read_config,
	listas(ListPreco),
	mais_baratinho(ListPreco, W),
        write(W).