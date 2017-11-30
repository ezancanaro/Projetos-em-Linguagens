Trabalho Final de Compiladores
Eric Tom�s Zancanaro e Ricardo Silveira Rodrigues

############

O trabalho foi realizado utilizando a ferramenta Antlr v4, a qual gera c�digos para Java vers�o 1.6 ou superior.

############

Execu��o do c�digo:
	1) Utilizar o antlr para gerar os objetos reconhecedores da linguagem atrav�s do comando:
		
		antlr4 rs.g4

	2) Compilar os arquivos java gerados pela ferramenta:

		javac *.java

	3) Executar a ferramenta de testes do antlr para o reconhecimento do fonte:

		grun rs s -gui < input.rs
	
	O comando acima chama o programa grun para a linguagem rs utilizando como s�mbolo inicial da gram�tica o s�mbolo s.
	O comando acima faz o reconhecimento da linguagem rs presente no c�digo fonte input.rs, gerando a �rvore
da gram�tica atrav�s do par�metro -gui .

############

Tratamento de erros:
	Os erros l�xicos e sint�ticos s�o oferecidos pela ferramenta antlr e s�o indicados no seguinte padr�o:
		
	linha:coluna "Mensagem de erro"

	Estes erros encompassam s�mbolos n�o reconhecidos, comandos n�o definidos na linguagem e instru��es em desacordo
com a gram�tica definida no trabalho.

	Os erros sem�nticos foram tratados pelo grupo atrav�s de a��es sem�nticas presentes no c�digo.
	Estes erros s�o apresentados seguindo o padr�o definido para os erros l�xicos e sint�ticos.

	Os erros s�o apresentados na sa�da padr�o.	
 
	