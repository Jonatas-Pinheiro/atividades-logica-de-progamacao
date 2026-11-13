programa
{
	
	funcao inicio()
	{
		real h1,h2,m1,m2,soma,mult
		escreva("digite a idade de um homem\n")
		leia(h1)
		escreva("digite a idade de um segundo homem\n")
		leia(h2)
		escreva("digite a idade de uma mulher\n")
		leia(m1)
		escreva("digite a idade de uma segunda mulher\n")
		leia(m2)
		se (h1>h2 e m1<m2){
			soma=h1+m2
			escreva(soma,"\n")
			mult=h2*m1
			escreva(mult,"\n")
		}senao{
			se(h1<h2 e m1>m2){
				soma=h2+m2
				escreva(soma,"\n")
				mult=h1*m1
				escreva(mult,"\n")
			}senao{
				se (h1<h2 e m1<m2){
					soma=h2+m2
					escreva(soma,"\n")
					mult=h1*m1
					escreva(mult,"\n")
				}senao{
					se (h1>h2 e m1<m2){
						soma=h1+m1
						escreva(soma,"\n")
						mult=h2*m2
						escreva(mult,"\n")
					}
				}
			}
		}
	}
}




/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 419; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */