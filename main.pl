:- use_module(library(lists)).
:- use_module(library(random)).
:- use_module(library(clpfd)).
:- use_module(library(samsort)).

:- include('config.pl').

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



preco_receita(List, PrecoT) :-
    preco_receita(List, 0, PrecoT).

preco_receita([], Acomulador, Acomulador).

preco_receita([H|T], Acomulador, Resultado) :-
	call(H, X, Y),
    Acomulador1 is Acomulador + X,
    preco_receita(T, Acomulador1, Resultado).


quantidade_receita(List, QuantidadeT) :-
    quantidade_receita(List, 0, QuantidadeT).

quantidade_receita([], Acomulador, Acomulador).

quantidade_receita([H|T], Acomulador, Resultado) :-
	call(H, X, Y),
    Acomulador1 is Acomulador + Y,
    preco_receita(T, Acomulador1, Resultado).

	
        
	
teste :-
	read_config,
	listas(ListPreco),
        Sopas  = [Sopa1, Sopa2, Sopa3],
        Sopas2 = [Cenas, Ca],
        append([Sopas], [Sopas2], Ba),
        length(Ba, 3),
        write(Ba).
	%mais_barato(ListPreco, [Preco|[Quantidade|Y]]),
        %write(Preco),
        %labeling([max, Cenas], [5,10,14]).
    %write('Quantidade: '), write(Quantidade),
    %nl,
   	%write('Preco: '), write(Preco),
    %nl.
    	%sopa1(Lista),
        %preco_receita(Lista, Preco),
        %append([[100,1]], [[Preco,2]], ListaPrecos),
        %samsort(ListaPrecos,ListaPrecos1),
        %write(ListaPrecos1),
       
        
        %VariedadesSopa =[Sopa1, Sopa2, Sopa3],
        %domain(VariedadesSopa, 1, 3),
        %Sopa1 #= Sopa2,
        %Sopa3 #> Sopa2,
        %append([], [NumeroVariedadesSopas], Teste),
        %labeling([], VariedadesSopa),
        %write(VariedadesSopa).


send :-
        Vars=[S,E,N,D,M,O,R,Y],
        domain(Vars,0,9),
        all_different(Vars),
        S #\= 0, M #\= 0,
        S*1000+E*100+N*10+D +
        M*1000+O*100+R*10+E #=
        M*10000+O*1000+N*100+E*10+Y,
        labeling([],Vars),
        write(Vars).
        

meal :-
        getIngredientsSopa(ListaIngredientes, Batata, Couve, Alface, Lista),
        Vars = [Id, R, Result],
        domain([Id,R],1,9),
        %element(Index, Lista, R),
        element(Index,Lista,Result),
        labeling([minimize(Result)],Vars),
        write(Vars).

getElement([H|T], Contador, Index, Resultado) :-
        Contador == Index,
        Resultado = H.

getElement([H|T], Contador, Index, Resultado) :-
        Contador \= Index,
        Contador1 is Contador +1,
        getElement(T,Contador1,Index,Resultado).

getElement(Lista, 0, Index, Resultado) :-
        getElement(Lista,1,Index,Resultado).

getElement([H|T], Contador, Index, Resultado) :-
        Resultado == H,
        Index = Contador.
        
getElement([H|T], Contador, Index, Resultado) :-
        Resultado \= H,
        Contador1 is Contador +1,
        getElement(T,Contador1,Index,Resultado).


           


                  
        