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
		<div class="name-logo">
            <!--Logo img-->
            <h3>Menu</h3>
        </div>
        <div>
            <ul><!--Direcciones no fijas-->
                <li><a href="https://www.youtube.com/watch?v=xvFZjo5PgG0&ab_channel=Duran">Post</a></li>
                <li><a href="https://www.youtube.com/watch?v=xvFZjo5PgG0&ab_channel=Duran">Ver</a></li>
                <li><a href="https://www.youtube.com/watch?v=xvFZjo5PgG0&ab_channel=Duran">Crear</a></li>
                <li><a href="https://www.youtube.com/watch?v=xvFZjo5PgG0&ab_channel=Duran">Perfil</a></li>
                <li><a href="https://www.youtube.com/watch?v=xvFZjo5PgG0&ab_channel=Duran">Logout</a></li>
            </ul>
        </div>
	</nav>
	<div class="container">
        <div class="image"><!--Aca se pone la foto como background-->
            <div>
                <form:form action="/buscar">
                    <form:input type="text" placeholder="Buscar...">
                </form:form>
            </div>
        </div>
	</div>
</body>
</html>
