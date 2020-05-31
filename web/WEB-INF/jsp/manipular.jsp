<%@page import="org.cdapi.bean.Component"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.multcare.multcaremedico.controller.DocumentoClinico"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="template/header.jsp" />
<%
    String usuario = (String) session.getAttribute("emailUsuario");
    if (usuario == null) {
        response.sendRedirect("home");
    }
%>
<jsp:include page="template/navbar.jsp"/>
<!-- Corpo da p�gina -->
<form action="./editar" method="POST" class="form-text">
    <div class="row">
        <div class="container">
            <div class="text-titulo">
                <h3 class="page-header">
                    Editar Documento Cl�nico
                </h3>
            </div>
            <p>
            <p>Este formul�rio deve ser preenchido por um profissional que possa fornecer essas informa��es com maior exatid�o. Ap�s o preenchimento completo do formul�rio, basta clicar no bot�o <label>Gerar Documento</label> que os dados ser�o direcionados diretamente para o servidor onde ser� mantido.</p>
            <h5 style="color: red;">* Preenchimento Obrigat�rio</h5>
            <div class="shadow p-3 mb-5 bg-white rounded" >
                <div class="panel-group" id="accordion">
                    <!--paciente-->
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title text-center  ">
                                <label ><a data-toggle="collapse" data-parent="#accordion" href="#collapse1">Paciente</a></label>
                            </h3>
                        </div>
                        <div id="collapse1" class="panel-collapse collapse in">
                            <p>Dados pessoais do paciente
                            <div class="form-row">
                                <div class="col-lg-5 lg-5 form-group">
                                    <label>Nome <label style="color: red;font-size: 16px;">*</label></label>
                                    <input style="border-radius: 20px;"name="patient.name" type="text"class="form-control" placeholder="Nome" value="${patient.getName()}"required="" >
                                </div>

                                <div class="col-lg-5 lg-5 form-group">
                                    <label>Sobrenome <label style="color: red;font-size: 16px;">*</label></label>
                                    <input style="border-radius: 20px;"name="patient.family" type="text" class="form-control" placeholder="Sobrenome" value="${patient.getFamily()}"required="">
                                </div>

                                <div class="col-lg-2 lg-2 form-group">
                                    <label>Sexo</label>
                                    <select style="border-radius: 20px;" name="patient.gender" id="inputState" class="form-control form-control-lg">
                                        <option value="${patient.getGender()}">${patient.getGender()}</option>
                                        <option value="...">...</option>
                                        <option  value="Masculino">Masculino</option>
                                        <option  value="Feminino">Feminino</option>
                                    </select>
                                </div>

                                <div class="col-lg-7 lg-2 form-group">
                                    <label>Endere�o</label>
                                    <input style="border-radius: 20px;"name="patient.addr" type="text"class="form-control " placeholder="Endere�o" value="${patient.getAddr()}">
                                </div>

                                <div class="col-lg-2 lg-2 form-group">
                                    <label>Telefone</label>
                                    <input style="border-radius: 20px;"name="patient.phone" type="text" id="telefonePaciente" class="p form-control " placeholder="Ex: (99) 99999-9999" value="${patient.getPhone()}">
                                </div>
                                <div class="col-lg-3 lg-2 form-group">
                                    <label>Estado civil</label>
                                    <select style="border-radius: 20px;" name="patient.maritalStatus" id="inputState" class="form-control form-control-lg">
                                        <option value="${patient.getMaritalStatus()}">${patient.getMaritalStatus()}</option>
                                        <option value="...">...</option>
                                        <option value="Solteiro(a)">Solteiro(a)</option>
                                        <option value="Casado(a)">Casado(a)</option>
                                        <option value="Separado(a)">Separado(a)</option>
                                        <option value="Divorciado(a)">Divorciado(a)</option>
                                        <option value="Vi�vo(a)">Vi�vo(a)</option>
                                    </select>
                                </div>

                                <div class="col-lg-4 lg-2 form-group">
                                    <label>Religi�o</label>
                                    <input style="border-radius: 20px;"name="patient.religious" type="text" class="form-control " placeholder="Ex: Crist�" value="${patient.getReligious()}">
                                </div>

                                <div class="col-lg-4 lg-2 form-group">
                                    <label>Ra�a/Cor</label>
                                    <select style="border-radius: 20px;" name="patient.race" id="inputState" class="form-control form-control-lg">
                                        <option value="${patient.getRace()}">${patient.getRace()}</option>
                                        <option value="...">Selecione</option>
                                        <option value="Amarela">Amarela</option>
                                        <option value="Branca">Branca</option>
                                        <option value="Parda">Parda</option>
                                        <option value="Preta">Preta</option>
                                        <option value="Ind�gena">Ind�gena</option>
                                    </select>
                                </div>

                                <div class="col-lg-4 lg-2 form-group">
                                    <label>Etnia</label>
                                    <input style="border-radius: 20px;"name="patient.ethnicGroup" type="text" class="form-control " placeholder="..." value="${patient.getEthnicGroup()}">
                                </div>

                                <div class="col-lg-4 lg-2 form-group">
                                    <label>Data de nascimento</label>
                                    <input style="border-radius: 20px;"name="patient.birth" type="text" class="p form-control" id="dataPaciente" placeholder="Ex: dd/mm/aaaa" value="${patient.getBirth()}">
                                </div>

                                <div class="col-lg-4 lg-2 form-group">
                                    <label>Local de nascimento</label>
                                    <input style="border-radius: 20px;"name="patient.birthPlace" type="text" class="form-control " placeholder="" value="${patient.getBirthPlace()}">
                                </div>

                                <div class="col-lg-4 lg-2 form-group">
                                    <label>End. local de nascimento</label>
                                    <input style="border-radius: 20px;"name="patient.addrBirthPlace" type="text" class="form-control " placeholder=""value="${patient.getAddrBirthPlace()}">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title text-center  ">
                                <label ><a data-toggle="collapse" data-parent="#accordion" href="#collapse3">Respons�vel</a></label>
                            </h3>
                        </div>
                        <div id="collapse3" class="panel-collapse collapse">
                            <p>Informa��es sobre o respons�vel pelo paciente
                            <div class="form-row">
                                <div class="col-lg-4 lg-4 form-group">
                                    <label>Nome</label>
                                    <input style="border-radius: 20px;"name="responsibleParty.name" type="text" class="form-control" placeholder=""value="${responsibleParty.getName()}">
                                </div>
                                <div class="col-lg-4 lg-4 form-group">
                                    <label>Sobrenome</label>
                                    <input style="border-radius: 20px;"name="responsibleParty.family" type="text" class="form-control" placeholder=""value="${responsibleParty.getFamily()}">
                                </div>
                                <div class="col-lg-4 lg-4 form-group">
                                    <label>Data</label>
                                    <input style="border-radius: 20px;"name="responsibleParty.date" type="text" class="p form-control" id="dataResponsavel" placeholder="Ex: dd/mm/aaaa"value="${responsibleParty.getDate()}">
                                </div>
                                <div class="col-lg-4 lg-4 form-group">
                                    <label>CEP</label>
                                    <input style="border-radius: 20px;"name="responsibleParty.postal" id="cep" type="text" class="p form-control" placeholder="Ex: 00000-000" value="${responsibleParty.getPostal()}">
                                </div>
                                <div class="col-lg-4 lg-4 form-group ">
                                    <label>Estado</label>
                                    <select style="border-radius: 20px;" name="responsibleParty.state" class="p form-control form-control-lg">
                                        <option value="${responsibleParty.getState()}">${responsibleParty.getState()}</option>
                                        <option value="...">Selecione</option>
                                        <option value="AC">Acre</option>
                                        <option value="AL">Alagoas</option>
                                        <option value="AP">Amap�</option>
                                        <option value="AM">Amazonas</option>
                                        <option value="BA">Bahia</option>
                                        <option value="CE">Cear�</option>
                                        <option value="DF">Distrito Federal</option>
                                        <option value="ES">Espirito Santo</option>
                                        <option value="GO">Goi�s</option>
                                        <option value="MA">Maranh�o</option>
                                        <option value="MS">Mato Grosso do Sul</option>
                                        <option value="MT">Mato Grosso</option>
                                        <option value="MG">Minas Gerais</option>
                                        <option value="PA">Par�</option>
                                        <option value="PB">Para�ba</option>
                                        <option value="PR">Paran�</option>
                                        <option value="PE">Pernambuco</option>
                                        <option value="PI">Piau�</option>
                                        <option value="RJ">Rio de Janeiro</option>
                                        <option value="RN">Rio Grande do Norte</option>
                                        <option value="RS">Rio Grande do Sul</option>
                                        <option value="RO">Rond�nia</option>
                                        <option value="RR">Roraima</option>
                                        <option value="SC">Santa Catarina</option>
                                        <option value="SP">S�o Paulo</option>
                                        <option value="SE">Sergipe</option>
                                        <option value="TO">Tocantins</option>
                                    </select>
                                </div>
                                <div class="col-lg-4 lg-2 form-group">
                                    <label>Cidade</label>
                                    <input style="border-radius: 20px;"name="responsibleParty.city" type="text" class="form-control" placeholder="Cidade"value="${responsibleParty.getCity()}">
                                </div>
                                <div class="col-lg-4 lg-2 form-group">
                                    <label>Rua</label>
                                    <input style="border-radius: 20px;"name="responsibleParty.street" type="text" class="form-control" placeholder="Rua"value="${responsibleParty.getStreet()}">
                                </div>
                                <div class="col-lg-1 lg-1 form-group ">
                                    <label>Uso</label>
                                    <input style="border-radius: 20px;"name="responsibleParty.use" type="text" class="form-control" placeholder="Uso" value="${responsibleParty.getUse()}">
                                </div>
                                <div class="col-lg-2 lg-2 form-group">
                                    <label>Telefone</label>
                                    <input style="border-radius: 20px;"name="responsibleParty.phone" type="text" id="telefoneResponsavel" class="g form-control" placeholder="Telefone"value="${responsibleParty.getPhone()}">
                                </div>
                                <div class="col-lg-5 lg-2 form-group">
                                    <label>Localidade</label>
                                    <input style="border-radius: 20px;"name="responsibleParty.location" type="text" class="form-control" placeholder="Localidade" value="${responsibleParty.getLocation()}">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--EXAMES LABORATORIAIS-->
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title text-center ">
                                <label><a data-toggle="collapse" data-parent="#accordion" href="#collapse4">Exames Laboratoriais</a></label>
                            </h3>
                        </div>
                        <div id="collapse4" class="panel-collapse collapse">
                            <div>
                                <p>Informa��es relacionadas aos Exames de laborat�rio (incluir os valores de refer�ncia considerados normais)
                            </div>
                            <div class="panel-body">
                                <div class="row clearfix">
                                    <div class="col-md-12 table-responsive">
                                        <table id="tabela" class="table" >
                                            <thead>
                                                <tr>
                                                    <th class="col-lg-11 lg-11 form-group">
                                                        Conte�do
                                                    </th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody id="body1">
                                                <tr>
                                                    <td>
                                                        <div class="col-lg-6 lg-6 form-group">
                                                            <p class="text-entrada">Creatinina <label style="color: red;font-size: 16px;">*</label></p>
                                                            <input style="border-radius: 20px;"name="exameslaboratoriaisfixos[0].conteudo" type="text"class="form-control" value="${component[0].getContent()[0]}" placeholder="Ex. Creatinina: 0,6 ~ 1,2 mg/dL"required="">
                                                        </div>
                                                        <div class="col-lg-6 lg-6 form-group">
                                                            <p class="text-entrada">Pot�ssio <label style="color: red;font-size: 16px;">*</label></p>
                                                            <input style="border-radius: 20px;"name="exameslaboratoriaisfixos[1].conteudo" type="text"class="form-control"  value="${component[0].getContent()[1]}" placeholder="Ex. Pot�ssio: 3,5 ~ 5,0 mEq/L"required="">
                                                        </div>
                                                        <div class="col-lg-6 lg-6 form-group">
                                                            <p class="text-entrada">Ur�ia <label style="color: red;font-size: 16px;">*</label></p>
                                                            <input style="border-radius: 20px;"name="exameslaboratoriaisfixos[2].conteudo" type="text"class="form-control" value="${component[0].getContent()[2]}"  placeholder="Ex. Ureia: 80 ~ 110 ?mol/L"required="">
                                                        </div>
                                                        <div class="col-lg-6 lg-6 form-group">
                                                            <p class="text-entrada">Albumin�ria <label style="color: red;font-size: 16px;">*</label></p>
                                                            <input style="border-radius: 20px;"name="exameslaboratoriaisfixos[3].conteudo" type="text"class="form-control" value="${component[0].getContent()[3]}"  placeholder="Ex. Albumin�ria: 20 mg/ 24h"required="">
                                                        </div>
                                                        <div class="col-lg-6 lg-6 form-group">
                                                            <p class="text-entrada">Microalbumin�ria <label style="color: red;font-size: 16px;">*</label></p>
                                                            <input style="border-radius: 20px;"name="exameslaboratoriaisfixos[4].conteudo" type="text"class="form-control" value="${component[0].getContent()[4]}"  placeholder="Ex. Microalbumin�ria: 30 ~ 300 mg/dia"required="">
                                                        </div>
                                                        <div class="col-lg-6 lg-6 form-group">
                                                            <p class="text-entrada">Taxa de Filtra��o Glomerular (TFG)<label style="color: red;font-size: 16px;">*</label></p>
                                                            <input style="border-radius: 20px;"name="exameslaboratoriaisfixos[5].conteudo" type="text"class="form-control"  value="${component[0].getContent()[5]}" placeholder="Ex. TFG: 80 ~ 120 mL/min"required="">
                                                        </div>
                                                    </td>
                                                </tr>
                                                <c:forEach var="components" items="${component[0].getContent()}" varStatus="status">
                                                    <c:if test = "${status.index > 5}">
                                                        <tr id="linha_${status.index}">
                                                            <td>
                                                                <input style="border-radius: 20px;"name="exameslaboratoriais[${status.index}].conteudo" type="text"class="form-control"value="${components}"> 
                                                            </td>
                                                            <td>
                                                                <button type="button" onclick="tabela.deletarLinha(${status.index});" name="deletar" class="btn btn-danger glyphicon glyphicon-remove row-remove"></button>
                                                            </td>
                                                        </tr>
                                                    </c:if>
                                                </c:forEach>
                                            </tbody>
                                        </table>

                                        <a onclick="tabela.update(exameslaboratoriais, ${(component[0].getContent().size() == null)? 0 : component[0].getContent().size()})" class="btn float-right btn-light icones" data-toggle="tooltip" data-placement="top" title='Adicionar um novo componente'>
                                            <svg id="i-plus" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="25" height="32" fill="none" stroke="currentcolor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
                                            <path d="M16 2 L16 30 M2 16 L30 16" />
                                            </svg>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--DIAGNOSTICO-->
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title text-center  ">
                                <label><a data-toggle="collapse" data-parent="#accordion" href="#collapse7">Diagn�stico da DRC</a></label>
                            </h3>
                        </div>
                        <div id="collapse7" class="panel-collapse collapse">
                            <div>
                                <p>Diagn�stico Insufici�ncia Renal Cr�nica (CID-10: N18) 
                            </div>
                            <div class="panel-body">
                                <div class="row clearfix">
                                    <div class="col-md-12 table-responsive">
                                        <table class="table table-bordered table-hover table-sortable" id="tab_logic">
                                            <thead>
                                                <tr>
                                                    <th>
                                                        Conte�do <label style="color: red;font-size: 16px;">*</label>
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <div class="col-lg-3 lg-3 form-group">
                                                            <div class="custom-control custom-radio custom-control-inline">
                                                                <input style="border-radius: 20px;"type="radio" id="customRadioInline1" name="diagnostico[0].conteudo" class="custom-control-input" 
                                                                       <c:if test = "${component[1].getContent()[0] == 'Risco baixo (RB)'}">
                                                                           checked="" 
                                                                       </c:if>
                                                                       value="Risco baixo (RB)">
                                                                <label class="custom-control-label" for="customRadioInline1"style="color: green">Risco baixo (RB)</label>
                                                            </div>
                                                        </div>                                                            

                                                        <div class="col-lg-3 lg-3 form-group">
                                                            <div class="custom-control custom-radio custom-control-inline">
                                                                <input style="border-radius: 20px;"type="radio" id="customRadioInline2" name="diagnostico[0].conteudo" class="custom-control-input"
                                                                       <c:if test = "${component[1].getContent()[0] == 'Risco moderado (RM)'}">
                                                                           checked="" 
                                                                       </c:if>
                                                                       value="Risco moderado (RM)">
                                                                <label class="custom-control-label" for="customRadioInline2"style="color: #eeeb00">Risco moderado (RM)</label>
                                                            </div>                                                            
                                                        </div>
                                                        <div class="col-lg-3 lg-3 form-group">
                                                            <div class="custom-control custom-radio custom-control-inline">
                                                                <input style="border-radius: 20px;"type="radio" id="customRadioInline3" name="diagnostico[0].conteudo" class="custom-control-input"
                                                                       <c:if test = "${component[1].getContent()[0] == 'Risco alto (RA)'}">
                                                                           checked="" 
                                                                       </c:if>
                                                                       value="Risco alto (RA)">
                                                                <label class="custom-control-label" for="customRadioInline3"style="color: orange">Risco alto (RA)</label>
                                                            </div>                                                            
                                                        </div>
                                                        <div class="col-lg-3 lg-3 form-group">
                                                            <div class="custom-control custom-radio custom-control-inline">
                                                                <input style="border-radius: 20px;"type="radio" id="customRadioInline4" name="diagnostico[0].conteudo" class="custom-control-input"
                                                                       <c:if test = "${component[1].getContent()[0] == 'Risco muito alto (RMA)'}">
                                                                           checked="" 
                                                                       </c:if>
                                                                       value="Risco muito alto (RMA)">
                                                                <label class="custom-control-label" for="customRadioInline4"style="color: red">Risco muito alto (RMA)</label>
                                                            </div>                                                            
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <textarea style="border-radius: 20px;" class="form-control" name="diagnostico[1].conteudo" placeholder="Observa��o" >${component[1].getContent()[1]}</textarea>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--ALERGIAS-->
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title text-center  ">
                                <label><a data-toggle="collapse" data-parent="#accordion" href="#collapse5">Alergias</a></label>
                            </h3>
                        </div>
                        <div id="collapse5" class="panel-collapse collapse">
                            <div>
                                <p>Informe se o paciente apresenta algum tipo de alergia ou rea��o de hipersensibilidade. Ex: Dermatol�gicas, Alimentares, Medicamentosa, Ocular (conjuntivite al�rgica), etc. </p>
                            </div>
                            <div class="panel-body">
                                <div class="row clearfix">
                                    <div class="col-md-12 table-responsive">
                                        <table class="table table-bordered table-hover table-sortable" id="tab_logic">
                                            <thead>
                                                <tr>
                                                    <th class="col-lg-11 lg-11 form-group">
                                                        Conte�do
                                                    </th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody id="body2">
                                                <c:forEach var="components" items="${component[2].getContent()}" varStatus="status">
                                                    <tr id="linha_${status.index}">
                                                        <td>
                                                            <input style="border-radius: 20px;"name="alergias[${status.index}].conteudo" type="text"class="form-control"value="${components}"> 
                                                        </td>
                                                        <td>
                                                            <button type="button" onclick="tabela2.deletarLinha(${status.index});" name="deletar" class="btn btn-danger glyphicon glyphicon-remove row-remove"></button>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <a id="add_row" onclick="tabela2.update(alergias,${(component[2].getContent().size() == null)? 0 : component[2].getContent().size()})" class="btn float-right btn-light icones" data-toggle="tooltip" data-placement="top" title='Adicionar um novo componente'>
                                            <svg id="i-plus" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="32" height="32" fill="none" stroke="currentcolor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
                                            <path d="M16 2 L16 30 M2 16 L30 16" />
                                            </svg>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--MEDICAMENTOS-->
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title text-center  ">
                                <label><a data-toggle="collapse" data-parent="#accordion" href="#collapse6">Medicamentos</a></label>
                            </h3>
                        </div>
                        <div id="collapse6" class="panel-collapse collapse">
                            <div>
                                <p>Quais medicamentos utilizados pelo paciente e informados pelo m�dico assistente. Informar se faz uso de algum tipo de medicamentos (inclusive os da medicina alternativa).</p>
                            </div>
                            <div class="panel-body">
                                <div class="row clearfix">
                                    <div class="col-md-12 table-responsive">
                                        <table class="table table-bordered table-hover table-sortable" id="tab_logic">
                                            <thead>
                                                <tr>
                                                    <th class="col-lg-11 lg-11 form-group">
                                                        Conte�do
                                                    </th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody id="body3">
                                                <c:forEach var="components" items="${component[3].getContent()}" varStatus="status">
                                                    <tr id="linha_${status.index}">
                                                        <td>
                                                            <input style="border-radius: 20px;"name="medicamentos[${status.index}].conteudo" type="text"class="form-control"value="${components}"> 
                                                        </td>
                                                        <td>
                                                            <button type="button" onclick="tabela3.deletarLinha(${status.index});" name="deletar" class="btn btn-danger glyphicon glyphicon-remove row-remove"></button>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <a id="add_row" onclick="tabela3.update(medicamentos,${(component[3].getContent().size() == null)? 0 : component[3].getContent().size()})" class="btn float-right btn-light icones" data-toggle="tooltip" data-placement="top" title='Adicionar um novo componente'>
                                            <svg id="i-plus" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="32" height="32" fill="none" stroke="currentcolor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
                                            <path d="M16 2 L16 30 M2 16 L30 16" />
                                            </svg>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--HISTORICO MEDICO-->
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title text-center  ">
                                <label><a data-toggle="collapse" data-parent="#accordion" href="#collapse8">Hist�rico M�dico</a></label>
                            </h3>
                        </div>
                        <div id="collapse8" class="panel-collapse collapse">
                            <div>
                                <p>Informa��es relacionadas ao relato do problema ou Hist�ria M�dica atual do paciente. Adquire-se informa��es sobre toda a hist�ria m�dica do paciente, mesmo das condi��es que n�o estejam relacionadas com a doen�a atual.
                            </div>
                            <div class="panel-body">
                                <div class="row clearfix">
                                    <div class="col-md-12 table-responsive">
                                        <table class="table table-bordered table-hover table-sortable" id="tab_logic">
                                            <thead>
                                                <tr>
                                                    <th class="col-lg-11 lg-11 form-group">
                                                        Conte�do
                                                    </th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody id="body5">
                                                <c:forEach var="components" items="${component[4].getContent()}" varStatus="status">
                                                    <tr id="linha_${status.index}">
                                                        <td>
                                                            <input style="border-radius: 20px;"name="historicomedico[${status.index}].conteudo" type="text"class="form-control"value="${components}"> 
                                                        </td>
                                                        <td>
                                                            <button type="button" onclick="tabela5.deletarLinha(${status.index});" name="deletar" class="btn btn-danger glyphicon glyphicon-remove row-remove"></button>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <a id="add_row" onclick="tabela5.update(historicomedico,${(component[4].getContent().size() == null)? 0 : component[4].getContent().size()})" class="btn float-right btn-light icones" data-toggle="tooltip" data-placement="top" title='Adicionar um novo componente'>
                                            <svg id="i-plus" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="32" height="32" fill="none" stroke="currentcolor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
                                            <path d="M16 2 L16 30 M2 16 L30 16" />
                                            </svg>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--HISTORICO FAMILIAR-->
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title text-center  ">
                                <label><a data-toggle="collapse" data-parent="#accordion" href="#collapse9">Hist�rico Familiar</a></label>
                            </h3>
                        </div>
                        <div id="collapse9" class="panel-collapse collapse">
                            <div>
                                <p>Informe se algu�m da fam�lia do paciente tem ou teve alguma doen�a relacionada. Neste hist�rico � perguntado ao paciente sobre sua fam�lia e suas condi��es de trabalho e vida, al�m de alguma rela��o de hereditariedade das doen�as (Ex. Press�o alta, Diabetes, Doen�a Card�aca, Outro tipo de Neoplasia, etc.).</p>
                            </div>
                            <div class="panel-body">
                                <div class="row clearfix">
                                    <div class="col-md-12 table-responsive">
                                        <table class="table table-bordered table-hover table-sortable" id="tab_logic">
                                            <thead>
                                                <tr>
                                                    <th class="col-lg-11 lg-11 form-group">
                                                        Conte�do
                                                    </th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody id="body6">
                                                <c:forEach var="components" items="${component[5].getContent()}" varStatus="status">
                                                    <tr id="linha_${status.index}">
                                                        <td>
                                                            <input style="border-radius: 20px;"name="historicofamiliar[${status.index}].conteudo" type="text"class="form-control"value="${components}"> 
                                                        </td>
                                                        <td>
                                                            <button type="button" onclick="tabela6.deletarLinha(${status.index});" name="deletar" class="btn btn-danger glyphicon glyphicon-remove row-remove"></button>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <a id="add_row" onclick="tabela6.update(historicofamiliar,${(component[5].getContent().size() == null)? 0 : component[5].getContent().size()})" class="btn float-right btn-light icones" data-toggle="tooltip" data-placement="top" title='Adicionar um novo componente'>
                                            <svg id="i-plus" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="32" height="32" fill="none" stroke="currentcolor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
                                            <path d="M16 2 L16 30 M2 16 L30 16" />
                                            </svg>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--HISTORICO DE SA�DE-->
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title text-center  ">
                                <label><a data-toggle="collapse" data-parent="#accordion" href="#collapse10">Hist�rico de Sa�de</a></label>
                            </h3>
                        </div>
                        <div id="collapse10" class="panel-collapse collapse">
                            <div>
                                <p>No hist�rico de sa�de � registrado tudo que se relaciona quanto � doen�a atual. Sintomatologia, �poca de in�cio, hist�ria da evolu��o da doen�a, entre outros.</p>
                            </div>
                            <div class="panel-body">
                                <div class="row clearfix">
                                    <div class="col-md-12 table-responsive">
                                        <table class="table table-bordered table-hover table-sortable" id="tab_logic">
                                            <thead>
                                                <tr>
                                                    <th class="col-lg-11 lg-11 form-group">
                                                        Conte�do
                                                    </th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody id="body7">
                                                <c:forEach var="components" items="${component[6].getContent()}" varStatus="status">
                                                    <tr id="linha_${status.index}">
                                                        <td>
                                                            <input style="border-radius: 20px;"name="historicosaude[${status.index}].conteudo" type="text"class="form-control"value="${components}"> 
                                                        </td>
                                                        <td>
                                                            <button type="button" onclick="tabela7.deletarLinha(${status.index});" name="deletar" class="btn btn-danger glyphicon glyphicon-remove row-remove"></button>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <a id="add_row" onclick="tabela7.update(historicosaude,${(component[6].getContent().size() == null)? 0 : component[6].getContent().size()})" class="btn float-right btn-light icones" data-toggle="tooltip" data-placement="top" title='Adicionar um novo componente'>
                                            <svg id="i-plus" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="32" height="32" fill="none" stroke="currentcolor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
                                            <path d="M16 2 L16 30 M2 16 L30 16" />
                                            </svg>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--EXAMES M�TRICO/F�SICO-->
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title text-center  ">
                                <label><a data-toggle="collapse" data-parent="#accordion" href="#collapse11">Exames M�trico/F�sico</a></label>
                            </h3>
                        </div>
                        <div id="collapse11" class="panel-collapse collapse">
                            <div>
                                <p>Informa��es relacionadas aos Exames M�trico/F�sicos do paciente. Ex: PA (mmHg), FC(/min), FR(/min), Peso (gramas, Kg), Altura, IMC, Temperatura, etc.</p>
                            </div>
                            <div class="panel-body">
                                <div class="row clearfix">
                                    <div class="col-md-12 table-responsive">
                                        <table class="table table-bordered table-hover table-sortable" id="tab_logic">
                                            <thead>
                                                <tr>
                                                    <th class="col-lg-11 lg-11 form-group">
                                                        Conte�do
                                                    </th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody id="body8">
                                                <c:forEach var="components" items="${component[7].getContent()}" varStatus="status">
                                                    <tr id="linha_${status.index}">
                                                        <td>
                                                            <input style="border-radius: 20px;"name="exames[${status.index}].conteudo" type="text"class="form-control"value="${components}"> 
                                                        </td>
                                                        <td>
                                                            <button type="button" onclick="tabela8.deletarLinha(${status.index});" name="deletar" class="btn btn-danger glyphicon glyphicon-remove row-remove"></button>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <a id="add_row" onclick="tabela8.update(exames,${(component[7].getContent().size() == null)? 0 : component[7].getContent().size()})" class="btn float-right btn-light icones" data-toggle="tooltip" data-placement="top" title='Adicionar um novo componente'>
                                            <svg id="i-plus" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="32" height="32" fill="none" stroke="currentcolor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
                                            <path d="M16 2 L16 30 M2 16 L30 16" />
                                            </svg>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--TRATAMENTO-->
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title text-center  ">
                                <label><a data-toggle="collapse" data-parent="#accordion" href="#collapse12">Tratamento</a></label>
                            </h3>
                        </div>
                        <div id="collapse12" class="panel-collapse collapse">
                            <div>
                                <p>Para melhor estrutura��o do tratamento do paciente, � necess�rio que, ap�s o diagn�stico, o paciente seja classificado informando o est�gio de tratamento. 
                            </div>
                            <div class="panel-body">
                                <div class="row clearfix">
                                    <div class="col-md-12 table-responsive">
                                        <table class="table table-bordered table-hover table-sortable" id="tab_logic">
                                            <thead>
                                                <tr>
                                                    <th class="col-lg-11 lg-11 form-group">
                                                        Conte�do
                                                    </th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody id="body9">
                                                <c:forEach var="components" items="${component[8].getContent()}" varStatus="status">
                                                    <tr id="linha_${status.index}">
                                                        <td>
                                                            <input style="border-radius: 20px;"name="tratamento[${status.index}].conteudo" type="text"class="form-control"value="${components}"> 
                                                        </td>
                                                        <td>
                                                            <button type="button" onclick="tabela9.deletarLinha(${status.index});" name="deletar" class="btn btn-danger glyphicon glyphicon-remove row-remove"></button>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <a id="add_row" onclick="tabela9.update(tratamento,${(component[8].getContent().size() == null)? 0 : component[8].getContent().size()})" class="btn float-right btn-light icones" data-toggle="tooltip" data-placement="top" title='Adicionar um novo componente'>
                                            <svg id="i-plus" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="32" height="32" fill="none" stroke="currentcolor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
                                            <path d="M16 2 L16 30 M2 16 L30 16" />
                                            </svg>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <button type="button" class="btn btn-info icones" data-toggle="modal" data-target="#salvarEdicao">
                    <svg id="i-checkmark" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="32" height="32" fill="none" stroke="currentcolor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" data-toggle="tooltip" data-placement="top" title='Confirmar edi��o do Documento Cl�nico'>
                    <path d="M2 20 L12 28 30 4" />
                    </svg>
                    Salvar Documento
                </button>
                <input name="header.version" type="text"class="form-control" placeholder="Id" value="${cabecalho.getVersion()}" readonly="true" style="visibility: hidden">
                <input name="patient.id" type="number"class="form-control" placeholder="Id" value="${idArquivo}" readonly="true" style="visibility: hidden">
                <input name="idArquivo" type="text"class="form-control" placeholder="Id" value="${idArquivo}"readonly="true" style="visibility: hidden">
                <!-- Modal -->
                <style>

                    .modal-backdrop {
                        position: relative;
                        top: 0;
                        right: 0;
                        bottom: 0;
                        left: 0;
                        z-index: 1040;
                        background-color: #000;
                    }
                </style>
                <div class="modal fade" id="salvarEdicao" tabindex="-1" role="dialog" aria-labelledby="Salvar Edicao" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLongTitle">Janela de confirma��o</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                Deseja criar o documento?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                                <input style="border-radius: 20px;"type="submit" id="submit" class="btn btn-info" value="Gerar">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<script src="resources/js/Contador.js" type="text/javascript"></script>
<script src="resources/js/tabela.js" type="text/javascript"></script>
<script src="resources/js/multcare.js" type="text/javascript"></script>
<jsp:include page="template/footer.jsp" />