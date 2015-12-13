imprime([],Contador):-
        nl,
        write('Bebida:'),nl,
        write('- Agua'),nl.

imprime([H|T],Contador) :-
        Contador is 0,
        write('Sopa: '),nl,
        write('- '),
        imprimeIngrediente(H),
        Contador1 is Contador+1,
        imprime(T,Contador1).

imprime([H|T],Contador) :-
        Contador is 2,nl,
        write('Prato Principal: '),nl,
        write('- '),
        imprimeIngrediente(H),
        Contador1 is Contador+1,
        imprime(T,Contador1).

imprime([H|T],Contador) :-
        Contador is 4,nl,
        write('Pao: '),nl,
        write('- '),
        imprimeIngrediente(H),
        Contador1 is Contador+1,
        imprime(T,Contador1).

imprime([H|T],Contador) :-
        Contador is 5,nl,
        write('Salada: '),nl,
        write('- '),
        imprimeIngrediente(H),
        Contador1 is Contador+1,
        imprime(T,Contador1).

imprime([H|T],Contador) :-
        Contador is 8,nl,
        write('Sobremesa: '),nl,
        write('- '),
        imprimeIngrediente(H),
        Contador1 is Contador+1,
        imprime(T,Contador1).

imprime([H|T],Contador) :-
        Contador1 is Contador+1,
        write('- '),
        imprimeIngrediente(H),
        imprime(T,Contador1).

imprimeIngrediente(1):-
                write('Batata'),nl.

imprimeIngrediente(2):-
                write('Favas'),nl.

imprimeIngrediente(3):-
                write('Feijao'),nl.

imprimeIngrediente(4):-
                write('Grao'),nl.

imprimeIngrediente(5):-
                write('Cenoura'),nl.

imprimeIngrediente(6):-
                write('Curgete'),nl.

imprimeIngrediente(7):-
                write('Abobora'),nl.

%legumes
imprimeIngrediente(8):-
                write('Alho Frances'),nl.

imprimeIngrediente(9):-
                write('Feijao Verde'),nl.

imprimeIngrediente(10):-
                write('Espinafre'),nl.

imprimeIngrediente(11):-
                write('Couve'),nl.

imprimeIngrediente(12):-
                write('Broculo'),nl.

imprimeIngrediente(13):-
                write('Ervilhas'),nl.

imprimeIngrediente(14):-
                write('Tomate'),nl.

imprimeIngrediente(15):-
                write('Alface'),nl.

imprimeIngrediente(16):-
                write('Cebola'),nl.

imprimeIngrediente(17):-
                write('Rucula'),nl.

imprimeIngrediente(18):-
                write('Milho'),nl.

imprimeIngrediente(19):-
                write('Couve Roxa'),nl.

imprimeIngrediente(20):-
                write('Beterraba'),nl.

imprimeIngrediente(21):-
                write('Arroz'),nl.

imprimeIngrediente(22):-
                write('Massa'),nl.

imprimeIngrediente(23):-
                write('Cuscuz'),nl.

%carne
imprimeIngrediente(24):-
                write('Porco'),nl.

imprimeIngrediente(25):-
                write('Frango'),nl.

imprimeIngrediente(26):-
                write('Pato'),nl.

imprimeIngrediente(27):-
                write('Peru'),nl.

imprimeIngrediente(28):-
                write('Vitela'),nl.

%peixe
imprimeIngrediente(29):-
                write('Carapau'),nl.

imprimeIngrediente(30):-
                write('Salmao'),nl.

imprimeIngrediente(31):-
                write('Pescada'),nl.

imprimeIngrediente(32):-
                write('Dourada'),nl.

imprimeIngrediente(33):-
                write('Solha'),nl.

%pao
imprimeIngrediente(34):-
                write('Pao de Mistura'),nl.

imprimeIngrediente(35):-
                write('Pao de Trigo'),nl.

imprimeIngrediente(36):-
                write('Pao de Centeio'),nl.

%fruta
imprimeIngrediente(37):-
                write('Banana'),nl.

imprimeIngrediente(38):-
                write('Laranja'),nl.

imprimeIngrediente(39):-
                write('Pera'),nl.

imprimeIngrediente(40):-
                write('Maca'),nl.

imprimeIngrediente(41):-
                write('Kiwi'),nl.

imprimeIngrediente(42):-
                write('Maca Cozida'),nl.

imprimeIngrediente(43):-
                write('Maca Assada'),nl.

imprimeIngrediente(44):-
                write('Pera Cozida'),nl.

%doces
imprimeIngrediente(45):-
                write('Arroz Doce'),nl.

imprimeIngrediente(46):-
                write('Aletria'),nl.

imprimeIngrediente(47):-
                write('Leite Creme'),nl.

imprimeIngrediente(48):-
                write('Pudim'),nl.

imprimeIngrediente(49):-
                write('Gelatina Vegetal'),nl.

imprimeIngrediente(50):-
                write('Gelado de Leite'),nl.

imprimeIngrediente(51):-
                write('Iogurte'),nl.                            
                           
                             