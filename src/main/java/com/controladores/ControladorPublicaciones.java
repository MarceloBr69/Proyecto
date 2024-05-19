package com.controladores;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.modelos.CalculoFechas;
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


    @GetMapping("/home")
    public String mostrarHome(Model modelo) {
        List<Publicaciones> publicaciones = this.servicioPublicaciones.obtenerUltimas5Publicaciones();
        List<String> tiemposTranscurridos = new ArrayList<>();
        List<String> fechasFormateadas = new ArrayList<>();

        for (Publicaciones publicacion : publicaciones) {
            LocalDateTime fechaPublicacion = CalculoFechas.convertirDateALocalDateTime(publicacion.getFechaCreacion());
            tiemposTranscurridos.add(CalculoFechas.tiempoTranscurrido(fechaPublicacion));
            fechasFormateadas.add(CalculoFechas.formatearFecha(publicacion.getFechaEvento()));
        }   

        modelo.addAttribute("publicaciones", publicaciones);
        modelo.addAttribute("tiemposTranscurridos", tiemposTranscurridos);
        modelo.addAttribute("fechasFormateadas", fechasFormateadas);
        return "home.jsp";
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
    
    @DeleteMapping("/home/eliminar/{id}")
    public String eliminarPublicacion(@PathVariable("id") Long id) {
    	this.servicioPublicaciones.eliminarEvento(id);
    	return "redirect:/home";
    }
}
