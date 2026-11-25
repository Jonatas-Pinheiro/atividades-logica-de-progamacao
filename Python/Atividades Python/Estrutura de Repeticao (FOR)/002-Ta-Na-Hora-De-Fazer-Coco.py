def dinheiro_da_carla(dinheiro_atual, custo):
    if(dinheiro_atual>=custo):
        print("Compra bem sucedida!")
    else:
        print("Valor insuficiente! Faltam ",custo-dinheiro_atual," R$!")

dinheiro_atual = float(input("Quantos reais você tem agora? "))
custo = float(input("Qual o valor das suas compras? "))

dinheiro_da_carla(dinheiro_atual, custo)

