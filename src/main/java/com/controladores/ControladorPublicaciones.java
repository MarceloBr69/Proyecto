package com.controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.modelos.Publicaciones;
import com.servicios.ServicioPublicaciones;
import com.servicios.ServicioUsuarios;

import jakarta.servlet.http.HttpSession;

@Controller
public class ControladorPublicaciones {

	@Autowired
	public ServicioUsuarios servicioUsuario;
	
	@Autowired
	public ServicioPublicaciones servicioProgramas;
	
	@GetMapping("/home")
	public String despliegPublicaciones(Model modelo, HttpSession sesion) {
		Long idUsuario = (Long)sesion.getAttribute("idUsuario");
		if(idUsuario == null) {
			return "redirect:/";
		}
		List<Publicaciones> programas = this.servicioProgramas.obtenerTodosLosProgramas();		
		modelo.addAttribute("programas", programas);
		return "home.jsp";
	}
}