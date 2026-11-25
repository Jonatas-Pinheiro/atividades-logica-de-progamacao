programa {
	funcao inicio() {
		inteiro codigo, codigo_fornecido, senha, senha_fornecida, usuario
		codigo = 1234
		senha = 9999

		escreva("Digite o código:\n>> ")
		leia(codigo_fornecido)
		se(codigo_fornecido==codigo){
			escreva("Agora digite a senha:\n>> ")
			leia(senha_fornecida)
			
		se(senha_fornecida!=senha ou codigo_fornecido!=codigo){
				escreva("Acesso negado!")
			}senao{
				escreva("Acesso autorizado!")
			}

		}senao{
			escreva("Acesso negado!")
		}
	}
}
