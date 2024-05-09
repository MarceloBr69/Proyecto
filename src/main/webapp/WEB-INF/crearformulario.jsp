<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<!--Este jsp sirve para crear un post, conta con el formulario para ello-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Crear</title>
</head>
<body>
	<h2>Nuevo POST!</h2>
	<div class="container">
		<form:form modelAttribute="publicacion" action="/enviarPublicacion" method="POST">
			<form:label path="titulo">Título:</form:label>
			<form:input path="titulo" type="text"/>
			<br>
	        <form:label  path="descripcion">Descripción:</form:label>
	        <form:textarea path="descripcion"></form:textarea>
	        <br>
	        <form:label path="subirFoto">Sube una foto(opcional)</form:label>
	        <form:input path="subirFoto" type="file" accept="image/png, image/jpg, image/jpeg"/>
	        <br>
			<button>Enviar</button>
		</form:form>
	</div>
</body>
</html>