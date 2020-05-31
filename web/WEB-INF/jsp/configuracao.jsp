<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="template/header.jsp" />
<!--Verifica se o usuário está logado no sistema-->
<%
    String usuario = (String) session.getAttribute("emailUsuario");
    if (usuario == null) {
        response.sendRedirect("home");
    }
%>
<jsp:include page="template/navbar.jsp"/>

<section class="container">
    <div>
        <h3 class="page-header text-titulo">
            Configurações
        </h3>
        <p>
        <h6>Descrição</h6>
        <h4 class="page-header text-titulo">
            Perfil
        </h4>
        <form action="configuracao" method="POST"class="form-text">
            <div class="row">
                <div class="container">
                    <div class="shadow p-3 mb-5 bg-white rounded">
                        <!--paciente-->
                        <div class="panel">
                            <div class="panel-heading">
                            </div>
                            <div class="form-row">
                                <div class="col-lg-2 lg-2 form-group ">
                                    <p class="text-entrada">CRM</p>
                                    <input style="border-radius: 20px;" name="crmUsuario" type="text"class="form-control" value="${crmUsuario}"placeholder="CRM" required="">
                                </div>
                                <div class="col-lg-5 lg-5 form-group ">
                                    <p class="text-entrada">Nome</p>
                                    <input style="border-radius: 20px;" name="nomeUsuario" type="text"class="form-control" value="${nomeUsuario}"placeholder="Nome"required="">
                                </div>
                                <div class="col-lg-5 lg-5 form-group">
                                    <p class="text-entrada">Sobrenome</p>
                                    <input style="border-radius: 20px;" name="sobrenomeUsuario" type="text"class="form-control" value="${sobrenomeUsuario}"placeholder="Sobrenome"required="">
                                </div>
                                <div class="col-lg-3 lg-3 form-group ">
                                    <p class="text-entrada">Telefone</p>
                                    <input style="border-radius: 20px;"  id="telefoneMedico" name="telefoneUsuario" type="text"class="form-control" value="${telefoneUsuario}"placeholder="(__)_____-____"required="">
                                </div>
                                <div class="col-lg-9 lg-9 form-group">
                                    <p class="text-entrada">Endereço</p>
                                    <input style="border-radius: 20px;" name="enderecoUsuario" type="text"class="form-control " value="${enderecoUsuario}"placeholder="Endereço"required="" >
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="shadow p-3 mb-5 bg-white rounded">
                        <p>Por favor, confirme seu email e senha antes de salvar os dados.</p>
                        <div class="form-row">
                            <div class="col-lg-5 lg-5 form-group">
                                <p class="text-entrada">Email</p>
                                <input style="border-radius: 20px;" name="emailUsuario" type="email"class="form-control " value="${emailUsuario}"placeholder="Email"required="" >
                                <p class="text-entrada">Senha</p>
                                <input style="border-radius: 20px;" name="senhaUsuario" type="password"class="form-control " value="${enderecoUsuario}"placeholder="Endereço" required="">
                            </div>
                        </div>
                    </div>
                    <!-- Botão gerar documento -->
                    <button type="submit" class="btn btn-info icones" data-toggle="tooltip" data-placement="top" title='Clique se deseja confirmar as alterações'>
                        <svg id="i-checkmark" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="32" height="32" fill="none" stroke="currentcolor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
                        <path d="M2 20 L12 28 30 4" />
                        </svg>
                        Salvar alterações
                    </button>
                </div>
            </div>
        </form>
        <hr>
        <h4 class="page-header text-titulo">
            Sistema
        </h4>
        <p>
        <h6>Descrição</h6>
        <form action="configuracao" method="POST" class="form-text">
        </form>
    </div>
</section>
<script src="resources/js/multcare.js" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<jsp:include page="template/footer.jsp" />