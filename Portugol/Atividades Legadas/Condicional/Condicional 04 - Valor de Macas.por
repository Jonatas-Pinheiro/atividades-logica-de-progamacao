programa{
	funcao inicio(){
		real maca

		escreva("digite um valor de maçãs \n")
		leia(maca)

		se(maca<=12){
		  maca = maca*1.30
		  escreva(maca)
		}senao{
		  maca=maca*1.0
		  escreva(maca)}
	}
}