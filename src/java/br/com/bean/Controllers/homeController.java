/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.bean.Controllers;

import br.com.bean.Classes_Mapeamentos.Festa;
import br.com.bean.Classes_Mapeamentos.Usuario;
import br.com.bean.Classes_Mapeamentos.Viagem;
import br.com.bean.Utilitarios.CollectionDeserializer;
import br.com.bean.Utilitarios.ConversorFloat;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonParseException;
import com.google.gson.JsonPrimitive;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;
import com.google.gson.reflect.TypeToken;
import java.lang.reflect.Type;
import java.sql.SQLException;
import java.util.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Guilherme
 */
@Controller
public class homeController {

    @RequestMapping("/home")
    public static ModelAndView home() throws SQLException {
        ModelAndView mv = new ModelAndView("home");
        RestTemplate request = new RestTemplate();
        String listaDeViagens = request.getForObject("http://localhost:8080/SistemaDeViagensBackEnd/busca-viagens", String.class);
        Gson gson = new GsonBuilder()
                .registerTypeAdapter(Collection.class, new CollectionDeserializer()).create();
        Type listaViagens = new TypeToken<List<Viagem>>() {
        }.getType();
        List<Usuario> viagens = gson.fromJson(listaDeViagens, listaViagens);
        mv.addObject("viagens", viagens);
        String listaDeFestas = request.getForObject("http://localhost:8080"
                + "/SistemaDeViagensBackEnd/busca-festas", String.class);
        Type listaFestas = new TypeToken<List<Festa>>() {
        }.getType();
        List<Festa> festas = gson.fromJson(listaDeFestas, listaFestas);
        mv.addObject("festas", festas);
        return mv;
    }

    JsonSerializer<Date> ser = new JsonSerializer<Date>() {
        @Override
        public JsonElement serialize(Date src, Type typeOfSrc, JsonSerializationContext context) {

            return src == null ? null : new JsonPrimitive(src.getTime());
        }
    };

    JsonDeserializer<Date> deser = new JsonDeserializer<Date>() {
        @Override
        public Date deserialize(JsonElement json, Type typeOfT,
                JsonDeserializationContext context) throws JsonParseException {
            try {
                DateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");
                String string1 = json.toString();
                return json == null ? null : (java.util.Date) df1.parse(string1);
            } catch (ParseException p) {
                return null;
            }
        }
    };

    @InitBinder
    public void binder(WebDataBinder binder) {
        binder.registerCustomEditor(float.class, new ConversorFloat());
    }

}
