<%-- 
    Document   : lista-usuario
    Created on : 10/11/2015, 10:28:27
    Author     : Guilherme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
        <title>TravelParty - Lista de Usuarios</title>
    </head>

    <c:import url="cssPadrao.jsp"></c:import>

        <body id="body">
        <c:import url="barraDeNavegacao.jsp"></c:import>

            <div class="section no-pad-bot" id="index-banner">
                <div class="container">
                    <br><br>
                    <h1 class="header center orange-text">Lista de Usuários do Sistema</h1>
                    <div class="row center">
                        <h5 class="header col s12 light">Todas os Usuários Cadastrados</h5>
                    </div>
                <c:if test="${usuarios != null}">
                    <div class="row">
                        <div class="col s12">
                            <table class="striped responsive-table">
                                <thead>
                                    <tr>
                                        <th data-field="Nome">Nome</th>
                                        <th data-field="E-mail">E-Mail</th>
                                        <th data-field="DataNascimento">Data de Nascimento</th>
                                        <th data-field="Telefone">Telefone</th>
                                        <th data-field="Celular">Celular</th>
                                        <th data-field="Alterar">Alterar</th>
                                        <th data-field="Excluir">Excluir</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${usuarios}" var="usuario">
                                        <tr>
                                            <td>
                                                ${usuario.nome}
                                            </td>
                                            <td>
                                                ${usuario.email}
                                            </td>
                                            <td>
                                                ${usuario.dataNascimento}
                                            </td>
                                            <td>
                                                ${usuario.telefone}
                                            </td>
                                            <td>
                                                ${usuario.celular}
                                            </td>
                                            <td id="table-ajuste-icone-excluir">
                                                <a href="alteracao-usuario-adm?id=${usuario.pessoaId}" class="secondary-content"><i class="material-icons">edit</i></a>
                                            </td>
                                            <td id="table-ajuste-icone-excluir">  
                                                <a href="#!" onclick="executaModalDelete()" class="secondary-content"><i class="material-icons">clear</i></a>      
                                            </td>
                                        </tr>
                                        <c:set value="${usuario.pessoaId}" var="pessoa"></c:set>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </c:if>
                <br>
                <br>
                <c:if test="${usuarios == null}">
                    <div class="row center">
                        <h5 class="header col s12 light">Não há Usuarios Cadastradas</h5>
                    </div>
                </c:if>
                <a href="cadastro-usuario-adm" class="btn-large waves-effect waves-light yellow accent-4">Cadastrar Novo Usuário</a>
            </div>

            <!-- Modal Structure -->
            <div id="modalDeletar" class="modal">
                <div class="modal-content">
                    <h4>Exclusão de Usuário</h4>
                    <p>Deseja Excluir esse Registro</p>
                </div>
                <div class="modal-footer">
                    <a href="#!" onclick="deletaUsuario(${pessoa})" class=" modal-action modal-close waves-effect waves-green btn-flat">Sim</a>
                    <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Não</a>
                </div>
            </div>

        </div>
        <c:import url="footer.jsp"></c:import>
        <c:import url="jsPadrao.jsp"></c:import>
        <script src="js_telas/listaUsuario.js" type="text/javascript"></script>
</html>
