<!-- Navigation -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav class=" navbar navbar-expand-md navbar-toggler bg-light navbar-fixed-top" id="mainNav" role="navigation">
    <div class="navbar-header">
        <a class="navbar-brand" href="./homePage"> <img class="navbar-brand-cdapi" src="resources/img/cda-icon.png" data-toggle="tooltip" data-placement="top" title='Voltar para a Página Inicial'></a>
        <a class="navbar-brand js-scroll-trigger" href="./homePage"></a>
    </div>
    <button class="navbar-toggle glyphicon glyphicon-menu-hamburger icones" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler"></span>
    </button>
    <div class="collapse navbar-collapse text-center" id="navbarResponsive">
        <ul class="nav navbar-nav text-navbar-menu">
            <li data-toggle="tooltip" data-placement="top" title='Acesso à página inicial do sistema.'><a href="./homePage">Home page</a></li>
            <li data-toggle="tooltip" data-placement="top" title='Acesso à página de manipulação de Documentos Clínicos'><a href="./ler">Manipulate Clinical Document</a></li>
            <li data-toggle="tooltip" data-placement="top" title='Acesso à página de criação de Documentos Clínicos'><a href="./escrever">Create Clinical Document</a></li>
            <li data-toggle="tooltip" data-placement="top" title='Acesso à página de histórico de versões.'><a href="./historico">Version history</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a href="http://phpoll.com/login" class="dropdown-toggle" data-toggle="dropdown" data-toggle="tooltip" data-placement="top" title='Expandir o perfil do usuário do sistema.'>
                    <svg id="i-user" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="20" height="20" fill="none" stroke="currentcolor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
                        <path d="M22 11 C22 16 19 20 16 20 13 20 10 16 10 11 10 6 12 3 16 3 20 3 22 6 22 11 Z M4 30 L28 30 C28 21 22 20 16 20 10 20 4 21 4 30 Z" />
                    </svg>
                    User
                </a>
                <!--<a href="http://phpoll.com/login" class="dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></a>-->
                <ul class="dropdown-menu dropdown-lr animated slideInRight" style="border-radius: 20px" role="menu">
                    <div class="col-lg-12">
                        <div >
                            <div class="card-body text-center">
                                <p>
                                    <svg id="i-user" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="32" height="32" fill="none" stroke="currentcolor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
                                        <path d="M22 11 C22 16 19 20 16 20 13 20 10 16 10 11 10 6 12 3 16 3 20 3 22 6 22 11 Z M4 30 L28 30 C28 21 22 20 16 20 10 20 4 21 4 30 Z" />
                                    </svg>
                                </p>
                                <h5>${nomeUsuario} ${sobrenomeUsuario}</h5><br>
                                    <p class="card-title">${emailUsuario}</p>
                                    <p class="card-text">CRM: ${crmUsuario}</p>
                                    <a  data-toggle="tooltip" data-placement="top" title='Clique para acessar as suas configurações de perfil e de sistema.'  href="configuracao" class="btn btn-primary">Settings</a>
                            </div>
                        </div>
                        <li data-toggle="tooltip" data-placement="top" title='Clique para sair de sua conta.' ><a href="sair"><i class=" fa fa-fw fa-power-off"></i> Logout</a></li>
                    </div>
                </ul>
            </li>
        </ul>
    </div>
</nav>

<div id="alerta"></div>
<div id="content" style="display: none;" class="fadeIn content firstOne">
    <c:if test = "${status == 'false'}">
        <div class="pull-alert fadeIn second">
            <div class="alert alert-success pull-right" >
                <button type="button" class="btn btn-default btn-circle btn-xl-alert btn-lateral btn-float-alert"><i class="glyphicon glyphicon-envelope"></i></button>
                <hr class="hr-alert">
                    <strong>${notificacao}</strong>
            </div>
        </div> 
    </c:if>