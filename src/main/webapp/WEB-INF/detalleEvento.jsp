<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
    <meta lang="es">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="/css/detalleEventos.css">
    <title>Detalles de la Publicación</title>
</head>
<body>
    <nav>
        <div class="contenedorNav">
            <div>
                <a href="/home"><img id="nameLogo" src="/fotos/fellow.png" alt="Fellow"/></a>
            </div>
            <div>
                <ul>
                    <li><a href="/home">Inicio</a></li>
                    <li><a href="/publicar">Publicar</a></li>
                    <li><a href="/perfil">Perfil</a></li>
                    <li><a href="/logout">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <section class="container-detalle">
    
        <h2><c:out value="${publicacion.titulo}"/></h2>
        
        <div id="detalle-publicacion">
        
        <div class="detalle-publicacion">
         
            <p> <c:out value="${publicacion.descripcion}"/></p>
            
            <br>
            
            <p><strong>Publicado por:</strong> <a class= "nombreCreador" href="/verperfil/${publicacion.usuario.id}"><c:out value="${publicacion.usuario.nombre}"/></a></p>
            <p><strong>Fecha del evento:</strong> <c:out value="${fechaFormateada}"/></p>
            <p><strong>Tiempo transcurrido:</strong> <c:out value="${tiempoTranscurrido}"/></p>
            
            <c:if test="${publicacion.usuario.id == idUsuario}">
            	<a href="/home/editar/${publicacion.id}"> editar evento</a>
            </c:if>
            
            

        </div>
        
        <div class="fotoPublicacion">
        	
        	<c:if test="${publicacion.imagen != null}">
			    <img src="/imagenes/${publicacion.imagen.nombre}" alt="Imagen de ${publicacion.titulo}" class="fotoEvento"/>
			</c:if>
        </div>
        
        </div>
        
        
        
    </section>
    <footer>
        <div class="derechos">
            <p>© 2024 Fellow. Todos los derechos reservados. </p>
        </div>
    </footer>
    <script src="../js/detallePublicacion.js"></script>
</body>
</html>
