programa
{
	
	funcao inicio()
	{
		real nmc
		escreva("Quantas maçãs você deseja comprar \n")
		leia(nmc)
		se(nmc<=12){
		  escreva("O valor a ser pago é igual a: ",nmc*1.30)
		}senao{
		  escreva("O valor a ser pago é igual a: ",nmc*1.00)
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 255; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */