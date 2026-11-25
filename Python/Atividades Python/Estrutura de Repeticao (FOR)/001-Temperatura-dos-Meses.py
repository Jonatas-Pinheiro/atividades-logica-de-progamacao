meses = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"]
temperaturas_mensais = [13]

for x in range(12):
    temperaturas_mensais.append(float(input("Qual a temperatura do mês atual? ")))
    #temperaturas_mensais.append(temperaturas_mensais

media_anual = sum(temperaturas_mensais)/12
print("A temperatura média da soma de todos os meses é: ",media_anual)

#Ele é GORRRDO, mas eu gosto dele