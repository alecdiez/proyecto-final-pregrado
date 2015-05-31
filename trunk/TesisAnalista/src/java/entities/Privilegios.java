/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author Alejandro
 */
@Entity
@Table(name = "privilegios")
public class Privilegios implements Serializable {

    private Long id;
    private Persona persona;
    private String privilegio;

    public Privilegios() {
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "privilegio_id")
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "f_persona")
    public Persona getPersona() {
        return persona;
    }

    public void setPersona(Persona persona) {
        this.persona = persona;
    }

    public String getPrivilegio() {
        return privilegio;
    }

    public void setPrivilegio(String privilegio) {
        this.privilegio = privilegio;
    }

}
