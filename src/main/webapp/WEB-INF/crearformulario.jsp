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
	<form:form action="" method="POST">
		<form:label path="titulo">Titulo:</form:label>
		<form:input path="titulo" type="text"/>
		
		<form:label path="descripcion">Descripcion:</form:label>
		<form:textarea path="titulo" rows="5" cols="33"/>
		
		<form:label path="foto">Sube una foto:</form:label>
		<form:input type="file" path="foto"/>
		
		<button>Enviar</button>
	</form:form>
</body>
</html>