programa {
  funcao inicio() {
    inteiro c, i = 0
    cadeia nome[10], n
    para(c=1;c<=5;c++){
      escreva("Digite o ",c,"º nome: \n>> ")
      leia(nome[i])
    }
    escreva("Digite o nome que você procura: ")
    leia(n)

    se(n == nome[i]){
      escreva("Achei!")
    }senao{
      escreva("Não achei, seu betA")
    }

  }
}
