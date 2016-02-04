<%-- 
    Document   : barraDeNavegacao
    Created on : 10/11/2015, 03:44:42
    Author     : Guilherme
--%>

<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>



<nav class="light-blue darken-1" role="navigation">
    <div class="nav-wrapper container">
        <a id="logo-container" href="home" class="brand-logo"><img src="Img/Logo.png" alt="" class="logo"/></a>
        <ul class="right hide-on-med-and-down">

            <c:if test="${!sessionScope.logado}">
                <li><a href="cadastro-faculdade">Cadastre Sua Faculdade</a></li>
                </c:if>

            <ul id="dropdownFaculdade" class="dropdown-content">
                <!-- Lista de Turmas: Acessivel Somente a Faculdades -->
                <c:if test="${sessionScope.logado && sessionScope.nivelAcesso == 3}">
                    <li><a href="lista-turmas">Turmas</a></li>
                    </c:if>
                <li class="divider"/>
                <c:if test="${sessionScope.logado && sessionScope.nivelAcesso == 3}">
                    <li><a href="lista-alunos">Alunos</a></li>
                    </c:if>
            </ul>

            <ul id="dropdownAdministrador" class="dropdown-content">
                <c:if test="${sessionScope.logado && sessionScope.nivelAcesso == 1}">
                    <li><a href="lista-viagens">Viagens</a></li>
                    </c:if>
                <li class="divider"></li>
                    <c:if test="${sessionScope.logado && sessionScope.nivelAcesso == 1}">
                    <li><a href="lista-festas">Festas</a></li>
                    </c:if>
                <li class="divider"></li>
                <!-- Lista de Faculdades: Acessivel a Representantes e Administradores -->
                <c:if test="${sessionScope.logado && (sessionScope.nivelAcesso == 4 || sessionScope.nivelAcesso == 1)}">
                    <li><a href="lista-faculdades">Faculdades</a></li>
                    </c:if>
                <li class="divider"></li>
                <!-- Lista de Representantes: Acessivel Somente a Administradores (Dados Pessoais) -->
                <c:if test="${sessionScope.logado && sessionScope.nivelAcesso == 1}">
                    <li><a href="lista-representantes-adm">Representantes</a></li>
                    </c:if>
                <li class="divider"></li>
                <!-- Lista de Usuários: Acessivel Somente a Administradores -->
                <c:if test="${sessionScope.logado && sessionScope.nivelAcesso == 1}">
                    <li><a href="lista-usuarios-adm">Usuários</a></li>
                    </c:if>
            </ul>

            <ul id="dropdownAluno" class="dropdown-content">
                <c:if test="${sessionScope.logado && sessionScope.nivelAcesso == 2}">
                    <li><a href="lista-pagamento">Pagamentos</a></li>
                    </c:if>
                <li class="divider"></li>
                    <c:if test="${sessionScope.logado && sessionScope.nivelAcesso == 2}">
                    <li><a href="lista-dependente">Dependentes</a></li>
                    </c:if>
            </ul>

            <ul id="dropdownRepresentante" class="dropdown-content">
                <!-- Lista de Faculdades: Acessivel a Representantes e Administradores -->
                <c:if test="${sessionScope.logado && sessionScope.nivelAcesso == 4}">
                    <li><a href="lista-faculdades">Faculdades</a></li>
                    </c:if>
            </ul>

            <c:if test="${sessionScope.logado && sessionScope.nivelAcesso == 1}">
                <li><a class="dropdown-button" href="#!" data-activates="dropdownAdministrador">Menu Administrador<i class="material-icons right">arrow_drop_down</i></a></li>
                </c:if>


            <c:if test="${sessionScope.logado && sessionScope.nivelAcesso == 3}">
                <li><a class="dropdown-button" href="#!" data-activates="dropdownFaculdade">Menu Faculdade<i class="material-icons right">arrow_drop_down</i></a></li>
                </c:if>

            <c:if test="${sessionScope.logado && sessionScope.nivelAcesso == 2}">
                <li><a class="dropdown-button" href="#!" data-activates="dropdownAluno">Menu Aluno<i class="material-icons right">arrow_drop_down</i></a></li>
                </c:if>

            <c:if test="${sessionScope.logado && sessionScope.nivelAcesso == 4}">
                <li><a class="dropdown-button" href="#!" data-activates="dropdownRepresentante">Menu Representante<i class="material-icons right">arrow_drop_down</i></a></li>
                </c:if>

            <!-- Login -->
            <c:if test="${!sessionScope.logado}">
                <li><a href="login">Login</a></li>
                </c:if>

            <c:if test="${sessionScope.logado}">
                <li>Bem Vindo, ${sessionScope.nome}</li>
                <li><a href="efetua-logoff">Logoff</a></li>
                </c:if>
        </ul>

        <ul id="nav-mobile" class="side-nav">
            <c:if test="${sessionScope.logado}">
                <div class="card blue-grey darken-1">
                    <div class="card-content white-text">
                        <span class="card-title">TravelParty</span>
                        <p>Bem Vindo, ${sessionScope.nome}</p>
                    </div>
                    <div class="card-action">
                        <li><a href="efetua-logoff">Logoff</a></li>
                    </div>
                </div>
            </c:if>


            <c:if test="${!sessionScope.logado}">
                <li><a href="cadastro-faculdade">Cadastre Sua Faculdade</a></li>
                </c:if>

            <!-- Login -->
            <c:if test="${!sessionScope.logado}">
                <li><a href="login">Login</a></li>
                </c:if>

            <ul id="dropdownFaculdadeMobile" class="dropdown-content">
                <!-- Lista de Turmas: Acessivel Somente a Faculdades -->
                <c:if test="${sessionScope.logado && sessionScope.nivelAcesso == 3}">
                    <li><a href="lista-turma">Turmas</a></li>
                    </c:if>
                <li class="divider"/>
                <c:if test="${sessionScope.logado && sessionScope.nivelAcesso == 3}">
                    <li><a href="lista-alunos">Alunos</a></li>
                    </c:if>
            </ul>

            <ul id="dropdownAdministradorMobile" class="dropdown-content">
                <c:if test="${sessionScope.logado && sessionScope.nivelAcesso == 1}">
                    <li><a href="lista-viagens">Viagens</a></li>
                    </c:if>
                <li class="divider"></li>
                    <c:if test="${sessionScope.logado && sessionScope.nivelAcesso == 1}">
                    <li><a href="lista-festas">Festas</a></li>
                    </c:if>
                <li class="divider"></li>
                <!-- Lista de Faculdades: Acessivel a Representantes e Administradores -->
                <c:if test="${sessionScope.logado && (sessionScope.nivelAcesso == 4 || sessionScope.nivelAcesso == 1)}">
                    <li><a href="lista-faculdades">Faculdades</a></li>
                    </c:if>
                <li class="divider"></li>
                <!-- Lista de Representantes: Acessivel Somente a Administradores (Dados Pessoais) -->
                <c:if test="${sessionScope.logado && sessionScope.nivelAcesso == 1}">
                    <li><a href="lista-representantes-adm">Representantes</a></li>
                    </c:if>
                <li class="divider"></li>
                <!-- Lista de Usuários: Acessivel Somente a Administradores -->
                <c:if test="${sessionScope.logado && sessionScope.nivelAcesso == 1}">
                    <li><a href="lista-usuarios-adm">Usuários</a></li>
                    </c:if>
            </ul>

            <ul id="dropdownAlunoMobile" class="dropdown-content">
                <!-- Lista de Pagamentos: Acessivel Somente a Alunos (Dados Pessoais) -->
                <c:if test="${sessionScope.logado && sessionScope.nivelAcesso == 2}">
                    <li><a href="lista-pagamento">Pagamentos</a></li>
                    </c:if>
                <li class="divider"></li>
                <!-- Lista de Dependentes Acessivel Somente a Alunos (Dados Pessoais) -->
                <c:if test="${sessionScope.logado && sessionScope.nivelAcesso == 2}">
                    <li><a href="lista-dependente">Dependentes</a></li>
                    </c:if>
            </ul>

            <c:if test="${sessionScope.logado && sessionScope.nivelAcesso == 1}">
                <li><a class="dropdown-button" href="#!" data-activates="dropdownAdministradorMobile">Menu Administrador<i class="material-icons right">arrow_drop_down</i></a></li>
                </c:if>

            <c:if test="${sessionScope.logado && sessionScope.nivelAcesso == 3}">
                <li><a class="dropdown-button" href="#!" data-activates="dropdownFaculdadeMobile">Menu Faculdade<i class="material-icons right">arrow_drop_down</i></a></li>
                </c:if>

            <c:if test="${sessionScope.logado && sessionScope.nivelAcesso == 2}">
                <li><a class="dropdown-button" href="#!" data-activates="dropdownAlunoMobile">Menu Aluno<i class="material-icons right">arrow_drop_down</i></a></li>
                </c:if>
        </ul>
        <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="mdi-navigation-menu"></i></a>
    </div>
</nav>
