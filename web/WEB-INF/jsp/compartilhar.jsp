<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <hr/>
    <div class="text-titulo">
        <h3 class="page-header">
            Compartilhar Documento Clínico
        </h3>
    </div>
    <p>
        Escolha entre os médicos cadastrados no sistema para compartilhar o documento clínico selecionado.<br>
            Para ajudar na busca, pesquise pelo Nome, CRM ou Endereço do Médico.
    </p>
    <div class="shadow p-3 mb-5 bg-white rounded">
        <div class="form-group input-group">
            <input style="border-radius: 20px;" name="consulta" id="txt_consulta" placeholder="Consultar" type="text" class="form-control"data-toggle="tooltip" data-placement="top" title='Insira aqui a informação a ser buscada'>
        </div>
        <div class="tableFixHead-shared">
            <table id="tabela" class="table table-hover" >
                <thead >
                    <tr>
                        <th >Nome do Médico</th>
                        <th >CRM</th>
                        <th >Endereço</th>
                        <th >Enviar</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${usuarios}" var="u">
                        <tr >
                            <td>${u.getNomeUsuario()} ${u.getSobrenomeUsuario()}</td>
                            <td>${u.getCrmUsuario()}</td>
                            <td>${u.getEnderecoUsuario()}</td>
                            <td>
                                <button type="button" onclick="caixaConfirmacao(${u.getIdUsuario()}, COMPARTILHAR, SHARED)" class="btn btn-light  icones" data-toggle="modal" data-target="#_visualizar" data-toggle="tooltip" data-placement="top" title='Compartilhar Documento Clínico para este contato'>
                                    <svg id="i-send" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="20" height="20" fill="none" stroke="currentcolor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
                                        <path d="M2 16 L30 2 16 30 12 20 Z M30 2 L12 20" />
                                    </svg>
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</section>
<hr>
    <section class="container">
        <form action="enviarEmail" method="POST" class="form-text">
            <div class="text-titulo">
                <h3 class="page-header">
                    Enviar Documento Clínico por E-mail
                </h3>
            </div>
            <p>Você também pode compartilhar esse documento por email.<br> Insira um email válido e o documento irá ser encaminhado para o destinatário.</p>
            <div class="form-row">
                <div class="col-lg-6 lg-6 form-group">
                    <label >Email <label style="color: red; font-size: 19px">*</label></label>
                    <input style="border-radius: 20px;" type="email" name="emailEmail" class="form-control" placeholder="Por favor, informe o email do destinatário *" required="">
                </div>

                <div class="col-lg-12 lg-12 form-group">
                    <label >Mensagem</label>
                    <textarea style="border-radius: 20px;"  name="mensagemEmail" class="form-control" placeholder="Deixe uma mensagem para o destinatário" rows="4"></textarea>
                </div>

                <!-- Button trigger modal -->
                <button type="submit" class="btn btn-info icones" data-toggle="tooltip" data-placement="top" title='Clique se deseja enviar o Documento Clínico para o email informado'>
                    <svg id="i-mail" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="32" height="32" fill="none" stroke="currentcolor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
                        <path d="M2 26 L30 26 30 6 2 6 Z M2 6 L16 16 30 6" />
                    </svg>
                    Enviar Documento Clínico
                </button>
                <!--<a href="enviarEmail">Enviar Documento Clínico</a>-->
                <div class="row">
                    <div class="col-md-12">
                        <p class="text-muted">
                            <strong><label style="color: red; font-size: 19px">*</label></strong> Esses campos são obrigatórios.
                    </div>
                </div>
            </div>
        </form>
    </section>
    <hr>
        <script src="resources/js/multcare.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
        <jsp:include page="template/footer.jsp" />