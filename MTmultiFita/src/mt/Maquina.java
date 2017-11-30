/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package mt;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author rafael
 */
public class Maquina 
{
    private String estadoAtual;
    private ArrayList<String> estados;
    private String tipo;
    private ArrayList<Transicao> funcaoTransicao;
    private int Nfitas;
    private ArrayList<Fita> fitas;
    private ArrayList<Atualizador> atualizadores;
    private ArrayList<Thread> threads;
    private File saida;
     /*
        ArrayTransiçoes: |T1f1|T1f2|T2f1|T2f2|...|
        Indice do arrray:   0    1    2    3
        nFitas = 2;
        */
    
    
    public Maquina() 
    {
        this.estados = new ArrayList<>();
        this.funcaoTransicao = new ArrayList<>();
        this.threads = new ArrayList<>();
        this.fitas = new ArrayList<>();
        this.atualizadores = new ArrayList<>();
    }

    public void addEstado(String estado)
    {
        this.estados.add(estado);
    }
    
    public void addTransicao(Transicao t)
    {
        this.funcaoTransicao.add(t);
    }
    
    public void addFita(Fita f)
    {
        //ALTERAR
        this.fitas.add(f);
    }

    public void setTipo(String tipo) 
    {
        this.tipo = tipo;
    }    
    
    public void setNfitas(int n){
        this.Nfitas = n;
    }
    
    private void configuracao()
    {
        
        //ALTERAR
       // System.out.println("----------------------------------------------------");
        int cabecas[] = new int[Nfitas];
        String content[] = new String[Nfitas];
        for(int j = 0; j<Nfitas; j++){
            cabecas[j]= this.fitas.get(j).getCabeca();
            content[j]= this.fitas.get(j).getConteudo();
        }
        
                
        /*
        System.out.print("|");
        for(int i=0; i< contet.length(); i++)
        {
            if(cabeca1 == i)
            {
                System.out.print(this.estadoAtual+"=");
            }          
            System.out.print(contet.charAt(i)+"|");            
            
        }
        System.out.print("\n");
        for(int i=0; i< content[1].length();i++){
            if(cabecas[1] == i){
                System.out.print(content[1].charAt(0)+"|");
                System.out.println();
            }
        }*/
    }    
    
