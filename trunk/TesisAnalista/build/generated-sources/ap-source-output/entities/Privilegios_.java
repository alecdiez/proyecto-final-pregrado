package entities;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(Privilegios.class)
public abstract class Privilegios_ {

	public static volatile SingularAttribute<Privilegios, String> privilegio;
	public static volatile SingularAttribute<Privilegios, Long> privilegioId;
	public static volatile ListAttribute<Privilegios, Personas> persona;

}

