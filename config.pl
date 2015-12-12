
%% prato(preco,quantidade)
sopa(5,10).
prato(5,5).
sobremesa(1,7).
couve(5,10).
alface(6,10).

%%Ingredientes(preco, quantidade)
batata(40, 200).
arroz(40, 200).
massa(40,200).
agua(1, 500).
couve(20, 100).
marisco(120, 300).
frango(150, 300).


%%Sopas--------------mais tarde fazer sopa(lista, preco, quantidade)
sopa1([ batata, arroz, agua]).
sopa2([ batata, massa, agua]).
sopa3([ batata, couve, agua]).
sopa5([ batata, frango, agua]).
sopa5([ batata, marisco, agua]).

starter(salad,16).
starter(peixe,15). 


getIngredientsSopa(ListaIngredientes, Batata, Couve, Alface, ListaPrecosQuantidades) :-
        Batata = batata,
        Couve = couve,
        Alface = alface,
        ListaIngredientes = [Batata, Couve, Alface],
        ListaPrecosQuantidades = [0, 1, 2].
        