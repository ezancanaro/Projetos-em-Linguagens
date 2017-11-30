/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package mt;

/**
 *
 * @author rafael
 */
public class Fita 
{
    private String conteudo;
    private int cabeca;

    public Fita(String conteudo) 
    {
        this.cabeca = 0;
        this.conteudo = conteudo+"B";
    }
    
    public void andarDireita()    
    {
        this.cabeca++;
        if(this.conteudo.length() == this.cabeca)
            this.conteudo = this.conteudo+" ";
    }
    
    public void andarEsquerda()
    {
        this.cabeca --;
    }
    
    public char ler()
    {
        return this.conteudo.charAt(cabeca);
    }
    
    public void gravar(char caracter)
    {        
        String resultado = "";  
        int posicao = this.cabeca;  
        char caracterParaMudar = caracter;  
        for(int i = 0; i < this.conteudo.length(); i++)
        {  
            if(i == posicao)
            {  
                resultado+=caracterParaMudar;  
            }else
            {  
                resultado+=this.conteudo.charAt(i);  
            }  
              
        }  
        this.conteudo = resultado;
    }

    public String getConteudo() 
    {
        return this.conteudo;
    }

    public int getCabeca() 
    {
        return this.cabeca;
    }    
}
