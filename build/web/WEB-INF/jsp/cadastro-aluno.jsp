<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
        <title>TravelParty - Alunos</title>
    </head>
    <c:import url="cssPadrao.jsp"></c:import>

    <body id="body">

    <c:import url="barraDeNavegacao.jsp"></c:import>
    
    <div class="section no-pad-bot" id="index-banner">
        <div class="container">
            <br><br>
            <h1 class="header center orange-text">Cadastre-se aluno</h1> 
            <div class="row center">
                <h5 class="header col s12 light">Verifique se sua Faculdade Possui cadastro</h5>
            </div>

            <br><br>

            <!-- Div do Spin -->
            <div class="row">
                <div class="spin col s12" ></div>
            </div>
            <div class="row">
                <form class="col s12">
                    <div class="row">
                        <div class="input-field col s6">
                            <select id="turma" name="turma">
                                <option value="" disabled selected>Busque sua Turma</option>
                            </select>
                            <label for="turma">Turma</label>
                        </div>
                        <div class="input-field col s6">
                            <input placeholder="curso" id="curso" name="curso" type="text">
                            <label for="curso">Curso</label>
                        </div>
                        <div class="input-field col s6">
                            <input placeholder="semestre" id="semestre" name="semestre" type="text">
                            <label for="semestre">Semestre</label>
                        </div>
                        <div class="input-field col s6">
                            <input placeholder="Carteirinha" id="numeroCarteiraFaculdade" name="numeroCarteiraFaculdade" type="text">
                            <label for="numeroCarteiraFaculdade">Número Carterinha</label>
                        </div>
                    </div>
                </form> 
            </div>
        </div>
    </div>
    <c:import url="footer.jsp"></c:import> 
    <c:import url="jsPadrao.jsp"></c:import>
    <script src="js_telas/cadastroAluno.js" type="text/javascript"></script>
</html>