/*
 * Cliente.java
 *
 */
package view;

import dao.GenericDAO;
import dao.PersonaDAO;
import entities.Personas;
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

    private Long personaId;
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

    public Long getPersonaId() {
        return personaId;
    }

    public void setPersonaId(Long personaId) {
        this.personaId = personaId;
    }

    @Override
    public String toString() {
        return "ValidarSession{" + "usuarioId=" + personaId + ", usuario=" + usuario + ", pass=" + pass + ", validacion=" + validacion + '}';
    }

    public void valSession() throws NoSuchFieldException, IOException {

        FacesContext fc = FacesContext.getCurrentInstance();
        List<Personas> persona = (new PersonaDAO()).getByColumn("usuario", this.getUsuario());
        this.setPersonaId(persona.get(0).getId());

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

    }

    public void consultaEstadoValidacion() {
        FacesContext fc = FacesContext.getCurrentInstance();
        int l = this.getValidacion().length();
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
        this.setPersonaId(0L);
        this.setValidacion("");
        this.setUsuario("");
        this.setPass("");
        (new PersonaDAO()).closeSessionFactory();
        FacesContext fc = FacesContext.getCurrentInstance();
        ExternalContext ec = fc.getExternalContext();
        String url = "index.xhtml";
        try {
            ec.redirect(url);
        } catch (IOException ex) {
        }
    }
}
