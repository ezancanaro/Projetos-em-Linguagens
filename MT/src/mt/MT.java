/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package mt;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

/**
 *
 * @author rafael
 */
public class MT 
{

    /**
     * @param args the command line arguments
     * @throws java.io.IOException
     */
    public static void main(String[] args) throws IOException 
    {
        // TODO code application logic here
        BufferedReader	inReader;
        inReader = new BufferedReader(new InputStreamReader(System.in));
        //lê a primeira linha
        String line;
        line = inReader.readLine();
        int numeroFuncaoTransicao=lerNumeroFuncaoTranscicao(line);           
        
        //lê a segunda linha, cria uma Maquina e adiciona seus estados
        line = inReader.readLine();
        String[] vetor = line.split(" ");
        Maquina machine = new Maquina();
        for(String s : vetor)
        {            
            machine.addEstado(s);
        }
        
        //lê a terceira e quarta linhas (desnecesárias neste programa)
        line = inReader.readLine();
        line = inReader.readLine();
        
        //lê as linhas correspondentes às funções de transcição e as
        //adicionam na Maquina
        for(int count=1; count<= numeroFuncaoTransicao;count ++ )
        {            
            line = inReader.readLine();
            machine.addTransicao(lerTransicao(line));
        }
        
        //lê a próxima linha após as funções de transição
        //que determina se a máquina deverá ser reconhecedora
        //de linguagem ou processadora de funções
        line = inReader.readLine();
        machine.setTipo(line);
        
        //obtem numero de entradas
        line = inReader.readLine();
        int numeroEntradas = Integer.parseInt(line);
        
        ArrayList<String> entradas = new ArrayList<>();
        for(int i = 1;i<= numeroEntradas;i++)
        {
            line = inReader.readLine();
            entradas.add(line);
        }
        inReader.close();       
        
        //inicia o processamento das entradas
        machine.start(entradas,vetor[0]);
    }
    
    private static int lerNumeroFuncaoTranscicao(String linha)    
    {
        //obtém índice do terceiro espaço ' ' na string da primeira linha
        int indexSpace = linha.lastIndexOf(' ');
        String numero = linha.substring(indexSpace+1,linha.length());
        return Integer.parseInt(numero);
    }
    
    private static Transicao lerTransicao(String linha)
    {
        int indiceVirgulaEstadoInicial = linha.indexOf(',');
        String estadoInicial = linha.substring(1,indiceVirgulaEstadoInicial);
        
        char condicao = linha.charAt(indiceVirgulaEstadoInicial+1);
        
        int indiceVirgulaEstadoFinal = linha.indexOf(',',indiceVirgulaEstadoInicial+1);
        int indiceParentesesEstadoFinal = linha.lastIndexOf('(');
        String estadoFinal = linha.substring(indiceParentesesEstadoFinal+1, indiceVirgulaEstadoFinal);
        
        char acaoGravar = linha.charAt(indiceVirgulaEstadoFinal+1);
        
        char acaoAndar = linha.charAt(indiceVirgulaEstadoFinal+3);        
       
        return new Transicao(estadoInicial, estadoFinal, condicao, acaoAndar, acaoGravar);
    }
}
