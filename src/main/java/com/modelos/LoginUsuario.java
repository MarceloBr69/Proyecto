package com.modelos;

import jakarta.validation.constraints.Size;

public class LoginUsuario {

	
	@Size(min=1, message="Por favor, proporciona tu correo")
	private String emailLogin;
	
	@Size(min=1, message="Por favor, proporciona tu correo")
	private String passwordLogin;
	
	public String getEmailLogin() {
		return emailLogin;
	}

	public void setEmailLogin(String emailLogin) {
		this.emailLogin = emailLogin;
	}

	public String getPasswordLogin() {
		return passwordLogin;
	}

	public void setPasswordLogin(String passwordLogin) {
		this.passwordLogin = passwordLogin;
	}

	public LoginUsuario() {}
}
