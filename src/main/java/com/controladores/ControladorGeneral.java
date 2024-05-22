package com.controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.modelos.LoginUsuario;
import com.modelos.Publicaciones;
import com.modelos.Usuario;
import com.servicios.ServicioPublicaciones;
import com.servicios.ServicioUsuarios;

import jakarta.servlet.http.HttpSession;

@Controller
public class ControladorGeneral {
	

	
	@Autowired
    private ServicioPublicaciones servicioPublicaciones;
	
	@Autowired
	private ServicioUsuarios servicioUsuarios;
	
    @GetMapping("/")
    public String mostrarInicio(@ModelAttribute("usuario") Usuario usuario,
                                @ModelAttribute("loginUsuario") LoginUsuario loginUsuario) {
        return "index.jsp";
    }
    
    @GetMapping("/publicar")
    public String mostrarFormularioPublicacion(Model modelo, HttpSession sesion) {
    	Long idUsuario = (Long) sesion.getAttribute("idUsuario");
        if (idUsuario == null) {
            return "redirect:/#login";
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
    public String mostrarPerfil(HttpSession sesion, Model model) {
        Long idUsuario = (Long) sesion.getAttribute("idUsuario");
        if (idUsuario == null) {
            return "redirect:/";
        }

        Usuario usuarioActual = servicioUsuarios.selectPorId(idUsuario);
        if (usuarioActual == null) {
            return "redirect:/";
        }

        model.addAttribute("nombre", usuarioActual.getNombre());
        model.addAttribute("apellidos", usuarioActual.getApellidos());
        model.addAttribute("descripcion", usuarioActual.getDescripcion());
        model.addAttribute("usuario", usuarioActual);


        List<Publicaciones> publicaciones = servicioPublicaciones.obtenerPublicacionesPorUsuario(idUsuario);
        model.addAttribute("publicaciones", publicaciones);

        return "perfil.jsp";
    }
    

    @GetMapping("/home/detalle")
    public String mostrarDetalle() {
    	return "detalleEvento.jsp";
    }
    
    @GetMapping("/verperfil/{usuario_id}")
    public String mostrarPerfilDeOtroUsuario(@PathVariable("usuario_id") Long id, Model model) {
    	Usuario usuarioId = this.servicioUsuarios.selectPorId(id);
    	model.addAttribute("usuarioId", usuarioId);
        model.addAttribute("usuario", usuarioId);

    	List<Publicaciones> publicaciones = servicioPublicaciones.obtenerPublicacionesPorUsuario(id);
        model.addAttribute("publicaciones", publicaciones);
        
    	return "verperfil.jsp";
    }
    

}
