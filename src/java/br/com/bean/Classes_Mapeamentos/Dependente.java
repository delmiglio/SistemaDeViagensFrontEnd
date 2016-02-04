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
public class Dependente extends Pessoa {
    
    private int grauParentesco;
    private Aluno aluno;
       
    
    
    public Dependente(){
        
    }
    
    public Dependente(int grauParentesco){
        this.grauParentesco = grauParentesco;
    }


    /**
     * @return the grauParentesco
     */
    public int getGrauParentesco() {
        return grauParentesco;
    }

    /**
     * @param grauParentesco the grauParentesco to set
     */
    public void setGrauParentesco(int grauParentesco) {
        this.grauParentesco = grauParentesco;
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
    
    
}
