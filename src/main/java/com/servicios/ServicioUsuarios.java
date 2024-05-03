package com.servicios;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.modelos.LoginUsuario;
import com.modelos.Usuario;
import com.repositorios.RepositorioUsuarios;

@Service
public class ServicioUsuarios {
	
	@Autowired
	private RepositorioUsuarios repositorioUsuarios;
	
	//Comprueba que las contraseñas coincidan y que el correo no esté en uso
	public BindingResult validarRegistro(BindingResult resultado, Usuario nuevoUsuario) {
		if(! nuevoUsuario.getPassword().equals(nuevoUsuario.getPasswordConfirmar())) {
			resultado.rejectValue("confirmacionContraseña", "Matches", "Las contraseñas no coinciden");
		}
		Usuario usuarioExistente = this.repositorioUsuarios.getByEmail(nuevoUsuario.getEmail());
		if(usuarioExistente != null) {
			resultado.rejectValue("email", "Unique", "Este correo ya está en uso");
		}
		
		return resultado;
	}
	
	//Crea un nuevo usuario
	public Usuario insertarUsuario(Usuario nuevoUsuario) {
		String contraseñaEncriptada = BCrypt.hashpw(nuevoUsuario.getPassword(), BCrypt.gensalt());
		nuevoUsuario.setPassword(contraseñaEncriptada);
		return this.repositorioUsuarios.save(nuevoUsuario);
	}
	
	//Valida el login, comparando con lo que existe en la base de datos
	public BindingResult validarLogin(BindingResult resultado, LoginUsuario loginUsuario) {
		Usuario usuarioExistente = this.repositorioUsuarios.getByEmail(loginUsuario.getEmailLogin());
		if(usuarioExistente == null) {
			resultado.rejectValue("emailLogin", "Matches", "Credenciales incorrectas");
			return resultado;
		}
		
	
		if(! BCrypt.checkpw(loginUsuario.getPasswordLogin(), usuarioExistente.getPassword())) {
			resultado.rejectValue("emailLogin", "Matches", "Credenciales incorrectas");

		}
		return resultado;
	}
	
	public Usuario selectPorCorreo(String email) {
		return this.repositorioUsuarios.getByEmail(email);
		
	}
	
	public Usuario selectPorId(Long id) {
		return this.repositorioUsuarios.getById(id);
	}
}
