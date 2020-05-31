<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="org.cdapi.validator.ValidationCDA"%>
<%@page import="org.apache.tomcat.util.http.fileupload.UploadContext"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="template/header.jsp" />
<%
    String usuario = (String) session.getAttribute("emailUsuario");
    if (usuario == null) {
        response.sendRedirect("home");
    }
%>
<jsp:include page="template/navbar.jsp"/>
<c:set var = "status" scope = "session" value = "${status}"/>
<c:if test = "${validacao == 'true'}">
    <div class= "row">
        <div class="container">
            <strong>Versão atual do Documento: ${cabecalho.getVersion()}</strong>
            <div class="shadow p-3 mb-5 bg-white rounded">
                <c:if test = "${historico == 'false'}">
                    <a href="./manipular">
                        <button class="btn btn-info icones" data-toggle="tooltip" data-placement="top" title='Editar as informações deste Documento Clínico'> 
                            <svg id="i-edit" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="32" height="32" fill="none" stroke="currentcolor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
                                <path d="M30 7 L25 2 5 22 3 29 10 27 Z M21 6 L26 11 Z M5 22 L10 27 Z" />
                            </svg>
                        </button>
                    </a>
                </c:if>
                <c:if test = "${copiarDocumento == 'false'}">
                    <p>Salve uma cópia deste Documento Clinico para editar</p>
                    <a href="./copia">
                        <button class="btn btn-info icones" data-toggle="tooltip" data-placement="top" title='Clique para criar uma cópia deste Documento Clínico'> 
                            <svg id="i-file" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="32" height="32" fill="none" stroke="currentcolor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
                                <path d="M6 2 L6 30 26 30 26 10 18 2 Z M18 2 L18 10 26 10" />
                            </svg>
                            Fazer cópia
                        </button>
                    </a>
                </c:if>
                <div class="panel-group" id="accordion">
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title text-center ">
                                <label><a data-toggle="collapse" data-parent="#accordion" href="#collapse1"data-toggle="tooltip" data-placement="top" title='Expandir os dados do Paciente'>
                                        Paciente
                                    </a>
                                </label>
                            </h3>
                        </div>
                        <div id="collapse1" class="panel-collapse collapse  in">
                            <div class="form-row">
                                <div class="col-lg-4 lg-4 text-titulo">Id: 
                                    <label style="color: black;">${idPatient} ${cabecalho.getExtension()}</label>
                                </div>
                                <div class="col-lg-4 lg-4 text-titulo">Nome: 
                                    <label style="color: black;">${patient.getName()} ${patient.getFamily()}</label>
                                </div>
                                <div class="col-lg-4 lg-4 text-titulo">Data de nascimento: 
                                    <label style="color: black;">${patient.getBirth()}</label>
                                </div>
                                <div class="col-lg-4 lg-4 text-titulo">Local de nascimento: 
                                    <label style="color: black;">${patient.getBirthPlace()}</label>
                                </div>
                                <div class="col-lg-4 lg-4 text-titulo">Endereço do local de nascimento: 
                                    <label style="color: black;"> ${patient.getAddrBirthPlace()}</label>
                                </div>
                                <div class="col-lg-4 lg-4 text-titulo">Sexo: 
                                    <label style="color: black;">${patient.getGender()}</label>
                                </div>
                                <div class="col-lg-4 lg-4 text-titulo">Raça: 
                                    <label style="color: black;">${patient.getRace()}</label>
                                </div>
                                <div class="col-lg-4 lg-4 text-titulo">Etnia: 
                                    <label style="color: black;">${patient.getEthnicGroup()}</label>
                                </div>
                                <div class="col-lg-4 lg-4 text-titulo">Estado civil: 
                                    <label style="color: black;">${patient.getMaritalStatus()}</label>
                                </div>
                                <div class="col-lg-4 lg-4 text-titulo">Religião: 
                                    <label style="color: black;">${patient.getReligious()}</label>
                                </div>
                                <div class="col-lg-4 lg-4 text-titulo">Endereço: 
                                    <label style="color: black;">${patient.getAddr()}</label>
                                </div>
                                <div class="col-lg-4 lg-4 text-titulo">Telefone: 
                                    <label style="color: black;">${patient.getPhone()}</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title text-center ">
                                <label><a data-toggle="collapse" data-parent="#accordion" href="#collapse2"data-toggle="tooltip" data-placement="top" title='Expandir os dados do Documento'>Documento</a></label>
                            </h3>
                        </div>
                        <div id="collapse2" class="panel-collapse collapse">
                            <div class="form-row">
                                <div class="col-lg-6 text-titulo">Id: 
                                    <label style="color: black;">${cabecalho.getExtension()} ${cabecalho.getIdRoot()}</label>
                                </div>
                                <div class="col-lg-6 text-titulo">Criado em: 
                                    <label style="color: black;">${cabecalho.getEfetiveTime()}</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title text-center ">
                                <label><a data-toggle="collapse" data-parent="#accordion" href="#collapse3"data-toggle="tooltip" data-placement="top" title='Expandir os dados do Médico assistente'>Médico</a></label>
                            </h3>
                        </div>
                        <div id="collapse3" class="panel-collapse collapse">
                            <div class="form-row">
                                <div class="col-lg-6 text-titulo">Nome: 
                                    <label style="color: black;">${author.getName()} ${author.getFamily()}</label>
                                </div>
                                <div class="col-lg-6 text-titulo">Telefone:  
                                    <label style="color: black;">${author.getPhone()}</label>
                                </div>
                                <div class="col-lg-6 text-titulo">CRM: 
                                    <label style="color: black;">${author.getCrm()}</label>
                                </div>
                                <div class="col-lg-6 text-titulo">Endereço: 
                                    <label style="color: black;">${author.getAddr()}</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title text-center ">
                                <label><a data-toggle="collapse" data-parent="#accordion" href="#collapse4"data-toggle="tooltip" data-placement="top" title='Expandir outras informações'>Outras informações</a></label>
                            </h3>
                        </div>
                        <div id="collapse4" class="panel-collapse collapse">
                            <div class="form-row">
                                <div class="col-lg-6 text-titulo">Id: 
                                    <label style="color: black;">${responsibleParty.getExtension()} ${responsibleParty.getIdRoot()}</label>
                                </div>
                                <div class="col-lg-6 text-titulo">Data: 
                                    <label style="color: black;">${responsibleParty.getDate()}</label>
                                </div>
                                <div class="col-lg-6 text-titulo">Local: 
                                    <label style="color: black;">${responsibleParty.getLocation()}</label>
                                </div>
                                <div class="col-lg-6 text-titulo">Nome: 
                                    <label style="color: black;">${responsibleParty.getName()} ${responsibleParty.getFamily()}</label>
                                </div>
                                <div class="col-lg-12 text-titulo">Contato: 
                                    <label style="color: black;">${responsibleParty.getStreet()} ${responsibleParty.getCity()}, ${responsibleParty.getState()} - ${responsibleParty.getPostal()}, ${responsibleParty.getPhone()}</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title text-center ">
                                <label><a data-toggle="collapse" data-parent="#accordion" href="#collapse5"data-toggle="tooltip" data-placement="top" title='Expandir os dados de autenticação'>Autenticação</a></label>
                            </h3>
                        </div>
                        <div id="collapse5" class="panel-collapse collapse">
                            <div class="form-row">
                                <div class="col-lg-6 text-titulo">Autenticação legal: 
                                    <c:if test = "${authenticator.getCode() == 'S'}">
                                        <label style="color: black;">${author.getName()} ${author.getFamily()}, assinado em ${cabecalho.getEfetiveTime()} - ${authenticator.getCode()}</label>                                        
                                    </c:if>
                                    <c:if test = "${authenticator.getCode() != 'S'}">
                                        <label style="color: red;">Documento não assinado</label>                                        
                                    </c:if>
                                </div>
                                <div class="col-lg-6 text-titulo">Documento mantido por: 
                                    <label style="color: black;">${cabecalho.getDisplayName()}</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title text-center ">
                                <label><a data-toggle="collapse" data-parent="#accordion" href="#collapse6"data-toggle="tooltip" data-placement="top" title='Expandir os dados dos componentes'>Componentes</a></label>
                            </h3>
                        </div>
                        <div id="collapse6" class="panel-collapse collapse">
                            <div class="form-row">
                                <table class="table ">
                                    <c:forEach var="components" items="${component}">
                                        <tr>
                                            <td class="text-titulo"><div>
                                                    ${components.getTitle()}</div></td>
                                        </tr>
                                        <c:forEach var="component" items="${components.getContent()}">
                                            <tr>
                                                <td class=" text-valor"><label style="color: black;">${component}</label></td>
                                            </tr>
                                        </c:forEach>

                                    </c:forEach>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</c:if>
<c:if test = "${validacao == 'false'}">
    <!--Resultado--> 
    <div class="container">

        <div class="row">
            <div class="container">
                <div class="col-md-20 col-md-offset-1 col-lg-20 col-lg-offset-1">
                    <div>
                        <h5 id="cdapi" class="text-uppercase">Visualização do documento.</h5>
                    </div>  
                    <div class="alert-danger ">
                        <p>Não foi possível ler o documento!</p>
                        <hr>
                            <p class="mb-0">${resultadoValidacao}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:if>
<script src="resources/js/multcare.js" type="text/javascript"></script>
<jsp:include page="template/footer.jsp" />