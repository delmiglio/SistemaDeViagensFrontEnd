<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
        <title>TravelParty - Lista de Faculdades</title>
    </head>

    <c:import url="cssPadrao.jsp"></c:import>
        <body id="body">
        <c:import url="barraDeNavegacao.jsp"></c:import>
            <div class="section no-pad-bot" id="index-banner">
                <div class="container">
                    <br><br>
                    <h1 class="header center orange-text">Lista de faculdades</h1>
                    <div class="row center">
                        <h5 class="header col s12 light">Todas as faculdades cadastradas</h5>
                    </div>
                <c:if test="${faculdades != null}">
                    <div class="col s12 m12 l12">
                        <table class="striped responsive-table">
                            <thead>
                                <tr>
                                    <th data-field="Nome">Nome</th>
                                    <th data-field="Endereco">Endereco</th>
                                    <th data-field="Cidade">Cidade</th>
                                    <th data-field="Estado">Estado</th>
                                    <th data-field="Email">Email</th>
                                    <th data-field="Telefone">Telefone</th>
                                    <th data-field="Alterar">Alterar</th>
                                    <th data-field="Excluir">Excluir</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${faculdades}" var="faculdade">
                                    <tr>
                                        <td>
                                            ${faculdade.nome}
                                        </td>
                                        <td>
                                            ${faculdade.endereco}
                                        </td>
                                        <td>
                                            ${faculdade.cidade}
                                        </td>
                                        <td>
                                            ${faculdade.estado}
                                        </td>
                                        <td>
                                            ${faculdade.email}
                                        </td>
                                        <td>
                                            ${faculdade.telefone}
                                        </td>
                                        <td id="table-ajuste-icone-excluir">
                                            <a href="alteracao-faculdade?id=${faculdade.faculdadeId}" class="secondary-content"><i class="material-icons">edit</i></a>
                                        </td>
                                        <td id="table-ajuste-icone-excluir">
                                            <a href="#!" onclick="executaModalDelete()" class="secondary-content"><i class="material-icons">clear</i></a>    
                                        </td>
                                    </tr>
                                    <c:set value="${faculdade.faculdadeId}" var="faculdadeId"></c:set>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:if>
                <br><br>
                <c:if test="${sessionScope.logado && sessionScope.nivelAcesso == 1}">
                      <a href="cadastro-faculdade" class="btn-large waves-effect waves-light yellow accent-4">Cadastrar nova faculdade</a>
                </c:if>
                <div id="modalDeletar" name="modalDeletar" class="modal">
                    <div class="modal-content">
                        <h4>Exclusão de Faculdade</h4>
                        <p>Deseja Excluir essa Faculdade</p>
                    </div>
                    <div class="modal-footer">
                        <a href="#!" onclick="deletaFaculdade(${faculdadeId})" class=" modal-action modal-close waves-effect waves-green btn-flat">Sim</a>
                        <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Não</a>
                    </div>
                </div>
        </div>
    </div>
    <c:import url="footer.jsp"></c:import>
    <c:import url="jsPadrao.jsp"></c:import>
    <script src="js_telas/listaFaculdade.js" type="text/javascript"></script>
</body>
</html>
