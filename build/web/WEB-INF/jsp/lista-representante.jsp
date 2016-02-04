<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
        <title>TravelParty - Lista de Representantes</title>
    </head>

    <c:import url="cssPadrao.jsp"></c:import>
        <body id="body">
        <c:import url="barraDeNavegacao.jsp"></c:import>
            <div class="section no-pad-bot" id="index-banner">
                <div class="container">
                    <br><br>
                    <h1 class="header center orange-text">Lista de Representantes</h1>
                <c:if test="${representantes != null}">
                    <div class="col s12 m12 l12">
                        <table class="striped responsive-table">
                            <thead>
                                <tr>
                                    <th data-field="Nome">Nome</th>
                                    <th data-field="DataAdmissao">Data de Admissao</th>
                                    <th data-field="Email">Email</th>
                                    <th data-field="Celular">Celular</th>
                                    <th data-field="Estado">Descrição</th>
                                    <th data-field="Alterar">Alterar</th>
                                    <th data-field="Excluir">Excluir</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${representantes}" var="representante">
                                    <tr>
                                        <td>
                                            ${representante.nome}
                                        </td>
                                        <td>
                                            ${representante.dataDeAdmissao}
                                        </td>
                                        <td>
                                            ${representante.email}
                                        </td>
                                        <td>
                                            ${representante.celular}
                                        </td>
                                        <td>
                                            ${representante.estado}
                                        </td>
                                        <td id="table-ajuste-icone-excluir">
                                            <a href="alteracao-representante-adm?id=${representante.pessoaId}" class="secondary-content"><i class="material-icons">edit</i></a>
                                        </td id="table-ajuste-icone-excluir">
                                        <td>
                                            <a href="#!" onclick="executaModalDelete()" class="secondary-content"><i class="material-icons">clear</i></a>    
                                        </td>
                                    </tr>
                                    <c:set value="${representante.pessoaId}" var="representanteId"></c:set>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:if>
                <br><br>
                <a href="cadastro-representante-adm" class="btn-large waves-effect waves-light yellow accent-4">Cadastrar novo Representante</a>
                <div id="modalDeletar" name="modalDeletar" class="modal">
                    <div class="modal-content">
                        <h4>Exclusão de Representante</h4>
                        <p>Deseja Excluir esse Representante</p>
                    </div>
                    <div class="modal-footer">
                        <a href="#!" onclick="deletaRepresentante(${representanteId})" class=" modal-action modal-close waves-effect waves-green btn-flat">Sim</a>
                        <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Não</a>
                    </div>
                </div>
            </div>
        </div>
        <c:import url="footer.jsp"></c:import>
        <c:import url="jsPadrao.jsp"></c:import>
        <script src="js_telas/listaRepresentante.js" type="text/javascript"></script>
    </body>
</html>
