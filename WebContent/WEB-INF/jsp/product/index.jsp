<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
	<title>Product [index]</title>
	<script>
		function showModal() {
		    $('#modal-content').modal('show');
		    $('#modal-content').on('shown', function() {
		        $("#txtname").focus();
		    })
		};

	    $(function () {
	        $("#confirmButton").click(function () {
	            openConfirmModal();
	        });
	        function openConfirmModal() {
	            $("#confirmDiv").confirmModal({
	                heading: 'Are you sure?',
	                body: 'click on confirm button to destroy this product',
	                callback: function () {
	                    $('#destroy-form').submit();
	                }
	            });
	        }
	    });
	    
    </script>
</head>
<body>
	<h1>Listing products</h1>

	<table class="table table-condensed table-striped table-bordered">
		<tr>
			<th>Name</th>
			<th>Description</th>
			<th>Price</th>
			<th></th>
			<th></th>
			<th></th>
		</tr>

		<c:forEach items="${productList}" var="product">
			<tr>
				<td>${product.name}</td>
				<td>${product.description}</td>
				<td>${product.price}</td>
				<td><a href="${pageContext.request.contextPath}/products/${product.id}">show</a></td>
				<td><a href="${pageContext.request.contextPath}/products/${product.id}/edit">edit</a></td>
				<td>
					<form id="destroy-form" action="${pageContext.request.contextPath}/products/${product.id}" method="post">
						<input type="hidden" name="_method" value="delete"/>
						<button id="confirmButton" type="button">destroy</button>
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<div id="confirmDiv"></div>

	<br />

	<a class="btn btn-primary" href="#modal-content" onclick="showModal()">New product</a>
	
	<!-- div de cadastro de novo produto -->
	<div class="modal hide fade" id="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h3>New Product</h3>
		</div>
		<div class="modal-body">
		<!-- inicio do conteudo do modal -->			
			<c:if test="${not empty errors}">
				<c:forEach items="${errors}" var="error">
					${error.category} - ${error.message}<br />
				</c:forEach>
			</c:if>
			
			<form action="${pageContext.request.contextPath}/products" method="post">
			  
				<c:if test="${not empty product.id}">
					<input type="hidden" name="product.id" value="${product.id}"/>
					<input type="hidden" name="_method" value="put"/>
				</c:if>
				
				<div class="field">
					Name:<br />
					<input type="text" name="product.name" value="${product.name}"/>
				</div>
				
				<div class="field">
					Description:<br />
					<input type="text" name="product.description" value="${product.description}"/>
				</div>
				
				<div class="field">
					Price:<br />
					<input type="text" name="product.price" value="${product.price}"/>
				</div>
				
			  <div class="actions">
				  <button class="btn btn-primary" type="submit">save</button>
				</div>
			</form>
			<!-- fim do conteudo do modal -->	
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal" aria-hidden="true"> Cancel </a> 
		</div>
	</div>
	
	
	<!-- teste de combos -->
	<div>
		<label for='products-combo'>Products:</label> 
		<select id='products-combo' class="selectpicker" name='product.id'>
			<c:forEach var="product" items="${productList}">
				<option value="${product.id}"> ${product.name}</option>
			</c:forEach>
		</select> <br>
		
		<label for='users-combo'>Users:</label> 
		<select id='users-combo' name='user.id' ></select> <br>
	</div>

	<script>
		 $('#products-combo').change(function(product){
			 console.log(product.target.value)
			 $.ajax({
		    	    type: "GET",
		    	    url:  "http://localhost:8080/vstore/users/list", 
		    	    contentType: "application/json; charset=utf-8",
		    	    dataType: "json",
		    	    success: function(result) {
		    		    $(result.list).each(function(count, obj){
		    		    	var option = new Option(obj.name, obj.id)
		    		    	$('#users-combo').append(option)
		    		    })
		    	    },
		    	    error: function(err) {
		    	        alert(err.toString());
		    	    }
		    	});
		 });
	</script>

</body>