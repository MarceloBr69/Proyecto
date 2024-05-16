<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<!--Este jsp mostrara los post creados con anterioridad-->
<!DOCTYPE html>
<html>
	<head>	
		<meta lang="es">
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <link rel="stylesheet" href="/css/eventos.css">
	<title>Eventos</title>
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
		                <li><a href="/publicar">Publicar</a></li>
		                <li><a href="/perfil">Perfil</a></li>
		                <li><a href="/logout">Logout</a></li>
		            </ul>
		        </div>
		        
			</div>
		</nav>
		
		
	    <h1>Eventos cercanos</h1>
	    
	   <div class="contenedorPublicaciones">
	   		<c:forEach var="publicacion" items="${publicaciones}">
	            <div class="contenedorIndividual">
	                <h3> <c:out value="${publicacion.titulo}"/> </h3>
	                <p> <c:out value="${publicacion.descripcion}"/> </p>
	                <div>
	                    <p> imagen </p>
	                </div>
	            </div>
            </c:forEach>
	    </div>
	    
	    <footer>
		<div class="derechos">
			<p>© 2024 Fellow. Todos los derechos reservados.</p>
		</div>
	</footer>
	    
	</body>
</html>
