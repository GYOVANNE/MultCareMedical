package org.multcare.multcaremedico.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import org.cdapi.document.ClinicalDocument;
import org.cdapi.validator.ValidationCDA;
import org.multcare.multcaremedico.model.dao.ArquivoDAO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Gyovanne Cavalcanti
 */
@Controller
public class HistoricoDocumentoClinico extends DocumentoClinico {

    @RequestMapping(value = "/historico", method = RequestMethod.GET)
    private String historicoDocumentoClinico(@Validated ModelMap model, HttpServletRequest request) throws IOException {
        model.addAttribute("titlePage", "MultCare Médico - Histórico");
        setIdUsuario((int) request.getSession().getAttribute("idUsuario"));
        listarDocumentosClinicos(model, request, 0);
        return "./historico";
    }

    @RequestMapping("deletehistoric")
    private String deletarDocumentoClinico(@Validated ModelMap model, HttpServletRequest request, int id) throws IOException {
        setIdArquivo(id);
        new ArquivoDAO().deletarDocumentoClinico(getIdArquivo(), getIdUsuario(), 0);
        model.addAttribute("titlePage", "MultCare Médico - Histórico");
        model.addAttribute("status", false);
        model.addAttribute("notificacao", "Documento Clínico excluído com sucesso!");
        listarDocumentosClinicos(model, request, 0);
        return "./historico";
    }

    @RequestMapping(value = "/fileHistoric")
    private String visualizarDocumentoClinico(@Validated ModelMap model, HttpServletRequest request, int id) throws IOException {
        setIdArquivo(id);
        ValidationCDA vcda = new ValidationCDA();
        setFile(consultarDocumentoClinico(request, 0));
        boolean status = vcda.toValidate(getFile());
        model.addAttribute("titlePage", "MultCare Médico - Manipular");
        model.addAttribute("validacao", status);
        model.addAttribute("idPatient", getIdArquivo());
        model.addAttribute("resultadoValidacao", vcda.getNotificationHtml());
        if (status) {
            done(model, new ClinicalDocument(getFile()));
        }
        return "./done";
    }
}
