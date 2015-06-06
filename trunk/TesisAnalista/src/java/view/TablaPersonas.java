/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view;

/**
 *
 * @author Alejandro
 */
import dao.PersonaDAO;
import entities.Personas;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import org.primefaces.context.RequestContext;

@ManagedBean(name = "tper")
@SessionScoped
public class TablaPersonas {

    private List<Personas> personas;
    private String seccion;

    public String getSeccion() {
        return seccion;
    }

    public void setSeccion(String seccion) {
        this.seccion = seccion;
    }

    public List<Personas> getPersonas() {
        return personas;
    }

    public void setPersonas(List<Personas> personas) {
        this.personas = personas;
    }

    public void mostrarPersonas(String seccion) {
        this.setSeccion(seccion);
        this.setPersonas(new PersonaDAO().getAll());
        RequestContext.getCurrentInstance().openDialog("tablaPersonas");
    }

    public void moaPersonas() {
        FacesMessage message;        
        if (seccion.equals("modifica")) {
            message = new FacesMessage(FacesMessage.SEVERITY_INFO, "Se va a modificar", seccion);
            RequestContext.getCurrentInstance().showMessageInDialog(message);
        } else if (seccion.equals("elimina")) {
            message = new FacesMessage(FacesMessage.SEVERITY_INFO, "Se va a eliminar", seccion);
            RequestContext.getCurrentInstance().showMessageInDialog(message);
        }
    }
}
