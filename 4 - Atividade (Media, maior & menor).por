programa {
  funcao inicio() {
    inteiro contador = 1, x = 0, n1=0, maior = 0, menor = 100, soma = 0

    enquanto(contador <= 10){
      escreva("Digite o ",contador,"º valor:")
      leia(n1)
      contador = contador + 1

      se(n1>maior){
        maior = n1
      }

      se(n1<menor){
        menor = n1
      }
      soma = soma + n1
    }

    escreva("\nO maior número é: ", maior)
    escreva("\nO menor número é: ", menor)
    escreva("\nA média é: ",soma/10)
}
}
