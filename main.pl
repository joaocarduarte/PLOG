:- use_module(library(lists)).
:- use_module(library(random)).
:- use_module(library(clpfd)).
:- use_module(library(samsort)).

config_file('/Users/veryc/Desktop/PLOP/TP2(git)/PLOG/config.pl').

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

mais_barato(ListPreco) :- 
	sopa(A,P1),
	prato(B,P2),
	sobremesa(C,P3),
	append([], [P1, P2, P3], ListPreco).

mais_baratinho([X|Y]) :-
	Zero is 10,
	Zero < X,
	write(X);
	Zero > X,
	write(Y).


teste :-
	read_config,
	mais_barato(ListPreco),
	mais_baratinho(ListPreco).