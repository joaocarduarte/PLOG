:- use_module(library(lists)).
:- use_module(library(random)).
:- use_module(library(clpfd)).
:- use_module(library(samsort)).

:- include('config.pl').

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
        pratos(1, Random,Doce,FrutaEspecial,Refeicoes).

pratos(Contador, PeixeCarne,EscolhaDoce, EscolhaFrutaEspecial,Refeicoes) :-
        Contador \= 6,
        EscolhaDoce = Contador,
        write('Doce'),
        domain([EscolhaPeixeCarne],1,2),
        EscolhaPeixeCarne #\= PeixeCarne,
        getListasIngredientes(ListaPrecos,ListaQuantidades),
        Vars = [PratoPrincipalMain, PratoPrincipalAcompanhamento, Pao,L1,L2,L3, F1, F2,F3],
        pratoPrincipalMain(ListaPrecos,PratoPrincipalMain,PrecoMain,ListaQuantidades, EscolhaPeixeCarne),
        pratoPrincipalAcompanhamento(ListaPrecos, PratoPrincipalAcompanhamento,PrecoAcompanhamento,ListaQuantidades),
        legumesCrus(ListaPrecos, L1,L2,L3, PrecoLegumes,ListaQuantidades),
        pao(ListaPrecos, Pao, PrecoPao, ListaQuantidades),
        fruta(ListaPrecos,F1,F2,F3,PrecoFruta,ListaQuantidades),
        Preco #= PrecoAcompanhamento + PrecoMain + PrecoPao + PrecoLegumes + PrecoFruta,
        labeling([minimize(Preco)],Vars),
        write(Vars),
        Contador1 is Contador+1,
        pratos(Contador1, EscolhaPeixeCarne,EscolhaDoce,EscolhaFrutaEspecial,Refeicoes).  
                                                
pratos(Contador, PeixeCarne,EscolhaDoce,EscolhaFrutaEspecial,Refeicoes) :-
        Contador \= 6,
        EscolhaFrutaEspecial = Contador,
        write('Fruta Especial'),
        domain([EscolhaPeixeCarne],1,2),
        EscolhaPeixeCarne #\= PeixeCarne,
        getListasIngredientes(ListaPrecos,ListaQuantidades),
        Vars = [PratoPrincipalMain, PratoPrincipalAcompanhamento, Pao,L1,L2,L3, F1, F2,F3],
        pratoPrincipalMain(ListaPrecos,PratoPrincipalMain,PrecoMain,ListaQuantidades, EscolhaPeixeCarne),
        pratoPrincipalAcompanhamento(ListaPrecos, PratoPrincipalAcompanhamento,PrecoAcompanhamento,ListaQuantidades),
        legumesCrus(ListaPrecos, L1,L2,L3, PrecoLegumes,ListaQuantidades),
        pao(ListaPrecos, Pao, PrecoPao, ListaQuantidades),
        fruta(ListaPrecos,F1,F2,F3,PrecoFruta,ListaQuantidades),
        Preco #= PrecoAcompanhamento + PrecoMain + PrecoPao + PrecoLegumes + PrecoFruta,
        labeling([minimize(Preco)],Vars),
        write(Vars),
        Contador1 is Contador+1,
        pratos(Contador1, EscolhaPeixeCarne,EscolhaDoce,EscolhaFrutaEspecial,Refeicoes).   


pratos(Contador, PeixeCarne,EscolhaDoce,EscolhaFrutaEspecial,Refeicoes) :-
        Contador \= 6,
        domain([EscolhaPeixeCarne],1,2),
        EscolhaPeixeCarne #\= PeixeCarne,
        getListasIngredientes(ListaPrecos,ListaQuantidades),
        Vars = [PratoPrincipalMain, PratoPrincipalAcompanhamento, Pao,L1,L2,L3, F1, F2,F3],
        pratoPrincipalMain(ListaPrecos,PratoPrincipalMain,PrecoMain,ListaQuantidades, EscolhaPeixeCarne),
        pratoPrincipalAcompanhamento(ListaPrecos, PratoPrincipalAcompanhamento,PrecoAcompanhamento,ListaQuantidades),
        legumesCrus(ListaPrecos, L1,L2,L3, PrecoLegumes,ListaQuantidades),
        pao(ListaPrecos, Pao, PrecoPao, ListaQuantidades),
        fruta(ListaPrecos,F1,F2,F3,PrecoFruta,ListaQuantidades),
        Preco #= PrecoAcompanhamento + PrecoMain + PrecoPao + PrecoLegumes + PrecoFruta,
        labeling([minimize(Preco)],Vars),
        write(Vars),
        Contador1 is Contador+1,
        pratos(Contador1, EscolhaPeixeCarne,EscolhaDoce,EscolhaFrutaEspecial,Refeicoes).   

pratos(6, Random, EscolhaDoce, EscolhaFrutaEspecial).
        

pratoPrincipalMain(ListaPrecos, Index, Preco, ListaQuantidades, Random):-
         Random = 2,
         domain([Index], 1, 3),
         element(Index, ListaPrecos, Preco).

pratoPrincipalMain(ListaPrecos, Index, Preco, ListaQuantidades, Random):-
         Random = 1,
         domain([Index], 5, 6),
         element(Index, ListaPrecos, Preco).

pratoPrincipalAcompanhamento(ListaPrecos, Index, Preco, ListaQuantidades) :-
        domain([Index], 1, 1),
        element(Index, ListaPrecos, Preco).
    
pao(ListaPrecos, Index, Preco, ListaQuantidades) :-
        domain([Index], 1, 1),
        element(Index, ListaPrecos,Preco).  

fruta(ListaPrecos,I1,I2,I3,Preco,ListaQuantidades) :-
        ListaFrutas = [I1,I2,I3],
        
        I1 #> 2 #\/ I1 #< 2,    
        I2 #> 2 #\/ I2 #< 2,
        I3 #> 2 #\/ I3 #< 2, 
        all_different(ListaFrutas),
        element(I1,ListaPrecos,Preco1),
        element(I2,ListaPrecos,Preco2),
        element(I3,ListaPrecos,Preco3),
        Preco #= Preco1 + Preco2 + Preco3.

legumesCrus(ListaPrecos,I1,I2,I3,Preco,ListaQuantidades):-
        Legumes = [I1,I2,I3],
        domain(Legumes,2,5),
        all_different(Legumes),
        element(I1,ListaPrecos,Preco1),
        element(I2,ListaPrecos,Preco2),
        element(I3,ListaPrecos,Preco3),
        Preco #= Preco1 + Preco2 + Preco3.
                          