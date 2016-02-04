<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
        <title>TravelParty - Lista de Turmas</title>
    </head>

    <c:import url="cssPadrao.jsp"></c:import>
        <body id="body">
        <c:import url="barraDeNavegacao.jsp"></c:import>
            <div class="section no-pad-bot" id="index-banner">
                <div class="container">
                    <br><br>
                    <h1 class="header center orange-text">Lista de Turmas - ${sessionScope.faculdadeNome}</h1>
                <div class="row center">
                    <h5 class="header col s12 light">Todas as Turmas Cadastradas</h5>
                </div>
                <c:if test="${turmas != null}">
                    <div class="col s12 m12 l12">
                        <table class="striped responsive-table">
                            <thead>
                                <tr>
                                    <th data-field="QuantidadedeAlunos">Quantidade de Alunos</th>
                                    <th data-field="Serie">Serie</th>
                                    <th data-field="Descricao">Descricao</th>
                                    <th data-field="Alterar">Alterar</th>
                                    <th data-field="Excluir">Excluir</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${turmas}" var="turma">
                                    <tr>
                                        <td>
                                            ${turma.quantidadeAlunos}
                                        </td>
                                        <td>
                                            ${turma.serie}
                                        </td>
                                        <td>
                                            ${turma.descricao}
                                        </td>
                                        <td id="table-ajuste-icone-excluir">
                                            <a href="alteracao-turma-adm?id=${turma.turmaId}" class="secondary-content"><i class="material-icons">edit</i></a>
                                        </td>
                                        <td id="table-ajuste-icone-excluir">
                                            <a href="#!" onclick="executaModalDelete()" class="secondary-content"><i class="material-icons">clear</i></a>    
                                        </td>
                                    </tr>
                                    <c:set value="${turma.turmaId}" var="turmaId"></c:set>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:if>
                <br><br>
                <c:if test="${sessionScope.logado}">
                    <a href="cadastro-turma-adm" class="btn-large waves-effect waves-light yellow accent-4">Cadastrar nova Turma</a>
                </c:if>
                <div id="modalDeletar" name="modalDeletar" class="modal">
                    <div class="modal-content">
                        <h4>Exclusão de Turma</h4>
                        <p>Deseja Excluir essa Turma</p>
                    </div>
                    <div class="modal-footer">
                        <a href="#!" onclick="deletaTurma(${turmaId})" class=" modal-action modal-close waves-effect waves-green btn-flat">Sim</a>
                        <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Não</a>
                    </div>
                </div>
            </div>
        </div>
        <c:import url="footer.jsp"></c:import>
        <c:import url="jsPadrao.jsp"></c:import>
        <script src="js_telas/listaTurma.js" type="text/javascript"></script>
    </body>
</html>
