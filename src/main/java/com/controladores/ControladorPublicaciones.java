package com.controladores;

import java.io.File; 
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.text.SimpleDateFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.beans.propertyeditors.CustomDateEditor;

import com.modelos.CalculoFechas;
import com.modelos.Imagen;
import com.modelos.Publicaciones;
import com.modelos.Usuario;
import com.servicios.ServicioImagenes;
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
    
    @Autowired
    private ServicioImagenes servicioImagenes;


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
    
    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        binder.setDisallowedFields("archivo");
    }
    @InitBinder
    public void initBinder1(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
    }

    
    @PostMapping("/enviarPublicacion")
    public String agregarPublicacion(@Valid @ModelAttribute("publicacion") Publicaciones publicacionNuevo,
                                     BindingResult resultadoPublicacion,
                                     @RequestParam MultipartFile archivo,
                                     HttpSession sesion) throws IOException {

        if (resultadoPublicacion.hasErrors()) {
            return "publicar.jsp";
        }

        Long idUsuario = (Long) sesion.getAttribute("idUsuario");
        if (idUsuario == null) {
            return "redirect:/";
        }

        Usuario usuarioActual = this.servicioUsuario.selectPorId(idUsuario);
        if (usuarioActual == null) {
            return "redirect:/";
        }

        if (!archivo.isEmpty()) {
        	
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");
            String timestamp = dateFormat.format(new Date());
            String nombreImagen = timestamp + "_" + archivo.getOriginalFilename();
        	
        	
            String rutaBase = "C:/Users/liadi/Desktop/imagenes/";
            String rutaCompleta = rutaBase + nombreImagen;
            
            Imagen nuevaImagen = new Imagen(rutaCompleta, nombreImagen);
            this.servicioImagenes.guardarImagen(nuevaImagen);
            archivo.transferTo(new File(rutaCompleta));
            publicacionNuevo.setImagen(nuevaImagen);
        }
        publicacionNuevo.setUsuario(usuarioActual);
        this.servicioPublicaciones.crearPublicacion(publicacionNuevo);

        return "redirect:/home";
    }

    @DeleteMapping("/home/eliminar/{id}")
    public String eliminarPublicacion(@PathVariable("id") Long id) {
    	this.servicioPublicaciones.eliminarEvento(id);
    	return "redirect:/home";
    }
    

    
    @GetMapping("/home/detalle/{id}")
    public String mostrarDetallePublicacion(@PathVariable("id") Long id, Model modelo) {
        Publicaciones publicacion = servicioPublicaciones.obtenerPublicacion(id);
        LocalDateTime fechaPublicacion = CalculoFechas.convertirDateALocalDateTime(publicacion.getFechaCreacion());
        String tiempoTranscurrido = CalculoFechas.tiempoTranscurrido(fechaPublicacion);
        String fechaFormateada = CalculoFechas.formatearFecha(publicacion.getFechaEvento());

        modelo.addAttribute("publicacion", publicacion);
        modelo.addAttribute("tiempoTranscurrido", tiempoTranscurrido);
        modelo.addAttribute("fechaFormateada", fechaFormateada);
        return "detalleEvento.jsp";
    }
    
    @GetMapping("home/editar/{id}")
    public String editarPublicacion(@ModelAttribute("publicacion") Publicaciones publicacionNuevo,
    								@PathVariable("id") Long id, Model modelo, HttpSession sesion) {
    	 Long idUsuario = (Long) sesion.getAttribute("idUsuario");
         if (idUsuario == null) {
             return "redirect:/";
         }
         Usuario usuarioActual = this.servicioUsuario.selectPorId(idUsuario);
         if (usuarioActual == null) {
             return "redirect:/";
         }
         Publicaciones publicacion = servicioPublicaciones.obtenerPublicacion(id);
         modelo.addAttribute("publicacion", publicacion);
          
         return "editarEvento.jsp";
    }
    
   

    
   @PutMapping("/editarPublicacion/{id}")
   public String procesaEditarPublicacion(@Valid @ModelAttribute("publicacion") Publicaciones publicacionNuevo,
		   								BindingResult resultadoPublicacion,
		   								@RequestParam MultipartFile archivo,
		   								Model model,
		   								@PathVariable("id") Long id,
   										HttpSession sesion)  throws IOException {
	   if(resultadoPublicacion.hasErrors()) {
		   return "editarEvento/jsp";
	   }
	   
	   Publicaciones publicacionExistente = this.servicioPublicaciones.obtenerPublicacion(id);
	   
	   if (!archivo.isEmpty()) {
           String nombreImagen = new Date().toString() + "_" + archivo.getOriginalFilename();
           String rutaBase = "/Users/rociobustos/Desktop/imagenes/";
           String rutaCompleta = rutaBase + nombreImagen;
           
           Imagen nuevaImagen = new Imagen(rutaCompleta, nombreImagen);
           this.servicioImagenes.guardarImagen(nuevaImagen);
           archivo.transferTo(new File(rutaCompleta));
           publicacionNuevo.setImagen(nuevaImagen);
           
	   }else {
	        
	        publicacionNuevo.setImagen(publicacionExistente.getImagen());
	    }
	   
	   Long idUsuario = (Long) sesion.getAttribute("idUsuario");
	   Usuario usuarioActual = this.servicioUsuario.selectPorId(idUsuario);
	   publicacionNuevo.setUsuario(usuarioActual);
	   publicacionNuevo.setId(id);
	   
	   
	   
	   this.servicioPublicaciones.actualizarPublicacion(publicacionNuevo);
	   return "redirect:/home";
	   
   }
}
   
	   
    
