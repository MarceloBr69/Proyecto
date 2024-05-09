package com.repositorios;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.modelos.Publicaciones;

@Repository
public interface RepositorioPublicaciones extends CrudRepository<Publicaciones, Long> {
	List<Publicaciones> findAll();
}
