/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.bean.Controllers;

import br.com.bean.Classes_Mapeamentos.Faculdade;
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
public class faculdadeController {

    @RequestMapping(value = "lista-faculdades", method = RequestMethod.GET)
    public ModelAndView home() throws SQLException {

        ModelAndView mv = new ModelAndView("lista-faculdade");
        RestTemplate request = new RestTemplate();
        String listaDeFaculdades = request.getForObject("http://localhost:8080"
                + "/SistemaDeViagensBackEnd/busca-faculdades", String.class);
        Gson gson = new GsonBuilder()
                .registerTypeAdapter(Collection.class, new CollectionDeserializer()).create();
        Type listaFaculdades = new TypeToken<List<Faculdade>>() {
        }.getType();
        List<Faculdade> faculdades = gson.fromJson(listaDeFaculdades, listaFaculdades);
        mv.addObject("faculdades", faculdades);
        return mv;
    }

    @RequestMapping(value = "cadastro-faculdade", method = RequestMethod.GET)
    public ModelAndView cadastro() throws SQLException {
        ModelAndView mv = new ModelAndView("cadastro-faculdade");
        return mv;
    }

    @RequestMapping(value = "alteracao-faculdade", method = RequestMethod.GET)
    public ModelAndView alteracao(long id) {
        ModelAndView mv = new ModelAndView("cadastro-faculdade");
        RestTemplate request = new RestTemplate();
        String faculdadeString = request.getForObject("http://localhost:8080//SistemaDeViagensBackEnd"
                + "/buscaPorId-faculdade?id=" + id, String.class);
        Gson gson = new GsonBuilder()
                .registerTypeAdapter(Collection.class, new CollectionDeserializer()).create();
        Faculdade faculdade = gson.fromJson(faculdadeString, Faculdade.class);
        mv.addObject("faculdade", faculdade);
        return mv;
    }

    @RequestMapping(value = "salva-faculdade", method = RequestMethod.POST)
    @ResponseBody
    public String salvaFaculdade(String dados) {
        RestTemplate request = new RestTemplate();
        Gson gson = new Gson();
        Faculdade f = gson.fromJson(dados, Faculdade.class);
        request.getMessageConverters().add(new GsonHttpMessageConverter(gson));
        String resposta = request.postForObject("http://localhost:8080/SistemaDeViagensBackEnd"
                + "/insere-faculdade", gson.toJson(f, Faculdade.class), String.class);
        return resposta;
    }

    @RequestMapping(value = "atualiza-faculdade", method = RequestMethod.POST)
    @ResponseBody
    public String atualizaFaculdade(String dados) {
        RestTemplate request = new RestTemplate();
        Gson gson = new Gson();
        Faculdade f = gson.fromJson(dados, Faculdade.class);
        request.getMessageConverters().add(new GsonHttpMessageConverter(gson));
        String mensagem = request.postForObject("http://localhost:8080/SistemaDeViagensBackEnd"
                + "/atualiza-faculdade", gson.toJson(f, Faculdade.class), String.class);
        return mensagem;
    }

    @RequestMapping(value = "deleta-faculdade-adm", method = RequestMethod.GET)
    @ResponseBody
    public String deletaFaculdade(long id, HttpServletRequest request) throws SQLException {
        RestTemplate restTemplate = new RestTemplate();
        String resposta = restTemplate.getForObject("http://localhost:8080/SistemaDeViagensBackEnd"
                + "/deleta-faculdade?id=" + id, String.class);
        return resposta;
    }

    @InitBinder
    private void binder(WebDataBinder binder) {
        binder.registerCustomEditor(float.class, new ConversorFloat());
    }

}
