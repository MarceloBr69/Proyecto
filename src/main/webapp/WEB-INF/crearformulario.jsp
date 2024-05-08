<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Crear</title>
</head>
<body>
	<h2>Nuevo POST!</h2>
	<div class="container">
		<form:form action="" method="POST">
<<<<<<< HEAD
		<form:label path="titulo">Título:</form:label>
		<form:input path="titulo" type="text"/>
		<br>
        <form:label>Descripción:</form:label>
        <form:textarea></textarea>
        <br>
        <form:label>Sube una foto(opcional)</form:label>
        <form:input type="file">
        <br>
		<button>Enviar</button>
	</form:form>
=======
			<form:label path="titulo">Titulo:</form:label>
			<form:input path="titulo" type="text"/>
			<br>
	        <form:label path="descripcion">Descripcion:</form:label>
	        <form:textarea path="descripcion" ></form:textarea>
	        <br>
	        <form:label path="subirFoto" >Sube una foto(opcional)</form:label>
	        <form:input path="subirFoto" type="file"></form:input>
	        <br>
			<button>Enviar</button>
		</form:form>
>>>>>>> 4fbf9d1903a18ff20c0e1f5e5c59bbe409d60d96
	</div>
</body>
</html>