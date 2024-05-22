<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta charset="ISO-8859-1">
		<title>Perfil / Fellow</title>
		<link rel="stylesheet" href="/css/perfil.css">
	</head>
	
	<body>
		<nav>
			<div class="contenedorNav">
		
			<div>
				   <a href="/home"><img id="nameLogo" src="fotos/fellow.png" alt="Fellow"/></a>
			</div>
			
	        <div>
		        <ul><!--Direcciones no fijas-->
		        	<li><a href="/home">Inicio</a></li>
	                <li><a href="/eventos">Eventos</a></li>
	                <li><a href="/publicar">Publicar</a></li>
	                <li><a href="/logout">Logout</a></li>
	            </ul>
	        </div>
	        
		</div>
	</nav>
		
	<div class="top">
	    <div class="fotoPerfil">
		    <c:if test="${usuario.imagenPerfil != null}">
		        <img src="/imagenes/${usuario.imagenPerfil.nombre}" alt="Foto de Perfil"/>
		    </c:if>
	    </div>
	    <div class="seccionTop">
	        <div class="nombreCompleto">
	            <h1><c:out value="${usuarioId.nombre}"/> <c:out value="${usuarioId.apellidos}"/> </h1> <!-- hacer que aparescan en un mismo reglon pls -->
	        </div>
	        
	        <h3>Descripción</h3>
	        
	        <div id="descripcion">
	            <c:out value="${usuarioId.descripcion}"/>
	        </div>
	    </div>
</div>
			
		
	
	
		<div class="historialActividad">
		
		  <h2 id="actividad">Actividad Reciente</h2>
		  
		 <div class="publicaciones">
	        <c:forEach var="publicacion" items="${publicaciones}">
	            <div class="publicacion">
	                <h3>
		                <a href="/home/detalle/${publicacion.id}"><c:out value="${publicacion.titulo}"/></a>
		                
	                </h3>
					<p><c:out value="${publicacion.descripcion}"/></p>
	                <p>Fecha: <c:out value="${publicacion.fechaEvento}"/></p>
	            </div>
	        </c:forEach>
	    </div>

		</div>
	
	</body>
</html>