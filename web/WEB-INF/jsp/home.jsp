<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
        <title>TravelParty</title>
    </head>
    <c:import url="cssPadrao.jsp"></c:import>
        <body id="body">
        <c:import url="barraDeNavegacao.jsp"></c:import>
            <div class="section no-pad-bot" id="index-banner">
                <div class="container">
                    <br><br>
                    <div class="row">
                    <c:forEach items="${viagens}" var="viagem">
                        <div class="col s10 l6 m8">
                            <div class="card">
                                <div class="card-image waves-effect waves-block waves-light">
                                    <c:if test="${not empty viagem.foto}">
                                        <img class="activator" src="Img_Viagens/${viagem.foto}">
                                    </c:if>
                                    <c:if test="${empty viagem.foto}">
                                        <img class="activator" src="Img/SemFoto.jpg">
                                    </c:if>
                                </div>
                                <div class="card-content">
                                    <span class="card-title activator grey-text text-darken-4"><i class="material-icons right">list</i></span>
                                    <span class="grey-text text-darken-4">De: ${viagem.origem} <br> Para: ${viagem.destino} <br>  <fmt:formatNumber type="currency" value="${viagem.preco} " var="preco"/>
                                        Preco: ${preco}</span>
                                </div>
                                <div class="card-action">
                                    <p><a class="btn blue white-text">Adicionar ao Carinho</a></p>
                                </div>
                                <div class="card-reveal">
                                    <span class="card-title grey-text text-darken-4">Detalhes<i class="material-icons right">close</i></span>
                                    <p>Descricao: ${viagem.descricao}</p>
                                    <p>Data De Ida: ${viagem.dataIda}</p>
                                    <p>Data De Volta: ${viagem.dataVolta}</p>
                                    <p>Hotel: ${viagem.hotel}</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <c:forEach  items="${festas}" var="festa">
                        <div class="col s8 l6 m8">
                            <div class="card">
                                <div class="card-image waves-effect waves-block waves-light">
                                    <c:if test="${not empty festa.foto}">
                                        <img class="activator" src="Img_Festas/${festa.foto}">
                                    </c:if>
                                    <c:if test="${empty festa.foto}">
                                        <img class="activator" src="Img/SemFoto.jpg">
                                    </c:if>
                                </div>
                                <div class="card-content">
                                    <span class="card-title activator grey-text text-darken-4"><i class="material-icons right">list</i></span>
                                    <span class="grey-text text-darken-4">Data Do Evento: ${festa.dataDoEvento} <br> Cidade: ${festa.cidade} <br>  <fmt:formatNumber type="currency" value="${festa.preco} " var="preco"/>
                                        Preco: ${preco}</span>
                                </div>
                                <div class="card-action">
                                    <p><a class="btn blue white-text">Adicionar ao Carinho</a></p>
                                </div>
                                <div class="card-reveal">
                                    <span class="card-title grey-text text-darken-4">Detalhes<i class="material-icons right">close</i></span>
                                    <p>Descricao: ${festa.descricao}</p>
                                    <p>CEP: ${festa.cep}</p>
                                    <p>Endereco: ${festa.endereco}</p>
                                    <p>Complemento: ${festa.complemento}</p>
                                    <p>Cidade: ${festa.cidade}</p>
                                    <p>Estado: ${festa.estado}</p>
                                    <p>Data Do Evento: ${festa.dataDoEvento}</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>   
                </div>
            </div> 
        </div>
        <br><br>
        <c:import url="footer.jsp"></c:import>
        <c:import url="jsPadrao.jsp"></c:import>
        <script src="js_telas/home.js" type="text/javascript"></script>
</html>
