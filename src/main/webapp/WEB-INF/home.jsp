<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
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
			<div class="contenedorNav">
		
			<div>
				  <img id="nameLogo" src="fotos/fellow.png" alt="nombre proyecto"/>
			</div>
			
	        <div>
		        <ul><!--Direcciones no fijas-->
	                <li><a href="/eventos">Eventos</a></li>
	                <li><a href="/publicar">Publicar</a></li>
	                <li><a href="/perfil">Perfil</a></li>
	                <li><a href="/logout">Logout</a></li>
	            </ul>
	        </div>
	        
		</div>
	</nav>
	<section class="container-funcion"> <!-- Contenedor del mapa y actividad reciente -->
		<div> <!--Aca se pone la foto del mapa como background-->
			<p>Bienvenido a Fellow, <c:out value="${nombre}"></c:out>!</p>
			<br>
			<p>En esta pestana podras acceder a distintos apartados, como ver los Post, Crear uno y/o ver tu Perfil.</p>
        	<br>
        	<div id="map"></div>
        	<br>
        	<p>Actualmente el mapa no se encuentra operando.</p>
    	     <!-- <div id="map"></div> En este div se invoca el mapa -->
	    </div>
	    <div class="actividad-reciente">
	    	<h2>Publicaciones recientes</h2>
			<div class="table-actividad-reciente">
				<table>
					<thead>
						<tr>
							<th>Título</th>
							<th>Publicado por</th>
							<th>Fecha</th>
							<th>Comuna</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="publicacion" items="${publicaciones}">
		                <tr>
		                    <td> <c:out value= "${publicacion.titulo}"></c:out></td>
		                    <td> <c:out value= "${publicacion.usuario.nombre}"></c:out></td>
		                    <td> <c:out value= "${publicacion.fechaEvento}"></c:out></td>
		                    <td>
		                    	<a href="#">Detalle</a>
		                    	<c:if test="${idUsuario == publicacion.usuario.id}">
		                    		<a href="#">Editar</a>
		                    		<a href="#">Eliminar</a>
		                    	</c:if>
		                    </td>
		                </tr>
		                </c:forEach>
		            </tbody>
				</table>
			</div>
	    	
	    	
	    	
	    	
	    </div>
	</section>

	
	
	
	
	
	
	
	
	
	<footer>
		<div class="derechos">
			<p>© 2024 Fellow. Todos los derechos reservados. Fellow y todos los títulos y logotipos relacionados son marcas comerciales de Fellow.</p>
		</div>
	</footer>
	<script src="../js/home.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBDaeWicvigtP9xPv919E-RNoxfvC-Hqik&callback=iniciarMapa"></script> <!-- Este scrpit invoca al mapa -->
</body>
</html>
