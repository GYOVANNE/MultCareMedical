package org.multcare.multcaremedico.model.dao;

import org.multcare.multcaremedico.model.bean.Usuario;

/**
 *
 * @author Gyovanne Cavalcanti
 */
public interface Validar {

    /**
     *
     * @param usuario
     * @return
     */
    public Usuario validarUsuario(Usuario usuario);
}
