<jsp:include page="template/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--Verifica se o usuário está logado no sistema-->
<%
    String usuario = (String) session.getAttribute("emailUsuario");
    if (usuario != null) {
        response.sendRedirect("homePage");
    }
%>
<link href="resources/css/cadastro.css" rel="stylesheet" type="text/css"/>
<div id="throbber" style="display:none; min-height:120px;"></div>
<div id="noty-holder"></div>
<div id="wrapper"></div>
<!-- Navigation -->
<nav class=" navbar navbar-expand-md navbar-toggler bg-light navbar-fixed-top" id="mainNav" role="navigation">
    <div class="navbar-header">
        <a class="navbar-brand" href="home"> <img class="navbar-brand-cdapi" src="resources/img/cda-icon.png"></a>
        <a class="navbar-brand js-scroll-trigger" href="home"></a>
    </div>
    <button class="navbar-toggle glyphicon glyphicon-menu-hamburger" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler"></span>
    </button>
    <div class="collapse navbar-collapse text-center" id="navbarResponsive">
        <ul class="nav navbar-nav text-navbar-menu">
            <li data-toggle="tooltip" data-placement="top" title='Ir para a página Inicial do sistema' ><a href="home">Home page</a></li>
        </ul>
    </div>
</nav>
<!--Tela de login-->
<div class="wrapper fadeInDown">
    <div id="formContent">
        <div class="fadeIn first">
            <img src="resources/img/logo.png" id="icon"/>
        </div>
        <c:if test = "${status == 'false'}">
            <div class="fadeIn second">
                <strong style="color: red;">${notificacao}</strong>
            </div> 
        </c:if>
        <!--Login Form--> 
        <form action="home" method="POST">
            <input data-toggle="tooltip" data-placement="top" title='Insira seu email de acesso.'  type="email" id="login" class="fadeIn second" name="emailUsuario" placeholder="E-mail" required="">
            <input  data-toggle="tooltip" data-placement="top" title='Insira sua senha de autenticação.'  type="password" id="password" class="fadeIn third" name="senhaUsuario" placeholder="Password" required="">
            <input  data-toggle="tooltip" data-placement="top" title='Confirmar sua autenticação no sistema.'  type="submit" name="login" class="fadeIn fourth icones" value="entrar">
        </form>
        <!--Remind Passowrd--> 
        <div id="formFooter">
            <a class="underlineHover icones" href="cadastrarPage"  data-toggle="tooltip" data-placement="top" title='Clique aqui e você será redirecionado para a página de cadastro!'>Don't have a registration yet?</a>
        </div>
    </div>
</div>

<jsp:include page="template/body.jsp"/>
<<footer class="footer bg-light">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 h-100 text-center text-lg-left my-auto">
                <ul class="list-inline mb-2">
                    <li class="list-inline-item">
                        <a href="sobre">About</a>
                    </li>
                    <li class="list-inline-item">&sdot;</li>
                </ul>
                <p class="text-muted small mb-4 mb-lg-0">&copy; MultCare Medical 2020. All Rights Reserved.</p>
            </div>
        </div>
    </div>
</footer>

<!-- Bootstrap core JavaScript -->
<script src="resources/vendor/jquery/jquery.min.js"></script>
<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="resources/js/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="resources/js/jquery.maskedinput.min.js" type="text/javascript"></script>
<script src="resources/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="resources/js/jquery.zebra-datepicker.js" type="text/javascript"></script>

</body>
</html>