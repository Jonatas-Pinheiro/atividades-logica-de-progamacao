
programa {
  funcao inicio() {
    inteiro x, qtd
    real sal, soma, maior, menor, media
    cadeia nm
    escreva("Qual a quantidade de funcionários? ")
    leia(qtd)
    x = 1
    soma = 0
    maior = 0
    menor = 0
    enquanto(x<=qtd) {
      escreva("Qual seu nome? ")
      leia(nm)
      escreva("Qual seu salário? ")
      leia(sal)
      soma = soma + sal
      se(x==1) {
        maior = sal
        menor = sal
      }
      se(sal>maior) {
        maior = sal
      }
      se(sal<menor) {
        menor = sal
      }
      x=x+1
    }
    media = soma / qtd
    escreva("A média dos salários é: ", media)
    escreva("O salário mais alto é: ", maior)
    escreva("O salário mais baixo é: ", menor)
  }
}
