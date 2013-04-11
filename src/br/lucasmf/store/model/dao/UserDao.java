package br.lucasmf.store.model.dao;

import br.lucasmf.store.model.dao.generic.GenericDao;
import br.lucasmf.store.model.entity.User;

public interface UserDao extends GenericDao<User>{

        User findByLogin(String login);

}