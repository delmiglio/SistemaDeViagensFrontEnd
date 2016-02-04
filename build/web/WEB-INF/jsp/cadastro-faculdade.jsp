<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
        <title>TravelParty - Faculdades</title>
    </head>

    <c:import url="cssPadrao.jsp"></c:import>

        <body id="body">
        <c:import url="barraDeNavegacao.jsp"></c:import>

            <div class="section no-pad-bot" id="index-banner">
                <div class="container">
                    <br><br>
                    <br><br>
                    <h1 class="header center orange-text">
                    ${faculdade.faculdadeId != null ?  "Atualização de Faculdade" : "Cadastro de Faculdade"}
                </h1> 
                <br><br>
                <div class="row">
                    <form name="frmFaculdade" id="frmFaculdade" class="col s12">
                        <div class="row">
                            <input type="hidden" id="faculdadeId" name="faculdadeId" value="${faculdade.faculdadeId}">
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="Nome" id="nome" name="nome" type="text" value="${faculdade.nome}">
                                <label for="Nome">Nome</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="Email" id="email" name="email" type="email"  value="${faculdade.email}">
                                <label for="email">Email</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="Digite o CEP" data-mask="00000-000" id="cep" name="cep" type="text"  value="${faculdade.cep}">
                                <label for="cep">CEP</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="Endereço" id="endereco" name="endereco" type="text"  value="${faculdade.endereco}">
                                <label for="endereco">Endereço</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="Complemento" id="complemento" name="complemento" type="text"  value="${faculdade.complemento}">
                                <label for="complemento">Complemento</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="Cidade" id="cidade" name="cidade" type="text"  value="${faculdade.cidade}">
                                <label for="cidade">Cidade</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="UF" id="estado" name="estado" type="text"  value="${faculdade.estado}">
                                <label for="estado">Estado</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="Senha" id="senha" name="senha" type="password" value="${faculdade.senha}"> 
                                <label for="senha">Senha</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="Telefone" id="telefone" name="telefone" data-mask="(00)0000-0000" type="text" value="${faculdade.telefone}">
                                <label for="telefone">Telefone</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="Diretor" id="diretor" name="diretor" type="text"  value="${faculdade.diretor}">
                                <label for="diretor">Diretor</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="Informacoes" id="informacoes" name="informacoes" type="text"  value="${faculdade.informacoes}">
                                <label for="informacoes">Informacoes</label>
                            </div>
                        </div>
                    </form>
                    <div class="row">
                        <div class="input-field col s12">
                            <button class="btn waves-effect waves-light yellow col s12 l4 m6" ${faculdade.faculdadeId != null ?  "onclick='atualizarFaculdade()'" : "onclick='salvarFaculdade()'"} id="cadastrar" name="cadastrar">
                                ${faculdade.faculdadeId != null ?  "Atualizar" : "Salvar"}
                                <i class="material-icons right">send</i>
                            </button>
                        </div>
                    </div>
                </div> 
            </div>
        </div>
        <c:import url="footer.jsp"></c:import>
        <c:import url="jsPadrao.jsp"></c:import>
        <script src="js_telas/cadastroFaculdade.js" type="text/javascript"></script>
    </body>
</html>