package com.repositorios;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.modelos.Imagen;


@Repository
public interface RepositorioImagenes extends JpaRepository<Imagen, Long>{
	List<Imagen> findAll();
}
