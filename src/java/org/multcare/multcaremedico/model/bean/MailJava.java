package org.multcare.multcaremedico.model.bean;

import java.util.List;
import java.util.Map;

/**
 *
 * @author Gyovanne Cavalcanti
 */
public class MailJava {

    //indica se o formato de texto será texto ou html

    /**
     *
     */
    public static final String TYPE_TEXT_PLAIN = "text/plain";

    /**
     *
     */
    public static final String TYPE_TEXT_HTML = "text/html";
    //indica qual sera o servidor de email(gmail, hotmail...)
    private String smtpHostMail;
    //indica a porta de acesso ao servidor
    private String smtpPortMail;
    //indica que a necessidade de autenticacao 
    // no servidor(true ou false)
    private String smtpAuth;
    //indica ao servidor que ele esta recebendo uma conexao segura
    private String smtpStarttls;
    //nome do remetente do email
    private String fromNameMail;
    //email do remetente
    private String userMail;
    //senha do email do remetente
    private String passMail;
    //assunto do email
    private String subjectMail;
    //corpo do email, onde esta o texto da mensagem
    private String bodyMail;
    //lista com email e nome dos destinatarios
    private Map<String, String> toMailsUsers;
    //lista contendo os arquivos anexos
    private List<String> fileMails;
    //charset, no caso de html e necessario
    private String charsetMail;
    //tipo do formato da mensagem, texto ou html
    private String typeTextMail;

    // gere os metodos getters and setters

    /**
     *
     * @return
     */
    public String getSmtpHostMail() {
        return smtpHostMail;
    }

    /**
     *
     * @param smtpHostMail
     */
    public void setSmtpHostMail(String smtpHostMail) {
        this.smtpHostMail = smtpHostMail;
    }

    /**
     *
     * @return
     */
    public String getSmtpPortMail() {
        return smtpPortMail;
    }

    /**
     *
     * @param smtpPortMail
     */
    public void setSmtpPortMail(String smtpPortMail) {
        this.smtpPortMail = smtpPortMail;
    }

    /**
     *
     * @return
     */
    public String getSmtpAuth() {
        return smtpAuth;
    }

    /**
     *
     * @param smtpAuth
     */
    public void setSmtpAuth(String smtpAuth) {
        this.smtpAuth = smtpAuth;
    }

    /**
     *
     * @return
     */
    public String getSmtpStarttls() {
        return smtpStarttls;
    }

    /**
     *
     * @param smtpStarttls
     */
    public void setSmtpStarttls(String smtpStarttls) {
        this.smtpStarttls = smtpStarttls;
    }

    /**
     *
     * @return
     */
    public String getFromNameMail() {
        return fromNameMail;
    }

    /**
     *
     * @param fromNameMail
     */
    public void setFromNameMail(String fromNameMail) {
        this.fromNameMail = fromNameMail;
    }

    /**
     *
     * @return
     */
    public String getUserMail() {
        return userMail;
    }

    /**
     *
     * @param userMail
     */
    public void setUserMail(String userMail) {
        this.userMail = userMail;
    }

    /**
     *
     * @return
     */
    public String getPassMail() {
        return passMail;
    }

    /**
     *
     * @param passMail
     */
    public void setPassMail(String passMail) {
        this.passMail = passMail;
    }

    /**
     *
     * @return
     */
    public String getSubjectMail() {
        return subjectMail;
    }

    /**
     *
     * @param subjectMail
     */
    public void setSubjectMail(String subjectMail) {
        this.subjectMail = subjectMail;
    }

    /**
     *
     * @return
     */
    public String getBodyMail() {
        return bodyMail;
    }

    /**
     *
     * @param bodyMail
     */
    public void setBodyMail(String bodyMail) {
        this.bodyMail = bodyMail;
    }

    /**
     *
     * @return
     */
    public Map<String, String> getToMailsUsers() {
        return toMailsUsers;
    }

    /**
     *
     * @param toMailsUsers
     */
    public void setToMailsUsers(Map<String, String> toMailsUsers) {
        this.toMailsUsers = toMailsUsers;
    }

    /**
     *
     * @return
     */
    public List<String> getFileMails() {
        return fileMails;
    }

    /**
     *
     * @param fileMails
     */
    public void setFileMails(List<String> fileMails) {
        this.fileMails = fileMails;
    }

    /**
     *
     * @return
     */
    public String getCharsetMail() {
        return charsetMail;
    }

    /**
     *
     * @param charsetMail
     */
    public void setCharsetMail(String charsetMail) {
        this.charsetMail = charsetMail;
    }

    /**
     *
     * @return
     */
    public String getTypeTextMail() {
        return typeTextMail;
    }

    /**
     *
     * @param typeTextMail
     */
    public void setTypeTextMail(String typeTextMail) {
        this.typeTextMail = typeTextMail;
    }
}
