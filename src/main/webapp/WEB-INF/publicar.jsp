<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<!--Este jsp sirve para crear un post, conta con el formulario para ello-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/publicar.css">
<title>Crear Post</title>
</head>
<body>
	<nav>
			<div class="contenedorNav">
		
			<div>
				  <img id="nameLogo" src="fotos/fellow.png" alt="nombre proyecto"/>
			</div>
			
	        <div>
		        <ul><!--Direcciones no fijas-->
		        	<li><a href="/home">Inicio</a></li>
	                <li><a href="/eventos">Eventos</a></li>
	                <li><a href="/perfil">Perfil</a></li>
	                <li><a href="/logout">Logout</a></li>
	            </ul>
	        </div>
	        
		</div>
	</nav>
	<h2>Nuevo POST!</h2>
	<div class="container">
		<form:form modelAttribute="publicacion" action="/enviarPublicacion" method="POST">
			<form:label path="titulo">Título del evento:</form:label>
			<form:input path="titulo" type="text"/>
			<form:errors path="titulo" cssClass="error"/>
			<br>
			<br>
	        <form:label path="descripcion">Descripción:</form:label>
	        <form:textarea path="descripcion" cols="50"/>
	        <form:errors path="descripcion" cssClass="error"/>
			<br>
			<br>
	        <form:label path="fechaEvento">Fecha del evento: </form:label>
	        <form:input path="fechaEvento" type="date"/>
	        <form:errors path="fechaEvento" cssClass="error"/>
			<br>
			<br>
	        <form:label path="subirFoto">Sube una foto (opcional):</form:label>
	        <form:input path="subirFoto" type="file" accept="image/png, image/jpg, image/jpeg"/>
	        <br>
	        <br>		
			<button type="submit">Enviar</button>
		</form:form>
	</div>
	<div> <!-- La finalidad de este div es crear un recuadro izquierdo, donde se mostrara de forma de exposicion la imagen cargada. -->
		
	</div>
</body>
</html>