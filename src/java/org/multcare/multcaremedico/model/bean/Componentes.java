package org.multcare.multcaremedico.model.bean;

import java.util.List;

/**
 *
 * @author Gyovanne Cavalcanti
 */
public class Componentes {

    private List<Conteudo> exameslaboratoriais;
    private List<Conteudo> alergias;
    private List<Conteudo> medicamentos;
    private List<Conteudo> diagnostico;
    private List<Conteudo> historicomedico;
    private List<Conteudo> historicofamiliar;
    private List<Conteudo> historicosaude;
    private List<Conteudo> exames;
    private List<Conteudo> tratamento;
    private List<Conteudo> exameslaboratoriaisfixos;

    /**
     *
     */
    public Componentes() {
    }

    /**
     *
     * @return
     */
    public List<Conteudo> getExameslaboratoriaisfixos() {
        return exameslaboratoriaisfixos;
    }

    /**
     *
     * @param exameslaboratoriaisfixos
     */
    public void setExameslaboratoriaisfixos(List<Conteudo> exameslaboratoriaisfixos) {
        this.exameslaboratoriaisfixos = exameslaboratoriaisfixos;
    }

    /**
     *
     * @return
     */
    public List<Conteudo> getExames() {
        return exames;
    }

    /**
     *
     * @param exames
     */
    public void setExames(List<Conteudo> exames) {
        this.exames = exames;
    }

    /**
     *
     * @return
     */
    public List<Conteudo> getAlergias() {
        return alergias;
    }

    /**
     *
     * @param alergias
     */
    public void setAlergias(List<Conteudo> alergias) {
        this.alergias = alergias;
    }

    /**
     *
     * @return
     */
    public List<Conteudo> getDiagnostico() {
        return diagnostico;
    }

    /**
     *
     * @param diagnostico
     */
    public void setDiagnostico(List<Conteudo> diagnostico) {
        this.diagnostico = diagnostico;
    }

    /**
     *
     * @return
     */
    public List<Conteudo> getHistoricomedico() {
        return historicomedico;
    }

    /**
     *
     * @param historicomedico
     */
    public void setHistoricomedico(List<Conteudo> historicomedico) {
        this.historicomedico = historicomedico;
    }

    /**
     *
     * @return
     */
    public List<Conteudo> getHistoricofamiliar() {
        return historicofamiliar;
    }

    /**
     *
     * @param historicofamiliar
     */
    public void setHistoricofamiliar(List<Conteudo> historicofamiliar) {
        this.historicofamiliar = historicofamiliar;
    }

    /**
     *
     * @return
     */
    public List<Conteudo> getHistoricosaude() {
        return historicosaude;
    }

    /**
     *
     * @param historicosaude
     */
    public void setHistoricosaude(List<Conteudo> historicosaude) {
        this.historicosaude = historicosaude;
    }

    /**
     *
     * @return
     */
    public List<Conteudo> getExameslaboratoriais() {
        return exameslaboratoriais;
    }

    /**
     *
     * @param exameslaboratoriais
     */
    public void setExameslaboratoriais(List<Conteudo> exameslaboratoriais) {
        this.exameslaboratoriais = exameslaboratoriais;
    }

    /**
     *
     * @return
     */
    public List<Conteudo> getMedicamentos() {
        return medicamentos;
    }

    /**
     *
     * @param medicamentos
     */
    public void setMedicamentos(List<Conteudo> medicamentos) {
        this.medicamentos = medicamentos;
    }

    /**
     *
     * @return
     */
    public List<Conteudo> getTratamento() {
        return tratamento;
    }

    /**
     *
     * @param tratamento
     */
    public void setTratamento(List<Conteudo> tratamento) {
        this.tratamento = tratamento;
    }

}
