/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import com.sun.istack.internal.NotNull;
import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
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
    private Persona f_persona;
    private String privilegio;

    public Privilegios() {
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "privilegio_id")
    @NotNull
    public Long getPrivilegioId() {
        return privilegioId;
    }

    public void setPrivilegioId(Long id) {
        this.privilegioId = id;
    }

    @OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
    @JoinTable(name="persona",
            joinColumns = @JoinColumn(name="f_privilegios"),
            inverseJoinColumns = @JoinColumn(name="per_id"))
    @NotNull
    public Persona getF_persona() {
        return f_persona;
    }

    public void setF_persona(Persona f_persona) {
        this.f_persona = f_persona;
    }

    @Column(name = "privilegio")
    @NotNull
    public String getPrivilegio() {
        return privilegio;
    }

    public void setPrivilegio(String privilegio) {
        this.privilegio = privilegio;
    }

}
