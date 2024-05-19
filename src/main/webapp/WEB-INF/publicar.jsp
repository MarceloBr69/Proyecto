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
			<div> <!-- Logo de la empresa -->
				  <img id="nameLogo" src="fotos/fellow.png" alt="nombre proyecto"/>
			</div>
			
	        <div>
		        <ul><!-- Direcciones-->
		        	<li><a href="/home">Inicio</a></li>
	                <li><a href="/eventos">Eventos</a></li>
	                <li><a href="/perfil">Perfil</a></li>
	                <li><a href="/logout">Logout</a></li>
	            </ul>
	        </div>
	        
		</div>
	</nav>
	
	<div class="container">
	
		<form:form modelAttribute="publicacion" action="/enviarPublicacion" method="POST" enctype="multipart/form-data">
			<h2>Crea una publicacion!</h2>
			<br>
			<form:label path="titulo">Nombre del evento:</form:label>
			<br>
			<form:input path="titulo" type="text" class="text_input"/>
			<form:errors path="titulo" cssClass="error"/>
			<br>
	        <form:label path="descripcion">Descripción:</form:label>
	        <br>
	        <form:textarea path="descripcion" placeholder="Escribe una descripcion..."/>
	        <form:errors path="descripcion" cssClass="error"/>
			<br>
	        <form:label path="fechaEvento">Fecha del evento: </form:label>
	        <form:input path="fechaEvento" type="date"/>
	        <form:errors path="fechaEvento" cssClass="error"/>
			<br>
			<form action="/enviarPublicacion" method="POST" enctype="multipart/form-data">
				<div>
					<label for="imagen">
						Imagen:
					</label>
					<input type="file" name="imagen" id="imagen"	>
				</div>		
				<button type="submit">Enviar</button>
			</form>
			<%--
	        <form:label path="subirFoto">Sube una foto (opcional):</form:label>
	        <form:input path="subirFoto" type="file" accept="image/png, image/jpg, image/jpeg" id="file" name="file"/>
	        <br>	       
	         --%>
			
		</form:form>   
		
		

		<div id="preview" class="styleImage"></div><!-- Este sera el div donde ira la imagen -->
	</div>
	
	<script src="../js/publicar.js"></script>
</body>
</html>