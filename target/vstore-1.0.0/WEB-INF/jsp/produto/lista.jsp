<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista de Produtos</title>

<script type="text/javascript" src="<c:url value="/js/jquery-1.6.1.min.js" />"></script>
<script type="text/javascript">

function getByJson(id){
    $.getJSON(id +'/json', function(data) {
        var items = [];
        $.each(data, function(key, val) {
            items.push('<li id="' + key + '">' + val.id + ' - ' + val.nome + ' - ' + val.descricao + ' - ' + val.preco +'</li>');
        });
        $('<ul/>',{'class': 'listagem', html: items.join('')}).appendTo('body');
    });
}
 
function remover(id) {
    $.get('remove?produto.id=' + id, function() {
        alert('removido com sucesso');
        $('#produto-' + id).remove();
    });
}

</script>

</head>
<body>

<div class="alert alert-info">
  ${mensagem}
</div>

<table id="tbProducts" class="table table-bordered table-striped">
	<tr>
		<th>Nome</th>
		<th>Descrição</th>
		<th>Preço</th>
		<th>Cor</th>
		<th>Excluir</th>
		<th>Editar</th>
		<th>To Json</th>
	</tr>
	<c:forEach var="produto" items="${produtoList}">
	<tr id="produto-${produto.id}">
		<td><a href="${pageContext.request.contextPath}/produto/${produto.id}">${produto.nome}</a></td>
		<td>${produto.descricao}</td>
		<td>${produto.preco}</td>
		<td>${produto.cor}</td>
		<td><a href="javascript:void(0);" onclick="remover(${produto.id}); return false">Remover</a></td>
		<td>
			<form action='<c:url value="/produto/edit"/>' method="post">
				<input type="hidden" name="_method" value="put"/>
		        <input id="" type="hidden" name="id" value="${produto.id}"/>
		        <button class="btn btn-link">Editar</button>
		    </form>
		</td>
		<td><a href="javascript:void(0);" onclick="getByJson(${produto.id}); return false">Json</a></td>
	</tr>
	</c:forEach> 
</table>

<div id="resultado">
    <ul class="listagem"></ul>
</div>

</body>
</html>