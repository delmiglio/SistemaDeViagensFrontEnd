/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.bean.Classes_Mapeamentos;

import java.io.Serializable;
/**
 *
 * @author Guilherme
 */
public class AlunoxVenda implements Serializable {

   
    private AlunoxVendaID alunoxVendaId;
    private int parcelas;
    private float valorTotal;

    public AlunoxVenda(AlunoxVendaID alunoxvenda, int parcelas, float valorTotal) {
        this.alunoxVendaId = alunoxvenda;
        this.parcelas = parcelas;
        this.valorTotal = valorTotal;
    }

    public AlunoxVenda() {

    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final AlunoxVenda other = (AlunoxVenda) obj;
        if (this.alunoxVendaId != other.alunoxVendaId && (this.alunoxVendaId == null || !this.alunoxVendaId.equals(other.alunoxVendaId))) {
            return false;
        }
        if (this.parcelas != other.parcelas) {
            return false;
        }

        if (this.valorTotal != other.valorTotal) {
            return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 89 * hash + (this.alunoxVendaId != null ? this.alunoxVendaId.hashCode() : 0);
        hash = 89 * hash + this.parcelas;
        hash = 89 * hash + Integer.class.cast(this.valorTotal);
        return hash;
    }

    /**
     * @return the alunoxVendaId
     */
    public AlunoxVendaID getAlunoxVendaId() {
        return alunoxVendaId;
    }

    /**
     * @param alunoxVendaId the alunoxVendaId to set
     */
    public void setAlunoxVendaId(AlunoxVendaID alunoxVendaId) {
        this.alunoxVendaId = alunoxVendaId;
    }

    /**
     * @return the parcelas
     */
    public int getParcelas() {
        return parcelas;
    }

    /**
     * @param parcelas the parcelas to set
     */
    public void setParcelas(int parcelas) {
        this.parcelas = parcelas;
    }

    /**
     * @return the valorTotal
     */
    public float getValorTotal() {
        return valorTotal;
    }

    /**
     * @param valorTotal the valorTotal to set
     */
    public void setValorTotal(float valorTotal) {
        this.valorTotal = valorTotal;
    }

}
