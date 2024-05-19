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
                <img id="nameLogo" src="fotos/fellow.png" alt="nombre proyecto"/>
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
        <h2>Detalles de la Publicación</h2>
        <div class="detalle-publicacion">
            <p><strong>Título:</strong> <c:out value="${publicacion.titulo}"/></p>
            <p><strong>Descripción:</strong> <c:out value="${publicacion.descripcion}"/></p>
            <p><strong>Publicado por:</strong> <c:out value="${publicacion.usuario.nombre}"/></p>
            <p><strong>Fecha del evento:</strong> <c:out value="${fechaFormateada}"/></p>
            <p><strong>Tiempo transcurrido:</strong> <c:out value="${tiempoTranscurrido}"/></p>
            <c:if test="${publicacion.subirFoto != null}">
                <p><strong>Foto:</strong></p>
                <img src="/fotos/${publicacion.subirFoto}" alt="Foto de la publicación"/>
            </c:if>
        </div>
    </section>
    <footer>
        <div class="derechos">
            <p>© 2024 Fellow. Todos los derechos reservados. Fellow y todos los títulos y logotipos relacionados son marcas comerciales de Fellow.</p>
        </div>
    </footer>
    <script src="../js/detallePublicacion.js"></script>
</body>
</html>
