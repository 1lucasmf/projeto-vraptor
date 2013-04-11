package br.lucasmf.store.model.dao.impl;

import javax.persistence.EntityManager;

import org.hibernate.Criteria;
import org.hibernate.FlushMode;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import br.com.caelum.vraptor.ioc.Component;
import br.lucasmf.store.model.dao.UserDao;
import br.lucasmf.store.model.dao.generic.GenericDaoImpl;
import br.lucasmf.store.model.entity.User;

@Component
public class UserDaoImpl extends GenericDaoImpl<User> implements UserDao {

        public UserDaoImpl(EntityManager entityManager) {
                super(entityManager);
        }
        
        public User findByLogin(String login) {
                Session session = (Session) entityManager.getDelegate();
                session.setFlushMode(FlushMode.MANUAL);
                Criteria criteria = (Criteria) session.createCriteria(User.class);
                criteria.add(Restrictions.eq("login", login));
                
                return (User) criteria.uniqueResult();
        }
        
}	