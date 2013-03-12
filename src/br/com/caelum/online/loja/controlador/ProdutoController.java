package br.com.caelum.online.loja.controlador;

import java.util.List;

import br.com.caelum.online.loja.dominio.Produto;
import br.com.caelum.online.loja.repositorio.RepositorioDeProdutos;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.validator.Validations;
import br.com.caelum.vraptor.view.Results;

@Resource
public class ProdutoController {

	private RepositorioDeProdutos produtos;
	private Result result;
	private Validator validator;
	
	public ProdutoController(RepositorioDeProdutos produtos, Result result, Validator validator) {
		this.result = result;
		this.produtos = produtos;
		this.validator = validator;
	}
	
	public void formulario(Produto produto){
		result.include("produto", produto);
	}
	
	/*
	 * Restringe a chamada do metodo apenas a requisicoes do tipo POST.
	 * Por default todas as requisicoes http são aceitas pelo vraptor.
	 */
	@Post
	public void adiciona(final Produto produto){
		/*
		 * Aplica as validações referentes ao produto.
		 * O VRaptor também provê outra maneira para chamar a API de validação. 
		 * A ideia é tornar a leitura do código mais fluente, sem escrever muito ifs. 
		 * O objeto validator possui um método checking() 
		 * que recebe um objeto especializado que encapsula a regra de validação. 
		 * Esse objeto é do tipo Validations. 
		 */
		validator.checking(new Validations(){
			{
				/*
				 * Para que esse tipo de validação seja possivel o parametro do metodo utilizado na validação deve ser final.
				 * o 'that' define a condição, a categoria e a chave do resource que contem as mensagens que serão exibidas na tela.
				 */
				that(produto.getNome() == null || produto.getNome().length() >= 3 && produto.getNome().length() <= 100,"erro", "produto.nome.tamanho.invalido");
				that(produto.getDescricao() != null && produto.getDescricao().length() > 0 ,"erro", "produto.descricao.vazia");
				that(produto.getPreco() > 0.1,"erro", "produto.preco.invalido");
				//that(produto.getCor().equals("preto"),"erro", "produto.cor.invalida");	
			}
		});
		
		/*
		 * Define a pagina a qual o vraptor deve redirecionar a requisição em caso de erro.
		 */
		validator.onErrorUsePageOf(this).formulario(produto);
		
		/* 
		 * Lembrando que devera haver a pagina 'adiciona', 
		 * pois todos os metodos do vraptor devolvem pro padrao uma jsp.
		 * Portanto tal pagina pode ser utilizada como informacao de sucesso. 
		 * */
		produtos.salva(produto);
		
		/*
		 * inclui um objeto na sessão acessivel na JSP, 
		 * arg0 - variavel acessivel na JSP
		 * arg1 - valor da variavel (objeto a ser adicionado)
		 */
		result.include("mensagem", "produto inserido com sucesso!");
		
		/*
		 * informa o controlador e o metodo para qual o vraptor deve redicionar a requisição.
		 * forwardTo (redirect do lado servidor) - devolve a resposta diretamente para a requisição, permanecendo na mesma url.
		 * redirectTo (redirect do lado cliente) - devolve uma requisição que solicita um nova para chamar o novo metodo 
		 * e então devolver a pagina solicitada.
		 */
		result.redirectTo(this).lista();
	}
	
	/*
	 * Todo metodo com retorno, adiciona uma variavel no contexto do controlador.
	 * Nesse caso, a variável no request se chamará "produtoList". 
	 * O VRaptor sempre pega o nome do tipo do objeto (nesse caso, uma lista de produto) 
	 * e coloca a primeira letra em minúscula. 
	 * Produto vira "produto", Cliente se vira "cliente", NotaFiscal vira "notaFiscal". 
	 * Como é um lista concatena ainda "List".
	 */
	public List<Produto> lista(){
		return produtos.pegaTodos();
	}
	
	@Path({"/produto/{id}"})
	public Produto exibe(long id){
		return produtos.pegaPorId(id);
	}
	
	@Path({"/produto/{id}/xml"})
	public void exibeXML(long id){
		Produto produto = produtos.pegaPorId(id);
		result.use(Results.xml()).from(produto).serialize();
	}
	
	@Path({"/produto/{id}/json"})
	public void exibeJson(long id){
		Produto produto = produtos.pegaPorId(id);
		result.use(Results.json()).from(produto).serialize();  
	}
	
	public void remove(Produto produto){
		produtos.remove(produto);
		result.nothing(); //faz com que o vraptor ignore o retorno da requisição, ou seja, retorna nada.
	}
	
	public void edit(long id){
		Produto produto = produtos.pegaPorId(id);
		result.redirectTo(this).formulario(produto);
	}
	
	/*
	 * OBS1:
	 * Qual a diferença de usar result.include e fazer o próprio método retornar o dado que será exibido na view?
	 * 
	 * Nenhuma, ambos serão disponibilizadas na view da mesma forma.
	 * 
	 * Mas, se o programador precisar enviar mais de uma variável para a view, 
	 * ele precisa fazer uso obrigatoriamente do Result. 
	 * Além disso, com o result o programador consegue escolher qual o nome da variável disponibilizada na jsp; 
	 * com o retorno do método, isso não é possível. 
	 * A regra é sempre a seguinte: - O nome do tipo de retorno, com a primeira letra em minúscula, 
	 * caso esse tipo não seja uma lista; - O nome do tipo do conteúdo da lista, mais a palavra "list", 
	 * caso seja uma lista. Exemplo: se o retorno for List<Produto>, a variável será "produtoList".
	 */
	
	
}