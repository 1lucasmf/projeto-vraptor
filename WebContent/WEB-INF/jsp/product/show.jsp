<head>
	<title>User [show]</title>
</head>
<body>
	<p>
		<b>Registration:</b>
		${user.registration}
	</p>
	<p>
		<b>Name:</b>
		${user.name}
	</p>
	<p>
		<b>Senha:</b>
		${user.senha}
	</p>
	<p>
		<b>Email:</b>
		${user.email}
	</p>

	<a href="${pageContext.request.contextPath}/users/${user.id}/edit">Edit</a>
	<a href="${pageContext.request.contextPath}/users">Back</a>
</body>