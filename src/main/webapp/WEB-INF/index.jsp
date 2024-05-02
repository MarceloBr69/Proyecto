<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
	<!--Div donde se muestra informacion de la aplicacion-->
	<div class="divProyecto">
		<h1>Proyecto</h1>
	</div>


	<div class="informacion">
		<p> Bienvenido a este proyecto informatico. En este buscamos ayudar a las comunidades del gran concepcion a mantenerse 
			comunicadas e informadas junto a sus respectivas
			comunas y/o municipalidades. En esta aplicacion podras encontrar funciones como: publicar post, para advertir y/o dar a conocer problematicas de la comuna,
			ver publicaciones y anuncios de las municipalidades, publicitar negocios particulares, entre otras cosas.
		</p>	
		<br>
		<p>
			Donde sera presentado como proyecto final para la titulacion del mismo. En un futuro nos gustaria presentar
			este proyecto a diversas municipalidades del Bio Bio, para permitir una mejor conexion con todos los vecinos de las comunas. 
		</p>
	</div>

	<!--Aca colocar logo-->




	<!--Div de formulario registro-->
	<div class="registo">
		<h2>Registro:</h2>
		<form:form action="/login" method="POST" modelAttribute="registerUser">
			<form:label path="nombre">Nombre:</form:label>
			<form:input type="text" path="nombre"/>

			<form:label path="apellido">Apellido:</form:label>
			<form:input type="text" path="apellido"/>

			<form:label path="email">Email:</form:label>
			<form:input path="email" type="text" />
			<!--Password-->
			<form:label path="password">Password:</form:label>
			<form:input path="password" type="password" />
			<!-- Confirmar password-->
			<form:label path="passwordConfirmar">Confirmar password:</form:label>
			<form:input path="passwordConfirmar" type="password" />

			<!--Seleccion de municipalidad-->
			<form:label path="municiaplidad">Selecciona tu municipalidad</form:label>
			<form:select path="municiaplidad">
				<form:option value="1">Municiaplidad de Concepción</form:option>
				<form:option value="2">Municiaplidad de Lota</form:option>
				<form:option value="3">Municiaplidad de Hualpén</form:option>
			</form:select>
		</form:form>
	</div>
	<!--Div de formulario Login-->
	<div class="login">
		<h2>Login</h2>
		<form:form action="/login" method="POST" modelAttribute="loginUser">
			<!--Email-->
			<form:label path="emailLogin">Email:</form:label>
			<form:input path="emailLogin" type="text" />
			<!--Password-->
			<form:label path="passwordLogin">Password:</form:label>
			<form:input  path="passwordLogin" type="password" />
		</form:form>
	</div>
</body>
</html>