<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<!--Este jsp mostrara informacion del usuario, dando la opcion de editar la informacion a traves de un boton-->
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Crear</title>
</head>
<body>
    <h2>Datos:</h2>
    <br>
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

    <br>
    <form:form action="" method="POST">
        <button>Editar</button>
    </form:form>
</body>
