                            grammar rs;

@header {   
import java.util.*;
}
@members {
	HashMap <String, String> Signals = new HashMap <String, String>();
        HashMap <String, Integer> inputSignal = new HashMap <String, Integer>();
	HashMap <String, Integer> outputSignal = new HashMap <String, Integer>();
        HashMap <String, Integer> pSignal = new HashMap <String, Integer>();
        HashMap <String, String> parametros = new HashMap <String, String>();
	HashMap <String, Integer> variaveis = new HashMap <String, Integer>();  
}

s		:	module '[' input output tsignal psignal var? initially? onexception regras ']'(','|'.');

module 		: 	'module' ID ':';

input 		: 	'input' ':' '[' signalList["in"] {      Set<String> chaves = Signals.keySet();
                                                                for (String chave : chaves)  
                                                                {  
                                                                    if(chave != null && Signals.get(chave)=="in")  
                                                                        inputSignal.put(chave,0);
                                                                }  
                                                  
                                                        } 
                                    ']' ',';

output 		: 	'output' ':' '[' signalList["out"] {    Set<String> chaves = Signals.keySet();
                                                                for (String chave : chaves)  
                                                                {  
                                                                    if(chave != null && Signals.get(chave)=="out")  
                                                                        outputSignal.put(chave,0);
                                                                }  
                                                  
                                                        }
                                     ']' ',';

tsignal 	: 	't_signal' ':' '['']' ',';

psignal 	: 	'p_signal' ':' '[' signalList["p"]{     Set<String> chaves = Signals.keySet();
                                                                for (String chave : chaves)  
                                                                {  
                                                                    if(chave != null && Signals.get(chave)=="p")  
                                                                        pSignal.put(chave,1);
                                                                }  
                                                  
                                                          }
                                       ']' ',';

var 		: 	'var' ':' '[' varList ']' ',';

initially 	: 	'initially' ':' '[' comandosIni ']' ',';

onexception	: 	'on_exception' ':' '[' ']' ',';

regras          :   regra | regra ',' regras ;
                    
regra 		: 	ID { Integer v = inputSignal.get($ID.text);
                                if (v == null)							
                                    System.out.println($ID.line +":"+ $ID.pos + " Erro: Sinal externo " + $ID.text +" não declarado ");} 
                        '#''[' ID {  v = pSignal.get($ID.text);
                                        if (v == null)							
                                            System.out.println($ID.line +":"+ $ID.pos +" Erro: Sinal permanente " + $ID.text +" não declarado ");} 
                           ']' '===>' ('[' comandos ']' | caso ) ; 

signals		:	ID | ID ',' ID ;

varList 	: 	ID{if(variaveis.get($ID.text)!=null)
                                System.out.println($ID.line +":"+ $ID.pos+" Variável " + $ID.text +" declarado anteriormente");
                           else
                                variaveis.put($ID.text,0);} | ID{if(variaveis.get($ID.text)!=null)
                                                                            System.out.println($ID.line +":"+ $ID.pos+" Variável " + $ID.text +" declarado anteriormente");
                                                                        else
                                                                            variaveis.put($ID.text,0);}',' varList | ;

signalList [String tipo]	: 	ID{if(Signals.get($ID.text)!=null)
                                                System.out.println($ID.line +":"+ $ID.pos+" Sinal " + $ID.text +" declarado anteriormente");
                                           else
                                                Signals.put($ID.text,tipo);} 
                                        (par[$ID.text])? | ID{if(Signals.get($ID.text)!=null)
                                                                    System.out.println($ID.line +":"+ $ID.pos+" Sinal " + $ID.text +" declarado anteriormente");
                                                                 else
                                                                    Signals.put($ID.text,tipo);} 
                                                           (par[$ID.text])? ',' signalList[tipo] | ;

par [String sinal]              :	'(' ID {parametros.put(sinal,$ID.text);}')' ;

comandos 	:	comando | comando ',' comandos;

comandosIni     :	comandoIni | comandoIni ',' comandosIni;

comandoIni 	: 	activate |  comando ;

activate 	: 	'activate' '(' 'rules' ')';

comando 	: 	emit | up | att ;

emit 		: 	'emit' '(' id1=ID ( '('id2=ID')'{String s = parametros.get($id1.text);
                                                    if(s == null)
                                                        System.out.println($id1.line +":"+ $id1.pos +" Sinal "+ $id1.text +" não tem parametros");
                                                    Integer val = variaveis.get(s);
                                                 }
                                          )?
                                            { Integer v = outputSignal.get($id1.text);                                            
                                              String ss = parametros.get($id1.text);
                                              Integer valu = variaveis.get($id2.text);
                                              if (v == null)							
                                                System.out.println($id2.line +":"+ $id2.pos +" Erro: Sinal de saída " + $id1.text +" não declarado ");
                                                                                                                                                 
                                            }
                               ')';

up 			: 	'up' '(' ID { Integer v = pSignal.get($ID.text);
                                                if (v == null)							
                                                    System.out.println($ID.line +":"+ $ID.pos + " Erro: Sinal permanente " + $ID.text +" não declarado ");
                                                else
                                                    pSignal.put($ID.text,1);
                                            }
                                     ')';



att 		: 	ID ':=' NUM {	Integer v = variaveis.get($ID.text);      //Pega o valor de ID na tabela de variaveis.
								if (v != null)      //Se ID existe no mapa de variaveis.
									variaveis.put($ID.text,Integer.parseInt($NUM.text));
                                                                else
                                                                    System.out.println($ID.line +":"+ $ID.pos +" Erro: variável "+$ID.text+" não declarada");
							}
                |       ID ':=' a=op  {	Integer v = variaveis.get($ID.text);      //Pega o valor de ID na tabela de variaveis.
								if (v != null)      //Se ID existe no mapa de variaveis.
									variaveis.put($ID.text,$a.valor);
                                                                else
                                                                    System.out.println($ID.line +":"+ $ID.pos +" Erro: variável "+$ID.text+" não declarada");
							};

caso 		:   'case' '[' ID LOGIC NUM '--->' '[' comandos ']'',' 
                                'else'  '--->'   '[' comandos ']'
                                ']';

op returns [int valor]    : label=operando{$valor = $label.val;} 
                          | a=operando{$valor = $a.val;} '+' b=op{$valor += $b.valor;} 
                          | a=operando{$valor = $a.val;} '-' b=op{$valor -= $b.valor;}; 
                                                                                    
operando returns [int val]: ID{$val = variaveis.get($ID.text);} | NUM {$val = Integer.parseInt($NUM.text);};
                  

ID		: LITERAL (LITERAL | NUM | '_')*
                                                        ;

VARIAVEL	: MINUSCULA+ (LITERAL | NUM)*
							;

MINUSCULA       :   ['a'-'z']                            
                ;


NUM		: ('0'..'9')+
							;

LITERAL		: ('a'..'z'|'A'..'Z')+
							;

WS 		: [ \t\r\n]+ {skip();}
                                    ;

COMENTARIO	: '/*' .*? '*/' -> skip
							;
LOGIC           :   '>'|'<'|'='
                                                        ;

OPERADOR        :   '+'|'-'
                                                        ;