<jsp:include page="template/header.jsp" />
<!--Verifica se o usuário está logado no sistema-->
<%
    String usuario = (String) session.getAttribute("emailUsuario");
    if (usuario == null) {
        response.sendRedirect("home");
    }
%>
<jsp:include page="template/navbar.jsp"/>

<!-- Masthead -->
<header class="masthead text-white text-center fadeIn first">
    <div class="overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-xl-9 mx-auto text-masthead "style="font-family: 'Poiret One', cursive; font-size: 70px;">
                MultCare Medical
            </div>
        </div>
    </div>
</header>

<jsp:include page="template/body.jsp"/>
<script src="resources/js/multcare.js" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<jsp:include page="template/footer.jsp" />
