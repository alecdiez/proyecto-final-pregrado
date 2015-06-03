/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view;

import dao.PersonaDAO;
import dao.PrivilegiosDAO;
import entities.Personas;
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
public class Privilegio {

    public boolean tieneAcceso(Long personaId, String seccion) throws NoSuchFieldException {

        if (seccion.equals("altaPersona")) {
            Personas persona = (new PersonaDAO()).getById(personaId);
            ArrayList per=new ArrayList<Personas>();
            per.add(persona);
            Privilegios pri = new Privilegios();           
            pri.setPersona(per);
            pri.setPrivilegio("altaPersona");
            (new PrivilegiosDAO()).save(pri);
        }

        List<Privilegios> privilegios = (new PrivilegiosDAO()).getByColumn("f_privilegio", String.valueOf(personaId));
        boolean validado = false;
        for (Privilegios o : privilegios) {
            if (o.getPrivilegio().equals(seccion)) {
                validado = true;
            }
        }
        (new PrivilegiosDAO()).closeSessionFactory();
        return validado;
    }

}
