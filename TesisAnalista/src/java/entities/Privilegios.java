/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Alejandro
 */
@Entity
@Table(name = "privilegios")
public class Privilegios implements Serializable {

    private Long privilegioId;       
    private String privilegio;
    private List<Personas> persona;  
   

    public Privilegios() {
       
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "privilegio_id")    
    public Long getPrivilegioId() {
        return privilegioId;
    }

    public void setPrivilegioId(Long id) {
        this.privilegioId = id;
    }
    

    @Column(name = "privilegio")    
    public String getPrivilegio() {
        return privilegio;
    }

    public void setPrivilegio(String privilegio) {
        this.privilegio = privilegio;
    }    

    
    @OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
    @JoinColumn(name="f_privilegio")
    public List<Personas> getPersona() {
        return persona;
    }

    public void setPersona(List<Personas> persona) {
        this.persona = persona;
    }
    
   
    
    
    
    
   

}
