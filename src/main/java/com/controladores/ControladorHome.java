package com.controladores;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ControladorHome {
	@GetMapping("/home")
	public String despliegaHome() {
		return "home.jsp";
	}
}
