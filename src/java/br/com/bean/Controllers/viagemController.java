package br.com.bean.Controllers;

import br.com.bean.Classes_Mapeamentos.Festa;
import br.com.bean.Classes_Mapeamentos.Usuario;
import br.com.bean.Classes_Mapeamentos.Viagem;
import br.com.bean.Utilitarios.CollectionDeserializer;
import br.com.bean.Utilitarios.ConversorFloat;
import br.com.bean.Utilitarios.CriadorJson;
import br.com.bean.Utilitarios.GsonHttpMessageConverter;
import com.google.gson.*;
import com.google.gson.reflect.TypeToken;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Type;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Guilherme
 */
@Controller
public class viagemController {

    @RequestMapping(value = "lista-viagens", method = RequestMethod.GET)
    public ModelAndView home() throws SQLException {
        ModelAndView mv = new ModelAndView("lista-viagem");
        RestTemplate request = new RestTemplate();
        String listaDeViagens = request.getForObject("http://localhost:8080/SistemaDeViagensBackEnd/busca-viagens", String.class);
        Gson gson = new GsonBuilder()
                .registerTypeAdapter(Collection.class, new CollectionDeserializer()).create();
        Type listaViagens = new TypeToken<List<Viagem>>() {
        }.getType();
        List<Usuario> viagens = gson.fromJson(listaDeViagens, listaViagens);
        mv.addObject("viagens", viagens);
        return mv;
    }

    @RequestMapping(value = "cadastro-viagem-adm", method = RequestMethod.GET)
    public ModelAndView cadastro() throws SQLException {
        RestTemplate request = new RestTemplate();
        String listaVooComEscala = request.getForObject("http://localhost:8080/SistemaDeViagensBackEnd"
                + "/vooComEscala", String.class);
        Gson gson = new GsonBuilder()
                .registerTypeAdapter(Collection.class, new CollectionDeserializer()).create();
        Type integerStringMap = new TypeToken<Map<Integer, String>>() {
        }.getType();
        Map<Integer, String> voosComEscala = gson.fromJson(listaVooComEscala, integerStringMap);
        ModelAndView mv = new ModelAndView("cadastro-viagem");
        mv.addObject("voosComEscala", voosComEscala);
        return mv;
    }

    @RequestMapping(value = "alteracao-viagem-adm", method = RequestMethod.GET)
    public ModelAndView alteracao(long id) {
        ModelAndView mv = new ModelAndView("cadastro-viagem");
        RestTemplate request = new RestTemplate();
        String viagem = request.getForObject("http://localhost:8080/SistemaDeViagensBackEnd"
                + "/buscaPorId-viagem?id=" + id, String.class);
        Gson gson = new GsonBuilder()
                .registerTypeAdapter(Collection.class, new CollectionDeserializer()).create();
        Viagem v = gson.fromJson(viagem, Viagem.class);
        String listaVooComEscala = request.getForObject("http://localhost:8080/SistemaDeViagensBackEnd"
                + "/vooComEscala", String.class);
        Type integerStringMap = new TypeToken<Map<Integer, String>>() {
        }.getType();
        Map<Integer, String> voosComEscala = gson.fromJson(listaVooComEscala, integerStringMap);
        mv.addObject("viagem", v);
        mv.addObject("voosComEscala",voosComEscala);
        return mv;
    }

    @RequestMapping(value = "salva-viagem-adm", method = RequestMethod.POST)
    @ResponseBody
    public String salvaViagem(String dados) {
        RestTemplate request = new RestTemplate();
        Gson gson = new Gson();
        Viagem v = gson.fromJson(dados, Viagem.class);
        request.getMessageConverters().add(new GsonHttpMessageConverter(gson));
        String resposta = request.postForObject("http://localhost:8080/SistemaDeViagensBackEnd"
                + "/insere-viagem", gson.toJson(v, Viagem.class), String.class);
        return resposta;
    }

    @RequestMapping(value = "atualiza-viagem-adm", method = RequestMethod.POST)
    @ResponseBody
    public String atualizaViagem(String dados) {
        Gson gson = new Gson();
        Viagem v = gson.fromJson(dados, Viagem.class);
        RestTemplate request = new RestTemplate();
        request.getMessageConverters().add(new GsonHttpMessageConverter(gson));
        String mensagem = request.postForObject("http://localhost:8080/SistemaDeViagensBackEnd"
                + "/atualiza-viagem", gson.toJson(v, Viagem.class), String.class);
        return mensagem;

    }

