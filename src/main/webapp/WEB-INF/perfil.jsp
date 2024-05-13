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
		</head>
	<body>
	
	<!-- barra de navegación, se repite en todos los jsp posteriores al login -->
	<nav>
			<div class="name-logo">
	            <!--Logo img-->
	            <h3>Menu</h3>
	        </div>
	        <div>
	            <ul><!--Direcciones no fijas-->
	            	<li><a href="/home">Inicio</a></li>
	                <li><a href="https://www.youtube.com/watch?v=xvFZjo5PgG0&ab_channel=Duran">Post</a></li>
	                <li><a href="https://www.youtube.com/watch?v=xvFZjo5PgG0&ab_channel=Duran">Ver</a></li>
	                <li><a href="/crear">Crear</a></li>
	                <li><a href="/perfil">Perfil</a></li>
	                <li><a href="/logout">Logout</a></li>
	            </ul>
	            
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
				
				<p>Descripción biografía yapayapayayappningggg
				Lorem ipsum dolor sit, amet consectetur adipisicing elit. Numquam consequatur doloremque nisi ratione eum, magni hic similique neque impedit delectus
			 asperiores enim, itaque veniam nulla accusantium minus 
			 tenetur commodi ut! </p>
				
					
			<form:form action="/editar" method="POST">
	        	<button>Editar</button>
	   		</form:form>
		
				
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
	    
	    <%-- 
	    <!--Tabla donde se muestran los datos del usuario-->
	    <table>
	        <tr>
	            <th>
	                Nombre:
	            </th>
	            <th>
	                Apellidos:
	            </th>
	            <th>
	                Email:
	            </th>
	            <th>
	                Municipalidad:
	            </th>
	        </tr>
	        <tr>
	            <td>
	                <c:forEach value="${nombre}"/>
	            </td>
	            <td>
	                <c:forEach value="${apellidos}"/>
	            </td>
	            <td>
	                <c:forEach value="${correo}"/>
	            </td>
	            <td>
	                <c:forEach value="${municipalidadId}"/>
	            </td>
	        </tr>
	    </table>
	--%>
	
	
		
	    
	</body>
