/*
 * Cliente.java
 *
 */
package entities;

import dao.GenericDAO;
import dao.PersonaDAO;
import java.io.IOException;
import java.io.Serializable;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.ExternalContext;
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

    public void valSession() throws NoSuchFieldException, IOException {

        FacesContext fc = FacesContext.getCurrentInstance();
        List<Persona> persona = (new PersonaDAO()).getByColumn("usuario", this.getUsuario());

        if (!persona.isEmpty()) {
            String userToCompare = persona.get(0).getUsuario();
            String passToCompare = persona.get(0).getPass();

            if (userToCompare.equals(this.getUsuario()) && passToCompare.equals(this.getPass())) {
                this.setValidacion("VALIDADO");
                String url = "default.xhtml";
                ExternalContext ec = fc.getExternalContext();
                try {
                    ec.redirect(url);
                } catch (IOException ex) {

                }
            } else {
                fc.addMessage(null,
                        new FacesMessage("RECUERDE INGRESAR DATOS VÁLIDOS!!!"));
            }

        } else {
            fc.addMessage(null,
                    new FacesMessage("RECUERDE INGRESAR UN USUARIO VÁLIDO!!!"));
        }

        (new PersonaDAO()).closeSessionFactory();
    }

    public void consultaEstadoValidacion() {
        FacesContext fc = FacesContext.getCurrentInstance();
        int l=this.getValidacion().length();
        if (this.getValidacion() != null && !this.getValidacion().isEmpty()) {
            if (this.getValidacion().equals("VALIDADO")) {
                fc.addMessage(null, new FacesMessage("Bienvenido: " + this.getUsuario()));

            }
        } else {
            ExternalContext ec = fc.getExternalContext();
            String url = "index.xhtml";
            try {
                ec.redirect(url);

            } catch (IOException ex) {

            }
        }
    }

    public void logOut() {
        this.setValidacion("");
        this.setUsuario("");
        this.setPass("");
        FacesContext fc = FacesContext.getCurrentInstance();
        ExternalContext ec = fc.getExternalContext();
        String url = "index.xhtml";
        try {
            ec.redirect(url);
        } catch (IOException ex) {
        }
    }
}
