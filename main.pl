:- use_module(library(lists)).
:- use_module(library(random)).
:- use_module(library(clpfd)).
:- use_module(library(samsort)).

%config_file('/Users/veryc/Desktop/PLOP/TP2(git)/PLOG/config.pl').
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
	sopa(P1, A),
        append([],[P1,A], Sopa),
	prato(P2, B),
        append([],[P2,B], Prato),
	sobremesa(P3, C),
        append([],[P3,C], Sobremesa),
	append([], [Sopa, Prato, Sobremesa], ListPreco).

mais_barato(Lista, W) :-
	samsort(Lista, [X|Y]),
    append([],X, W).
        
	
teste :-
	read_config,
	%listas(ListPreco),
	%mais_barato(ListPreco, [Preco|[Quantidade|Y]]),
    %write('Quantidade: '), write(Quantidade),
    %nl,
   	%write('Preco: '), write(Preco),
    %nl.
        preparareceitas(Sopa1),
        write(Sopa1).