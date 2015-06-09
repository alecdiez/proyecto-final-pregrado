/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view;

import java.io.Serializable;

import dao.PrivilegiosDAO;
import entities.Privilegios;

import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

/**
 *
 * @author Alejandro
 */
@ManagedBean(name = "privilegio")
@SessionScoped
public class Privilegio implements Serializable {

    private List<Privilegios> privilegios = new ArrayList();

    public void clearPrivilegios() {
        if (!privilegios.isEmpty()) {
            privilegios.clear();
        }
    }

    public void setPrivilegios(List<Privilegios> privilegios) {
        this.privilegios = privilegios;
    }

    public boolean tieneAcceso(Long personaId, String seccion) throws NoSuchFieldException {

        this.clearPrivilegios();

        StringBuilder query = new StringBuilder();
        query.append(" SELECT privilegios.privilegio ");
        query.append(" FROM tesisanalista.personas_privilegios AS personas_privilegios,");
        query.append(" tesisanalista.personas AS personas, tesisanalista.privilegios AS privilegios");
        query.append(" WHERE personas_privilegios.fk_persona = personas.per_id");
        query.append(" AND personas_privilegios.fk_privilegio = privilegios.privilegio_id");
        query.append(" AND personas.per_id = ").append(personaId);

        this.setPrivilegios(new PrivilegiosDAO().getListBySQLQuery(query.toString()));
        boolean validado = false;
        for (Object o : privilegios) {
            if (o.equals(seccion)) {
                validado = true;
            }
        }
        (new PrivilegiosDAO()).closeSessionFactory();
        return validado;
    }

}
