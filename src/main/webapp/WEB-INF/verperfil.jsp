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
		<link rel="stylesheet" href="/css/verperfil.css">
	</head>
	
	<body>
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
	        <!-- aqui va a ir la foto de perfil -->
	    </div>
	    <div class="seccionTop">
	        <div class="nombreCompleto">
	            <h1><c:out value="${nombre}"/> <c:out value="${apellidos}"/> </h1>
	        </div>
	        
	        <h3>Descripción</h3>
	        
	        <div id="descripcion">
	            <c:out value="${descripcion}"/>
	        </div>
	        <button id="editBtn" onclick="enableEditing()">Editar</button>
	        <button id="saveBtn" style="display: none;" onclick="saveDescription()">Guardar</button>
	    </div>
</div>
			
		
	
	
		<div class="historialActividad">
		
		  <h2 id="actividad">Actividad Reciente</h2>
		  
		 <div class="publicaciones">
		 	<p><c:out value="${descripcion}"/>
			Lorem ipsum dolor sit, amet consectetur adipisicing elit. Numquam consequatur doloremque nisi ratione eum, magni hic similique neque impedit delectus
			 asperiores enim, itaque veniam nulla accusantium minus 
			 tenetur commodi ut!</p>
			 
			 	<p><c:out value="${descripcion}"/>
			Lorem ipsum dolor sit, amet consectetur adipisicing elit. Numquam consequatur doloremque nisi ratione eum, magni hic similique neque impedit delectus
			 asperiores enim, itaque veniam nulla accusantium minus 
			 tenetur commodi ut!</p>
			 
			 	<p><c:out value="${descripcion}"/>
			Lorem ipsum dolor sit, amet consectetur adipisicing elit. Numquam consequatur doloremque nisi ratione eum, magni hic similique neque impedit delectus
			 asperiores enim, itaque veniam nulla accusantium minus 
			 tenetur commodi ut!</p>
			 
			 	<p><c:out value="${descripcion}"/>
			Lorem ipsum dolor sit, amet consectetur adipisicing elit. Numquam consequatur doloremque nisi ratione eum, magni hic similique neque impedit delectus
			 asperiores enim, itaque veniam nulla accusantium minus 
			 tenetur commodi ut!</p>
			
		 </div> 

		</div>
	
	</body>
</html>