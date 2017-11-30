/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package mt;

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
    private ArrayList<Transicao> funcaoTransicao;
    private Fita fita;
    private String tipo;
    private File saida;
    
    public Maquina() 
    {
        this.estados = new ArrayList<>();
        this.funcaoTransicao = new ArrayList<>();
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
        this.fita = f;
    }

    public void setTipo(String tipo) 
    {
        this.tipo = tipo;
    }    
    
    private void configuracao()
    {
      //  System.out.println("----------------------------------------------------");
        int cabeca = this.fita.getCabeca();
        String contet = this.fita.getConteudo();
        
       /* System.out.print("|");
        for(int i=0; i< contet.length(); i++)
        {
            if(cabeca == i)
            {
                System.out.print(this.estadoAtual+"=");
            }          
            System.out.print(contet.charAt(i)+"|");            
        }  
        System.out.println();*/
    }    
    
    public void start(ArrayList<String> entradas,String estadoInicial)
    {
        this.SetSaida();
        for(String entrada : entradas)
        {
            this.estadoAtual = estadoInicial;
            this.addFita(new Fita(entrada));
            System.out.println("Entrada => "+entrada);
                        
                while(true)
                {
                    this.configuracao();
                    if(!this.processa())
                    {
                         this.ImprimeSaida(0, entrada);
                        //System.out.println("rejeita");
                        break;
                    }                        
                    else if(this.estadoAtual.equals("qac"))
                    {   
                         this.ImprimeSaida(1, entrada);
                        //System.out.println("aceita");
                        break;
                    }                
                }
            
        }        
    }
    
    private boolean processa()
    {
        for(Transicao t : this.funcaoTransicao)
        {
            if(this.estadoAtual.equals(t.getEstadoInicial()))
            {                
                if(this.fita.ler() == t.getCondicao())
                {
                    this.fita.gravar(t.getAcaoGravar());
                    if(t.getAcaoAndar()=='D')
                    {
                        this.fita.andarDireita();
                    }
                    else if(t.getAcaoAndar()=='E')
                    {
                        this.fita.andarEsquerda();
                    }
                    this.estadoAtual = t.getEstadoFinal();
                    return true;
                }
            }
        }
        return false;
    }

    
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
                    writer.println(this.fita.getConteudo());
                }else{
                    writer.println(entrada);
                    writer.println("aceita");
                    writer.println(this.fita.getConteudo());
                }
                
            }
        } catch (IOException ex) {
            Logger.getLogger(Maquina.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            writer.close();
        }
    
    }

}

