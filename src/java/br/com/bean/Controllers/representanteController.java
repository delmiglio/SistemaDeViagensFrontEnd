/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.bean.Controllers;

import br.com.bean.Classes_Mapeamentos.Representante;
import br.com.bean.Classes_Mapeamentos.Usuario;
import br.com.bean.Utilitarios.CollectionDeserializer;
import br.com.bean.Utilitarios.ConversorFloat;
import br.com.bean.Utilitarios.CriadorJson;
import br.com.bean.Utilitarios.GsonHttpMessageConverter;
import br.com.bean.Utilitarios.ManipuladorCookies;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import java.lang.reflect.Type;
import java.sql.SQLException;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
 * @author Delmiglio
 */
@Controller
public class representanteController {
    
    @RequestMapping(value = "lista-representantes-adm", method = RequestMethod.GET)
    public ModelAndView home() throws SQLException {
        ModelAndView mv = new ModelAndView("lista-representante");
        RestTemplate request = new RestTemplate();
        String listaDeRepresentantes = request.getForObject("http://localhost:8080/SistemaDeViagensBackEnd/busca-representantes", String.class);
        Gson gson = new GsonBuilder()
                .registerTypeAdapter(Collection.class, new CollectionDeserializer()).create();
        Type listaRepresentantes = new TypeToken<List<Representante>>() {
        }.getType();
        List<Representante> representantes = gson.fromJson(listaDeRepresentantes, listaRepresentantes);
        mv.addObject("representantes", representantes);
        return mv;
    }

    @RequestMapping(value = "cadastro-representante-adm", method = RequestMethod.GET)
    public ModelAndView cadastro() throws SQLException {
       ModelAndView mv = new ModelAndView("cadastro-representante");
       return mv;
    }

    @RequestMapping(value = "alteracao-representante-adm", method = RequestMethod.GET)
    public ModelAndView alteracao(long id) {
        ModelAndView mv = new ModelAndView("cadastro-representante");
        RestTemplate request = new RestTemplate();
        String representante = request.getForObject("http://localhost:8080/SistemaDeViagensBackEnd"
                + "/buscaPorId-representante?id="
                + id, String.class);
        Gson gson = new GsonBuilder()
                .registerTypeAdapter(Collection.class, new CollectionDeserializer()).create();
        Representante r = gson.fromJson(representante, Representante.class);
        mv.addObject("representante", r);
        return mv;
    }

    @RequestMapping(value = "salva-representante-adm", method = RequestMethod.POST)
    @ResponseBody
    public String salvaRepresentante(String dados) {
        RestTemplate request = new RestTemplate();
        Gson gson = new Gson();
        Representante r = gson.fromJson(dados, Representante.class);
        request.getMessageConverters().add(new GsonHttpMessageConverter(gson));
        String resposta = request.postForObject("http://localhost:8080/SistemaDeViagensBackEnd/insere-representante", gson.toJson(r, Representante.class), String.class);
        return resposta;
    }

    @RequestMapping(value = "atualiza-representante-adm", method = RequestMethod.POST)
    @ResponseBody
    public String atualizaRepresentante(String dados) {
        RestTemplate request = new RestTemplate();
        Gson gson = new Gson();
        Representante r = gson.fromJson(dados, Representante.class);
        request.getMessageConverters().add(new GsonHttpMessageConverter(gson));
        String mensagem = request.postForObject("http://localhost:8080/SistemaDeViagensBackEnd/atualiza-representante", gson.toJson(r, Representante.class), String.class);
        return mensagem;
    }

    @RequestMapping(value = "deleta-representante-adm", method = RequestMethod.GET)
    @ResponseBody
    public String deletaRepresentante(long id) {
        RestTemplate request = new RestTemplate();
        String resposta = request.getForObject("http://localhost:8080/SistemaDeViagensBackEnd/"
                + "deleta-representante?id=" + id, String.class
        );
        return resposta;
    }

    @InitBinder
    private void binder(WebDataBinder binder) {
        binder.registerCustomEditor(float.class, new ConversorFloat());
    }
    
}
