package br.lucasmf.store.model.dao.impl;

import javax.persistence.EntityManager;

import br.com.caelum.vraptor.ioc.Component;
import br.lucasmf.store.model.dao.ProductDao;
import br.lucasmf.store.model.dao.generic.GenericDaoImpl;
import br.lucasmf.store.model.entity.Product;

@Component
public class ProductDaoImpl extends GenericDaoImpl<Product> implements ProductDao{

	public ProductDaoImpl(EntityManager entityManager) {
		super(entityManager);
	}
	
}
