<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Proyecto</title>
</head>
<body>
	<nav>
		<ul><!--Direcciones no fijas-->
			<li><a href="https://www.youtube.com/watch?v=xvFZjo5PgG0&ab_channel=Duran">Post</a></li>
			<li><a href="https://www.youtube.com/watch?v=xvFZjo5PgG0&ab_channel=Duran">Ver</a></li>
			<li><a href="https://www.youtube.com/watch?v=xvFZjo5PgG0&ab_channel=Duran">Crear</a></li>
			<li><a href="https://www.youtube.com/watch?v=xvFZjo5PgG0&ab_channel=Duran">Perfil</a></li>
			<li><a href="https://www.youtube.com/watch?v=xvFZjo5PgG0&ab_channel=Duran">Logout</a></li>
		</ul>
	</nav>
	<div class="map">
		<!--Imagen de fondo, un mapa-->
		<!--Boton de crear post-->
		<form action="crear/post" method="POST">
			<button>Crear post</button>
		</form>
	</div>
</body>
</html>
