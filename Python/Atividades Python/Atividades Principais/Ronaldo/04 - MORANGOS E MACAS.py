
qmo=int(input("Quantos kg morangos você deseja comprar?"))
qma=int(input("Quantas kg maçãs você deseja comprar?"))
if(qmo<=5):
    p_mo=2.5*qmo
else:
    p_mo=2.2*qmo
if(qma<=5):
    p_ma=1.8*qma
else:
    p_ma=1.50*qma
if((qmo+qma)>8):
    soma=(p_mo+p_ma)*0.9
else:
    soma=p_mo=p_ma
print("O valor total a ser pago é:",soma)