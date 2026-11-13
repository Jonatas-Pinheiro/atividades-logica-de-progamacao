programa
{
	
	funcao inicio()
	{
		real HT,VH,PD,SB,SL,TD
		
		escreva("Digite suas horas trabalhadas mensalmente: \n>> ")
		leia(HT)
		
		escreva("Digite o valor de cada hora trabalhada por você:\n>> ")
		leia(VH)
		
		escreva("Digite o percentual de descontos: \n>> ")
		leia(PD)
		
		SB = HT*VH
		TD = (PD/100)*SB
		SL = SB-TD
		
		escreva("O valor do seu salário bruto é: \n>> ",SB)
		escreva("O valor do total de desconto é: \n>> ",TD)

	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 441; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */