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
                <ul>
                    <li><a href="/eventos">Eventos</a></li>
                    <li><a href="/publicar">Publicar</a></li>
                    <li><a href="/perfil">Perfil</a></li>
                    <li><a href="/logout">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <section class="container-funcion">
        <div>
            <p>Bienvenido a Fellow, <c:out value="${nombre}"></c:out>!</p>
            <br>
            <p>En esta pestaña podrás acceder a distintos apartados, como ver los Post, Crear uno y/o ver tu Perfil.</p>
            <br>
            <div id="map"></div>
            <br>
            <p>Actualmente el mapa no se encuentra operando.</p>
        </div>
        <div class="actividad-reciente">
            <h2>Publicaciones recientes</h2>
            <div class="table-actividad-reciente">
                <table>
                    <thead>
                        <tr>
                            <th>Título</th>
                            <th>Publicado por</th>
                            <th>Fecha del evento</th>
                            <th>Tiempo transcurrido</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="publicacion" items="${publicaciones}" varStatus="status">
                            <tr>
                                <td><c:out value="${publicacion.titulo}"></c:out></td>
                                <td><c:out value="${publicacion.usuario.nombre}"></c:out></td>
                                <td><c:out value="${fechasFormateadas[status.index]}"></c:out></td>
                                <td><c:out value="${tiemposTranscurridos[status.index]}"></c:out></td>
                                <td>
                                    <a href="/home/detalle">Detalle</a>
                                    <c:if test="${idUsuario == publicacion.usuario.id}">
                                        <form action="/home/eliminar/${publicacion.id}" method="GET">
                                        	<input type="hidden" name="_method" value="DELETE"/>
                                        	<button>Eliminar</button>
                                        </form>
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
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBDaeWicvigtP9xPv919E-RNoxfvC-Hqik&callback=iniciarMapa"></script>
</body>
</html>
