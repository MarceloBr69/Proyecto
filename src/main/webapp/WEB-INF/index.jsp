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
	    <link rel="stylesheet" href="/css/index.css">
		<title>FELLOW</title>
		
		<!-- Validar formato de RUT y correo -->
		<script src="/js/script.js"></script>
		<script>
			function validarRegistro() {
			    var rutInput = document.getElementById('rut').value;
			    var correoInput = document.getElementById('correo').value;
			    var contraseña = document.getElementById('contraseña').value;
			    var confirmarContraseña = document.getElementById('confirmarContraseña').value;
	
			    if (!validarRut(rutInput)) {
			        alert('Formato de RUT inválido');
			        return false; 
			    }
			    
			    if (!validarCorreo(correoInput)) {
			        alert('Formato de correo electrónico inválido');
			        return false; 
			    }
				    
			    if (contraseña != confirmarContraseña) {
			        alert("Contraseñas no coinciden");
			        return false; 
			    }

			    return true;
			}
			
			function validarLogin() {
				var correoLogin = document.getElementById('correoLogin').value;
				
				
				if (!validarCorreo(correoLogin)) {
					alert("Formato de Correo inválido");
					return false;
				}
				return true;
			}
    	</script>
    	
	</head>
	
	<body>
		<!--Barra de navegacion-->
		<nav>
		<div class="contenedorNav"> 
			
			<div>
				  <img id="nameLogo" src="fotos/fellow.png" alt="nombre proyecto"/>
			</div>
				
			<div>
				<ul>
					<li><a href='#registro'>Registro</a></li>
					<li><a href='#login'>Iniciar sesión</a></li>
				</ul>	
			</div>

		</div>
	</nav>
	
		<!--Div donde se muestra informacion de la aplicacion-->
		<div class="divProyecto">
		
			<img id="logo" src="fotos/logoblanco.png" alt="logo en blanco"/>
			
			<h1>FELLOW</h1>
		</div>
	
		<!--Div donde se muestra la informacion-->
		<div class="informacion">
			
			<h2> Descubre, comparte y conecta </h2>
			
			<h5> Bienvenid@ a FELLOW, únete a nuestra comunidad para descubrir y compartir todo lo que ocurra
			a tus alrededores. No te pierdas de nada, aprovecha las oportunidades y eventos en tu cercanía, conoce
			las novedades y acércate a tus vecinos.
			</h5>	
			<p>
				¡Conviértete en un Good Fellow!
			</p>
			<form action="/home" class="boton_ver">
				<button class="ver_publicaciones">Revisa los últimos eventos</button>
			</form>
			
		</div>
	
		<!--Aca colocar logo-->
	
	
	<!--Div contenedor de formularios-->
		<div class="formulario">
		
			<!--Div de formulario registro-->
		<div id="registro">
			<h2>Registrarse</h2>
			
			
				<form:form modelAttribute="usuario" action="/registro" method="POST" onsubmit="return validarRegistro()">
					<!--Nombres-->
					<form:label path="nombre" for="nombre">Nombres:</form:label>
					<form:input path="nombre" id="nombre" name="nombre" type="text"/>
					<form:errors path="nombre"/>
					<!--Apellido-->
					<form:label path="apellidos" for="apellidos">Apellidos:</form:label>
					<form:input path="apellidos" id="apellidos" name="apellidos" type="text"/>
					<form:errors path="apellidos"/>
					<!--Rut-->
					<form:label path="rut" for="rut">RUT:</form:label>
					<form:input path="rut" id="rut" name="rut" type="text"/>
					<form:errors path="rut"/>
					<!-- Correo -->
					<form:label path="correo" for="correo">Correo:</form:label>
					<form:input path="correo" id="correo" name="correo" type="text"/>
					<form:errors path="correo"/>
					<!--Contraseña-->
					<form:label path="contraseña" for="contraseña">Contraseña:</form:label>
					<form:input path="contraseña" id="contraseña" name="contraseña" type="password"/>
					<form:errors path="contraseña"/>
					<!-- Confirmar password-->
					<form:label path="confirmarContraseña" for="confirmarContraseña">Confirmar Contraseña:</form:label>
					<form:input path="confirmarContraseña" id="confirmarContraseña" name="confirmarContraseña" type="password"/>
					<form:errors path="confirmarContraseña"/>
		
					<!--Seleccion de municipalidad-->
					<form:label path="municipalidadId">Selecciona tu comuna</form:label>
					<form:select path="municipalidadId">
						<form:option value="1">Concepción</form:option>
						<form:option value="2">Lota</form:option>
						<form:option value="3">Hualpén</form:option>
						<form:option value="4">Chiguayante</form:option>
						<form:option value="5">San Pedro de la Paz</form:option>
						<form:option value="6">Talcahuano</form:option>
						<form:option value="7">Penco</form:option>
						<form:option value="8">Tomé</form:option>
						<form:option value="9">Coronel</form:option>
						<form:option value="10">Hualqui</form:option>
						
					</form:select>
					<br>
					<button>Confirmar registro</button>
				</form:form> 
			 
		</div>
		<!--Div de formulario Login-->
		<div id="login">
			<h2>Iniciar sesión</h2>
			
				<form:form action="/login" method="POST" modelAttribute="loginUsuario" onsubmit="return validarLogin()">
					<!-- Correo -->
					<form:label path="correoLogin" for="correoLogin">Correo:</form:label>
					<form:input path="correoLogin" id="correoLogin" name="correoLogin" type="text"/>
					<form:errors path="correoLogin"/>
					<!--Contraseña-->
					<form:label path="contraseñaLogin" for="contraseñaLogin">Contraseña:</form:label>
					<form:input path="contraseñaLogin" id="contraseñaLogin" name="contraseñaLogin" type="password"/>
					<form:errors path="contraseñaLogin"/>
					<br>
					<button>Iniciar sesión</button>
				</form:form>
			 
		</div>
		
		</div>
		

	</body>
</html>