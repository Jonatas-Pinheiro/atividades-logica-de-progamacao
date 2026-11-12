programa {
  funcao inicio() {
    inteiro quant, soma, valor, x
    soma = 0
    x = 0
    quant = 0
    
    enquanto(x<=5){
      x = x + 1
      escreva("Digite o ",x," valor\n")
      leia(valor)
      
      se(valor>=0){
        soma = soma + valor
      }senao{
        quant = quant + 1
      }
    }

    escreva("A soma dos valores positivos é: ",soma,"\n")
    escreva("A quantidade de valores negativos é: ",quant,"\n")
  }
}

  

