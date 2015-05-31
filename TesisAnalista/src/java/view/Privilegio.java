/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view;

import dao.PersonaDAO;
import dao.PrivilegiosDAO;
import entities.Persona;
import entities.Privilegios;
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
        
        List<Privilegios> privilegios = (new PrivilegiosDAO()).getByColumn("f_persona", String.valueOf(personaId));
        for(Privilegios o:privilegios){
            if(o.getPrivilegio().equals("seccion")){
                return true;           
            }
        }
        return false;
    }

}