    public void start(ArrayList<String> entradas,String estadoInicial)
    {
        
        this.SetSaida();
        for(String entrada : entradas)
        { 
            
            this.estadoAtual = estadoInicial;
            //Fita 1 com a entrada.
            this.addFita(new Fita(entrada));
            //Restante das fitas em branco.
            for(int i=0; i<Nfitas-1; i++){
                this.addFita(new Fita(""));
            }
           
           // System.out.println("Entrada => "+entrada);
            if(this.tipo.equals("R")||this.tipo.equals("P"))
            {               
                while(true)
                {
                    this.configuracao();
                    try {
                        if(!this.processa())
                        {
                            this.ImprimeSaida(0, entrada);
                            //System.out.println("rejeita");
                            break;
                        }
                        else if(this.estadoAtual.equals("qac"))
                        {
                            this.ImprimeSaida(1, entrada);
                           // System.out.println("aceita");
                            break;                
                        }
                    } catch (InterruptedException ex) {
                        Logger.getLogger(Maquina.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
            //Limpa a lista de fitas.
            this.fitas.clear();
        }        
    }
    
    
    private boolean processa() throws InterruptedException
    {
        //ALTERAR
        //ArrayList com as transições das n fitas a serem testadas em um passo.
        ArrayList<Transicao> trans = new ArrayList<>(); 
        //controle dos testes de condições.
        boolean allFitasOk = false;
        /*
        ArrayTransiçoes: |T1f1|T1f2|T2f1|T2f2|...|
        Indice do arrray:   0    1    2    3
        nFitas = 2;
        */
        //Como as transições são guardadas em um mesmo array, percorre de N em N transições.
        for(int i=0; i< this.funcaoTransicao.size(); i= i+Nfitas)
        {
            //Transição da primeira fita, usada como base para o teste de estados.
            Transicao t = this.funcaoTransicao.get(i);
            //System.out.print("1º for \n");
            if(this.estadoAtual.equals(t.getEstadoInicial()))
            {                
               //Lista com as transiçoes atuais de todas as fitas
               // System.out.print("estadoatual = estadoinicial \n");
                for(int j=0; j< Nfitas; j++){
                    trans.add(this.funcaoTransicao.get(i+j)); 
                   // System.out.print(trans.get(j).getEstadoInicial()+"|"+trans.get(j).getCondicao()+"\n");
                }
                //Instancia uma thread para realizar as operações sobre cada uma das fitas.
                //Inicia pela fita 0 e percorre todas as fitas da máquina.
                int fita = 0;
                for(Transicao tr : trans){
                   // System.out.print("Foreach trans|Fita ="+fita+"Cabeca1 ="+this.fitas.get(fita).getCabeca()+" \n");
                    allFitasOk = true;
                    if(this.fitas.get(fita).ler() == tr.getCondicao())
                    {   
                        //Adiciona uma thread de atualização na pool;
                        Atualizador at = new Atualizador(this.fitas.get(fita),tr); 
                        this.atualizadores.add(at);
                        Thread threadn = new Thread(at);
                        this.threads.add(threadn);
                       // System.out.print("Condição aceita: "+tr.getCondicao()+"\n");
                        //System.out.print("Conteudo da fita: "+this.fitas.get(fita).ler()+"\n");
                       // System.out.print("Posicao Cabeça"+fita+" " +this.fitas.get(fita).getCabeca()+" | ");

                        //Passa para a próxima fita a ser testada.
                        fita++;   
                    }
                    else
                    {
                        allFitasOk = false;
                        this.LimpaThreads();
                        
                        // System.out.print("FALSE \n");
                        //System.out.print("Condição rejeitada: "+tr.getCondicao()+"\n");
                         // System.out.print("Conteudo da fita: "+this.fitas.get(fita).ler()+"\n");
                        
                        break;
                    }     
                }
                if(allFitasOk){
                    //roda todas as threads de atualização;
                    for(Thread exec : this.threads){
                        exec.start();
                     }
                    this.estadoAtual = t.getEstadoFinal();
                    //Sincroniza as threads com o programa principal.
                    for(Thread j : this.threads){
                        j.join();
                    }
                    this.LimpaThreads();
                    return true;
                }
                                               
            }
            //Limpa a lista de transações atuais
            trans.clear();
        }
        return false;
    }

    //Apaga todas as threads decorridas.
    private void LimpaThreads(){
        this.atualizadores.clear();
        this.threads.clear();
    }

     //Determina o arquivo a ser utilizado como saida do programa
    private void SetSaida()
    {
        File output = new File("../output.txt");
        if(!output.exists())
        {
            try {
                output.createNewFile();
            } catch (IOException ex) {
                Logger.getLogger(Maquina.class.getName()).log(Level.SEVERE, null, ex);
            }
        }else
        {
            output.delete();
            try {
                output.createNewFile();
            } catch (IOException ex) {
                Logger.getLogger(Maquina.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        this.saida = output;
        
    }
    
    private void ImprimeSaida(int result, String entrada){
     
        
        
        PrintWriter writer = null;
        try {
            writer = new PrintWriter(new FileWriter(this.saida,true),true);
            if(this.tipo.equals("R"))
            {
                if(result==0){
                    writer.println("rejeita");
                }else{
                    writer.println("aceita");
                }
            }else
            {
                if(result==0){
                    writer.println(entrada);
                    writer.println("rejeita");
                    writer.println(this.fitas.get(0).getConteudo());
                }else{
                    writer.println(entrada);
                    writer.println("aceita");
                    writer.println(this.fitas.get(0).getConteudo());
                }
                
            }
        } catch (IOException ex) {
            Logger.getLogger(Maquina.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            writer.close();
        }
    
    }
}