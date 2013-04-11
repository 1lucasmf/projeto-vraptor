package br.lucasmf.store.model.dao.generic;

import java.util.List;

public interface GenericDao<T> {

        public T find(Long id);
        public T create(T objeto);
        public T update(T objeto);
        public void destroy(T objeto);
        public List<T> findAll();
        
}