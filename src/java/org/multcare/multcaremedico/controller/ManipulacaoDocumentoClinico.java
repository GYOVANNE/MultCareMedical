package org.multcare.multcaremedico.controller;

import org.multcare.multcaremedico.model.bean.ArquivoModelo;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import static org.apache.commons.io.FileUtils.readFileToByteArray;
import org.cdapi.document.ClinicalDocument;
import org.cdapi.validator.ValidationCDA;
import org.multcare.multcaremedico.model.bean.Arquivo;
import org.multcare.multcaremedico.model.dao.ArquivoDAO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Gyovanne Cavalcanti
 */
@Controller
public class ManipulacaoDocumentoClinico extends DocumentoClinico {

    @RequestMapping(value = "/ler", method = RequestMethod.GET)
    private String lerDocumentoClinico(ModelMap model, HttpServletRequest request) {
        setIdUsuario((int) request.getSession().getAttribute("idUsuario"));
        model.addAttribute("titlePage", "MultCare Médico - Manipular");
        listarDocumentosClinicos(model, request, 1);
        return "./ler";
    }

    @RequestMapping(value = "/ler", method = RequestMethod.POST)
    private String lerDocumentoClinico(@Validated ArquivoModelo file, BindingResult result, HttpServletRequest request, ModelMap model) throws IOException {
        if (result.hasErrors()) {
            return "ler";
        } else {
            MultipartFile multipartFile = file.getFile();
            if (multipartFile.getSize() > 0 && multipartFile.getContentType().equals("text/xml")) {
                ValidationCDA vcda = new ValidationCDA();
                boolean status = vcda.toValidate(convertMultiPartFileToFile(multipartFile));
                model.addAttribute("validacao", status);
                model.addAttribute("titlePage", "MultCare Médico - Manipular");
                model.addAttribute("resultadoValidacao", vcda.getNotificationHtml());
                model.addAttribute("copiarDocumento", false);
                if (status) {
                    setFile(convertMultiPartFileToFile(multipartFile));
                    done(model, new ClinicalDocument(getFile()));
                }
                return "./done";
            } else {
                listarDocumentosClinicos(model, request, 1);
                model.addAttribute("status", false);
                model.addAttribute("notificacao", "Ocorreu um erro ao tentar abrir o Documento Clínico<br>Tente outro arquivo!");
                return "./ler";
            }
        }
    }

    @RequestMapping(value = "/copia", method = RequestMethod.GET)
    private String copiarDocumentoClinico(@Validated HttpServletRequest request, ModelMap model) throws IOException {
        Arquivo a = new Arquivo();
        ClinicalDocument cda = new ClinicalDocument(getFile());
        a.setIdUsuarioArquivo(getIdUsuario());
        a.setDataArquivo(dataAtual("dd/MMMM/yyyy"));
        a.setNomeArquivo(cda.getPatient().getName() + " " + cda.getPatient().getFamily() + " | V" + cda.getHeader().getVersion());
        a.setFileArquivo(readFileToByteArray(getFile()));
        a.setVersaoArquivo(cda.getHeader().getVersion());
        new ArquivoDAO().adicionarDocumentoClinico(a);
        model.addAttribute("status", false);
        model.addAttribute("notificacao", "Documento Clínico copiado com sucesso!<br>Agora você pode editar!");
        listarDocumentosClinicos(model, request, 1);
        return "./ler";
    }

    @RequestMapping(value = "/file")
    private String visualizarDocumentoClinico(@Validated HttpServletRequest request, ModelMap model, int id) throws IOException {
        setIdArquivo(id);
        ValidationCDA vcda = new ValidationCDA();
        boolean status = vcda.toValidate(consultarDocumentoClinico(request, 1));
        model.addAttribute("titlePage", "MultCare Médico - Manipular");
        model.addAttribute("idPatient", getIdArquivo());
        model.addAttribute("validacao", status);
        model.addAttribute("resultadoValidacao", vcda.getNotificationHtml());
        model.addAttribute("historico", false);
        if (status) {
            done(model, new ClinicalDocument(getFile()));
        }
        return "./done";
    }

    @RequestMapping("delete")
    private String deletarDocumentoClinico(@Validated ModelMap model, HttpServletRequest request, int id) throws IOException {
        setIdArquivo(id);
        new ArquivoDAO().deletarDocumentoClinico(getIdArquivo(), getIdUsuario(), 1);
        listarDocumentosClinicos(model, request, 1);
        model.addAttribute("titlePage", "MultCare Médico - Manipular");
        model.addAttribute("status", false);
        model.addAttribute("notificacao", "Documento Clínico excluído com sucesso!");
        return "./ler";
    }

    @RequestMapping(value = "/manipular", method = RequestMethod.GET)
    private String manipularDocumentoClinico(@Validated HttpServletRequest request, ModelMap model) throws IOException {
        done(model, new ClinicalDocument(getFile()));
        model.addAttribute("idArquivo", getIdArquivo());
        return "./manipular";
    }

}
