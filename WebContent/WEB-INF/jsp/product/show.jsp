<head>
	<title>Product [show]</title>
</head>
<body>
	<p>
		<b>Name:</b>
		${product.name}
	</p>
	<p>
		<b>Description:</b>
		${product.description}
	</p>
	<p>
		<b>Price:</b>
		${product.price}
	</p>

	<a href="${pageContext.request.contextPath}/products/${product.id}/edit">Edit</a>
	<a href="${pageContext.request.contextPath}/products">Back</a>
</body>