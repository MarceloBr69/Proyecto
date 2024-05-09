package com.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.modelos.Publicaciones;
import com.modelos.Usuario;
import com.servicios.ServicioPublicaciones;
import com.servicios.ServicioUsuarios;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ControladorPublicaciones {

    @Autowired
    private ServicioPublicaciones servicioPublicaciones;
    
    @Autowired
    private ServicioUsuarios servicioUsuario;

    // Mostrar la página
    @GetMapping("/crear")
    public String mostrarFormulario(Model model) {
        model.addAttribute("publicacion", new Publicaciones());
        return "crearformulario.jsp"; 
    }
    
    
    // Agrega la publicación a la base de datos
    @PostMapping("/enviarPublicacion")
    public String agregarPublicacion(@Valid @ModelAttribute("publicacion") Publicaciones publicacionNuevo,
    								BindingResult resultado,
    								HttpSession sesion) {
    	
    	if (resultado.hasErrors()) {
    		System.out.println("Error");
    		return "home.jsp";
    	}
    	
    	// Obtiene el id de usuario actual
		Long idUsuario = (Long) sesion.getAttribute("idUsuario");
		if (idUsuario == null) {
			return "redirect:/";
		}
		
		Usuario usuarioActual = this.servicioUsuario.selectPorId(idUsuario);
	    if (usuarioActual == null) {
	        return "redirect:/";
	    }
		
	    // Guarda la id del usuario dentro de la tabla
		publicacionNuevo.setUsuario(usuarioActual);
		this.servicioPublicaciones.crearPublicacion(publicacionNuevo);
    	
        System.out.println("Se recibió una nueva publicación: " + publicacionNuevo.getTitulo());

        servicioPublicaciones.crearPublicacion(publicacionNuevo);
        

        return "redirect:/home";
    }
}
