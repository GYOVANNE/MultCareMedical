package org.multcare.multcaremedico.model.bean;

import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Gyovanne Cavalcanti
 */
public class ArquivoModelo {

    private MultipartFile file;

    /**
     *
     * @return
     */
    public MultipartFile getFile() {
        return file;
    }

    /**
     *
     * @param file
     */
    public void setFile(MultipartFile file) {
        this.file = file;
    }
}
