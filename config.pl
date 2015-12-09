%% prato(preco,quantidade)
%sopa(5,10).
%prato(5,5).
%sobremesa(1,7).

%%Ingredientes(preco, quantidade)
batata(50, 200).
arroz(40, 200).
%massa(40,200).
%agua(1, 500).
%couve(20, 100).
%marisco(120, 300).
%frango(150, 300).

%sopa1(batata(50,200),arroz(C,V)).

%%Sopas  				mais tarde fazer sopa(lista, preco, quantidade)
%append([], [batata(50,200), arroz(40,200), agua(1,500)], Sopa1).
%append([], [batata(X,Y), massa(X,Y), agua(X,Y)], Sopa2).
%append([], [batata(X,Y), couve(X,Y), agua(X,Y)], Sopa3).
%append([], [batata(X,Y), frango(X,Y), agua(X,Y)], Sopa4).
%append([], [batata(X,Y), marisco(X,Y), agua(X,Y)], Sopa5).


lista(Lista) :- 
	append([],[batata(50,200), arroz(50,200)], Lista).