<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="msapplication-tap-highlight" content="no">
        <title>TravelParty - Login</title>
        <meta name="msapplication-TileColor" content="#00bcd4">
        <meta name="msapplication-TileImage" content="images/favicon/mstile-144x144.png">
        <c:import url="cssPadrao.jsp"></c:import>
            <link href="css_telas/style.css" rel="stylesheet" type="text/css"/>
            <link href="css_telas/style-horizontal.css" rel="stylesheet" type="text/css"/>
            <link href="css_telas/loginCss.css" rel="stylesheet" type="text/css"/>
            <link href="css_telas/page-center.css" rel="stylesheet" type="text/css"/>
            <link href="bibliotecas/perfectScrollbar/perfect-scrollbar.css" rel="stylesheet" type="text/css"/>
            <link href="bibliotecas/Prism/prism.css" rel="stylesheet" type="text/css"/>
        </head>
        <body class="cyan loaded">
            <div id="loader-wrapper">
                <div id="loader"></div>        
                <div class="loader-section section-left"></div>
                <div class="loader-section section-right"></div>
            </div>
            <div id="login-page" class="row">
                <div class="col s12 z-depth-4 card-panel">
                    <form class="login-form" id="frmLogin" name="frmLogin">
                        <div class="row">
                            <div class="input-field col s12 center">
                                <img src="Img/Logo.png" alt="" class="circle responsive-img valign profile-image-login">
                                <p class="center login-form-text">TravelParty - Login</p>
                            </div>
                        </div>
                        <div class="row margin">
                            <div class="input-field col s12">
                                <i class="mdi-social-person-outline prefix"></i>
                                <input placeholder="E-mail" id="email" name="email" type="text">
                                <label for="email" class="center-align">E-Mail</label>
                            </div>
                        </div>
                        <div class="row margin">
                            <div class="input-field col s12">
                                <i class="mdi-action-lock-outline prefix"></i>
                                <input placeholder="Senha" id="senha" name="senha" type="password">
                                <label for="senha">Senha</label>
                            </div>
                        </div>
                        <div class="row">    
                            <div class="switch col s12 m12 l12 ">
                                &nbsp&nbsp <label for="manterLogado">Manter logado</label><br><br>
                                &nbsp&nbsp<label>
                                    Não
                                    <input type="checkbox" id="ckSalvaLogin" name="ckSalvaLogin">
                                    <span class="lever"></span>
                                    Sim
                                </label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <a id="acessar" name="acessar" class="btn waves-effect waves-light yellow accent-4">Login</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        <c:import url="jsPadrao.jsp"></c:import>  
        <script src="bibliotecas/perfectScrollbar/perfect-scrollbar.min.js" type="text/javascript"></script>
        <script src="bibliotecas/Prism/prism.js" type="text/javascript"></script>
        <script src="js_telas/login.js" type="text/javascript"></script>
    </body>
</html>