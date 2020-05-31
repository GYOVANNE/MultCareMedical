<jsp:include page="template/header.jsp" />
<%
    String usuario = (String) session.getAttribute("emailUsuario");
    if (usuario == null) {
        response.sendRedirect("home");
    }
%>
<jsp:include page="template/navbar.jsp"/>
<!-- Corpo da página -->
<form action="./escrever" method="POST" class="form-text">
    <div class="row">
        <div class="container">
            <div class="text-titulo">
                <h3 class="page-header">
                    Create a new Clinical Document
                </h3>
            </div>
            <p>
            <p>This form must be edited by a professional who can provide this information with greater precision. After filling out the form completely, just click on the <label>Generate document</label> button and the data will be directed directly to the server where it will be kept..</p>
            <h5 style="color: red;">* Mandatory fill</h5>
            <div class="shadow p-3 mb-5 bg-white rounded" >
                <div class="panel-group" id="accordion">
                    <!--paciente-->
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title text-center">
                                <label ><a data-toggle="collapse" data-parent="#accordion" href="#collapse1">Patient</a></label>
                            </h3>
                        </div>
                        <div id="collapse1" class="panel-collapse collapse in">
                            <p>Patient's personal data
                            <div class="form-row">
                                <div class="col-lg-5 lg-5 form-group">
                                    <p class="text-entrada">Name <label style="color: red;font-size: 16px;">*</label></p>
                                    <input style="border-radius: 20px;"name="patient.name" type="text"class="form-control" placeholder="Name" required="">
                                </div>

                                <div class="col-lg-5 lg-5 form-group">
                                    <p class="text-entrada">Last name <label style="color: red;font-size: 16px;">*</label></p>
                                    <input style="border-radius: 20px;"name="patient.family" type="text" class="form-control " placeholder="Family"required="">
                                </div>

                                <div class="col-lg-2 lg-2 form-group">
                                    <p class="text-entrada">Gender</p>
                                    <select style="border-radius: 20px;" name="patient.gender" id="inputState" class="form-control form-control-lg">
                                        <option value="...">...</option>
                                        <option  value="Male">Male</option>
                                        <option  value="Female">Female</option>
                                    </select>
                                </div>

                                <div class="col-lg-7 lg-7 form-group">
                                    <p class="text-entrada">Address</p>
                                    <input style="border-radius: 20px;"name="patient.addr" type="text"class="form-control " placeholder="Address" >
                                </div>

                                <div class="col-lg-3 lg-2 form-group">
                                    <p class="text-entrada">Phone</p>
                                    <input style="border-radius: 20px;"name="patient.phone" type="text" id="telefonePaciente" class="p form-control " placeholder="Ex: (99) 99999-9999">
                                </div>
                                <div class="col-lg-2 lg-2 form-group">
                                    <p class="text-entrada">Marital status</p>
                                    <select name="patient.maritalStatus" id="inputState" class="form-control form-control-lg" style="border-radius: 20px;">
                                        <option value="...">Select</option>
                                        <option value="Solteiro(a)">Single</option>
                                        <option value="Casado(a)">Married</option>
                                        <option value="Separado(a)">Separated</option>
                                        <option value="Divorciado(a)">Divorced</option>
                                        <option value="Viúvo(a)">Widowed</option>
                                    </select>
                                </div>

                                <div class="col-lg-4 lg-2 form-group">
                                    <p class="text-entrada">Religion</p>
                                    <input style="border-radius: 20px;"name="patient.religious" type="text" class="form-control " placeholder="Ex: Cristã">
                                </div>

                                <div class="col-lg-4 lg-2 form-group">
                                    <p class="text-entrada">Race / Color</p>
                                    <select style="border-radius: 20px;" name="patient.race" id="inputState" class="form-control form-control-lg">
                                        <option value="...">Select</option>
                                        <option value="Amarela">Yellow</option>
                                        <option value="Branca">White</option>
                                        <option value="Parda">Brown</option>
                                        <option value="Preta">Black</option>
                                        <option value="Indígena">Indigenous</option>
                                    </select>
                                </div>

                                <div class="col-lg-4 lg-2 form-group">
                                    <p class="text-entrada">Ethnic group</p>
                                    <input style="border-radius: 20px;"name="patient.ethnicGroup" type="text" class="form-control " placeholder="..." >
                                </div>

                                <div class="col-lg-2 lg-2 form-group">
                                    <p class="text-entrada">Birth date</p>
                                    <input style="border-radius: 20px;"name="patient.birth" type="text" class="p form-control" id="dataPaciente" placeholder="Ex: dd/mm/aaaa">
                                </div>

                                <div class="col-lg-5 lg-2 form-group">
                                    <p class="text-entrada">Birthplace</p>
                                    <input style="border-radius: 20px;"name="patient.birthPlace" type="text" class="form-control " placeholder="" >
                                </div>

                                <div class="col-lg-5 lg-2 form-group">
                                    <p class="text-entrada">Adr. birthplace</p>
                                    <input style="border-radius: 20px;"name="patient.addrBirthPlace" type="text" class="form-control " placeholder="">
                                </div>

                            </div>
                        </div>
                    </div>
                    <!--responsavel-->
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title text-center">
                                <label ><a data-toggle="collapse" data-parent="#accordion" href="#collapse3">Responsible</a></label>
                            </h3>
                        </div>
                        <div id="collapse3" class="panel-collapse collapse">
                            <div>
                                <p >Information about the person responsible for the patient.
                            </div>
                            <div class="form-row">
                                <div class="col-lg-4 lg-4 form-group">
                                    <p class="text-entrada">Name</p>
                                    <input style="border-radius: 20px;"name="responsibleParty.name" type="text" class="form-control" placeholder="Name">
                                </div>
                                <div class="col-lg-4 lg-4 form-group">
                                    <p class="text-entrada">Family</p>
                                    <input style="border-radius: 20px;"name="responsibleParty.family" type="text" class="form-control" placeholder="Family">
                                </div>
                                <div class="col-lg-4 lg-4 form-group">
                                    <p class="text-entrada">Date</p>
                                    <input style="border-radius: 20px;"name="responsibleParty.date" type="text" class="p form-control" id="dataResponsavel" placeholder="Ex: dd/mm/aaaa">
                                </div>
                                <div class="col-lg-4 lg-4 form-group">
                                    <p class="text-entrada">Postal code</p>
                                    <input style="border-radius: 20px;"name="responsibleParty.postal" id="cep" type="text" class="p form-control" placeholder="Ex: 00000-000">
                                </div>
                                <div class="col-lg-4 lg-4 form-group ">
                                    <p class="text-entrada">State</p>
                                    <select style="border-radius: 20px;" name="responsibleParty.state" class="p form-control form-control-lg">
                                        <option value="...">Select</option>
                                        <option value="AC">Acre</option>
                                        <option value="AL">Alagoas</option>
                                        <option value="AP">Amapá</option>
                                        <option value="AM">Amazonas</option>
                                        <option value="BA">Bahia</option>
                                        <option value="CE">Ceará</option>
                                        <option value="DF">Distrito Federal</option>
                                        <option value="ES">Espirito Santo</option>
                                        <option value="GO">Goiás</option>
                                        <option value="MA">Maranhão</option>
                                        <option value="MS">Mato Grosso do Sul</option>
                                        <option value="MT">Mato Grosso</option>
                                        <option value="MG">Minas Gerais</option>
                                        <option value="PA">Pará</option>
                                        <option value="PB">Paraíba</option>
                                        <option value="PR">Paraná</option>
                                        <option value="PE">Pernambuco</option>
                                        <option value="PI">Piauí</option>
                                        <option value="RJ">Rio de Janeiro</option>
                                        <option value="RN">Rio Grande do Norte</option>
                                        <option value="RS">Rio Grande do Sul</option>
                                        <option value="RO">Rondônia</option>
                                        <option value="RR">Roraima</option>
                                        <option value="SC">Santa Catarina</option>
                                        <option value="SP">São Paulo</option>
                                        <option value="SE">Sergipe</option>
                                        <option value="TO">Tocantins</option>
                                    </select>
                                </div>
                                <div class="col-lg-4 lg-2 form-group">
                                    <p class="text-entrada">City</p>
                                    <input style="border-radius: 20px;"name="responsibleParty.city" type="text" class="form-control" placeholder="City">
                                </div>
                                <div class="col-lg-4 lg-2 form-group">
                                    <p class="text-entrada">Street</p>
                                    <input style="border-radius: 20px;"name="responsibleParty.street" type="text" class="form-control" placeholder="Street">
                                </div>
                                <div class="col-lg-1 lg-1 form-group ">
                                    <p class="text-entrada">Use</p>
                                    <input style="border-radius: 20px;"name="responsibleParty.use" type="text" class="form-control" placeholder="Use">
                                </div>
                                <div class="col-lg-2 lg-2 form-group">
                                    <p class="text-entrada">Phone</p>
                                    <input style="border-radius: 20px;"name="responsibleParty.phone" type="text" id="telefoneResponsavel" class="g form-control" placeholder="Phone">
                                </div>
                                <div class="col-lg-5 lg-5 form-group">
                                    <p class="text-entrada">Locality</p>
                                    <input style="border-radius: 20px;"name="responsibleParty.location" type="text" class="form-control" placeholder="Locality">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--EXAMES LABORATORIAIS--> 
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title text-center ">
                                <label><a data-toggle="collapse" data-parent="#accordion" href="#collapse4">Laboratory Exams</a></label>
                            </h3>
                        </div>
                        <div id="collapse4" class="panel-collapse collapse">
                            <div>
                                <p>Information related to laboratory tests (include reference values considered normal)
                            </div>
                            <div class="panel-body">
                                <div class="row clearfix">
                                    <div class="col-md-12 table-responsive">
                                        <table id="tabela" class="table" >
                                            <thead>
                                                <tr>
                                                    <th class="col-lg-11 lg-11 form-group">
                                                        Content
                                                    </th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody id="body1">
                                                <tr>
                                                    <td>
                                                        <div class="col-lg-6 lg-6 form-group">
                                                            <p class="text-entrada">Creatinine <label style="color: red;font-size: 16px;">*</label></p>
                                                            <input style="border-radius: 20px;"name="exameslaboratoriaisfixos[0].conteudo" type="text"class="form-control" placeholder="e.g. Creatinine: 0,6 ~ 1,2 mg/dL"required="">
                                                        </div>
                                                        <div class="col-lg-6 lg-6 form-group">
                                                            <p class="text-entrada">Potassium <label style="color: red;font-size: 16px;">*</label></p>
                                                            <input style="border-radius: 20px;"name="exameslaboratoriaisfixos[1].conteudo" type="text"class="form-control" placeholder="e.g. Potassium: 3,5 ~ 5,0 mEq/L"required="">
                                                        </div>
                                                        <div class="col-lg-6 lg-6 form-group">
                                                            <p class="text-entrada">Urea <label style="color: red;font-size: 16px;">*</label></p>
                                                            <input style="border-radius: 20px;"name="exameslaboratoriaisfixos[2].conteudo" type="text"class="form-control" placeholder="e.g. Urea: 80 ~ 110 ?mol/L"required="">
                                                        </div>
                                                        <div class="col-lg-6 lg-6 form-group">
                                                            <p class="text-entrada">Albuminuria <label style="color: red;font-size: 16px;">*</label></p>
                                                            <input style="border-radius: 20px;"name="exameslaboratoriaisfixos[3].conteudo" type="text"class="form-control" placeholder="e.g. Albuminuria: 20 mg/ 24h"required="">
                                                        </div>
                                                        <div class="col-lg-6 lg-6 form-group">
                                                            <p class="text-entrada">Microalbuminuria <label style="color: red;font-size: 16px;">*</label></p>
                                                            <input style="border-radius: 20px;"name="exameslaboratoriaisfixos[4].conteudo" type="text"class="form-control" placeholder="e.g. Microalbuminuria: 30 ~ 300 mg/day"required="">
                                                        </div>
                                                        <div class="col-lg-6 lg-6 form-group">
                                                            <p class="text-entrada">Glomerular Filtration Rate (GFR)<label style="color: red;font-size: 16px;">*</label></p>
                                                            <input style="border-radius: 20px;"name="exameslaboratoriaisfixos[5].conteudo" type="text"class="form-control" placeholder="e.g. GFR: 80 ~ 120 mL/min"required="">
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <a onclick="tabela.update(exameslaboratoriais, 0)" class="btn float-right btn-light icones" data-toggle="tooltip" data-placement="top" title='Adicionar um novo componente'>
                                            <svg id="i-plus" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="16" height="16" fill="none" stroke="currentcolor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
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
                                <label><a data-toggle="collapse" data-parent="#accordion" href="#collapse7">CKD Diagnosis</a></label>
                            </h3>
                        </div>
                        <div id="collapse7" class="panel-collapse collapse">
                            <div>
                                <p>Diagnosis based on the risk analysis of Chronic Kidney Disease.
                            </div>
                            <div class="panel-body">
                                <div class="row clearfix">
                                    <div class="col-md-12 table-responsive">
                                        <table class="table table-bordered table-hover table-sortable" id="tab_logic">
                                            <thead>
                                                <tr>
                                                    <th>
                                                        Content <label style="color: red;font-size: 16px;">*</label>
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <div class="col-lg-3 lg-3 form-group">
                                                            <div class="custom-control custom-radio custom-control-inline">
                                                                <input type="radio" id="customRadioInline1" name="diagnostico[0].conteudo" class="custom-control-input" value="Risco baixo (RB)">
                                                                <label class="custom-control-label" for="customRadioInline1"style="color: green">Low risk (LR)</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 lg-3 form-group">
                                                            <div class="custom-control custom-radio custom-control-inline">
                                                                <input type="radio" id="customRadioInline2" name="diagnostico[0].conteudo" class="custom-control-input" value="Risco moderado (RM)">
                                                                <label class="custom-control-label" for="customRadioInline2"style="color: #ffd32a">Moderate risk (MR)</label>
                                                            </div>                                                            
                                                        </div>
                                                        <div class="col-lg-3 lg-3 form-group">
                                                            <div class="custom-control custom-radio custom-control-inline">
                                                                <input type="radio" id="customRadioInline3" name="diagnostico[0].conteudo" class="custom-control-input" value="Risco alto (RA)">
                                                                <label class="custom-control-label" for="customRadioInline3"style="color: orange">High risk (HR)</label>
                                                            </div>                                                            
                                                        </div>
                                                        <div class="col-lg-3 lg-3 form-group">
                                                            <div class="custom-control custom-radio custom-control-inline">
                                                                <input type="radio" id="customRadioInline4" name="diagnostico[0].conteudo" class="custom-control-input" value="Risco muito alto (RMA)">
                                                                <label class="custom-control-label" for="customRadioInline4"style="color: red">Very high risk (VHR)</label>
                                                            </div>                                                            
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <textarea style="border-radius: 20px;" class="form-control" name="diagnostico[1].conteudo" placeholder="Observação" ></textarea>
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
                                <label><a data-toggle="collapse" data-parent="#accordion" href="#collapse5">Allergies</a></label>
                            </h3>
                        </div>
                        <div id="collapse5" class="panel-collapse collapse">
                            <div>
                                <p> Inform if the patient has any type of allergy or hypersensitivity reaction. Ex: Dermatological, Food, Medicinal, Ocular (allergic conjunctivitis), etc.</p>
                            </div>
                            <div class="panel-body">
                                <div class="row clearfix">
                                    <div class="col-md-12 table-responsive">
                                        <table class="table table-bordered table-hover table-sortable" id="tab_logic">
                                            <thead>
                                                <tr>
                                                    <th class="col-lg-11 lg-11 form-group">
                                                        Content
                                                    </th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody id="body2">
                                            </tbody>
                                        </table>
                                        <a id="add_row" onclick="tabela2.update(alergias, 0)" class="btn float-right btn-light icones" data-toggle="tooltip" data-placement="top" title='Adicionar um novo componente'>
                                            <svg id="i-plus" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="16" height="16" fill="none" stroke="currentcolor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
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
                                <label><a data-toggle="collapse" data-parent="#accordion" href="#collapse6">Medicines</a></label>
                            </h3>
                        </div>
                        <div id="collapse6" class="panel-collapse collapse">
                            <div>
                                <p>Which medicines used by the patient and informed by the attending physician. Inform if you use any type of medication (including alternative medicine).</p>
                            </div>
                            <div class="panel-body">
                                <div class="row clearfix">
                                    <div class="col-md-12 table-responsive">
                                        <table class="table table-bordered table-hover table-sortable" id="tab_logic">
                                            <thead>
                                                <tr>
                                                    <th class="col-lg-11 lg-11 form-group">
                                                        Content
                                                    </th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody id="body3">
                                            </tbody>
                                        </table>
                                        <a id="add_row" onclick="tabela3.update(medicamentos, 0)" class="btn float-right btn-light icones" data-toggle="tooltip" data-placement="top" title='Adicionar um novo componente'>
                                            <svg id="i-plus" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="16" height="16" fill="none" stroke="currentcolor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
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
                                <label><a data-toggle="collapse" data-parent="#accordion" href="#collapse8">Medical history</a></label>
                            </h3>
                        </div>
                        <div id="collapse8" class="panel-collapse collapse">
                            <div>
                                <p>Information related to the patient's current medical history or problem report. Information about the patient's entire medical history is acquired, even of conditions that are not related to the current disease.</p>
                            </div>
                            <div class="panel-body">
                                <div class="row clearfix">
                                    <div class="col-md-12 table-responsive">
                                        <table class="table table-bordered table-hover table-sortable" id="tab_logic">
                                            <thead>
                                                <tr>
                                                    <th class="col-lg-11 lg-11 form-group">
                                                        Content
                                                    </th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody id="body5">
                                            </tbody>
                                        </table>
                                        <a id="add_row" onclick="tabela5.update(historicomedico, 0)" class="btn float-right btn-light icones" data-toggle="tooltip" data-placement="top" title='Adicionar um novo componente'>
                                            <svg id="i-plus" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="16" height="16" fill="none" stroke="currentcolor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
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
                                <label><a data-toggle="collapse" data-parent="#accordion" href="#collapse9">Family history</a></label>
                            </h3>
                        </div>
                        <div id="collapse9" class="panel-collapse collapse">
                            <div>
                                <p>Inform if anyone in the patient's family has or has had any related illness. In this history, the patient is asked about his family and his work and life conditions, as well as some relation of inheritance of the diseases (Ex. High blood pressure, Diabetes, Heart disease, Other type of Neoplasia, etc.).</p>
                            </div>
                            <div class="panel-body">
                                <div class="row clearfix">
                                    <div class="col-md-12 table-responsive">
                                        <table class="table table-bordered table-hover table-sortable" id="tab_logic">
                                            <thead>
                                                <tr>
                                                    <th class="col-lg-11 lg-11 form-group">
                                                        Content
                                                    </th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody id="body6">
                                            </tbody>
                                        </table>
                                        <a id="add_row" onclick="tabela6.update(historicofamiliar, 0)" class="btn float-right btn-light icones" data-toggle="tooltip" data-placement="top" title='Adicionar um novo componente'>
                                            <svg id="i-plus" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="16" height="16" fill="none" stroke="currentcolor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
                                            <path d="M16 2 L16 30 M2 16 L30 16" />
                                            </svg>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--HISTORICO DE SAÚDE-->
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title text-center  ">
                                <label><a data-toggle="collapse" data-parent="#accordion" href="#collapse10">Health History</a></label>
                            </h3>
                        </div>
                        <div id="collapse10" class="panel-collapse collapse">
                            <div>
                                <p>In the health history, everything related to the current disease is recorded. Symptoms, time of onset, history of disease evolution, among others.</p>
                            </div>
                            <div class="panel-body">
                                <div class="row clearfix">
                                    <div class="col-md-12 table-responsive">
                                        <table class="table table-bordered table-hover table-sortable" id="tab_logic">
                                            <thead>
                                                <tr>
                                                    <th class="col-lg-11 lg-11 form-group">
                                                        Content
                                                    </th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody id="body7">
                                            </tbody>
                                        </table>
                                        <a id="add_row" onclick="tabela7.update(historicosaude, 0)" class="btn float-right btn-light icones" data-toggle="tooltip" data-placement="top" title='Adicionar um novo componente'>
                                            <svg id="i-plus" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="16" height="16" fill="none" stroke="currentcolor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
                                            <path d="M16 2 L16 30 M2 16 L30 16" />
                                            </svg>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--EXAMES MÉTRICO/FÍSICO-->
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title text-center  ">
                                <label><a data-toggle="collapse" data-parent="#accordion" href="#collapse11">Metric / Physical Exams</a></label>
                            </h3>
                        </div>
                        <div id="collapse11" class="panel-collapse collapse">
                            <div>
                                <p>Information related to the Metric / Physical Examination of the patient. Ex: PA (mmHg), FC (/ min), FR (/ min), Weight (grams, Kg), Height, BMI, Temperature, etc.</p>
                            </div>
                            <div class="panel-body">
                                <div class="row clearfix">
                                    <div class="col-md-12 table-responsive">
                                        <table class="table table-bordered table-hover table-sortable" id="tab_logic">
                                            <thead>
                                                <tr>
                                                    <th class="col-lg-11 lg-11 form-group">
                                                        Content
                                                    </th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody id="body8"></tbody>
                                        </table>
                                        <a onclick="tabela8.update(exames, 0)" class="btn float-right btn-light icones" data-toggle="tooltip" data-placement="top" title='Adicionar um novo componente'>
                                            <svg id="i-plus" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="16" height="16" fill="none" stroke="currentcolor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
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
                                <label><a data-toggle="collapse" data-parent="#accordion" href="#collapse12">Treatment</a></label>
                            </h3>
                        </div>
                        <div id="collapse12" class="panel-collapse collapse">
                            <div>
                                <p>For a better structuring of the patient's treatment, it is necessary that, after diagnosis, the patient be classified informing the treatment stage</p>
                            </div>
                            <div class="panel-body">
                                <div class="row clearfix">
                                    <div class="col-md-12 table-responsive">
                                        <table class="table table-bordered table-hover table-sortable" id="tab_logic">
                                            <thead>
                                                <tr>
                                                    <th class="col-lg-11 lg-11 form-group">
                                                        Content
                                                    </th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody id="body9">
                                            </tbody>
                                        </table>
                                        <a id="add_row" onclick="tabela9.update(tratamento, 0)" class="btn float-right btn-light icones" data-toggle="tooltip" data-placement="top" title='Adicionar um novo componente'>
                                            <svg id="i-plus" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="16" height="16" fill="none" stroke="currentcolor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
                                            <path d="M16 2 L16 30 M2 16 L30 16" />
                                            </svg>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Botão gerar documento -->
                    <button type="button" class="btn btn-info icones" data-toggle="modal" data-target="#_criar" data-toggle="tooltip" data-placement="top" title='Clique se deseja confirmar a criação do Documento Clínico'>
                        <svg id="i-checkmark" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="32" height="32" fill="none" stroke="currentcolor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
                        <path d="M2 20 L12 28 30 4" />
                        </svg>
                        Generate Document
                    </button>
                    <p><br><label>Attention:</label> When recording, wait for the confirmation screen. Only if the confirmation message appears, has your data been saved.</p>
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
                    <div class="modal fade" id="_criar" tabindex="-1" role="dialog" aria-labelledby="_criarTitle" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLongTitle">Confirmation window</h5>
                                    <button onclick="" type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    Do you want to create the document?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                                    <input type="submit" id="submit" class="btn btn-info" value="Gerar">
                                </div>
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