    @RequestMapping(value = "cadastro-imagem-viagem-adm", method = RequestMethod.GET)
    public ModelAndView cadastroImagemViagem(String dados, HttpServletRequest request) {
        Viagem v = new Gson().fromJson(dados, Viagem.class);
        HttpSession sessao = request.getSession();
        sessao.setAttribute("viagemTmp", v);
        ModelAndView mv = new ModelAndView("cadastro-imagem-viagem");
        mv.addObject("viagem", v);
        return mv;
    }

    @RequestMapping(value = "deleta-viagem-adm", method = RequestMethod.GET)
    @ResponseBody
    public String deletaViagem(long id, HttpServletRequest request) throws SQLException {
        apagaImagens(id, request);
        RestTemplate servletRequest = new RestTemplate();
        String resposta = servletRequest.getForObject("http://localhost:8080/SistemaDeViagensBackEnd"
                + "/deleta-viagem?id=" + id, String.class);
        return resposta;
    }

    @RequestMapping(value = "salvar-imagem-viagem", method = RequestMethod.POST)
    public ModelAndView salvaImagensViagem(HttpServletRequest request,
            @RequestParam("fotoSelecionada") MultipartFile fotoSelecionada) throws SQLException {
        try {
            HttpSession sessao = request.getSession();
            Viagem viagem = (Viagem) sessao.getAttribute("viagemTmp");
            viagem.setFoto(criaNomeImagem(1, viagem.getViagemId(), fotoSelecionada));
            salvaImagem("fotoSelecionada", viagem.getFoto(), request, fotoSelecionada);
            String mensagemAtualizacao = atualizaViagem(new Gson().toJson(viagem, Viagem.class));
        } catch (Exception erro) {
            String jsonErro = CriadorJson.criaJsonErro(erro, "Ocorreu um Erro ao Salvar Imagem");
        }
        return home();

    }

    private void apagaImagens(long id, HttpServletRequest request) throws SQLException {
        RestTemplate restTemplate = new RestTemplate();
        String viagemString = restTemplate.getForObject("http://localhost:8080//SistemaDeViagensBackEnd"
                + "/buscaPorId-viagem?id=" + id, String.class);
        Gson gson = new Gson();
        Viagem viagemCadastrada = gson.fromJson(viagemString, Viagem.class);
        File file = new File(getPastaImagens(request) + viagemCadastrada.getFoto());
        if (file.exists()) {
            file.delete();
        }
    }

    /**
     * Cria o nome da imagem
     *
     * @param numeroImagem numero da imagem (1,2 ou 3)
     * @param IdImagem (id da imagem no banco de dados)
     * @param request (objeto request com os dados da imagem)
     * @return Nome da imagem
     * @throws Exception
     */
    private String criaNomeImagem(int numeroImagem, long IdImagem,
            MultipartFile conteudoArquivo) throws Exception {

        String originalName = conteudoArquivo.getOriginalFilename();
        String ext = getExtension(originalName);
        String arquivo = "img_" + IdImagem + "_" + numeroImagem + "." + ext;
        return arquivo;
    }

    private void salvaImagem(String imagem, String nomeArquivoDestino,
            HttpServletRequest request, MultipartFile conteudoArquivo) throws Exception {

        String pastaDestino = getPastaImagens(request);
        File outputFilePath = new File(pastaDestino + nomeArquivoDestino);

        byte[] bytes = conteudoArquivo.getBytes();
        BufferedOutputStream stream = null;
        try {
            stream = new BufferedOutputStream(new FileOutputStream(outputFilePath));
            stream.write(bytes);
        } finally {
            if (stream != null) {
                stream.close();
            }
        }
    }

    private String getPastaImagens(HttpServletRequest request) {
        return request.getServletContext().getRealPath("/WEB-INF/jsp/Img_Viagens") + File.separator;
    }

    /**
     * Retorna só a extenção de um arquivo. Ex: Jpg
     *
     * @param name
     * @return
     */
    private String getExtension(String fileName) {
        String[] str = fileName.split("\\.");
        if (str.length > 1) {
            return str[str.length - 1];
        }
        return "";
    }

    @InitBinder
    private void binder(WebDataBinder binder) {
        binder.registerCustomEditor(float.class, new ConversorFloat());
    }
}
