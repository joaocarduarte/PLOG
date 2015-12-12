
%% prato(preco,quantidade)
sopa(5,10).
prato(5,5).
sobremesa(1,7).
couve(5,10).
alface(6,10).

%%Ingredientes(preco, quantidade)
batata(40, 200).         %1
espinafre(30,200).       %2
abobora(50,200).         %3
couve(20,200).           %4
arroz(40, 200).          %5
massa(30,200).           %6
agua(1, 500).            %7
couve(20, 100).          %8
marisco(170, 300).       %9
frango(150, 400).        %10
paoMistura(10,200).      %11
paoTrigo(5,200).         %12
paoCenteio(8,200).       %13
banana(1,200).           %14
laranja(2,200).          %15
pera(5,200).             %16
maca(2,200).             %17
macaCozida(1,200).       %18
macaAssada(1,200).       %19
peraCozida(1,200).       %20
arrozDoce(1,200).        %21
aletria(1,200).          %22
leiteCreme(1,200).       %23
pudim(1,200).            %24
gelatinaVegetal(1,200).  %25
geladoLeite(1,200).      %26
iogurte(1,200).          %27



getListasIngredientes(ListaPrecos,ListaQuantidades) :-
        batata(P1,Q1),
        espinafre(P2,Q2),
        abobora(P3,Q3),
        couve(P4,Q4),
        arroz(P5,Q5),
        massa(P6,Q6),
        agua(P7,Q7),
        couve(P8,Q8),
        marisco(P9,Q9),
        frango(P10,Q10),
        paoMistura(P11,Q11),
        paoTrigo(P12,Q12),
        paoCenteio(P13,Q13),
        banana(P14,Q14),
        laranja(P15,Q15),
        pera(P16,Q16),
        maca(P17,Q17),
        macaCozida(P18,Q18),
        macaAssada(P19,Q19),
        peraCozida(P20,Q20),
        arrozDoce(P21,Q21),
        aletria(P22, Q22),
        leiteCreme(P23,Q23),
        pudim(P24,Q24),
        gelatinaVegetal(P25,Q25),
        geladoLeite(P26,Q26),
        iogurte(P27,Q27),
        append([],[P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,P14,P15,P16,P17,P18,P19,P20,P21,P22,P23,P24,P25,P26,P27],ListaPrecos),
        append([],[Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27],ListaQuantidades).
        

