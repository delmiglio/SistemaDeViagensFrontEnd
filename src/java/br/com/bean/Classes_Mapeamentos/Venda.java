/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.bean.Classes_Mapeamentos;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;


/**
 *
 * @author Guilherme
 */
public class Venda implements Serializable {

    private long vendaId;
    private Set<Festa> festas = new HashSet<Festa>();
    private Set<Viagem> viagens = new HashSet<Viagem>();
    private Set<Representante> representante = new HashSet<Representante>();
    private Pagamento pagamento;

    public Venda() {

    }

    /**
     * @return the festas
     */
    public Set<Festa> getFestas() {
        return festas;
    }

    /**
     * @param festas the festas to set
     */
    public void setFestas(Set<Festa> festas) {
        this.festas = festas;
    }

    /**
     * @return the viagens
     */
    public Set<Viagem> getViagens() {
        return viagens;
    }

    /**
     * @param viagens the viagens to set
     */
    public void setViagens(Set<Viagem> viagens) {
        this.viagens = viagens;
    }

    /**
     * @return the representante
     */
    public Set<Representante> getRepresentante() {
        return representante;
    }

    /**
     * @param representante the representante to set
     */
    public void setRepresentante(Set<Representante> representante) {
        this.representante = representante;
    }

    /**
     * @return the pagamento
     */
    public Pagamento getPagamento() {
        return pagamento;
    }

    /**
     * @param pagamento the pagamento to set
     */
    public void setPagamento(Pagamento pagamento) {
        this.pagamento = pagamento;
    }

    /**
     * @return the vendaId
     */
    public long getVendaId() {
        return vendaId;
    }

    /**
     * @param vendaId the vendaId to set
     */
    public void setVendaId(long vendaId) {
        this.vendaId = vendaId;
    }

}
