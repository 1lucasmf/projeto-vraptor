package br.lucasmf.store.model.dao.generic;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.Criteria;
import org.hibernate.FlushMode;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class GenericDaoImpl<T> implements GenericDao<T> {

        protected final EntityManager entityManager;
        protected final Class<T> classePersistente;
        
        @SuppressWarnings("unchecked")
        public GenericDaoImpl(EntityManager entityManager){
                this.entityManager = entityManager;
                this.classePersistente = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
        }
        
        @Override
        @SuppressWarnings("unchecked")
        public T find(Long id){
                Session session = (Session) entityManager.getDelegate();
                session.setFlushMode(FlushMode.MANUAL);
                Criteria criteria = (Criteria) session.createCriteria(classePersistente);
                criteria.add(Restrictions.eq("id", id));
                
                return (T) criteria.uniqueResult();
        }

        @Override
        public T create(T objeto) {
                entityManager.persist(objeto);
                entityManager.flush();
                return objeto;
        }
        
        @Override
        public T update(T objeto) {
                entityManager.merge(objeto);
                entityManager.flush();
                return objeto;
        }
        
        @Override
        @SuppressWarnings("unchecked")
        public List<T> findAll(){
                Session session = (Session) entityManager.getDelegate();
                session.setFlushMode(FlushMode.MANUAL);
                Criteria criteria = (Criteria) session.createCriteria(classePersistente);
                criteria.addOrder(Order.asc("id"));
                
                return criteria.list();
        }

        @Override
        public void destroy(T objeto) {
                entityManager.remove(objeto);
        }
        
}