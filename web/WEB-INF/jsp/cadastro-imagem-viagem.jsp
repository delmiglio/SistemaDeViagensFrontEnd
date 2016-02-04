<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
        <title>TravelParty - Viagens</title>
    </head>

    <!-- CSS -->
    <c:import url="cssPadrao.jsp"></c:import>
        <body id="body">
        <c:import url="barraDeNavegacao.jsp"></c:import>
            <div class="section no-pad-bot" id="index-banner">
                <div class="container">
                    <br><br>
                    <br><br>
                    <h1 class="header center orange-text">
                        Selecione a Imagem da Viagem
                    </h1> 
                    <div class="row center">
                        <h5 class="header col s12 light">Somente para Administradores</h5>
                    </div>
                    <br><br>
                    <div class="row">
                        <form name="frmViagem" id="frmViagem" action="salvar-imagem-viagem" 
                              method="post" enctype="multipart/form-data">
                            <div class="col s6">
                                <div class="file-field input-field">
                                    <div class="btn">
                                        <span>Foto</span>
                                        <input type="file" id="fotoSelecionada" name="fotoSelecionada">
                                    </div>
                                    <div class="file-path-wrapper">
                                        <input class="file-path validate" value="${viagem.foto}" id="foto" name="foto" type="text" placeholder="Selecione uma Foto" />
                                </div>
                            </div> 
                        </div>
                        <div class="col s4 input-field right">
                            <button class="btn waves-effect waves-light" type="submit" id="imagem" name="imagem">
                                Salvar Imagem
                                <i class="material-icons right">perm_media</i>
                            </button>
                        </div>
                        <div class="col s12">
                            <figure>
                                <img id="imagemSelecionada" src="#"/>
                                <figcaption> Imagem Selecionada </figcaption>
                            </figure>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
    <c:import url="jsPadrao.jsp"></c:import>
    <script src="js_telas/cadastroViagem.js" type="text/javascript"></script>
</html>
