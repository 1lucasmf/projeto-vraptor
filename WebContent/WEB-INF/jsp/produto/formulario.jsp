<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adicionar Produto</title>
</head>
<body>

<c:forEach var="error" items="${errors}">
    ${error.category} - ${error.message}<br />
</c:forEach>

<form action="<c:url value="/produto/adiciona"/>" method="post" class="form-horizontal">
	
	<div class="control-group">
	    <label class="control-label" for="inputName">Nome</label>
	    <div class="controls">
	      <input type="text" id="inputName" name="produto.nome" value="${produto.nome}">
	    </div>
    </div>
    
	<div class="control-group">
	    <label class="control-label" for="inputDesc">Descrição</label>
	    <div class="controls">
	      <input type="text" id="inputDesc" name="produto.descricao" value="${produto.descricao}">
	    </div>
    </div>
    
	<div class="control-group">
	    <label class="control-label" for="inputPrice">Preço</label>
	    <div class="controls">
	      <input type="text" id="inputPrice" name="produto.preco" value="${produto.preco}">
	    </div>
    </div>
    
	<div class="control-group">
	    <label class="control-label" for="inputColor">Cor</label>
	    <div class="controls">
	      <input type="text" id="inputColor" name="produto.cor" value="${produto.cor}">
	    </div>
    </div>

<!-- 	Nome: <input type="text" name="produto.nome" "/><br/> -->
<%-- 	Descrição: <input type="text" name="produto.descricao" value="${produto.descricao}"/> <br/> --%>
<%-- 	Preço: <input type="text" name="produto.preco" value="${produto.preco}"/> <br/> --%>
<%-- 	Cor: <input type="text" name="produto.cor" value="${produto.cor}"/> <br/> <br/> --%>
	
	<button class="btn btn-primary">Salvar</button>
</form>

</body>
</html>