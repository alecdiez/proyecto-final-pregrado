/*
 * Cliente.java
 *
 */
package entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@ManagedBean(name = "persona")
@SessionScoped
@Entity
@Table(name = "personas", uniqueConstraints
       = @UniqueConstraint(columnNames =
          {
             "per_usuario", "per_dni"
   }))
public class Personas implements Serializable
{

   private Long id;
   private String usuario;
   private String pass;
   private String nombre;
   private String apellido;
   private Long dni;
   private List<Privilegios> privilegios;

   public Personas()
   {
      privilegios = new ArrayList<Privilegios>();
   }

   @Id
   @GeneratedValue(strategy = GenerationType.AUTO)
   @Column(name = "per_id")
   public Long getId()
   {
      return id;
   }

   public void setId(Long id)
   {
      this.id = id;
   }

   @Column(name = "per_usuario", unique = true)
   public String getUsuario()
   {
      return usuario;
   }

   public void setUsuario(String usuario)
   {
      this.usuario = usuario;
   }

   @Column(name = "per_pass")
   public String getPass()
   {
      return pass;
   }

   public void setPass(String pass)
   {
      this.pass = pass;
   }

   @Column(name = "per_nombre")
   public String getNombre()
   {
      return nombre;
   }

   public void setNombre(String nombre)
   {
      this.nombre = nombre;
   }

   @Column(name = "per_ape")
   public String getApellido()
   {
      return apellido;
   }

   public void setApellido(String apellido)
   {
      this.apellido = apellido;
   }

   @Column(name = "per_dni", unique = true)
   public Long getDni()
   {
      return dni;
   }

   public void setDni(Long dni)
   {
      this.dni = dni;
   }

   @ManyToMany()
   @JoinTable(name = "personas_privilegios",
              joinColumns = @JoinColumn(name = "fk_persona"),
              inverseJoinColumns = @JoinColumn(name = "fk_privilegio"))
   public List<Privilegios> getPrivilegios()
   {
      return privilegios;
   }

   public void setPrivilegios(List<Privilegios> privilegios)
   {
      this.privilegios = privilegios;
   }

   @Override
   public String toString()
   {
      return "Persona{" + "id=" + id + ", usuario=" + usuario + ", pass=" + pass + ", nombre=" + nombre + ", apellido=" + apellido + ", dni=" + dni + '}';
   }

}
