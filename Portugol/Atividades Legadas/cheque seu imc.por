programa
{
	
	funcao inicio(){
         real m,a, imc
		escreva("Digite sua altura\n")
		 leia(a)
		 escreva("Digite seu peso corporal em kg\n")
		 leia(m)
		 imc=m/(a*a)
	      se (imc<18.5){
		 	escreva("Voce está abaixo do seu peso ideal\n")
		 }senao{
		    se (imc>=18.5 e imc<=24.9){
		    escreva("Você está com o peso corporal ideal\n")
	      }senao{
		    se(imc>=25 e imc<=29.9){
		    escreva("você está com sobrepeso\n")
		 }senao{
		     se(imc>=30 e imc<=34.9){
		 	escreva("você tem obesidade grau I\n")
		 }senao{
		     se(imc>=35 e imc<=40){
		 	escreva("Você tem obesidade grau II\n")
		 }senao{
		 	escreva("Você tem obesidade grau III\n")
		  }
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
 * @POSICAO-CURSOR = 703; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */