package com.modelos;

import jakarta.validation.constraints.Size;

public class LoginUsuario {
	
	@Size(min=2, message="Proporciona tu correo")
	private String correoLogin;
	
	@Size(min=2, message="Proporciona tu contraseña")
	private String contraseñaLogin;
	
	public LoginUsuario() {}

	public String getCorreoLogin() {
		return correoLogin;
	}

	public void setCorreoLogin(String correoLogin) {
		this.correoLogin = correoLogin;
	}

	public String getContraseñaLogin() {
		return contraseñaLogin;
	}

	public void setContraseñaLogin(String contraseñaLogin) {
		this.contraseñaLogin = contraseñaLogin;
	}


	
}
