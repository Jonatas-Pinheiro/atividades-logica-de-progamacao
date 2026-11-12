programa {
  funcao inicio() {
    inteiro a[11], x, m[11], c
	
	para(c=1;c<=10;c++){
		escreva("Digite o ",c,"º valor\n>> ")
		leia(a[c])
	}
	escreva("Agora digite o outro valor:\n>> ")
	leia(x)

	para(c=1;c<=10;c++){
		m[c]=x*a[c]
		escreva("\n",m[c] ," > ", c,"º multiplicação")
	}
  }
}
