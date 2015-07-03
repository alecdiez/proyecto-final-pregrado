/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import dao.PrivilegiosDAO;
import entities.Privilegios;
import org.primefaces.context.RequestContext;

/**
 *
 * @author bizit
 */
@ManagedBean(name = "tprivi")
@SessionScoped
public class TablaPrivilegios implements Serializable
{

   public Map<String, Object> getDialogOptions()
   {
      Map<String, Object> options = new HashMap<String, Object>();
      options.put("modal", true);
      options.put("draggable", true);
      options.put("resizable", true);
      options.put("contentHeight", "'100%'");
      options.put("contentWidth", "'100%'");
      options.put("width", 700);
      options.put("height", 300);

      return options;
   }

   public void aPrivilegio()
   {
      RequestContext.getCurrentInstance().openDialog("altaPrivilegio", getDialogOptions(), null);
   }

   public void altaPrivilegio(Privilegios privilegio)
   {
      FacesMessage message;
      try
      {
         (new PrivilegiosDAO()).save(privilegio);
         RequestContext.getCurrentInstance().execute("alert('Exito!! El Privilegio : " + privilegio.getPrivilegio() + " se guardo Exitosamente!!!');");
         RequestContext.getCurrentInstance().closeDialog("altaPrivilegio");

      }
      catch (Exception ex)
      {
         message = new FacesMessage("Error!!", ex.getMessage());
         RequestContext.getCurrentInstance().showMessageInDialog(message);
      }

   }

}
