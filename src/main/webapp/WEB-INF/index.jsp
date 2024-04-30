<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h1>Registro:</h1>
		<form:form>
			<form:label>Nombre:</form:label>
			<form:input type="text" />

			<form:label>Apellido:</form:label>
			<form:input type="text" />

			<form:label>Email:</form:label>
			<form:input type="text" />

			<form:label>Password:</form:label>
			<form:input type="password" />

			<form:label>Confirmar password:</form:label>
			<form:input type="password" />
		</form:form>
	</div>

	<div>
		<h1>Login</h1>
		<form:form>
			<form:label>Email:</form:label>
			<form:input type="text" />

			<form:label>Password:</form:label>
			<form:input type="password" />
		</form:form>
	</div>
</body>
</html>