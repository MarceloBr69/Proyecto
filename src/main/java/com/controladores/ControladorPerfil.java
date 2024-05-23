package com.controladores;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.modelos.Imagen;
import com.modelos.Usuario;
import com.servicios.ServicioImagenes;
import com.servicios.ServicioUsuarios;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ControladorPerfil {
    
	@Autowired
    private ServicioUsuarios servicioUsuarios;
	
	@Autowired ServicioImagenes servicioImagenes;

    @GetMapping("/editarPerfil")
    public String mostrarFormularioEditarPerfil(HttpSession session, Model model) {
        Long idUsuario = (Long) session.getAttribute("idUsuario");
        if (idUsuario == null) {
            System.out.println("Error: No se ha iniciado sesión");
            return "redirect:/#login";
        }
        
        Usuario usuario = servicioUsuarios.selectPorId(idUsuario);
        
        if (usuario == null) {
            System.out.println("Error: El usuario no existe");
            return "redirect:/#login";
        }
        
        model.addAttribute("usuario", usuario);
        
        
        return "editarPerfil.jsp";
    }
    
	
	
    @PostMapping("/guardarPerfil")
    public String guardarPerfil(@Valid @ModelAttribute("usuario") Usuario usuario,
                                BindingResult result,
                                @RequestParam("fotoPerfilArchivo") MultipartFile fotoPerfilArchivo,
                                HttpSession session,
                                RedirectAttributes redirectAttributes) {

        if (result.hasErrors()) {
            return "editarPerfil.jsp"; 
        }

        Long idUsuario = (Long) session.getAttribute("idUsuario");
        if (idUsuario == null) {
            System.out.println("Error: No se ha iniciado sesión");
            return "redirect:/#login";
        }

        Usuario usuarioExistente = servicioUsuarios.selectPorId(idUsuario);
        if (usuarioExistente == null) {
            System.out.println("Error: El usuario no existe");
            return "redirect:/#login";
        }

        usuarioExistente.setDescripcion(usuario.getDescripcion());

        if (!fotoPerfilArchivo.isEmpty()) {
            String nombreImagen = idUsuario + "_" + fotoPerfilArchivo.getOriginalFilename();
            String rutaBase = "C:/Users/liadi/Desktop/imagenes/";
            String rutaCompleta = rutaBase + nombreImagen;

            try {
                fotoPerfilArchivo.transferTo(new File(rutaCompleta));
                usuarioExistente.setFotoPerfil(rutaCompleta); 
                
                Imagen nuevaImagenPerfil = new Imagen(rutaCompleta, nombreImagen);
                servicioImagenes.guardarImagen(nuevaImagenPerfil);
                usuarioExistente.setImagenPerfil(nuevaImagenPerfil);
            } catch (IOException e) {
                e.printStackTrace();
                System.out.println("Error al cargar la imagen de perfil");
            }
        }

        servicioUsuarios.actualizarUsuario(usuarioExistente);
        redirectAttributes.addFlashAttribute("success", "Perfil actualizado correctamente");

        return "redirect:/perfil"; 
    }
}