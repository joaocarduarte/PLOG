:- use_module(library(lists)).
:- use_module(library(random)).
:- use_module(library(clpfd)).
:- use_module(library(samsort)).

:- include('config.pl').
:- include('prints.pl').

init :- 
        random(1, 3, Random),
        domain([Doce],1,5),
        random(0,4,Numero),
        random(0,5,Numero2),
        domain([FrutaEspecial],1,5), 
        FrutaEspecial #\= Doce,
        FrutaEspecial #> Numero2,
        Doce #>Numero,
        numerorefeicoesdiarias(Refeicoes),
        getListasIngredientes(ListaPrecos,ListaQuantidades),
        %updateQuantidades([1,2,3,4],ListaQuantidades,Result, 8),
        %write(Result).
        pratos(1, Random,Doce,FrutaEspecial,Refeicoes,ListaPrecos,ListaQuantidades,[]).

pratos(Contador, PeixeCarne,EscolhaDoce, EscolhaFrutaEspecial,Refeicoes,ListaPrecos,ListaQuantidades,PrecoTotal) :-
        Contador \= 6,
        EscolhaDoce = Contador,
        domain([EscolhaPeixeCarne],1,2),
        EscolhaPeixeCarne #\= PeixeCarne,
        Vars = [BaseSopa,VerduraSopa,PratoPrincipalMain, PratoPrincipalAcompanhamento, Pao,L1,L2,L3, F1, F2,F3,Doce],
        pratoPrincipalMain(ListaPrecos,PratoPrincipalMain,PrecoMain,ListaQuantidades, EscolhaPeixeCarne,Refeicoes),
        pratoPrincipalAcompanhamento(ListaPrecos, PratoPrincipalAcompanhamento,PrecoAcompanhamento,ListaQuantidades,Refeicoes),
        legumesCrus(ListaPrecos, L1,L2,L3, PrecoLegumes,ListaQuantidades,Refeicoes),
        pao(ListaPrecos, Pao, PrecoPao, ListaQuantidades,Refeicoes),
        fruta(ListaPrecos,F1,F2,F3,PrecoFruta,ListaQuantidades,Refeicoes),
        baseSopa(ListaPrecos,BaseSopa,PrecoBaseSopa,ListaQuantidades,Refeicoes),
        verduraSopa(ListaPrecos,VerduraSopa,PrecoVerduraSopa,ListaQuantidades,Refeicoes),
        doce(ListaPrecos,Doce,PrecoDoce,ListaQuantidades,Refeicoes),
        Preco #= PrecoAcompanhamento + PrecoMain + PrecoPao + PrecoLegumes + PrecoFruta + PrecoDoce + PrecoBaseSopa + PrecoVerduraSopa,
        labeling([minimize(Preco)],Vars),
        write('Dia '),
        write(Contador),nl,nl,
        imprime(Vars,0),nl,
        write('Gastos(por pessoa): '),write(Preco),put_code(8364),nl,
        write('------------------------------------'),nl,
        updateQuantidades([BaseSopa,VerduraSopa,PratoPrincipalMain],ListaQuantidades,Result,Refeicoes),
        Contador1 is Contador+1,
        append(PrecoTotal,[Preco],PrecoTotal1),
        pratos(Contador1, EscolhaPeixeCarne,EscolhaDoce,EscolhaFrutaEspecial,Refeicoes,ListaPrecos,Result,PrecoTotal1).  
                                                
