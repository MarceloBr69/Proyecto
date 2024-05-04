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
	
	public Publicaciones crearPrograma(Publicaciones nuevaPublicacion) {
		return this.repositorioPublicaciones.save(nuevaPublicacion);
	}
	
	public List<Publicaciones> obtenerTodosLosProgramas(){
		return this.repositorioPublicaciones.findAll();
	}
	
	public void eliminarPublicacion(Long id) {
		this.repositorioPublicaciones.deleteById(id);
	}
	
	public Publicaciones obtenerPrograma(Long id) {
		Optional<Publicaciones> publicacion = this.repositorioPublicaciones.findById(id);
		return publicacion.get();
	}

	public Publicaciones actualizarPrograma(Publicaciones publicacion) {
		return this.repositorioPublicaciones.save(publicacion);
	}
}
