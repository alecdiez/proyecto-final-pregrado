/*
 * Cliente.java
 *
 */
package entities;

import dao.GenericDAO;
import dao.PersonaDAO;
import java.io.Serializable;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

@ManagedBean(name = "valses")
@SessionScoped

public class ValidarSession extends GenericDAO<ValidarSession, Long> implements Serializable {
    
    private String usuario;
    private String pass;
    private String validacion;

    public String getValidacion() {
        return validacion;
    }

    public void setValidacion(String validacion) {
        this.validacion = validacion;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
    

    public void valSession() {
        
        Persona per= new Persona();
        per.setNombre("ale");
        per.setApellido("sosa");
        per.setUsuario(this.getUsuario());
        per.setPass(this.getPass());
        per.setDni(27921909L);
        (new PersonaDAO()).save(per);
        
        List<Persona> persona = (new PersonaDAO()).getAll();
        FacesContext.getCurrentInstance().addMessage(null,
                new FacesMessage("Welcome " + persona.get(0)+" lalalala"));
        (new PersonaDAO()).closeSessionFactory();
    }
}
