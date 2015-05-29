package dao;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;
import org.hibernate.Session;
import java.io.Serializable;
import org.hibernate.Transaction;
import util.HibernateUtil;

public abstract class GenericDAO<E extends Serializable, PK extends Serializable> {

    @SuppressWarnings("unchecked")
    protected Class<E> getType() {
        ParameterizedType genericSuperclass = (ParameterizedType) getClass().getGenericSuperclass();
        Type[] actualTypeArguments = genericSuperclass.getActualTypeArguments();
        Type type = actualTypeArguments[0];
        return (Class<E>) type;
    }

    public E getById(PK id) {
        Session session = getHibernateSession();
        Transaction transaction = session.beginTransaction();
        E e = (E) session.get(getType(), id);
        transaction.commit();
        return e;
    }

    @SuppressWarnings("unchecked")
    public List<E> getAll() {
        Class<E> type = this.getType();
        Session session = getHibernateSession();
        Transaction transaction = session.beginTransaction();
        List<E> objects = session.createQuery("from " + type.getCanonicalName()).list();
        transaction.commit();
        return objects;
    }

    
    public List<E> getByColumn(String ColumnName, String row) {
        Class<E> type = this.getType();        
        Session session = getHibernateSession();
        Transaction transaction = session.beginTransaction();
        List<E> objects = session.createQuery("FROM "+type.getName()+ " E WHERE E."+ColumnName+"="+row+"").list();        
        transaction.commit();
        return objects;
    }

    public E save(E object) {
        Session session = getHibernateSession();
        Transaction transaction = session.beginTransaction();
        E e = (E) session.save(object);
        transaction.commit();
        return e;
    }

    public void remove(E object) {
        Session session = getHibernateSession();
        Transaction transaction = session.beginTransaction();
        session.delete(object);
        transaction.commit();

    }

    public void update(E object) {
        Session session = getHibernateSession();
        Transaction transaction = session.beginTransaction();
        session.update(object);
        transaction.commit();
    }

    public void saveOrUpdate(E object) {
        Session session = getHibernateSession();
        Transaction transaction = session.beginTransaction();
        session.saveOrUpdate(object);
        transaction.commit();
    }

    protected Session getHibernateSession() {
        return HibernateUtil.getSessionFactory().openSession();

    }

    public void closeSessionFactory() {
        HibernateUtil.shutdown();
    }
}
