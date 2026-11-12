programa {
  funcao inicio() {
    real nota[3],soma=0,media
		inteiro c

		para(c=0;c<=2;c++){
			escreva("Digite a ",c,"º nota:\n")
			leia(nota[c])
			soma += nota[c]
		}
		media=soma/3
		escreva("A média é ", media)
	}
}
