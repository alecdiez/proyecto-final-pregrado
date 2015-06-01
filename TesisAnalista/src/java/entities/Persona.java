/*
 * Cliente.java
 *
 */
package entities;

import com.sun.istack.internal.NotNull;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Persona")
public class Persona implements Serializable {

    private Long id;
    private String usuario;
    private String pass;
    private String nombre;
    private String apellido;
    private Long dni;    
    private List<Privilegios> privilegios;
    
    public Persona() {
        privilegios=new ArrayList<Privilegios>();
    }  
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "per_id")
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    
    @Column(name = "per_usuario")
    @NotNull
    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }
   
    @Column(name = "per_pass")
    @NotNull
    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    
    @Column(name = "per_nombre")
    @NotNull
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
   
    @Column(name = "per_ape")
    @NotNull
    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    @Column(name = "per_dni")
    @NotNull
    public Long getDni() {
        return dni;
    }

    public void setDni(Long dni) {
        this.dni = dni;
    }       
   
     @ManyToOne(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
     @JoinColumn(name="f_persona")
     public List<Privilegios> getPrivilegios() {
        return privilegios;
    }

    public void setPrivilegios(List<Privilegios> privilegios) {
        this.privilegios = privilegios;
    }

    @Override
    public String toString() {
        return "Persona{" + "id=" + id + ", usuario=" + usuario + ", pass=" + pass + ", nombre=" + nombre + ", apellido=" + apellido + ", dni=" + dni + '}';
    }

    
}
