<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<!DOCTYPE html>
<html>
<head>
	<meta lang="es">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="/css/home.css">
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
                <li><a href="/crear">Crear</a></li>
                <li><a href="/perfil">Perfil</a></li>
                <li><a href="/logout">Logout</a></li>
            </ul>
            
        </div>
	</nav>
	<div class="container">
        <div class="image">
        
             <h3>¡Hola <c:out value="${nombre}"></c:out>!</h3>
        
        <!--Aca se pone la foto como background-->
        <%--
            <div>
                <form:form action="/buscar">
                    <form:input path="buscar" type="text" placeholder="Buscar..."></form:input>
                </form:form>
            </div>
            
         --%>
        </div>
	</div>
	<div>
		<h2>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Numquam consequatur doloremque nisi ratione eum, magni hic similique neque impedit delectus asperiores enim, itaque veniam nulla accusantium minus tenetur commodi ut!</h2>
	</div>
</body>
</html>
