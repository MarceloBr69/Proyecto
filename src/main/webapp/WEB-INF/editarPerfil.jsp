<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Perfil</title>
    <link rel="stylesheet" href="/css/perfil.css">
</head>
<body>

<nav>
    <div class="contenedorNav">
        <div>
            <a href="/home"><img id="nameLogo" src="fotos/fellow.png" alt="Fellow"/></a>
        </div>
        <div>
            <ul>
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
		
	    
	<form:form action="/guardarPerfil" method="post" modelAttribute="usuario" enctype="multipart/form-data">
        <div class="nombreCompleto">
            <h1><c:out value="${nombre}"/> <c:out value="${apellidos}"/> </h1>
        </div>
        <h3>Descripción</h3>
		<div class="nombreCompleto">
		    <label for="descripcion"></label>
		    <form:textarea path="descripcion" id="descripcion"/>
		</div>
		<div class="nombreCompleto">
		    <label for="fotoPerfilArchivo">Foto de Perfil:</label>
		    <input type="file" name="fotoPerfilArchivo" id="fotoPerfilArchivo"/>
		</div>
		<button type="submit">Guardar</button>
	</form:form>
	
    </div>
</div>
</body>
</html>
