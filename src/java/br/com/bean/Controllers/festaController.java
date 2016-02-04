package br.com.bean.Controllers;

import br.com.bean.Classes_Mapeamentos.Festa;
import br.com.bean.Utilitarios.CollectionDeserializer;
import br.com.bean.Utilitarios.ConversorFloat;
import br.com.bean.Utilitarios.CriadorJson;
import br.com.bean.Utilitarios.GsonHttpMessageConverter;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Type;
import java.sql.SQLException;
import java.util.Collection;
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
public class festaController {

    @RequestMapping(value = "lista-festas", method = RequestMethod.GET)
    public ModelAndView home() throws SQLException {
        ModelAndView mv = new ModelAndView("lista-festa");
        RestTemplate request = new RestTemplate();
        String listaDeFestas = request.getForObject("http://localhost:8080"
                + "/SistemaDeViagensBackEnd/busca-festas", String.class);
        Gson gson = new GsonBuilder()
                .registerTypeAdapter(Collection.class, new CollectionDeserializer()).create();
        Type listaFestas = new TypeToken<List<Festa>>() {
        }.getType();
        List<Festa> festas = gson.fromJson(listaDeFestas, listaFestas);
        mv.addObject("festas", festas);
        return mv;
    }

    @RequestMapping(value = "cadastro-festa-adm", method = RequestMethod.GET)
    public ModelAndView cadastro() throws SQLException {
        RestTemplate request = new RestTemplate();
        String tiposEventoJson = request.getForObject("http://localhost:8080//SistemaDeViagensBackEnd"
                + "/tiposEvento", String.class);
        Gson gson = new GsonBuilder()
                .registerTypeAdapter(Collection.class, new CollectionDeserializer()).create();
        Type integerStringMap = new TypeToken<Map<Integer, String>>() {
        }.getType();
        Map<Integer, String> tiposDeEventos = gson.fromJson(tiposEventoJson, integerStringMap);
        ModelAndView mv = new ModelAndView("cadastro-festa");
        mv.addObject("tiposDeEventos", tiposDeEventos);
        return mv;
    }

    @RequestMapping(value = "cadastro-imagem-festa-adm", method = RequestMethod.GET)
    public ModelAndView cadastroImagemFesta(String dados, HttpServletRequest request) {
        Festa f = new Gson().fromJson(dados, Festa.class);
        HttpSession sessao = request.getSession();
        sessao.setAttribute("festaTmp", f);
        ModelAndView mv = new ModelAndView("cadastro-imagem-festa");
        mv.addObject("festa", f);
        return mv;
    }

    @RequestMapping(value = "alteracao-festa-adm", method = RequestMethod.GET)
    public ModelAndView alteracao(long id) {
        ModelAndView mv = new ModelAndView("cadastro-festa");
        RestTemplate request = new RestTemplate();
        String festaString = request.getForObject("http://localhost:8080//SistemaDeViagensBackEnd"
                + "/buscaPorId-festa?id=" + id, String.class);
        Gson gson = new Gson();
        Festa festa = gson.fromJson(festaString, Festa.class);
        String tiposEventoJson = request.getForObject("http://localhost:8080//SistemaDeViagensBackEnd"
                + "/tiposEvento", String.class);
        gson = new GsonBuilder()
                .registerTypeAdapter(Collection.class, new CollectionDeserializer()).create();
        Type integerStringMap = new TypeToken<Map<Integer, String>>() {
        }.getType();
        Map<Integer, String> tiposDeEventos = gson.fromJson(tiposEventoJson, integerStringMap);
        mv.addObject("festa", festa);
        mv.addObject("tiposDeEventos", tiposDeEventos);
        return mv;
    }

    @RequestMapping(value = "salva-festa-adm", method = RequestMethod.POST)
    @ResponseBody
    public String salvaFesta(String dados) {
        RestTemplate request = new RestTemplate();
        Gson gson = new Gson();
        Festa f = gson.fromJson(dados, Festa.class);
        request.getMessageConverters().add(new GsonHttpMessageConverter(gson));
        String resposta = request.postForObject("http://localhost:8080/SistemaDeViagensBackEnd"
                + "/insere-festa", gson.toJson(f, Festa.class), String.class);
        return resposta;
    }

    @RequestMapping(value = "atualiza-festa-adm", method = RequestMethod.POST)
    @ResponseBody
    public String atualizaFesta(String dados) {
        RestTemplate request = new RestTemplate();
        Gson gson = new Gson();
        Festa f = gson.fromJson(dados, Festa.class);
        request.getMessageConverters().add(new GsonHttpMessageConverter(gson));
        String mensagem = request.postForObject("http://localhost:8080/SistemaDeViagensBackEnd"
                + "/atualiza-festa", gson.toJson(f, Festa.class), String.class);
        return mensagem;
    }

    @RequestMapping(value = "deleta-festa-adm", method = RequestMethod.GET)
    @ResponseBody
    public String deletaFesta(long id, HttpServletRequest request) throws SQLException {
        apagaImagens(id, request);
        RestTemplate restTemplate = new RestTemplate();
        String resposta = restTemplate.getForObject("http://localhost:8080/SistemaDeViagensBackEnd"
                + "/deleta-festa?id=" + id, String.class);
        return resposta;
    }

    @InitBinder
    private void binder(WebDataBinder binder) {
        binder.registerCustomEditor(float.class, new ConversorFloat());
    }

    @RequestMapping(value = "salvar-imagem-festa", method = RequestMethod.POST)
    public ModelAndView salvaImagensFesta(HttpServletRequest request,
            @RequestParam("fotoSelecionada") MultipartFile fotoSelecionada) throws SQLException {
        try {
            HttpSession sessao = request.getSession();
            Festa festa = (Festa) sessao.getAttribute("festaTmp");
            festa.setFoto(criaNomeImagem(1, festa.getFestaId(), fotoSelecionada));
            salvaImagem("fotoSelecionada", festa.getFoto(), request, fotoSelecionada);
            String mensagemAtualizacao = atualizaFesta(new Gson().toJson(festa, Festa.class));
        } catch (Exception erro) {
            String jsonErro = CriadorJson.criaJsonErro(erro, "Ocorreu um Erro ao Salvar Imagem");
        }
        return home();

    }

    private void apagaImagens(long id, HttpServletRequest request) throws SQLException {
        RestTemplate restTemplate = new RestTemplate();
        String festaString = restTemplate.getForObject("http://localhost:8080//SistemaDeViagensBackEnd"
                + "/buscaPorId-festa?id=" + id, String.class);
        Gson gson = new Gson();
        Festa festaCadastrada = gson.fromJson(festaString, Festa.class);
        File file = new File(getPastaImagens(request) + festaCadastrada.getFoto());
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
        return request.getServletContext().getRealPath("/WEB-INF/jsp/Img_Festas") + File.separator;
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

}
