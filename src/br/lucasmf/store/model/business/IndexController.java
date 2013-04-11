package br.lucasmf.store.model.business;

import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;

@Resource
public class IndexController {

	@Path("/")
	public void home() {
	}
	
	@Path("/help")
	public void ajuda(){
	}

}
