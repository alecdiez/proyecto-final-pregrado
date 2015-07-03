package util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

public class HibernateUtil {

	private static SessionFactory sessionFactory;

	static {
		try {
                    
                    sessionFactory = new  AnnotationConfiguration().configure().buildSessionFactory();

		} catch (Throwable ex) {

			throw new ExceptionInInitializerError(ex);
		}
	}

	public static SessionFactory getSessionFactory() {

		// Alternatively, you could look up in JNDI here
		return sessionFactory;
	}

	public static void shutdown() {

		// Close caches and connection pools
		sessionFactory.close();
	}
}