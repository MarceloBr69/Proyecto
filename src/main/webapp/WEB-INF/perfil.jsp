<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<!--Este jsp mostrara informacion del usuario, dando la opcion de editar la informacion a traves de un boton-->
<!DOCTYPE html>
	<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Perfil</title>
	    <link rel="stylesheet" href="/css/perfil.css">
	    <script>
	        function enableEditing() {
	            var desc = document.getElementById("descripcion");
	            var editBtn = document.getElementById("editBtn");
	            var saveBtn = document.getElementById("saveBtn");
	
	            desc.contentEditable = true;
	            desc.focus();
	            editBtn.style.display = "none";
	            saveBtn.style.display = "inline";
	        }
	
	        function saveDescription() {
	            var desc = document.getElementById("descripcion");
	            var editBtn = document.getElementById("editBtn");
	            var saveBtn = document.getElementById("saveBtn");
	
	            // Here you would typically make an AJAX call to save the data to the server.
	            // For simplicity, we'll just make it non-editable and switch buttons.
	
	            desc.contentEditable = false;
	            editBtn.style.display = "inline";
	            saveBtn.style.display = "none";
	
	            // Example AJAX call (using fetch API):
	            fetch('/saveDescription', {
	                method: 'POST',
	                headers: {
	                    'Content-Type': 'application/json'
	                },
	                body: JSON.stringify({ description: desc.innerText })
	            }).then(response => {
	                if (response.ok) {
	                    console.log("Description saved successfully");
	                } else {
	                    console.error("Failed to save description");
	                }
	            }).catch(error => console.error('Error:', error));
	        }
	    </script>
	</head>
	<body>
	
	<!-- barra de navegación, se repite en todos los jsp posteriores al login -->
	<nav>
			<div class="contenedorNav">
		
			<div>
				  <img id="nameLogo" src="fotos/fellow.png" alt="nombre proyecto"/>
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
