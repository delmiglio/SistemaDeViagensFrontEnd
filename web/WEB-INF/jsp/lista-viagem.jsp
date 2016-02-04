<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
        <title>TravelParty - Lista de Viagens</title>
    </head>

    <c:import url="cssPadrao.jsp"></c:import>

        <body id="body">
        <c:import url="barraDeNavegacao.jsp"></c:import>
            <div class="section no-pad-bot" id="index-banner">
                <div class="container">
                    <br><br>
                    <h1 class="header center orange-text">Lista de Viagens</h1>
                    <div class="row center">
                        <h5 class="header col s12 light">Todos os destinos disponiveis</h5>
                    </div>
                <c:if test="${viagens != null}">
                    <div class="row">
                        <div class="col s12">
                            <table class="responsive-table striped">
                                <thead>
                                    <tr>
                                        <th data-field="Origem">Origem</th>
                                        <th data-field="Destino">Destino</th>
                                        <th data-field="Ida">Ida</th>
                                        <th data-field="Volta">Volta</th>
                                        <th data-field="Preco">Preço</th>
                                        <th data-field="Descricao">Descrição</th>
                                        <th data-field="Alterar">Alterar</th>
                                        <th data-field="Excluir">Excluir</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${viagens}" var="viagem">
                                        <tr>
                                            <td>
                                                ${viagem.origem}
                                            </td>
                                            <td>
                                                ${viagem.destino}
                                            </td>
                                            <td>
                                                ${viagem.dataIda}
                                            </td>
                                            <td>
                                                ${viagem.dataVolta}
                                            </td>
                                            <td>
                                                <fmt:formatNumber type="currency" value="${viagem.preco} " var="preco"/>
                                                ${preco}
                                            </td>
                                            <td>
                                                ${viagem.descricao}
                                            </td>
                                            <td id="table-ajuste-icone-alterar">
                                                <a href="alteracao-viagem-adm?id=${viagem.viagemId}" class="secondary-content"><i class="material-icons">edit</i></a>
                                            </td>
                                            <td id="table-ajuste-icone-excluir">
                                                <a href="#!" onclick="executaModalDelete()" class="secondary-content"><i class="material-icons">clear</i></a>    
                                            </td>
                                        </tr>
                                        <c:set value="${viagem.viagemId}" var="viagemId"></c:set>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </c:if>
                <br><br>
                <c:if test="${sessionScope.logado}">
                    <a href="cadastro-viagem-adm" class="btn-large waves-effect waves-light yellow accent-4">cadastrar nova viagem</a>
                </c:if>
                <div id="modalDeletar" class="modal">
                    <div class="modal-content">
                        <h4>Exclusão de Viagem</h4>
                        <p>Deseja Excluir essa Viagem</p>
                    </div>
                    <div class="modal-footer">
                        <a href="#!" onclick="deletaViagem(${viagemId})" class=" modal-action modal-close waves-effect waves-green btn-flat">Sim</a>
                        <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Não</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <c:import url="footer.jsp"></c:import>
    <c:import url="jsPadrao.jsp"></c:import>
    <script src="js_telas/listaViagem.js" type="text/javascript"></script>
</html>