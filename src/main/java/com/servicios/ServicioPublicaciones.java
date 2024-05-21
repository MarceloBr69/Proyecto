package com.servicios;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modelos.Publicaciones;
import com.repositorios.RepositorioPublicaciones;



@Service
public class ServicioPublicaciones {

    @Autowired
    private RepositorioPublicaciones repositorioPublicaciones;

    public Publicaciones crearPublicacion(Publicaciones publicacionNuevo) {
        return this.repositorioPublicaciones.save(publicacionNuevo);
    }

    public List<Publicaciones> obtenerTodasLasPublicaciones(){
        return repositorioPublicaciones.findAllByOrderByFechaCreacionDesc();
    }

    public List<Publicaciones> obtenerUltimas5Publicaciones() {
        return this.repositorioPublicaciones.findTop5ByOrderByFechaCreacionDesc();
    }

    public void eliminarPublicacion(Long id) {
        this.repositorioPublicaciones.deleteById(id);
    }

    public Publicaciones obtenerPublicacion(Long id) {
        Optional<Publicaciones> publicaciones = this.repositorioPublicaciones.findById(id);
        return publicaciones.get();
    }

    public Publicaciones actualizarPublicacion(Publicaciones publicacion) {
        return this.repositorioPublicaciones.save(publicacion);
    }
    
    public void eliminarEvento(Long id) {
    	repositorioPublicaciones.deleteById(id);
    }
    
    public Publicaciones obtenerUnoPorId(Long id) {
    	Optional<Publicaciones> publicacionEncontrada = repositorioPublicaciones.findById(id);
    	return publicacionEncontrada.get();
    }
    
    public List<Publicaciones> obtenerPublicacionesPorUsuario(Long idUsuario) {
        return repositorioPublicaciones.findByUsuarioId(idUsuario);
    }
    
    
}