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
import java.io.Serializable;

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
public class TablaPersonas implements Serializable {

    private static final long serialVersionUID = 1L;

    private List<Personas> personas;
    private String seccion;
    private String usuario;
    private Personas persona;

    public Personas getPersona() {
        return persona;
    }

    public void setPersona(Personas persona) {
        this.persona = persona;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

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
        this.setPersonas((new PersonaDAO()).getAll());
        RequestContext.getCurrentInstance().openDialog("tablaPersonas", getDialogOptions(seccion), null);
    }

    public Map<String, Object> getDialogOptions(String seccion) {
        Map<String, Object> options = new HashMap<String, Object>();
        options.put("modal", true);
        options.put("draggable", true);
        options.put("resizable", true);
        options.put("contentHeight", "'100%'");
        options.put("contentWidth", "'100%'");
        if (seccion.equals("actualiza")) {
            options.put("width", 700);
            options.put("height", 300);
        } else {
            options.put("width", 900);
            options.put("height", 500);
        }

        return options;
    }

    public void aPersona() {
        this.setSeccion("alta");
        RequestContext.getCurrentInstance().openDialog("altaPersona", getDialogOptions(seccion), null);
    }

    public void mOePersonas(Personas persona, Long usuarioId) {
        FacesMessage message;
        this.setUsuario(persona.getUsuario());
        if (seccion.equals("modifica")) {
            this.setPersona(persona);
            RequestContext.getCurrentInstance().openDialog("modificaPersona", getDialogOptions("actualiza"), null);
        } else if (seccion.equals("elimina")) {
            try {
                Long pId = persona.getId();
                if (pId.longValue() == usuarioId.longValue()) {
                    message = new FacesMessage("Error de Seguridad!!!");
                    RequestContext.getCurrentInstance().showMessageInDialog(message);
                } else {
                    (new PersonaDAO()).remove(persona);
                    this.setPersonas((new PersonaDAO()).getAll());
                    message = new FacesMessage("Exito!!", "El usuario : " + persona.getUsuario() + " se elimino Exitosamente!!!");
                    RequestContext.getCurrentInstance().showMessageInDialog(message);
                }
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
            RequestContext.getCurrentInstance().execute("alert('Exito!! El usuario : " + persona.getUsuario() + " se guardo Exitosamente!!!');");
            RequestContext.getCurrentInstance().closeDialog("altaPersona");

        } catch (Exception ex) {
            message = new FacesMessage("Error!!", ex.getMessage());
            RequestContext.getCurrentInstance().showMessageInDialog(message);

        }

    }

    public void modificaPersona(Personas persona) {
        FacesMessage message;
        RequestContext context = RequestContext.getCurrentInstance();
        try {
            (new PersonaDAO()).update(persona);            
            RequestContext.getCurrentInstance().execute("alert('Exito!! El usuario : " + persona.getUsuario() + " se modifico Exitosamente!!!');");
            RequestContext.getCurrentInstance().closeDialog(this);

        } catch (Exception ex) {
            message = new FacesMessage("Error!!", ex.getMessage());
            context.showMessageInDialog(message);

        }

    }

    public String getIcon() {
        if (seccion.equals("modifica")) {
            return "ui-icon-arrowrefresh-1-w";
        } else if (seccion.equals("elimina")) {
            return "ui-icon-trash";
        } else {
            return "error";
        }
    }

    public String getAccion() {
        if (seccion.equals("modifica")) {
            return "Modificar este Usuario";
        } else if (seccion.equals("elimina")) {
            return "Eliminar este Usuario";
        } else {
            return "error";
        }
    }
}
