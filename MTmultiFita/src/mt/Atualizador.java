/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package mt;


/**
 *
 * @author Zancanaro
 */
public class Atualizador implements Runnable{
    private Fita fita; 
    private Transicao t;

    
    
    public Atualizador(Fita fita, Transicao transicao){
        this.fita= fita;     
        this.t = transicao;
    }

    public void run(){
        
        this.fita.gravar(t.getAcaoGravar());
        if(t.getAcaoAndar()=='D')
        {
            this.fita.andarDireita();
        }
        else if(t.getAcaoAndar()=='E')
        {
            this.fita.andarEsquerda();
        }
               
    }
    
}
