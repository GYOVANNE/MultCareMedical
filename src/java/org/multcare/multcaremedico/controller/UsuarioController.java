package org.multcare.multcaremedico.controller;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import org.multcare.multcaremedico.model.bean.Usuario;
import org.multcare.multcaremedico.model.dao.UsuarioDAO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Gyovanne Cavalcanti
 */
@Controller
public class UsuarioController {

    private int idUsuario;

    private int getIdUsuario() {
        return idUsuario;
    }

    private void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    private String redirecionarParaInicio(ModelMap model) {
        model.addAttribute("titlePage", "MultCare Médico");
        return "./home";
    }

    @RequestMapping(value = {"/homePage"}, method = RequestMethod.GET)
    private String redirecionarParaPaginaInicial(ModelMap model) {
        model.addAttribute("titlePage", "MultCare Médico - Pagina Inicial");
        return "./homePage";
    }

    @RequestMapping(value = {"/homePage"}, method = RequestMethod.POST)
    private String redirecionarParaPaginaInicial() {
        return "./homePage";
    }

    @RequestMapping(value = "/cadastrarPage", method = RequestMethod.GET)
    private String cadastrarUsuario(ModelMap model) {
        model.addAttribute("titlePage", "MultCare Médico - Cadastro");
        return "./cadastrarPage";
    }

    @RequestMapping(value = "/cadastrarPage", method = RequestMethod.POST)
    private String cadastrarUsuario(@Validated HttpServletRequest request, ModelMap model) throws IOException {
        String accion = request.getParameter("cadastrar");
        if (accion.equals("cadastrar")) {
            Usuario u = cadastrarUsuario(request);
            if (u != null) {
                if (new UsuarioDAO().adicionarUsuario(u)) {
                    model.addAttribute("status", false);
                    model.addAttribute("notificacao", "Cadastro realizado com sucesso!");
                    return "./home";
                } else {
                    model.addAttribute("status", false);
                    model.addAttribute("notificacao", "Ocorreu um erro no cadastro! Tente novamente mais tarde.");
                    return "./cadastrarPage";
                }
            } else {
                model.addAttribute("status", false);
                model.addAttribute("notificacao", "As senhas são diferentes!<br>As senhas devem ser iguais para concluir o cadastro.");
                return "./cadastrarPage";
            }
        } else {
            model.addAttribute("status", false);
            model.addAttribute("notificacao", "Ops, ocorreu um erro no momento do cadastro!<br>Estamos verificando isso");
            return "./home";
        }
    }

    private static Usuario cadastrarUsuario(HttpServletRequest request) {
        String nome = request.getParameter("nomeUsuario");
        String sobrenome = request.getParameter("sobrenomeUsuario");
        String crm = request.getParameter("crmUsuario");
        String endereco = request.getParameter("enderecoUsuario");
        String telefone = request.getParameter("telefoneUsuario");
        String email = request.getParameter("emailUsuario");
        String senha = request.getParameter("senhaUsuario");
        String senha2 = request.getParameter("senha2Usuario");
        if (!senha.equals(senha2)) {
            return null;
        }
        return new Usuario(nome, sobrenome, crm, endereco, telefone, email, senha);
    }

    @RequestMapping(value = {"/configuracao"}, method = RequestMethod.GET)
    private String configurarDadosUsuario(ModelMap model) {
        model.addAttribute("titlePage", "MultCare Médico - Configurações");
        return "./configuracao";
    }

    @RequestMapping(value = "/configuracao", method = RequestMethod.POST)
    private String configurarDadosUsuario(@Validated BindingResult result, HttpServletRequest request, ModelMap model, Usuario usuario) throws IOException {
        if (result.hasErrors()) {
            return "configuracao";
        } else {
            setIdUsuario((int) request.getSession().getAttribute("idUsuario"));
            usuario.setIdUsuario(getIdUsuario());
            if (new UsuarioDAO().atualizarUsuario(usuario)) {
                return "./homePage";
            } else {
                return "./configuracao";
            }
        }
    }

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    private String efetuarLogin(ModelMap model) {
        model.addAttribute("titlePage", "MultCare Médico - Login");
        return "./home";
    }

    @RequestMapping(value = "/home", method = RequestMethod.POST)
    private String efeturarLogin(HttpServletRequest request, ModelMap model) throws IOException {
        String accion = request.getParameter("login");
        if (accion.equals("entrar")) {
            String email = request.getParameter("emailUsuario");
            String senha = request.getParameter("senhaUsuario");
            Usuario u = new Usuario();
            u.setEmailUsuario(email);
            u.setSenhaUsuario(senha);
            UsuarioDAO dao = new UsuarioDAO();
            u = dao.validarUsuario(u);
            if (u != null) {
                request.getSession().setAttribute("idUsuario", u.getIdUsuario());
                request.getSession().setAttribute("nomeUsuario", u.getNomeUsuario());
                request.getSession().setAttribute("sobrenomeUsuario", u.getSobrenomeUsuario());
                request.getSession().setAttribute("crmUsuario", u.getCrmUsuario());
                request.getSession().setAttribute("enderecoUsuario", u.getEnderecoUsuario());
                request.getSession().setAttribute("telefoneUsuario", u.getTelefoneUsuario());
                request.getSession().setAttribute("emailUsuario", u.getEmailUsuario());
                return "./homePage";
            } else {
                model.addAttribute("status", false);
                model.addAttribute("notificacao", "Email ou senha incorretos!<br>Tente novamente!");
                return "./home";
            }
        } else {
            return "./home";
        }
    }

    @RequestMapping(value = "/sobre", method = RequestMethod.GET)
    private String redirecionarParaSobre(ModelMap model) {
        model.addAttribute("titlePage", "MultCare Médico - Sobre");
        return "./sobre";
    }

    @RequestMapping(value = "/sair", method = RequestMethod.GET)
    private String efetuarLogout() {
        return "./sair";
    }
}
