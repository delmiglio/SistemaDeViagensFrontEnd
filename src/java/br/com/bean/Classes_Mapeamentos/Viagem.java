/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.bean.Classes_Mapeamentos;

import java.io.Serializable;
import java.text.ParseException;


/**
 *
 * @author Guilherme
 */
public class Viagem implements Serializable {

    private long viagemId;
    private String origem;
    private String destino;
    private String dataIda;
    private String dataVolta;
    private short vooComEscala;
    private float preco;
    private String hotel;
    private String descricao;
    private String foto;
    private Venda venda;

    public Viagem(String origem, String destino, String dataIda, String dataVolta, short vooComEscala,
            float preco, String hotel, String descricao, String foto) throws ParseException {
        this.origem = origem;
        this.destino = destino;
        this.dataIda = dataIda;
        this.dataVolta = dataVolta;
        this.vooComEscala = vooComEscala;
        this.preco = preco;
        this.hotel = hotel;
        this.descricao = descricao;
        this.foto = foto;
    }

    public Viagem() {

    }

    /**
     * @return the origem
     */
    public String getOrigem() {
        return origem;
    }

    /**
     * @param origem the origem to set
     */
    public void setOrigem(String origem) {
        this.origem = origem;
    }

    /**
     * @return the destino
     */
    public String getDestino() {
        return destino;
    }

    /**
     * @param destino the destino to set
     */
    public void setDestino(String destino) {
        this.destino = destino;
    }

    /**
     * @return the dataIda
     */
    public String getDataIda() {
        return dataIda;
    }

    /**
     * @param dataIda the dataIda to set
     */
    public void setDataIda(String dataIda) {
        this.dataIda = dataIda;
    }

    /**
     * @return the dataVolta
     */
    public String getDataVolta() {
        return dataVolta;
    }

    /**
     * @param dataVolta the dataVolta to set
     */
    public void setDataVolta(String dataVolta) {
        this.dataVolta = dataVolta;
    }

    /**
     * @return the vooComEscala
     */
    public short getVooComEscala() {
        return vooComEscala;
    }

    /**
     * @param vooComEscala the vooComEscala to set
     */
    public void setVooComEscala(short vooComEscala) {
        this.vooComEscala = vooComEscala;
    }

    /**
     * @return the preco
     */
    public float getPreco() {
        return preco;
    }

    /**
     * @param preco the preco to set
     */
    public void setPreco(float preco) {
        this.preco = preco;
    }

    /**
     * @return the hotel
     */
    public String getHotel() {
        return hotel;
    }

    /**
     * @param hotel the hotel to set
     */
    public void setHotel(String hotel) {
        this.hotel = hotel;
    }

    /**
     * @return the descricao
     */
    public String getDescricao() {
        return descricao;
    }

    /**
     * @param descricao the descricao to set
     */
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    /**
     * @return the foto
     */
    public String getFoto() {
        return foto;
    }

    /**
     * @param foto the foto to set
     */
    public void setFoto(String foto) {
        this.foto = foto;
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
     * @return the viagemId
     */
    public long getViagemId() {
        return viagemId;
    }

    /**
     * @param viagemId the viagemId to set
     */
    public void setViagemId(long viagemId) {
        this.viagemId = viagemId;
    }

}