pratos(Contador, PeixeCarne,EscolhaDoce,EscolhaFrutaEspecial,Refeicoes,ListaPrecos,ListaQuantidades,PrecoTotal) :-
        Contador \= 6,
        EscolhaFrutaEspecial = Contador,
        domain([EscolhaPeixeCarne],1,2),
        EscolhaPeixeCarne #\= PeixeCarne,
        Vars = [BaseSopa,VerduraSopa,PratoPrincipalMain, PratoPrincipalAcompanhamento, Pao,L1,L2,L3, F1, F2,F3,FrutaEspecial],
        pratoPrincipalMain(ListaPrecos,PratoPrincipalMain,PrecoMain,ListaQuantidades, EscolhaPeixeCarne,Refeicoes),
        pratoPrincipalAcompanhamento(ListaPrecos, PratoPrincipalAcompanhamento,PrecoAcompanhamento,ListaQuantidades,Refeicoes),
        legumesCrus(ListaPrecos, L1,L2,L3, PrecoLegumes,ListaQuantidades,Refeicoes),
        pao(ListaPrecos, Pao, PrecoPao, ListaQuantidades,Refeicoes),
        fruta(ListaPrecos,F1,F2,F3,PrecoFruta,ListaQuantidades,Refeicoes),
        baseSopa(ListaPrecos,BaseSopa,PrecoBaseSopa,ListaQuantidades,Refeicoes),
        verduraSopa(ListaPrecos,VerduraSopa,PrecoVerduraSopa,ListaQuantidades,Refeicoes),
        frutaEspecial(ListaPrecos,FrutaEspecial,PrecoFrutaEspecial,ListaQuantidades,Refeicoes),
        Preco #= PrecoAcompanhamento + PrecoMain + PrecoPao + PrecoLegumes + PrecoFruta + PrecoFrutaEspecial + PrecoBaseSopa + PrecoVerduraSopa,
        labeling([minimize(Preco)],Vars),
        write('Dia '),
        write(Contador),nl,nl,
        imprime(Vars,0),nl,
        write('Gastos(por pessoa): '),write(Preco),put_code(8364),nl,
        write('------------------------------------'),nl,
        updateQuantidades([BaseSopa,VerduraSopa,PratoPrincipalMain],ListaQuantidades,Result,Refeicoes),
        Contador1 is Contador+1,
        append(PrecoTotal,[Preco],PrecoTotal1),
        pratos(Contador1, EscolhaPeixeCarne,EscolhaDoce,EscolhaFrutaEspecial,Refeicoes,ListaPrecos,Result,PrecoTotal1).


pratos(Contador, PeixeCarne,EscolhaDoce,EscolhaFrutaEspecial,Refeicoes,ListaPrecos,ListaQuantidades,PrecoTotal) :-
        Contador \= 6,
        %EscolhaDoce = Contador,
        domain([EscolhaPeixeCarne],1,2),
        EscolhaPeixeCarne #\= PeixeCarne,
        Vars = [BaseSopa,VerduraSopa,PratoPrincipalMain, PratoPrincipalAcompanhamento, Pao,L1,L2,L3, F1, F2,F3],
        pratoPrincipalMain(ListaPrecos,PratoPrincipalMain,PrecoMain,ListaQuantidades, EscolhaPeixeCarne,Refeicoes),
        pratoPrincipalAcompanhamento(ListaPrecos, PratoPrincipalAcompanhamento,PrecoAcompanhamento,ListaQuantidades,Refeicoes),
        legumesCrus(ListaPrecos, L1,L2,L3, PrecoLegumes,ListaQuantidades,Refeicoes),
        pao(ListaPrecos, Pao, PrecoPao, ListaQuantidades,Refeicoes),
        fruta(ListaPrecos,F1,F2,F3,PrecoFruta,ListaQuantidades,Refeicoes),
        baseSopa(ListaPrecos,BaseSopa,PrecoBaseSopa,ListaQuantidades,Refeicoes),
        verduraSopa(ListaPrecos,VerduraSopa,PrecoVerduraSopa,ListaQuantidades,Refeicoes),
        %doce(ListaPrecos,Doce,PrecoDoce,ListaQuantidades,Refeicoes),
        Preco #= PrecoAcompanhamento + PrecoMain + PrecoPao + PrecoLegumes + PrecoFruta + PrecoBaseSopa + PrecoVerduraSopa,
        labeling([minimize(Preco)],Vars),
        write('Dia '),
        write(Contador),nl,nl,
        imprime(Vars,0),nl,
        write('Gastos(por pessoa): '),write(Preco),put_code(8364),nl, 
        write('------------------------------------'),nl,
        updateQuantidades([BaseSopa,VerduraSopa,PratoPrincipalMain],ListaQuantidades,Result,Refeicoes),
        Contador1 is Contador+1,
        append(PrecoTotal,[Preco],PrecoTotal1),
        pratos(Contador1, EscolhaPeixeCarne,EscolhaDoce,EscolhaFrutaEspecial,Refeicoes,ListaPrecos,Result,PrecoTotal1).

sumList([],0).
sumList([X|Xrest], Sum) :-
         sumList(Xrest, Sum1),
         Sum is X + Sum1.


pratos(6, Random, EscolhaDoce, EscolhaFrutaEspecial,Refeicoes,ListaPrecos,ListaQuantidades,PrecoTotal):-
         write('Gastos na semana(por pessoa): '),
         sumList(PrecoTotal,Total),
         write(Total),put_code(8364),nl,
         write('Total gastos na semana: '),
         Total1 is Total*Refeicoes,
         write(Total1),put_code(8364),nl.
        

