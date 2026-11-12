programa {
  funcao inicio() {
    inteiro c = 1, i = 0
    cadeia nome[5], n
    para(c=0;c<=4;c++){
      escreva("Digite o ",c,"º nome: \n>> ")
      leia(nome[c])
    }
    escreva("Digite o nome que você procura: ")
    leia(n)

			se(n == nome[0]){
      escreva("Achei!\n")
    	}senao{
				se(n == nome[1]){
      	escreva("Achei!\n")
   		}senao{
				se(n == nome[2]){
      	escreva("Achei!\n")
			}senao{
				se(n == nome[3]){
      	escreva("Achei!\n")
			}senao{
				se(n == nome[4]){
      	escreva("Achei!\n")
			}senao{
				escreva("Não achei!")
			}
			

			}
				}	
			}
  	}
	}
}
