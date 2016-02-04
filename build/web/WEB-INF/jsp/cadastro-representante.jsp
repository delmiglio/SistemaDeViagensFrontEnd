<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
        <title>TravelParty - Representantes</title>
    </head>

    <c:import url="cssPadrao.jsp"></c:import>

        <body id="body">
        <c:import url="barraDeNavegacao.jsp"></c:import>

            <div class="section no-pad-bot" id="index-banner">
                <div class="container">
                    <br><br>
                    <br><br>
                    <h1 class="header center orange-text">
                    ${representante.pessoaId != null ?  "Atualização de Representante" : "Cadastro de Representante"}
                </h1> 
                <br><br>
                <div class="row">
                    <form name="frmRepresentante" id="frmRepresentante" class="col s12">
                        <div class="row">
                            <input type="hidden" id="representanteId" name="representanteId" value="${representante.pessoaId}">
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="Nome" id="nome" name="nome" type="text" value="${representante.nome}">
                                <label for="Nome">Nome</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="RG" id="rg" name="rg" type="text" value="${representante.rg}">
                                <label for="rg">RG</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="CPF" data-mask="000.000.000-00" id="cpf" name="cpf" type="text"  value="${representante.cpf}">
                                <label for="cpf">CPF</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="Email" id="email" name="email" type="email"  value="${representante.email}">
                                <label for="email">Email</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="Digite o CEP" data-mask="00000-000" id="cep" name="cep" type="text"  value="${representante.cep}">
                                <label for="cep">CEP</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="Endereço" id="endereco" name="endereco" type="text"  value="${representante.endereco}">
                                <label for="endereco">Endereço</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="Complemento" id="complemento" name="complemento" type="text"  value="${representante.complemento}">
                                <label for="complemento">Complemento</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="Cidade" id="cidade" name="cidade" type="text"  value="${representante.cidade}">
                                <label for="cidade">Cidade</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="UF" id="estado" name="estado" type="text"  value="${representante.estado}">
                                <label for="estado">Estado</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="Selecione" type="text" id="dataNascimento" name="dataNascimento" class="datepicker" value="${representante.dataNascimento}">
                                <label for="dataNascimento">Data de Nascimento</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="(ddd) + Número" data-mask="(00) 0000-0000" id="telefone" name="telefone" type="text" value="${representante.telefone}">
                                <label for="telefone">Telefone</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="(ddd) + Número" id="celular" data-mask="(00) 00000-0000" name="celular" type="text"  value="${representante.celular}">
                                <label for="celular">Celular</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="Senha" id="senha" name="senha" type="password"  value="${representante.senha}"> 
                                <label for="senha">Senha</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="Selecione" type="text" id="dataDeAdmissao" name="dataDeAdmissao" class="datepicker" value="${representante.dataDeAdmissao}">
                                <label for="dataDeAdmissao">Data de Admissão</label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="(Numero + Serie)" id="CTPS" name="CTPS" type="text"  value="${representante.CTPS}"> 
                                <label for="CTPS">Carteira de Trabalho </label>
                            </div>
                            <div class="input-field col s12 l4 m6">
                                <input placeholder="Salario" id="salario" value="${representante.salario}" name="salario" type="text">
                                <label for="salario">Salário</label>
                            </div>
                        </div>
                    </form>
                    <div class="row">
                        <div class="input-field col s12">
                            <button class="btn waves-effect waves-light yellow col s12 l4 m6" ${representante.pessoaId != null ?  "onclick='atualizarRepresentante()'" : "onclick='salvarRepresentante()'"} id="cadastrar" name="cadastrar">
                                ${representante.pessoaId != null ?  "Atualizar" : "Salvar"}
                                <i class="material-icons right">send</i>
                            </button>
                        </div>
                    </div>
                </div> 
            </div>
        </div>
        <c:import url="footer.jsp"></c:import>
        <c:import url="jsPadrao.jsp"></c:import>
        <script src="js_telas/cadastroRepresentante.js" type="text/javascript"></script>
    </body>
</html>
