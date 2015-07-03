package entities;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(Personas.class)
public abstract class Personas_ {

	public static volatile SingularAttribute<Personas, String> apellido;
	public static volatile SingularAttribute<Personas, String> nombre;
	public static volatile SingularAttribute<Personas, Long> id;
	public static volatile SingularAttribute<Personas, String> usuario;
	public static volatile ListAttribute<Personas, Privilegios> privilegios;
	public static volatile SingularAttribute<Personas, Long> dni;
	public static volatile SingularAttribute<Personas, String> pass;

}

