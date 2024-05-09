package com.controladores;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ControladorPerfil {
	@GetMapping("/perfil")
	public String despliegaPerfil() {
		return "perfil.jsp";
	}
}
