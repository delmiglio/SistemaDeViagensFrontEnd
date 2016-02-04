package br.com.bean.Controllers;

import br.com.bean.Classes_Mapeamentos.Faculdade;
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
 * @author Guilherme
 */
@Controller
public class usuarioController {

    @RequestMapping(value = "lista-usuarios-adm", method = RequestMethod.GET)
    public ModelAndView home() throws SQLException {
        ModelAndView mv = new ModelAndView("lista-usuario");
        RestTemplate request = new RestTemplate();
        String listaDeUsuarios = request.getForObject("http://localhost:8080/SistemaDeViagensBackEnd/busca-usuarios", String.class);
        Gson gson = new GsonBuilder()
                .registerTypeAdapter(Collection.class, new CollectionDeserializer()).create();
        Type listaUsuarios = new TypeToken<List<Usuario>>() {
        }.getType();
        List<Usuario> usuarios = gson.fromJson(listaDeUsuarios, listaUsuarios);
        mv.addObject("usuarios", usuarios);
        return mv;
    }

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public ModelAndView login() throws SQLException {
        ModelAndView mv = new ModelAndView("login");
        return mv;
    }

    @RequestMapping(value = "efetua-logoff", method = RequestMethod.GET)
    public ModelAndView logOff(HttpSession sessao, HttpServletRequest request) throws SQLException {
        sessao.setAttribute("logado", false);
        ManipuladorCookies.apagaCookie("loginCookie", request);
        ManipuladorCookies.apagaCookie("senhaCookie", request);
        return homeController.home();
    }

    @RequestMapping(value = "cadastro-usuario-adm", method = RequestMethod.GET)
    public ModelAndView cadastro() throws SQLException {
        RestTemplate restTemplate = new RestTemplate();
        String niveisPermissaoJson = restTemplate.getForObject("http://localhost:8080/SistemaDeViagensBackEnd"
                + "/nivel-acesso", String.class);
        Gson gson = new GsonBuilder()
                .registerTypeAdapter(Collection.class, new CollectionDeserializer()).create();
        Type integerStringMap = new TypeToken<Map<Integer, String>>() {
        }.getType();
        Map<Integer, String> niveisAcesso = gson.fromJson(niveisPermissaoJson, integerStringMap);
        ModelAndView mv = new ModelAndView("cadastro-usuario");
        mv.addObject("niveisAcesso", niveisAcesso);
        return mv;
    }

    @RequestMapping(value = "alteracao-usuario-adm", method = RequestMethod.GET)
    public ModelAndView alteracao(long id) {

        ModelAndView mv = new ModelAndView("cadastro-usuario");
        RestTemplate request = new RestTemplate();
        String usuario = request.getForObject("http://localhost:8080/SistemaDeViagensBackEnd"
                + "/buscaPorId-usuario?id="
                + id, String.class);
        Gson gson = new GsonBuilder()
                .registerTypeAdapter(Collection.class, new CollectionDeserializer()).create();
        Usuario u = gson.fromJson(usuario, Usuario.class);
        mv.addObject("usuario", u);
        String niveisPermissaoJson = request.getForObject("http://localhost:8080/SistemaDeViagensBackEnd"
                + "/nivel-acesso", String.class);
        Type integerStringMap = new TypeToken<Map<Integer, String>>() {
        }.getType();
        Map<Integer, String> niveisAcesso = gson.fromJson(niveisPermissaoJson, integerStringMap);
        mv.addObject("niveisAcesso", niveisAcesso);
        return mv;
    }

    @RequestMapping(value = "acesso-usuario", method = RequestMethod.POST)
    @ResponseBody
    public String acesso(String dados, boolean ckSalvaLogin,
            HttpSession sessao, HttpServletResponse response) throws SQLException {
        Gson gson = new Gson();
        Usuario u = gson.fromJson(dados, Usuario.class);
        RestTemplate restTemplate = new RestTemplate();
        String usuarioNoBanco = restTemplate.getForObject("http://localhost:8080/SistemaDeViagensBackEnd/"
                + "buscaUsuario-nomeSenha?email="
                + u.getEmail() + "&senha=" + u.getSenha(), String.class);
        if (!usuarioNoBanco.equalsIgnoreCase("null")) {
            Usuario usuario = gson.fromJson(usuarioNoBanco, Usuario.class);
            // Faculdade
            Faculdade f = null;
            if (usuario.getNivelPermissao() == 3) {
                String faculdadeNoBanco = restTemplate.getForObject("http://localhost:8080/SistemaDeViagensBackEnd/"
                        + "busca-faculdade-email-senha?email="
                        + u.getEmail() + "&senha=" + u.getSenha(), String.class);
                f = gson.fromJson(faculdadeNoBanco, Faculdade.class);
            }
            if (ckSalvaLogin) {
                Cookie c = new Cookie("loginCookie", usuario.getEmail());
                c.setMaxAge(1000000); // em segundos
                response.addCookie(c);

                c = new Cookie("senhaCookie", usuario.getSenha());
                c.setMaxAge(1000000); // em segundos
                response.addCookie(c);

            }
            sessao.setAttribute("logado", true);
            sessao.setAttribute("nome", usuario.getNome());
            sessao.setAttribute("nivelAcesso", usuario.getNivelPermissao());
            if (f != null) {
                sessao.setAttribute("faculdadeId", f.getFaculdadeId());
                sessao.setAttribute("faculdadeNome", f.getNome());
            }
            if (sessao.getAttribute("endereco") == null) {
                return CriadorJson.criaJsonSucesso("OK");
            } else {
                String endereco = sessao.getAttribute("endereco").toString();
                endereco = endereco.substring(endereco.lastIndexOf("/") + 1);
                return CriadorJson.criaJsonSucesso("OK");
            }
        } else {
            sessao.setAttribute("logado", false);
            return CriadorJson.criaJsonErro(null, "Nome de usuário e(ou) Senha inválidos");
        }
    }

    @RequestMapping(value = "salva-usuario-adm", method = RequestMethod.POST)
    @ResponseBody
    public String salvaUsuario(String dados) {
        RestTemplate request = new RestTemplate();
        Gson gson = new Gson();
        Usuario u = gson.fromJson(dados, Usuario.class);
        request.getMessageConverters().add(new GsonHttpMessageConverter(gson));
        String resposta = request.postForObject("http://localhost:8080/SistemaDeViagensBackEnd/insere-usuario", gson.toJson(u, Usuario.class), String.class);
        return resposta;
    }

    @RequestMapping(value = "atualiza-usuario-adm", method = RequestMethod.POST)
    @ResponseBody
    public String atualizaUsuario(String dados) {
        RestTemplate request = new RestTemplate();
        Gson gson = new Gson();
        Usuario u = gson.fromJson(dados, Usuario.class);
        request.getMessageConverters().add(new GsonHttpMessageConverter(gson));
        String mensagem = request.postForObject("http://localhost:8080/SistemaDeViagensBackEnd/atualiza-usuario", gson.toJson(u, Usuario.class), String.class);
        return mensagem;
    }

    @RequestMapping(value = "deleta-usuario-adm", method = RequestMethod.GET)
    @ResponseBody
    public String deletaUsuario(long id) {
        RestTemplate request = new RestTemplate();
        String resposta = request.getForObject("http://localhost:8080/SistemaDeViagensBackEnd/"
                + "deleta-usuario?id=" + id, String.class
        );
        return resposta;
    }

    @InitBinder
    private void binder(WebDataBinder binder) {
        binder.registerCustomEditor(float.class, new ConversorFloat());
    }

}
