package com.controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.modelos.LoginUsuario;
import com.modelos.Publicaciones;
import com.modelos.Usuario;
import com.servicios.ServicioPublicaciones;

import jakarta.servlet.http.HttpSession;

@Controller
public class ControladorGeneral {
	
	@Autowired
    private ServicioPublicaciones servicioPublicaciones;
	
    @GetMapping("/")
    public String mostrarInicio(@ModelAttribute("usuario") Usuario usuario,
                                @ModelAttribute("loginUsuario") LoginUsuario loginUsuario) {
        return "index.jsp";
    }
    
    @GetMapping("/publicar")
    public String mostrarFormularioPublicacion(Model modelo, HttpSession sesion) {
    	Long idUsuario = (Long) sesion.getAttribute("idUsuario");
        if (idUsuario == null) {
            return "redirect:/";
        }
        modelo.addAttribute("publicacion", new Publicaciones());
        return "publicar.jsp";
    }
    
    @GetMapping("/eventos")
    public String mostrarEventos(Model modelo) {
        List<Publicaciones> publicaciones = servicioPublicaciones.obtenerTodasLasPublicaciones();
        modelo.addAttribute("publicaciones", publicaciones);
        return "eventos.jsp";
    }
    
    @GetMapping("/perfil")
    public String mostrarPerfil() {
    	return "perfil.jsp";
    }
    
    @GetMapping("/home/detalle")
    public String mostrarDetalle() {
    	return "detalleEvento.jsp";
    }

}
