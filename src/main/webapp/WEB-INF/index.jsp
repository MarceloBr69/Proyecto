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
	<!--Div donde se genera registro-->
	<h1>Bienvenidos a</h1>
	<div>
		<h1>Registro:</h1>
		<form:form action="/login" method="POST" modelAttribute="registerUser">
			<form:label path="nombre">Nombre:</form:label>
			<form:input type="text" path="nombre"/>

			<form:label path="apellido">Apellido:</form:label>
			<form:input type="text" path="apellido"/>

			<form:label path="email">Email:</form:label>
			<form:input path="email" type="text" />

			<form:label path="password">Password:</form:label>
			<form:input path="password" type="password" />

			<form:label path="passwordConfirmar">Confirmar password:</form:label>
			<form:input path="passwordConfirmar" type="password" />
		</form:form>
	</div>
	<!--Div donde se genera el login-->
	<div>
		<h1>Login</h1>
		<form:form action="/login" method="POST" modelAttribute="loginUser">
			<form:label path="emailLogin">Email:</form:label>
			<form:input path="emailLogin" type="text" />

			<form:label path="passwordLogin">Password:</form:label>
			<form:input  path="passwordLogin" type="password" />
		</form:form>
	</div>
</body>
</html>