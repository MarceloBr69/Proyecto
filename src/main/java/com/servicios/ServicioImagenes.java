package com.servicios;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modelos.Imagen;
import com.repositorios.RepositorioImagenes;

@Service
public class ServicioImagenes {
	
	@Autowired
	private final RepositorioImagenes repositorioImagenes;
	
	public ServicioImagenes(RepositorioImagenes repositorioImagenes) {
		this.repositorioImagenes = repositorioImagenes;
	}
	
	public List<Imagen> obtenerTodas(){
		return this.repositorioImagenes.findAll();
	}
	
	public Imagen guardarImagen(Imagen nuevaImagen) {
		return this.repositorioImagenes.save(nuevaImagen);
	}
}
