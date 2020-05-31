<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

<c:if test = "${status == 'emailEnviado'}">
    <div class="pull-alert">
        <div class="alert alert-success pull-right" >
            <button type="button" class="btn btn-default btn-circle btn-xl-alert btn-lateral btn-float-alert"><i class="glyphicon glyphicon-envelope"></i></button>
            <hr class="hr-alert">
            <strong>Document sent by E-mail successfully!</strong>
        </div>
    </div> 
</c:if>

<!-- Icons Grid -->
<section class="features-icons bg-white">
    <div class="container">
        <div class="row" align="justify">
            <p style="font-family: 'Poiret One', cursive; font-size: 30px;">Welcome to MultCare Medical!</p>
            <ul>
                <hr/>
                <li>The adoption of this tool aims to make the processes between the systems responsible for the operationalization of the <i> Health Level Seven Clinical Document Architecture </i> (HL7 CDA) standard more agile, providing improvements in the access to updated Clinical Documents of patients. Through this system, applications can transfer clinical data between doctors.</li>
                <p>
                <hr/>
                <li>The project was initiated by the Research Group on Critical Security Systems (GPSiCS), which is linked to the Multidisciplinary Center Pau dos Ferros (CMPDF). This project is not affiliated with the HL7 organization, it is just software written using its specification.</li>
                <p>
            </ul>
        </div>
    </div>
</section>
<hr/>
<script src="resources/js/multcare.js" type="text/javascript"></script>
<jsp:include page="template/footer.jsp" />
