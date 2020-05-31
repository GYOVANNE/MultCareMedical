package org.multcare.multcaremedico.model.bean;

/**
 *
 * @author Gyovanne Cavalcanti
 */
public class Usuario {

    private Integer idUsuario;
    private String nomeUsuario;
    private String sobrenomeUsuario;
    private String crmUsuario;
    private String enderecoUsuario;
    private String telefoneUsuario;
    private String emailUsuario;
    private String senhaUsuario;

    /**
     *
     */
    public Usuario() {
    }

    /**
     *
     * @param nomeUsuario
     * @param sobrenomeUsuario
     * @param crmUsuario
     * @param enderecoUsuario
     * @param telefoneUsuario
     * @param emailUsuario
     * @param senhaUsuario
     */
    public Usuario(String nomeUsuario, String sobrenomeUsuario, String crmUsuario, String enderecoUsuario, String telefoneUsuario, String emailUsuario, String senhaUsuario) {
        this.nomeUsuario = nomeUsuario;
        this.sobrenomeUsuario = sobrenomeUsuario;
        this.crmUsuario = crmUsuario;
        this.enderecoUsuario = enderecoUsuario;
        this.telefoneUsuario = telefoneUsuario;
        this.emailUsuario = emailUsuario;
        this.senhaUsuario = senhaUsuario;
    }

    /**
     *
     * @return
     */
    public Integer getIdUsuario() {
        return idUsuario;
    }

    /**
     *
     * @param idUsuario
     */
    public void setIdUsuario(Integer idUsuario) {
        this.idUsuario = idUsuario;
    }

    /**
     *
     * @return
     */
    public String getNomeUsuario() {
        return nomeUsuario;
    }

    /**
     *
     * @param nomeUsuario
     */
    public void setNomeUsuario(String nomeUsuario) {
        this.nomeUsuario = nomeUsuario;
    }

    /**
     *
     * @return
     */
    public String getSobrenomeUsuario() {
        return sobrenomeUsuario;
    }

    /**
     *
     * @param sobrenomeUsuario
     */
    public void setSobrenomeUsuario(String sobrenomeUsuario) {
        this.sobrenomeUsuario = sobrenomeUsuario;
    }

    /**
     *
     * @return
     */
    public String getCrmUsuario() {
        return crmUsuario;
    }

    /**
     *
     * @param crmUsuario
     */
    public void setCrmUsuario(String crmUsuario) {
        this.crmUsuario = crmUsuario;
    }

    /**
     *
     * @return
     */
    public String getEnderecoUsuario() {
        return enderecoUsuario;
    }

    /**
     *
     * @param enderecoUsuario
     */
    public void setEnderecoUsuario(String enderecoUsuario) {
        this.enderecoUsuario = enderecoUsuario;
    }

    /**
     *
     * @return
     */
    public String getTelefoneUsuario() {
        return telefoneUsuario;
    }

    /**
     *
     * @param telefoneUsuario
     */
    public void setTelefoneUsuario(String telefoneUsuario) {
        this.telefoneUsuario = telefoneUsuario;
    }

    /**
     *
     * @return
     */
    public String getEmailUsuario() {
        return emailUsuario;
    }

    /**
     *
     * @param emailUsuario
     */
    public void setEmailUsuario(String emailUsuario) {
        this.emailUsuario = emailUsuario;
    }

    /**
     *
     * @return
     */
    public String getSenhaUsuario() {
        return senhaUsuario;
    }

    /**
     *
     * @param senhaUsuario
     */
    public void setSenhaUsuario(String senhaUsuario) {
        this.senhaUsuario = senhaUsuario;
    }
}
