package br.com.caelum.online.loja.controlador;

import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;

@Resource
public class InfoController {

	@Path("/info/mostra")
	public void mostra(){
		//System.out.println("O método de ajuda foi invocado.");
	}
	
}
