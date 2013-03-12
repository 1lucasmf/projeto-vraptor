package br.com.caelum.online.loja.controlador;

import br.com.caelum.online.loja.dominio.UsuarioLogado;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class LoginController {

	private UsuarioLogado usuarioLogado;
	private Result result;

	public LoginController(UsuarioLogado usuarioLogado, Result result) {
		this.usuarioLogado = usuarioLogado;
		this.result = result;
	}
	
	public void formulario() {}
	 
	public void loga(String login, String senha) { 
	    if(login.equals("caelum") && senha.equals("vraptor")) {
	        this.usuarioLogado.setLogin(login);
	        result.redirectTo(ProdutoController.class).lista(); //ok, vá pra lista
	    } else {
	        //usuario não reconhecido, volta para o formulário
	        result.redirectTo(this).formulario();
	    }
	}
	
	public void exibe(){
		result.include("usuario", usuarioLogado.getLogin());
	}
	
}
