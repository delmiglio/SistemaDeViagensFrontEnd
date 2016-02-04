<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
        <title>TravelParty - Lista de Alunos</title>
    </head>

    <c:import url="cssPadrao.jsp"></c:import>

        <body id="body">
        <c:import url="barraDeNavegacao.jsp"></c:import>
            <div class="section no-pad-bot" id="index-banner">
                <div class="container">
                    <br><br>
                    <h1 class="header center orange-text">Lista de alunos</h1>
                    <div class="row center">
                        <h5 class="header col s12 light">Todas os alunos cadastrados</h5>
                    </div>
                <c:if test="${alunos != null}">
                    <c:forEach items="${alunos}" var="aluno">
                        <ul class="collection">
                            <li class="collection-item">
                                <div>
                                    Nome: ${aluno.nome}
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="atualiza-aluno?id= ${aluno.id}" class="secondary-content"><i class="material-icons">edit</i></a>
                                    <a href="#" onclick="deletaObjeto(${aluno.id})" class="secondary-content"><i class="material-icons">clear</i></a>    
                                </div>
                            </li>
                        </ul>
                    </c:forEach> 
                </c:if>
                <c:if test="${alunos == null}">
                    <div class="row center">
                        <h5 class="header col s12 light">Não há Alunos Cadastrados</h5>
                    </div>
                </c:if>
            </div>
        </div>
        <c:import url="footer.jsp"></c:import>
        <c:import url="jsPadrao.js"></c:import>
</html>
