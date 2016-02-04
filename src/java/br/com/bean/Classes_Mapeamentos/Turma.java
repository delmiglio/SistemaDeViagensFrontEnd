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
public class Turma implements Serializable {


    private long turmaId;
    private int quantidadeAlunos;
    private int serie;
    private int ativo;
    private String descricao;
    private Set<Aluno> alunos = new HashSet<Aluno>();
    private Faculdade faculdade;

    public Turma() {

    }

    public Turma(int quantidadedeAlunos, int serie, String descricao) {
        this.quantidadeAlunos = quantidadedeAlunos;
        this.serie = serie;
        this.descricao = descricao;
    }

    

    /**
     * @return the quantidadeAlunos
     */
    public int getQuantidadeAlunos() {
        return quantidadeAlunos;
    }

    /**
     * @param quantidadeAlunos the quantidadeAlunos to set
     */
    public void setQuantidadeAlunos(int quantidadeAlunos) {
        this.quantidadeAlunos = quantidadeAlunos;
    }

    /**
     * @return the serie
     */
    public int getSerie() {
        return serie;
    }

    /**
     * @param serie the serie to set
     */
    public void setSerie(int serie) {
        this.serie = serie;
    }

    /**
     * @return the alunos
     */
    public Set<Aluno> getAlunos() {
        return alunos;
    }

    /**
     * @param alunos the alunos to set
     */
    public void setAlunos(Set<Aluno> alunos) {
        this.alunos = alunos;
    }

    /**
     * @return the faculdade
     */
    public Faculdade getFaculdade() {
        return faculdade;
    }

    /**
     * @param faculdade the faculdade to set
     */
    public void setFaculdade(Faculdade faculdade) {
        this.faculdade = faculdade;
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
     * @return the turmaId
     */
    public long getTurmaId() {
        return turmaId;
    }

    /**
     * @param turmaId the turmaId to set
     */
    public void setTurmaId(long turmaId) {
        this.turmaId = turmaId;
    }

}
