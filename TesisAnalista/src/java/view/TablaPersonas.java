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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
        Map<String, Object> options = new HashMap<String, Object>();
        options.put("modal", true);
        options.put("draggable", true);
        options.put("resizable", true);
        options.put("width", 700);
        options.put("height", 400);
        RequestContext.getCurrentInstance().openDialog("tablaPersonas", options, null);
    }

    public void aPersona() {
        RequestContext.getCurrentInstance().openDialog("altaPersona");
    }

    public void mOePersonas(Personas persona) {
        FacesMessage message;
        if (seccion.equals("modifica")) {
            message = new FacesMessage(FacesMessage.SEVERITY_INFO, "Se va a modificar", persona.getNombre());
            RequestContext.getCurrentInstance().showMessageInDialog(message);
        } else if (seccion.equals("elimina")) {
            try {
                new PersonaDAO().remove(persona);
                message = new FacesMessage("Exito!!", "El usuario : " + persona.getUsuario() + " se elimino Exitosamente!!!");
                RequestContext.getCurrentInstance().showMessageInDialog(message);
                (new PersonaDAO()).closeSessionFactory();
            } catch (Exception ex) {
                message = new FacesMessage("Error!!", ex.getMessage());
                RequestContext.getCurrentInstance().showMessageInDialog(message);

            }
        }
    }

    public void altaPersona(Personas persona) {
        FacesMessage message;
        try {
            (new PersonaDAO()).save(persona);
            message = new FacesMessage("Exito!!", "El usuario : " + persona.getUsuario() + " se guardo Exitosamente!!!");
            RequestContext.getCurrentInstance().showMessageInDialog(message);
            (new PersonaDAO()).closeSessionFactory();
        } catch (Exception ex) {
            message = new FacesMessage("Error!!", ex.getMessage());
            RequestContext.getCurrentInstance().showMessageInDialog(message);

        }

    }
}
