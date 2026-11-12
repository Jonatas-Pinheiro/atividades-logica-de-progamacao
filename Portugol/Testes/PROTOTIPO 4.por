programa {
  funcao inicio() {
    inteiro num, x = 0, guardar = 0, maior = 0
    real media = 10.0

    enquanto(x <= 9){
      x = x + 1
      escreva("Digite o ",x," valor")
      leia(num)
      
      se(num>0){
        maior = num
      }
    }

    escreva("A média é ",num/media)
    escreva("\nSoma = ",num)
    escreva("\n",guardar)
  }
}
