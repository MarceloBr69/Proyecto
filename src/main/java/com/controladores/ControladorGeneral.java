package com.controladores;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.modelos.LoginUsuario;
import com.modelos.Publicaciones;
import com.modelos.Usuario;

@Controller
public class ControladorGeneral {
	
    @GetMapping("/")
    public String mostrarInicio(@ModelAttribute("usuario") Usuario usuario,
                                @ModelAttribute("loginUsuario") LoginUsuario loginUsuario) {
        return "index.jsp";
    }
    
    @GetMapping("/publicar")
    public String mostrarFormulario(Model model) {
        model.addAttribute("publicacion", new Publicaciones());
        return "publicar.jsp"; 
    }
    
    @GetMapping("/eventos")
    public String mostrarVer() {
    	return "eventos.jsp";
    }
    
    @GetMapping("/perfil")
    public String mostrarPerfil() {
    	return "perfil.jsp";
    }

}
