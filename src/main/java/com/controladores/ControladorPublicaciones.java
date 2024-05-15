package com.controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.modelos.LoginUsuario;
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

    @GetMapping("/")
    public String mostrarInicio(@ModelAttribute("usuario") Usuario usuario,
                                @ModelAttribute("loginUsuario") LoginUsuario loginUsuario) {
        return "index.jsp";
    }

    @GetMapping("/home")
    public String mostrarHome(Model modelo) {
    	List<Publicaciones> publicaciones = this.servicioPublicaciones.obtenerTodasLasPublicaciones();
    	modelo.addAttribute("publicaciones", publicaciones);
        return "home.jsp";
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
    
    @PostMapping("/enviarPublicacion")
    public String agregarPublicacion(@Valid @ModelAttribute("publicacion") Publicaciones publicacionNuevo,
                                     BindingResult resultado,
                                     HttpSession sesion) {

        if (resultado.hasErrors()) {
            return "crearformulario.jsp";
        }

        Long idUsuario = (Long) sesion.getAttribute("idUsuario");
        if (idUsuario == null) {
            return "redirect:/";
        }

        Usuario usuarioActual = this.servicioUsuario.selectPorId(idUsuario);
        if (usuarioActual == null) {
            return "redirect:/";
        }

        publicacionNuevo.setUsuario(usuarioActual);
        this.servicioPublicaciones.crearPublicacion(publicacionNuevo);

        System.out.println("Se recibió una nueva publicación: " + publicacionNuevo.getTitulo());

        return "redirect:/home";
    }
}
