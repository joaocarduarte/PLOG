%%Ingredientes(preco, quantidade)

%bases da sopa(batata pode ser utilizado como acompanhamento)
batata(40, 200).         %1
favas(40,200).           %2
feijao(40,200).          %3
grao(40,200).            %4
cenoura(40,200).         %5
curgete(40,200).         %6
abobora(50,200).         %7

%legumes
alhofrances(40,200).     %8       
feijaoVerde(40,200).     %9
espinafre(1,200).        %10
couve(20,200).           %11
broculos(20,200).        %12
ervilhas(20,200).        %13

tomate(1,200).           %14
alface(1,200).           %15
cebola(1,200).           %16
rúcula(1,200).           %17
milho(1,200).            %18
couveRouxa(1,200).       %19
beterraba(1,200).        %20

arroz(40, 200).          %21
massa(30,200).           %22
cuscuz(20,200).          %23

%carne
porco(10,200).           %24
frango(150,400).         %25
pato(12,400).            %26
peru(12,400).            %27
vitela(12,400).          %28

%peixe
carapau(10,200).         %29
salmao(10,200).          %30
pescada(10,200).         %31
dourada(10,200).         %32
solha(10,200).           %33

%pao
paoMistura(10,200).      %34
paoTrigo(5,200).         %35
paoCenteio(8,200).       %36

%fruta
banana(1,200).           %37
laranja(2,200).          %38
pera(5,200).             %39
maca(2,200).             %40
kiwi(2,200).             %41

%FrutaEspecial
macaCozida(1,200).       %42
macaAssada(1,200).       %43
peraCozida(1,200).       %44

%Doces
arrozDoce(2,200).        %45
aletria(1,200).          %46
leiteCreme(1,200).       %47
pudim(1,200).            %48
gelatinaVegetal(1,200).  %49
geladoLeite(1,200).      %50
iogurte(1,200).          %51

numerorefeicoesdiarias(200).

getListasIngredientes(ListaPrecos,ListaQuantidades) :-
        batata(P1, Q1),            %1
        favas(P2,Q2),              %2
        feijao(P3,Q3),             %3
        grao(P4,Q4),               %4
        cenoura(P5,Q5),            %5
        curgete(P6,Q6),            %6
        abobora(P7,Q7),            %7
        
        %legumes
        alhofrances(P8,Q8),        %8       
        feijaoVerde(P9,Q9),        %9
        espinafre(P10,Q10),        %10
        couve(P11,Q11),            %11
        broculos(P12,Q12),         %12
        ervilhas(P13,Q13),         %13
        
        tomate(P14,Q14),           %14
        alface(P15,Q15),           %15
        cebola(P16,Q16),           %16
        rúcula(P17,Q17),           %17
        milho(P18,Q18),            %18
        couveRouxa(P19,Q19),       %19
        beterraba(P20,Q20),        %20
        
        arroz(P21, Q21),           %21
        massa(P22,Q22),            %22
        cuscuz(P23,Q23),           %23
         
        %carne
        porco(P24,Q24),            %24
        frango(P25,Q25),           %25
        pato(P26,Q26),             %26
        peru(P27,Q27),             %27
        vitela(P28,Q28),           %28
        
        %peixe
        carapau(P29,Q29),          %29
        salmao(P30,Q30),           %30
        pescada(P31,Q31),          %31
        dourada(P32,Q32),          %32
        solha(P33,Q33),            %33
        
        %pao
        paoMistura(P34,Q34),       %34
        paoTrigo(P35,Q35),         %35
        paoCenteio(P36,Q36),       %36
        
        %fruta
        banana(P37,Q37),           %37
        laranja(P38,Q38),          %38
        pera(P39,Q39),             %39
        maca(P40,Q40),             %40
        kiwi(P41,Q41),             %41
        
        %FrutaEspecial
        macaCozida(P42,Q42),       %42
        macaAssada(P43,Q43),       %43
        peraCozida(P44,Q44),       %44
        
        %Doces
        arrozDoce(P45,Q45),        %45
        aletria(P46,Q46),          %46
        leiteCreme(P47,Q47),       %47
        pudim(P48,Q48),            %48
        gelatinaVegetal(P49,Q49),  %49
        geladoLeite(P50,Q50),      %50
        iogurte(P51,Q51),          %51

        append([],[P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,P14,P15,P16,P17,P18,P19,P20,P21,P22,P23,P24,P25,P26,P27,P28,P29,P30,P31,P32,P33,P34,P35,P36,P37,P38,P39,P40,P41,P42,P43,P44,P45,P46,P47,P48,P49,P50,P51],ListaPrecos),
        append([],[Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31,Q32,Q33,Q34,Q35,Q36,Q37,Q38,Q39,Q40,Q41,Q42,Q43,Q44,Q45,Q46,Q47,Q48,Q49,Q50,Q51],ListaQuantidades).
        

