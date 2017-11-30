Trabalho Final de Compiladores
Eric Tomás Zancanaro e Ricardo Silveira Rodrigues

############

O trabalho foi realizado utilizando a ferramenta Antlr v4, a qual gera códigos para Java versão 1.6 ou superior.

############

Execução do código:
	1) Utilizar o antlr para gerar os objetos reconhecedores da linguagem através do comando:
		
		antlr4 rs.g4

	2) Compilar os arquivos java gerados pela ferramenta:

		javac *.java

	3) Executar a ferramenta de testes do antlr para o reconhecimento do fonte:

		grun rs s -gui < input.rs
	
	O comando acima chama o programa grun para a linguagem rs utilizando como símbolo inicial da gramática o símbolo s.
	O comando acima faz o reconhecimento da linguagem rs presente no código fonte input.rs, gerando a árvore
da gramática através do parâmetro -gui .

############

Tratamento de erros:
	Os erros léxicos e sintáticos são oferecidos pela ferramenta antlr e são indicados no seguinte padrâo:
		
	linha:coluna "Mensagem de erro"

	Estes erros encompassam símbolos não reconhecidos, comandos não definidos na linguagem e instruções em desacordo
com a gramática definida no trabalho.

	Os erros semânticos foram tratados pelo grupo através de ações semânticas presentes no código.
	Estes erros são apresentados seguindo o padrão definido para os erros léxicos e sintáticos.

	Os erros são apresentados na saída padrão.	
 
	