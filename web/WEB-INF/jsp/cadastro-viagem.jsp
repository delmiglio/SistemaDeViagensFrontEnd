<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
        <title>TravelParty - Viagens</title>
    </head>
    <c:import url="cssPadrao.jsp"></c:import>
        <body id="body">
        <c:import url="barraDeNavegacao.jsp"></c:import>
            <div class="section no-pad-bot" id="index-banner">
                <div class="container">
                    <br><br>
                    <h1 class="header center orange-text">
                    ${viagem.viagemId != null ?  "Atualize os dados da Viagem" : "Cadastre Novas Viagens"}
                </h1>
                <br><br>
                <div class="row">
                    <form id="frmViagem" name="frmViagem" clas="col s12">
                        <div class="row">
                            <input type="hidden" id="viagemId" name="viagemId" value="${viagem.viagemId}">
                            <input type="hidden" id="foto" name="foto" value="${viagem.foto}">
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="origem" id="origem" name="origem" type="text" value="${viagem.origem}">
                                <label for="origem">Origem</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="destino" id="destino" value="${viagem.destino}" name="destino" type="text">
                                <label for="destino">Destino</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="data De Ida" value="${viagem.dataIda}" type="text" id="dataIda" name="dataIda" class="datepicker">
                                <label for="dataIda">Selecione</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="data De Volta" type="text" value="${viagem.dataVolta}" id="dataVolta" name="dataVolta" class="datepicker">
                                <label for="dataVolta">Selecione</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <select id="vooComEscala" name="vooComEscala">
                                    <c:forEach items="${voosComEscala}" var="voo">
                                        <option value="${voo.key}" ${voo.key == viagem.vooComEscala ? 'selected="selected"' : ''}>${voo.value}</option>
                                    </c:forEach>                    
                                </select>
                                <label>Tipo de Voo</label>
                            </div>    
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="valor" id="preco" value="${viagem.preco}" name="preco" type="text">
                                <label for="preco">Valor</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="hotel" id="hotel" value="${viagem.hotel}" name="hotel" type="text">
                                <label for="hotel">Hotel</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input type="text" placeholder="Descrição" id="descricao" value="${viagem.descricao}" name="descricao">
                                <label for="descricao">Descrição</label>
                            </div>
                        </div>
                    </form>
                    <div class="row">
                        <div class="input-field col s12">
                            <button class="btn waves-effect waves-light yellow" ${viagem.viagemId != null ?  "onclick='atualizarViagem()'" : "onclick='salvarViagem()'"} name="cadastrar" id="cadastrar">
                                ${viagem.viagemId != null ?  'Atualizar' : 'Salvar'}
                                <i class="material-icons right">send</i>
                            </button>
                        </div>
                        <div class="input-field col s12">
                            <c:if test="${viagem.viagemId != null}">
                                <button class="btn waves-effect waves-light yellow" id="imagem" name="imagem" onclick="inserirImagemViagem()">
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
        <script src="js_telas/cadastroViagem.js" type="text/javascript"></script>
    </body>
</html>