<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
        <title>TravelParty - Usuários</title>
    </head>

    <c:import url="cssPadrao.jsp"></c:import>
        <body id="body">
        <c:import url="barraDeNavegacao.jsp"></c:import>
            <div class="section no-pad-bot" id="index-banner">
                <div class="container">
                    <br><br>
                    <h1 class="header center orange-text">
                    ${usuario.pessoaId != null ?  "Atualize os Usuários" : "Cadastre usuários para o sistema"}
                </h1> 
                <br><br>
                <div class="row">
                    <form class="col s12" id="frmUsuario" name="frmUsuario">
                        <div class="row">
                            <input type="hidden" value="${usuario.pessoaId}" id="pessoaId" name="pessoaId">
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="Nome" id="nome" name="nome" type="text" value="${usuario.nome}">
                                <label for="Nome">Nome</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="RG" id="rg" name="rg" type="text" value="${usuario.rg}">
                                <label for="rg">RG</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="CPF" data-mask="000.000.000-00" id="cpf" name="cpf" type="text"  value="${usuario.cpf}">
                                <label for="cpf">CPF</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="Email" id="email" name="email" type="email"  value="${usuario.email}">
                                <label for="email">Email</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="Digite o CEP" data-mask="00000-000" id="cep" name="cep" type="text"  value="${usuario.cep}">
                                <label for="cep">CEP</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="Endereço" id="endereco" name="endereco" type="text"  value="${usuario.endereco}">
                                <label for="endereco">Endereço</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="Complemento" id="complemento" name="complemento" type="text"  value="${usuario.complemento}">
                                <label for="complemento">Complemento</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="Cidade" id="cidade" name="cidade" type="text"  value="${usuario.cidade}">
                                <label for="cidade">Cidade</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="UF" id="estado" name="estado" type="text"  value="${usuario.estado}">
                                <label for="estado">Estado</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="Selecione" type="text" id="dataNascimento" name="dataNascimento" class="datepicker" value="${usuario.dataNascimento}">
                                <label for="dataNascimento">Data de Nascimento</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="(ddd) + Número" data-mask="(00) 0000-0000" id="telefone" name="telefone" type="text" value="${usuario.telefone}">
                                <label for="telefone">Telefone</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="(ddd) + Número" id="celular" data-mask="(00) 00000-0000" name="celular" type="text"  value="${usuario.celular}">
                                <label for="celular">Celular</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="Senha" id="senha" name="senha" type="password"  value="${usuario.senha}"> 
                                <label for="senha">Senha</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <select id="nivelPermissao" name="nivelPermissao">
                                    <c:forEach items="${niveisAcesso}" var="nivelAcesso">
                                        <option value="${nivelAcesso.key}" ${nivelAcesso.key == usuario.nivelPermissao ? 'selected="selected"' : ''}>${nivelAcesso.value}</option>
                                    </c:forEach>                    
                                </select>
                                <label>Nível de Permissão</label>
                            </div>
                        </div>
                    </form>
                    <div class="row">
                        <div class="input-field col s12">
                            <button class="btn waves-effect waves-light yellow" ${usuario.pessoaId != null ?  "onclick='atualizarUsuario()'" : "onclick='salvarUsuario()'"} name="cadastrar" id="cadastrar">
                                ${usuario.pessoaId != null ?  "Atualizar" : "Salvar"}
                                <i class="material-icons right">send</i>
                            </button>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <c:import url="footer.jsp"></c:import> 
        <c:import url="jsPadrao.jsp"></c:import>
        <script src="js_telas/cadastroUsuario.js" type="text/javascript"></script>
</html>
