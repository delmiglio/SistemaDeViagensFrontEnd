<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
        <title>TravelParty - Festas</title>
    </head>
    <c:import url="cssPadrao.jsp"></c:import>
        <body id="body">
        <c:import url="barraDeNavegacao.jsp"></c:import>
            <div class="section no-pad-bot" id="index-banner">
                <div class="container">
                    <br><br>
                    <br><br>
                    <h1 class="header center orange-text">
                    ${festa.festaId != null ?  "Atualize as Festas" : "Cadastre Novas Festas"}
                </h1> 
                <br><br>
                <div class="row">
                    <form name="frmFesta" id="frmFesta" class="col s12">
                        <div class="row">
                            <input type="hidden" id="festaId" name="festaId" value="${festa.festaId}">
                            <input type="hidden" id="foto" name="foto" value="${festa.foto}">
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="Digite o CEP" id="cep" data-mask="00000-000" name="cep" value="${festa.cep}" type="text">
                                <label for="cep">CEP</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="Endereco" id="endereco" value="${festa.endereco}" value name="endereco" type="text">
                                <label for="endereco">Endereco</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="Complemento" value="${festa.complemento}" id="complemento" name="complemento" type="text">
                                <label for="complemento">Complemento</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="Cidade" value="${festa.cidade}" id="cidade" name="cidade" type="text">
                                <label for="cidade">Cidade</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="Estado" value="${festa.estado}" id="estado" name="estado" type="text">
                                <label for="estado">Estado</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="Selecione" type="date" value="${festa.dataDoEvento}" id="dataDoEvento" name="dataDoEvento" class="datepicker">
                                <label for="data">Data da Festa</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="Preço" value="${festa.preco}" id="preco" name="preco" type="text">
                                <label for="preco">Preço</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="Descricao" value="${festa.descricao}" id="descricao" name="descricao" type="text">
                                <label for="descricao">Descrição</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <select name="tipoEvento" id="tipoEvento">
                                    <c:forEach items="${tiposDeEventos}" var="tipoEvento">
                                        <option value="${tipoEvento.key}" ${tipoEvento.key == festa.tipoEvento ? 'selected="selected"' : ''}>${tipoEvento.value}</option>
                                    </c:forEach>                    
                                </select>
                                <label>Tipo de Evento</label>
                            </div>
                        </div>
                    </form>
                    <div class="row">
                        <div class="input-field col s12">
                            <button class="btn waves-effect waves-light yellow col s12 l4 m6" ${festa.festaId != null ?  "onclick='atualizarFesta()'" : "onclick='salvarFesta()'"} id="cadastrar" name="cadastrar">
                                ${festa.festaId != null ?  "Atualizar" : "Salvar"}
                                <i class="material-icons right">send</i>
                            </button>
                        </div>
                        <div class="input-field col s12">
                            <c:if test="${festa.festaId != null}">
                                <button class="btn waves-effect waves-light yellow col s12 l4 m6" id="imagem" name="imagem" onclick="inserirImagemFesta()">
                                    Inserir Imagem
                                    <i class="material-icons right">perm_media</i>
                                </button>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <c:import url="footer.jsp"></c:import>
        <c:import url="jsPadrao.jsp"></c:import>
        <script src="js_telas/cadastroFesta.js" type="text/javascript"></script>
    </body>
</html>