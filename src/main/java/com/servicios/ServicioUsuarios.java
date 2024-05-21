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
	private RepositorioUsuarios repositorioUsuario;
	
	public Usuario registrarUsuario(Usuario nuevoUsuario) {
		String contraseñaEncriptada = BCrypt.hashpw(nuevoUsuario.getContraseña(), BCrypt.gensalt());
		nuevoUsuario.setContraseña(contraseñaEncriptada);
		return this.repositorioUsuario.save(nuevoUsuario);
	}
	
	public BindingResult validarRegistro(BindingResult resultado, Usuario nuevoUsuario) {
		if(! nuevoUsuario.getContraseña().equals(nuevoUsuario.getConfirmarContraseña())) {
			resultado.rejectValue("confirmarContraseña", "Matches", "Las contraseñas no coinciden");
		}
		Usuario usuarioExistente = this.repositorioUsuario.getByCorreo(nuevoUsuario.getCorreo());
		if(usuarioExistente != null) {
			resultado.rejectValue("correo", "Unique", "Este correo ya está registrado");
		}
		return resultado;
	}
	
	public BindingResult validarLogin(BindingResult resultado, LoginUsuario loginUsuario) {
		Usuario usuarioExistente = this.repositorioUsuario.getByCorreo(loginUsuario.getCorreoLogin());
		if(usuarioExistente == null) {
			resultado.rejectValue("correoLogin", "Matches", "Credenciales incorrectas");
			return resultado;
		}
		
		if(! BCrypt.checkpw(loginUsuario.getContraseñaLogin(), usuarioExistente.getContraseña())) {
			resultado.rejectValue("correoLogin", "Matches", "Credenciales incorrectas");
		}
		
		return resultado;
	}
	

	
	public Usuario selectPorCorreo(String correo) {
		return this.repositorioUsuario.getByCorreo(correo);
	}
	
	public Usuario selectPorId(Long id) {
		return this.repositorioUsuario.getById(id);
	}
	
	public void actualizarUsuario(Usuario usuario) {
	    	repositorioUsuario.save(usuario);
    }  
	
	
	
	
	
}











