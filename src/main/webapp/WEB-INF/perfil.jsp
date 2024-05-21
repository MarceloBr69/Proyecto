<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<!--Este jsp mostrara informacion del usuario, dando la opcion de editar la informacion a traves de un boton-->
<!DOCTYPE html>
	<html>
	<head>
	    <meta charset="UTF-8">
	    <title><c:out value="${nombre}"/> <c:out value="${apellidos}"/> / Fellow </title>
	    <link rel="stylesheet" href="/css/perfil.css">

	</head>
	<body>
	
	<!-- barra de navegación, se repite en todos los jsp posteriores al login -->
	<nav>
			<div class="contenedorNav">
		
			<div>
				  <a href="/home"><img id="nameLogo" src="fotos/fellow.png" alt="nombre proyecto"/></a>
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
	        <img src="${usuario.imagenPerfil.rutaImagen}" alt="Foto de Perfil"/>
	    </c:if>
	</div>
	    <div class="seccionTop">
	        <div class="nombreCompleto">
	            <h1><c:out value="${nombre}"/> <c:out value="${apellidos}"/> </h1>
	        </div>
	        
	        <h3>Descripción</h3>
	        
	        <div id="descripcion">
	            <p><c:out value="${descripcion}">Aquí va la descripción</c:out></p>
	        </div>
	        <button onclick="window.location.href='/editarPerfil'">Editar Perfil</button>
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