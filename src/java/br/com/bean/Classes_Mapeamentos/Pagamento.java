/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.bean.Classes_Mapeamentos;

import java.io.Serializable;
import java.sql.Date;


/**
 *
 * @author Guilherme
 */

public class Pagamento implements Serializable {

    private long pagamentoId;
    private String numeroCartao;
    private int bandeira;
    private String dataVencimento;
    private Aluno aluno;
    private Venda venda;

    public Pagamento() {

    }

    public Pagamento(String numeroCartao, int bandeira, String dataVencimento) {
        this.numeroCartao = numeroCartao;
        this.bandeira = bandeira;
        this.dataVencimento = dataVencimento;
    }

    /**
     * @return the numeroCartao
     */
    public String getNumeroCartao() {
        return numeroCartao;
    }

    /**
     * @param numeroCartao the numeroCartao to set
     */
    public void setNumeroCartao(String numeroCartao) {
        this.numeroCartao = numeroCartao;
    }

    /**
     * @return the bandeira
     */
    public int getBandeira() {
        return bandeira;
    }

    /**
     * @param bandeira the bandeira to set
     */
    public void setBandeira(int bandeira) {
        this.bandeira = bandeira;
    }

    /**
     * @return the dataVencimento
     */
    public String getDataVencimento() {
        return dataVencimento;
    }

    /**
     * @param dataVencimento the dataVencimento to set
     */
    public void setDataVencimento(String dataVencimento) {
        this.dataVencimento = dataVencimento;
    }

    /**
     * @return the aluno
     */
    public Aluno getAluno() {
        return aluno;
    }

    /**
     * @param aluno the aluno to set
     */
    public void setAluno(Aluno aluno) {
        this.aluno = aluno;
    }

    /**
     * @return the venda
     */
    public Venda getVenda() {
        return venda;
    }

    /**
     * @param venda the venda to set
     */
    public void setVenda(Venda venda) {
        this.venda = venda;
    }

    /**
     * @return the pagamentoId
     */
    public long getPagamentoId() {
        return pagamentoId;
    }

    /**
     * @param pagamentoId the pagamentoId to set
     */
    public void setPagamentoId(long pagamentoId) {
        this.pagamentoId = pagamentoId;
    }

}
