programa {
  funcao inicio() {
    real altura, soma_alt
    inteiro idade, cont_idd, cont_alt, i, soma_idd
    i = 1
    soma_alt = 0
    soma_alt = 0
    soma_idd = 0
    cont_alt = 0
    cont_idd = 0

    enquanto(i<=45){
      escreva("Digite o ",i," idade: \n")
      leia(idade)
      escreva("Digite sua altura: \n")
      leia(altura)
    
      se(altura>=1.70){
        soma_idd=soma_idd+idade
        cont_idd=cont_idd+1
      }

      se(idade > 20){
        soma_alt = soma_alt+altura
        cont_alt = soma_alt+1
      }
      i = i + 1
  }

  se(cont_idd > 0){
    escreva("A Média das idades é: ",soma_idd/cont_idd)
  }
  se(cont_alt > 0){
    escreva("A média das alturas é: ", soma_alt/cont_alt)
  }
  }
}
