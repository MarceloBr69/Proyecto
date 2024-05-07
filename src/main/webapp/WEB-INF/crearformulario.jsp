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
		<form:label path="titulo">Titulo:</form:label>
		<form:input path="titulo" type="text"/>
		<br>
        <form:label>Decripcion:</label>
        <form:textarea></textarea>
        <br>
        <form:label>Sube una foto(opcional)</form:label>
        <form:input type="file">
        <br>
		<button>Enviar</button>
	</form:form>
	</div>
</body>
</html>