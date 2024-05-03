package com.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.modelos.LoginUsuario;
import com.modelos.Usuario;
import com.servicios.ServicioUsuarios;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ControladorUsuarios {

	@Autowired
	private ServicioUsuarios servicioUsuario;
	
	@GetMapping("/")
	public String mostrarInicio(@ModelAttribute("registerUser") Usuario usuario,
								@ModelAttribute("loginUser") LoginUsuario loginUser) {
		return "index.jsp";
	}
	
	@PostMapping("/register")
	public String procesaRegistro(@Valid @ModelAttribute("registerUser") Usuario nuevoUsuario, BindingResult resultado, HttpSession sesion) {
		
		resultado = this.servicioUsuario.validarRegistro(resultado, nuevoUsuario);
		if(resultado.hasErrors()) {
			return "index.jsp";
		}
		
		nuevoUsuario = this.servicioUsuario.insertarUsuario(nuevoUsuario);
		
		sesion.setAttribute("idUsuario", nuevoUsuario.getId());
		sesion.setAttribute("nombre", nuevoUsuario.getNombre());
		
		return "redirect:/home.jsp";
	}
	
	@PostMapping("/login")
	public String procesaLogin(@Valid @ModelAttribute("loginUsuario") LoginUsuario loginUsuario, BindingResult resultado, HttpSession sesion,
									  @ModelAttribute("registerUsuario") Usuario nuevoUsuario) {
		resultado = this.servicioUsuario.validarLogin(resultado, loginUsuario);
		if(resultado.hasErrors()) {
			return "redirect:/";
		}
		
		Usuario usuarioExistente = this.servicioUsuario.selectPorCorreo(loginUsuario.getEmailLogin());
		
		sesion.setAttribute("idUsuario", usuarioExistente.getId());
		sesion.setAttribute("nombre", usuarioExistente.getNombre());
		
		
		return "redirect:/home.jsp";
	}
	
	@GetMapping("/logout")
	public String procesaLogout(HttpSession sesion) {
		sesion.invalidate();
		return "redirect:/";
	}
	

}
