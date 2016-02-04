<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
        <title>TravelParty - Turmas</title>
    </head>
    <c:import url="cssPadrao.jsp"></c:import>
        <body id="body">
        <c:import url="barraDeNavegacao.jsp"></c:import>
            <div class="section no-pad-bot" id="index-banner">
                <div class="container">
                    <br><br>
                    <h1 class="header center orange-text">
                    ${turma.turmaId != null ?  "Atualize as Turmas" : "Cadastro de Turmas"}
                </h1> 
                <br><br>
                <div class="row">
                    <form class="col s12" id="frmTurma" name="frmTurma">
                        <div class="row">
                            <input type="hidden" value="${turma.turmaId}" id="turmaId" name="turmaId">
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="Quantidade de Alunos" id="quantidadeAlunos" name="quantidadeAlunos" type="text" value="${turma.quantidadeAlunos}">
                                <label for="quantidadedeAlunos">Quantidade de Alunos</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="Serie" id="serie" name="serie" type="text" value="${turma.serie}">
                                <label for="serie">Série</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="Descrição" id="descricao" name="descricao" type="text"  value="${turma.descricao}">
                                <label for="descricao">Descricao</label>
                            </div>
                        </div>
                    </form>
                    <div class="row">
                        <div class="input-field col s12">
                            <button class="btn waves-effect waves-light yellow" ${turma.turmaId != null ?  "onclick='atualizarTurma()'" : "onclick='salvarTurma()'"} name="cadastrar" id="cadastrar">
                                ${turma.turmaId != null ?  "Atualizar" : "Salvar"}
                                <i class="material-icons right">send</i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <c:import url="footer.jsp"></c:import> 
        <c:import url="jsPadrao.jsp"></c:import>
        <script src="js_telas/cadastroTurma.js" type="text/javascript"></script>
</html>
