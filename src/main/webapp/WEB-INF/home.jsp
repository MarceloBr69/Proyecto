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
			<div class="contenedorNav">
		
			<div>
				  <img id="nameLogo" src="fotos/fellow.png" alt="nombre proyecto"/>
			</div>
			
	        <div>
	              <ul><!--Direcciones no fijas-->
                <li><a href="https://www.youtube.com/watch?v=xvFZjo5PgG0&ab_channel=Duran">Post</a></li>
                <li><a href="https://www.youtube.com/watch?v=xvFZjo5PgG0&ab_channel=Duran">Eventos</a></li>
                <li><a href="/crear">Crear</a></li>
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
			<p>En esta pestana podras acceder a distintos apartados, como ver los Post, Crear uno, ver tu Perfil.</p>
        	<br>
        	<div id="map"></div>
        	<br>
        	<p>Actualmente el mapa no se encuentra operando.</p>
    	     <!-- <div id="map"></div> En este div se invoca el mapa -->
	    </div>
	    <div class="actividad-reciente">
	    	<h2>Actividad reciente</h2>
	    	<div>
	    		<p class="post-actividad-reciente"><c:out value="${nombre}"/> |</p>
	    	</div>
	    	<div>
	    		<p><c:out value="${titulo}"/></p>
	    	</div>
			
	    	
	    	
	    	
	    	
	    </div>
	</section>

	
	
	
	
	
	
	
	
	
	<footer>
		<div class="derechos">
			<p>© 2024 Fellow. Todos los derechos reservados. Fellow© 2024. Fellow y todos los títulos y logotipos relacionados son marcas comerciales de Fellow.</p>
		</div>
	</footer>
	
	
	<script src="../js/home.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBDaeWicvigtP9xPv919E-RNoxfvC-Hqik&callback=iniciarMapa"></script>--> <!-- Este scrpit invoca al mapa -->


</body>
</html>
