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

    public void valSession() throws NoSuchFieldException {

        /*Persona per= new Persona();
         per.setNombre("ale");
         per.setApellido("sosa");
         per.setUsuario(this.getUsuario());
         per.setPass(this.getPass());
         per.setDni(27921909L);
         (new PersonaDAO()).save(per);*/
        List<Persona> persona = (new PersonaDAO()).getByColumn("usuario", this.getUsuario());

        if (!persona.isEmpty()) {
            String userToCompare = persona.get(0).getUsuario();
            String passToCompare = persona.get(0).getPass();

            if (userToCompare.equals(this.getUsuario()) && passToCompare.equals(this.getPass())) {
                this.setValidacion("VALIDADO");
                FacesContext.getCurrentInstance().addMessage(null,
                        new FacesMessage(this.getValidacion()));
            } else {
                FacesContext.getCurrentInstance().addMessage(null,
                        new FacesMessage("RECUERDE INGRESAR DATOS VÁLIDOS!!!"));
            }

        } else {
            FacesContext.getCurrentInstance().addMessage(null,
                    new FacesMessage("RECUERDE INGRESAR UN USUARIO VÁLIDO!!!"));
        }

        (new PersonaDAO()).closeSessionFactory();
    }
}
