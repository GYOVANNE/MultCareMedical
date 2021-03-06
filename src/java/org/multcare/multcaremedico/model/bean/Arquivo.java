package org.multcare.multcaremedico.model.bean;

/**
 *
 * @author Gyovanne Cavalcanti
 */
public class Arquivo {

    private int idArquivo;
    private String nomeArquivo;
    private String dataArquivo;
    private byte[] fileArquivo;
    private int idUsuarioArquivo;
    private double versaoArquivo;

    /**
     *
     */
    public Arquivo() {
    }

    /**
     *
     * @param idArquivo
     * @param nomeArquivo
     * @param dataArquivo
     * @param fileArquivo
     * @param idUsuarioArquivo
     * @param versaoArquivo
     */
    public Arquivo(int idArquivo, String nomeArquivo, String dataArquivo, byte[] fileArquivo, int idUsuarioArquivo, double versaoArquivo) {
        this.idArquivo = idArquivo;
        this.nomeArquivo = nomeArquivo;
        this.dataArquivo = dataArquivo;
        this.fileArquivo = fileArquivo;
        this.idUsuarioArquivo = idUsuarioArquivo;
        this.versaoArquivo = versaoArquivo;
    }

    /**
     *
     * @return
     */
    public int getIdArquivo() {
        return idArquivo;
    }

    /**
     *
     * @param idArquivo
     */
    public void setIdArquivo(int idArquivo) {
        this.idArquivo = idArquivo;
    }

    /**
     *
     * @return
     */
    public String getNomeArquivo() {
        return nomeArquivo;
    }

    /**
     *
     * @param nomeArquivo
     */
    public void setNomeArquivo(String nomeArquivo) {
        this.nomeArquivo = nomeArquivo;
    }

    /**
     *
     * @return
     */
    public String getDataArquivo() {
        return dataArquivo;
    }

    /**
     *
     * @param dataArquivo
     */
    public void setDataArquivo(String dataArquivo) {
        this.dataArquivo = dataArquivo;
    }

    /**
     *
     * @return
     */
    public byte[] getFileArquivo() {
        return fileArquivo;
    }

    /**
     *
     * @param fileArquivo
     */
    public void setFileArquivo(byte[] fileArquivo) {
        this.fileArquivo = fileArquivo;
    }

    /**
     *
     * @return
     */
    public int getIdUsuarioArquivo() {
        return idUsuarioArquivo;
    }

    /**
     *
     * @param idUsuarioArquivo
     */
    public void setIdUsuarioArquivo(int idUsuarioArquivo) {
        this.idUsuarioArquivo = idUsuarioArquivo;
    }

    /**
     *
     * @return
     */
    public double getVersaoArquivo() {
        return versaoArquivo;
    }

    /**
     *
     * @param versaoArquivo
     */
    public void setVersaoArquivo(double versaoArquivo) {
        this.versaoArquivo = versaoArquivo;
    }

}
