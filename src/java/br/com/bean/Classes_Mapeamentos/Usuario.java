/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.bean.Classes_Mapeamentos;

/**
 *
 * @author Guilherme
 */
public class Usuario extends Pessoa {

    private int nivelPermissao;

    public Usuario() {

    }

    public Usuario(int nivelPermissao) {
        this.nivelPermissao = nivelPermissao;
    }

    /**
     * @return the nivelPermissao
     */
    public int getNivelPermissao() {
        return nivelPermissao;
    }

    /**
     * @param nivelPermissao the nivelPermissao to set
     */
    public void setNivelPermissao(int nivelPermissao) {
        this.nivelPermissao = nivelPermissao;
    }

}
