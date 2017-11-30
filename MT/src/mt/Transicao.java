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
public class Transicao 
{
    private final String estadoInicial;
    private final String estadoFinal;
    private final char condicao;
    private final char acaoAndar;
    private final char acaoGravar;

    public Transicao(String estadoInicial, String estadoFinal, char condicao, char acaoAndar, char acaoGravar) {
        this.estadoInicial = estadoInicial;
        this.estadoFinal = estadoFinal;
        this.condicao = condicao;
        this.acaoAndar = acaoAndar;
        this.acaoGravar = acaoGravar;
    }

    public String getEstadoInicial() 
    {
        return estadoInicial;
    }

    public String getEstadoFinal() 
    {
        return estadoFinal;
    }

    public char getCondicao() 
    {
        return condicao;
    }

    public char getAcaoAndar() 
    {
        return acaoAndar;
    }

    public char getAcaoGravar() 
    {
        return acaoGravar;
    }    
}
