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
    <div class="text-titulo">
        <h3 class="page-header">
            History Clinical Documents
        </h3>
    </div>
    <p>
        <p>This module lists all the history of altered clinical documents, ordered by the most recent modified version. Among the permitted actions, it is possible to view, search or delete a selected Clinical Document.</p>
        <div class="shadow p-3 mb-5 bg-white rounded">
            <div class="form-group">
                <input  style="border-radius: 20px;" name="consulta" id="txt_consulta" placeholder="Consult" type="text" class="form-control">
            </div>
            <div class="tableFixHead">
                <table id="tabela" class="table table-hover" >
                    <thead >
                        <tr>
                            <th >Document | Patient name</th>
                            <th >Last modified</th>
                            <th >Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${documentos}" var="doc">
                            <tr >
                                <td>${doc.getNomeArquivo()}</td>
                                <td>${doc.getDataArquivo()}</td>
                                <td>
                                    <!-- Botão visualizar documento -->
                                    <button onclick="window.location.href = 'fileHistoric?id=${doc.getIdArquivo()}'" type="button" class="btn icones btn-light" data-toggle="modal" data-target="#_visualizar" data-toggle="tooltip" data-placement="top" title='Abrir Documento Clínico'>
                                        <svg id="i-eye" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="20" height="20" fill="none" stroke="currentcolor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
                                            <circle cx="17" cy="15" r="1" />
                                            <circle cx="16" cy="16" r="6" />
                                            <path d="M2 16 C2 16 7 6 16 6 25 6 30 16 30 16 30 16 25 26 16 26 7 26 2 16 2 16 Z"/>
                                        </svg>
                                    </button>
                                    <!-- Botão visualizar documento -->
                                    <button onclick="caixaConfirmacao(${doc.getIdArquivo()}, EXCLUIR, REMOVE_H)" type="button" class="btn  icones btn-light" data-toggle="modal" data-target="#_visualizar"data-toggle="tooltip" data-placement="top" title='Excluir Documento Clínico'>
                                        <svg id="i-trash" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="20" height="20" fill="none" stroke="currentcolor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
                                            <path d="M28 6 L6 6 8 30 24 30 26 6 4 6 M16 12 L16 24 M21 12 L20 24 M11 12 L12 24 M12 6 L13 2 19 2 20 6" />
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
<div id="alerta"></div>

<hr>
    <script src="resources/js/multcare.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <jsp:include page="template/footer.jsp" />