pratoPrincipalMain(ListaPrecos, Index, Preco, ListaQuantidades, Random,Refeicoes):-
         Random = 2,
         domain([Index], 24, 28),
         element(Index, ListaPrecos, Preco),
         element(Index, ListaQuantidades, Q),
         Q #>= Refeicoes.

pratoPrincipalMain(ListaPrecos, Index, Preco, ListaQuantidades, Random,Refeicoes):-
         Random = 1,
         domain([Index], 29, 33),
         element(Index, ListaPrecos, Preco),
         element(Index, ListaQuantidades, Q),
         Q #>= Refeicoes.

pratoPrincipalAcompanhamento(ListaPrecos, Index, Preco, ListaQuantidades,Refeicoes) :-
        Index #>=21 #\/ Index #=1,  
        Index #=<23 #\/ Index #=1,
        element(Index, ListaPrecos, Preco),
        element(Index, ListaQuantidades, Q),
        Q #>= Refeicoes.
    
pao(ListaPrecos, Index, Preco, ListaQuantidades,Refeicoes) :-
        domain([Index], 34, 36),
        element(Index, ListaPrecos,Preco),
        element(Index, ListaQuantidades, Q),
        Q #>= Refeicoes. 

fruta(ListaPrecos,I1,I2,I3,Preco,ListaQuantidades,Refeicoes) :-
        ListaFrutas = [I1,I2,I3],
        domain(ListaFrutas,37,41),
        all_different(ListaFrutas),
        element(I1,ListaPrecos,Preco1),
        element(I2,ListaPrecos,Preco2),
        element(I3,ListaPrecos,Preco3),
        Preco #= Preco1 + Preco2 + Preco3,
        element(I1, ListaQuantidades, Q),
        Q #>= Refeicoes,
        element(I2, ListaQuantidades, Q2),
        Q2 #>= Refeicoes,
        element(I3, ListaQuantidades, Q3),
        Q3 #>= Refeicoes.

legumesCrus(ListaPrecos,I1,I2,I3,Preco,ListaQuantidades,Refeicoes):-
        Legumes = [I1,I2,I3],
        domain(Legumes,14,20),
        all_different(Legumes),
        element(I1,ListaPrecos,Preco1),
        element(I2,ListaPrecos,Preco2),
        element(I3,ListaPrecos,Preco3),
        Preco #= Preco1 + Preco2 + Preco3,
        element(I1, ListaQuantidades, Q),
        Q #>= Refeicoes,
        element(I2, ListaQuantidades, Q2),
        Q2 #>= Refeicoes,
        element(I3, ListaQuantidades, Q3),
        Q3 #>= Refeicoes.

doce(ListaPrecos,Doce,Preco,ListaQuantidades,Refeicoes) :-
        domain([Doce], 45, 51),
        element(Doce, ListaPrecos,Preco),
        element(Doce, ListaQuantidades, Q),
        Q #>= Refeicoes.

frutaEspecial(ListaPrecos,FrutaEspecial,Preco,ListaQuantidades,Refeicoes):-
        domain([FrutaEspecial],42,44),
        element(FrutaEspecial,ListaPrecos,Preco),
        element(FrutaEspecial, ListaQuantidades, Q),
        Q #>= Refeicoes.

baseSopa(ListaPrecos,Base,Preco,ListaQuantidades,Refeicoes):-
        domain([Base],1,7),
        element(Base,ListaPrecos,Preco),
        element(Base, ListaQuantidades, Q),
        Q #>= Refeicoes.

verduraSopa(ListaPrecos,VerduraSopa,Preco,ListaQuantidades,Refeicoes):-
        domain([VerduraSopa],8,13),
        element(VerduraSopa,ListaPrecos,Preco),
        element(VerduraSopa, ListaQuantidades, Q),
        Q #>= Refeicoes.
                         

updateQuantidades([],List,Result,Refeicoes):-
        Result = List.                                 
updateQuantidades([H|T],List,Result,Refeicoes) :-
        nth1(H,List,Elem),
        Add is Elem-Refeicoes,
        away(List,H,X),
        nth1(H,List1,Add,X),
        updateQuantidades(T,List1,Result,Refeicoes).
             
             
away([G|H],1,H):-!.
away([G|H],N,[G|L]):- N > 1, Nn is N - 1,!,away(H,Nn,L).
        
                          