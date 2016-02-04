/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.bean.Controllers;

import br.com.bean.Classes_Mapeamentos.Turma;
import br.com.bean.Utilitarios.CollectionDeserializer;
import br.com.bean.Utilitarios.ConversorFloat;
import br.com.bean.Utilitarios.GsonHttpMessageConverter;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import java.lang.reflect.Type;
import java.sql.SQLException;
import java.util.Collection;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Guilherme
 */
@Controller
public class turmaController {

    @RequestMapping(value = "lista-turmas", method = RequestMethod.GET)
    public ModelAndView home(HttpServletRequest servletRequest) throws SQLException {
        // Pega o Id da Faculdade que estava Guardado na Sessao
        HttpSession sessao = servletRequest.getSession();
        long faculdadeId = (long) sessao.getAttribute("faculdadeId");
        ModelAndView mv = new ModelAndView("lista-turma");
        RestTemplate request = new RestTemplate();
        String listaDeTurmas = request.getForObject("http://localhost:8080/SistemaDeViagensBackEnd/busca-turmas?faculdadeId="+faculdadeId, String.class);
        Gson gson = new GsonBuilder()
                .registerTypeAdapter(Collection.class, new CollectionDeserializer()).create();
        Type listaTurmas = new TypeToken<List<Turma>>() {
        }.getType();
        List<Turma> turmas = gson.fromJson(listaDeTurmas, listaTurmas);
        mv.addObject("turmas", turmas);
        return mv;
    }

    @RequestMapping(value = "cadastro-turma-adm", method = RequestMethod.GET)
    public ModelAndView cadastro(HttpServletRequest servletRequest) throws SQLException {
        RestTemplate request = new RestTemplate();
        ModelAndView mv = new ModelAndView("cadastro-turma");
        return mv;
    }

    @RequestMapping(value = "alteracao-turma-adm", method = RequestMethod.GET)
    public ModelAndView alteracao(long id) {
        ModelAndView mv = new ModelAndView("cadastro-turma");
        RestTemplate request = new RestTemplate();
        String turmaString = request.getForObject("http://localhost:8080//SistemaDeViagensBackEnd"
                + "/buscaPorId-turma?id=" + id, String.class);
        Gson gson = new Gson();
        Turma turma = gson.fromJson(turmaString, Turma.class);
        mv.addObject("turma", turma);
        return mv;
    }

    @RequestMapping(value = "salva-turma-adm", method = RequestMethod.POST)
    @ResponseBody
    public String salvaTurma(String dados, HttpServletRequest servletRequest) {
        RestTemplate request = new RestTemplate();
        HttpSession sessao = servletRequest.getSession();
        long faculdadeId = (long) sessao.getAttribute("faculdadeId");
        Gson gson = new Gson();
        Turma t = gson.fromJson(dados, Turma.class);
        request.getMessageConverters().add(new GsonHttpMessageConverter(gson));
        String resposta = request.postForObject("http://localhost:8080/SistemaDeViagensBackEnd"
                + "/insere-turma?faculdadeId=" + faculdadeId, gson.toJson(t, Turma.class), String.class);
        return resposta;
    }

    @RequestMapping(value = "atualiza-turma-adm", method = RequestMethod.POST)
    @ResponseBody
    public String atualizaTurma(String dados, HttpServletRequest servletRequest) {
        HttpSession sessao = servletRequest.getSession();
        long faculdadeId = (long) sessao.getAttribute("faculdadeId");
        RestTemplate request = new RestTemplate();
        Gson gson = new Gson();
        Turma t = gson.fromJson(dados, Turma.class);
        request.getMessageConverters().add(new GsonHttpMessageConverter(gson));
        String mensagem = request.postForObject("http://localhost:8080/SistemaDeViagensBackEnd"
                + "/atualiza-turma?faculdadeId="+faculdadeId, gson.toJson(t, Turma.class), String.class);
        return mensagem;
    }

    @RequestMapping(value = "deleta-turma-adm", method = RequestMethod.GET)
    @ResponseBody
    public String deletaFesta(long id, HttpServletRequest request) throws SQLException {
        RestTemplate restTemplate = new RestTemplate();
        String resposta = restTemplate.getForObject("http://localhost:8080/SistemaDeViagensBackEnd"
                + "/deleta-turma?id=" + id, String.class);
        return resposta;
    }
    
    @InitBinder
    public void binder(WebDataBinder binder) {
        binder.registerCustomEditor(float.class, new ConversorFloat());
    }
}
