package org.multcare.multcaremedico.controller;

import org.multcare.multcaremedico.model.bean.MailJava;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import org.multcare.multcaremedico.model.bean.Email;
import org.multcare.multcaremedico.model.bean.Usuario;
import org.multcare.multcaremedico.model.dao.ArquivoDAO;
import org.multcare.multcaremedico.model.dao.UsuarioDAO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Gyovanne Cavalcanti
 */
@Controller
public class CompartilhamentoDocumentoClinico extends DocumentoClinico {

    private String mensagem;

    private String getMensagem() {
        if (!this.mensagem.equals("")) {
            return "<br>Mensagem do remetente:<br>"
                    + mensagem;
        }
        return "";
    }

    private void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }

    @RequestMapping("share")
    private String compartilharDocumentoClinico(@Validated HttpServletRequest request, ModelMap model, int id) throws IOException {
        setIdArquivo(id);
        setIdUsuario((int) request.getSession().getAttribute("idUsuario"));
        model.addAttribute("titlePage", "MultCare Médico - Compartilhar");
        model.addAttribute("idArquivo", getIdArquivo());
        setFile(consultarDocumentoClinico(request, 1));
        model.addAttribute("usuarios", new UsuarioDAO().listarUsuarios(getIdUsuario()));
        return "./compartilhar";
    }

    @RequestMapping("shared")
    private String compartilharViaMedicosCadastrados(@Validated ModelMap model, HttpServletRequest request, int id) throws IOException {
        int usuarioSelecionado = id;
        new ArquivoDAO().duplicarDocumentoClinico(usuarioSelecionado, getIdArquivo());
        model.addAttribute("titlePage", "MultCare Médico - Manipular");
        model.addAttribute("status", false);
        model.addAttribute("notificacao", "Documento Clínico compartilhado com sucesso!");
        listarDocumentosClinicos(model, request, 1);
        return "./ler";
    }

    @RequestMapping("enviarEmail")
    private String compartilharViaEmail(@Validated HttpServletRequest request, ModelMap model, Email email) throws IOException, MessagingException {
        if (!email.getEmailEmail().equals("")) {
            send(email.getEmailEmail(), getFile(), email.getMensagemEmail(), informacaoUsuario(request));
        }
        model.addAttribute("titlePage", "MultCare Médico - Manipular");
        model.addAttribute("status", false);
        model.addAttribute("notificacao", "Documento Clínico compartilhado via E-mail com sucesso!");
        listarDocumentosClinicos(model, request, 1);
        return "./ler";
    }

    private Usuario informacaoUsuario(HttpServletRequest request) {
        Usuario u = new Usuario();
        u.setNomeUsuario((String) request.getSession().getAttribute("nomeUsuario"));
        u.setSobrenomeUsuario((String) request.getSession().getAttribute("sobrenomeUsuario"));
        u.setTelefoneUsuario((String) request.getSession().getAttribute("telefoneUsuario"));
        u.setEmailUsuario((String) request.getSession().getAttribute("emailUsuario"));
        return u;
    }

    private void send(String para, File file, String mensagem, Usuario u) throws MessagingException {

        setMensagem(mensagem);
        MailJava mj = new MailJava();
        //configuracoes de envio
        mj.setSmtpHostMail("smtp.gmail.com");
        mj.setSmtpPortMail("587");
        mj.setSmtpAuth("true");
        mj.setSmtpStarttls("true");
        mj.setUserMail("multcaremedico@gmail.com");
        mj.setFromNameMail("MultCare Médico");
        mj.setPassMail("multcaremedico@2019");
        mj.setCharsetMail("ISO-8859-1");
        mj.setSubjectMail("MultCare Médico");
        mj.setBodyMail(htmlMessage(u));
        mj.setTypeTextMail(MailJava.TYPE_TEXT_HTML);

        //sete quantos destinatarios desejar
        Map<String, String> map = new HashMap<>();
        map.put(para, "Email");
        mj.setToMailsUsers(map);

        //seta quatos anexos desejar
        List<String> files = new ArrayList<>();
        files.add(file.getPath());
        mj.setFileMails(files);

        try {
            senderMail(mj);
        } catch (UnsupportedEncodingException | MessagingException e) {
        }
    }

    //cria as propriedades necessarias para o envio de email
    private void senderMail(final MailJava mail) throws UnsupportedEncodingException, MessagingException {

        Properties props = new Properties();
        props.setProperty("mail.transport.protocol", "smtp");
        props.setProperty("mail.host", mail.getSmtpHostMail());
        props.setProperty("mail.smtp.auth", mail.getSmtpAuth());
        props.setProperty("mail.smtp.starttls.enable", mail.getSmtpStarttls());
        props.setProperty("mail.smtp.port", mail.getSmtpPortMail());
        props.setProperty("mail.mime.charset", mail.getCharsetMail());

        //classe anonima que realiza a autenticacao
        //do usuario no servidor de email.
        Authenticator auth = new Authenticator() {
            @Override
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(
                        mail.getUserMail(), mail.getPassMail()
                );
            }
        };

        // Cria a sessao passando as propriedades e a autenticacao
        Session session = Session.getDefaultInstance(props, auth);
        // Gera um log no console referente ao processo de envio
        session.setDebug(true);

        //cria a mensagem setando o remetente e seus destinatarios
        Message msg = new MimeMessage(session);
        //aqui seta o remetente
        msg.setFrom(new InternetAddress(
                mail.getUserMail(), mail.getFromNameMail())
        );
        boolean first = true;
        for (Map.Entry<String, String> map : mail.getToMailsUsers().entrySet()) {
            if (first) {
                //setamos o 1° destinatario
                msg.addRecipient(Message.RecipientType.TO,
                        new InternetAddress(map.getKey(), map.getValue())
                );
                first = false;
            } else {
                //setamos os demais destinatarios
                msg.addRecipient(Message.RecipientType.CC,
                        new InternetAddress(map.getKey(), map.getValue())
                );
            }
        }

        // Adiciona um Assunto a Mensagem
        msg.setSubject(mail.getSubjectMail());

        // Cria o objeto que recebe o texto do corpo do email
        MimeBodyPart textPart = new MimeBodyPart();
        textPart.setContent(mail.getBodyMail(), mail.getTypeTextMail());

        // Monta a mensagem SMTP  inserindo o conteudo, texto e anexos
        Multipart mps = new MimeMultipart();
        for (int index = 0; index < mail.getFileMails().size(); index++) {

            // Cria um novo objeto para cada arquivo, e anexa o arquivo
            MimeBodyPart attachFilePart = new MimeBodyPart();
            FileDataSource fds = new FileDataSource(
                    mail.getFileMails().get(index)
            );
            attachFilePart.setDataHandler(new DataHandler(fds));
            attachFilePart.setFileName(fds.getName());

            //adiciona os anexos da mensagem
            mps.addBodyPart(attachFilePart, index);

        }

        //adiciona o corpo texto da mensagem
        mps.addBodyPart(textPart);

        //adiciona a mensagem o conteudo texto e anexo
        msg.setContent(mps);

        // Envia a Mensagem
        Transport.send(msg);
    }

    private String htmlMessage(Usuario u) {
        return "<!DOCTYPE html>\n"
                + "<html lang=\"pt-br\">\n"
                + "<head>\n"
                + "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n"
                + "<meta name=\"description\" content=\"\">\n"
                + "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
                + "<meta name=\"author\" content=\"Gyovanne Cavalcanti\">\n"
                + "<title>MultCare Médico</title>\n"
                + "</head> \n"
                + "<body>\n"
                + "<p style=\"font-family:arial; font-size:18px;\" valign=\"top\">Olá,<br> segue em anexo o Documento Clínico compartilhado.<br>Para visualizá-lo, acesse o site <a href=\"www.multcaremedico.com.br\" target=\"blank\">MultCare Médico</a> e selecione o arquivo baixado.</p>\n"
                + "<p style=\"font-family:arial; font-size:18px;\" valign=\"top\">" + getMensagem() + "</p>\n"
                + "--\n"
                + "<br>\n"
                + "<hr size=\"2\" /><br>\n"
                + "<table>\n"
                + "<tr>\n"
                + "<td style=\"font-family:arial; font-size:16px; text-align:center\" valign=\"top\">\n"
                + "<img src=\"https://i.ibb.co/yhjRxzs/cda-icon-2.png\" border=\"0\" width=\"250\"/>\n"
                + "</td>\n"
                + "<td style=\"font-family:arial; font-size:16px; padding-left:20px\">\n"
                + "<strong>Remetente: " + u.getNomeUsuario() + " " + u.getSobrenomeUsuario() + "</strong><br/>\n"
                + "<strong>Fone:</strong>" + u.getTelefoneUsuario() + "<br/>\n"
                + "<strong>E-mail:</strong> <a href=\"mailto:" + u.getEmailUsuario() + "\" target=\"blank\">" + u.getEmailUsuario() + "</a><br/>\n"
                + "</td>\n"
                + "</tr>\n"
                + "</table>\n"
                + "<hr size=\"2\" /><br>\n"
                + "<p style=\"font-family:arial; font-size:12px;\" valign=\"top\">Este E-mail foi gerado automaticamente pelo sistema MultCare Médico. Não é necessário respondê-lo.</p>\n"
                + "</body> \n"
                + "</html>";
    }
}
