<jsp:include page="template/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--Verifica se o usuário NÂO está logado no sistema-->
<%
    String usuario = (String) session.getAttribute("emailUsuario");
    if (usuario != null) {
        response.sendRedirect("homePage");
    }
%>
<link href="resources/css/cadastro.css" rel="stylesheet" type="text/css"/>
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
            <li data-toggle="tooltip" data-placement="top" title='Acesso à Página Inicial do sistema.'><a href="home">Home page</a></li>
        </ul>
    </div>
</nav>
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
        <form action="cadastrarPage" method="POST">
            <input data-toggle="tooltip" data-placement="top" title='Seu nome deve ser inserido!' type="text" id="login" class="fadeIn first" name="nomeUsuario" placeholder="Name *" required="">
            <input data-toggle="tooltip" data-placement="top" title='Seu sobrenome deve ser inserido!'  type="text" id="login" class="fadeIn second" name="sobrenomeUsuario" placeholder="Family *" required="">
            <input  data-toggle="tooltip" data-placement="top" title='Insira o número do seu CRM. Só é permitido números' type="number" id="login" class="fadeIn second" name="crmUsuario" placeholder="CRM *" required="">
            <input data-toggle="tooltip" data-placement="top" title='Seu endereço deve ser inserido!' type="text" id="login" class="fadeIn second" name="enderecoUsuario" placeholder="Address *" required="">
            <input data-toggle="tooltip" data-placement="top" title='Insira seu telefone de contato.'  type="text" id="login telefoneMedico" class="fadeIn second " name="telefoneUsuario" placeholder="Phone *" required="">
            <input data-toggle="tooltip" data-placement="top" title='Insira o seu e-mail. Esse e-mail será utilizado para se autenticar no sistema.'  type="email" id="login" class="fadeIn second" name="emailUsuario" placeholder="E-mail *" required="">
            <input data-toggle="tooltip" data-placement="top" title='Insira uma senha.'  type="password" id="password" class="fadeIn third" name="senhaUsuario" placeholder="Password *" required="">
            <input data-toggle="tooltip" data-placement="top" title='Repita a sua senha.'  type="password" id="password" class="fadeIn fourth" name="senha2Usuario" placeholder="Password confirmation *" required="">
            <input data-toggle="tooltip" data-placement="top" title='Confirmar o cadastro de seus dados?'  type="submit" name="cadastrar" class="fadeIn fourth icones" value="Register">
        </form>
        <!--Remind Passowrd--> 
        <div id="formFooter">
            <a data-toggle="tooltip" data-placement="top" title='Cancelar o cadastro de seus dados no sistema.'  class="underlineHover icones" href="home">Come back</a>
        </div>
    </div>
</div>
<footer class="footer bg-light">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 h-100 text-center text-lg-left my-auto">
                <ul class="list-inline mb-2">
                    <li class="list-inline-item">
                        <a href="sobre">About</a>
                    </li>
                    <li class="list-inline-item">&sdot;</li>
                </ul>
                <p class="text-muted small mb-4 mb-lg-0">&copy; MultCare Medical 2020. All rights reserved.</p>
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
<script src="resources/js/multcare.js" type="text/javascript"></script>
</body>
</html>