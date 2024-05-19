package com.repositorios;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.modelos.Publicaciones;

@Repository
public interface RepositorioPublicaciones extends JpaRepository<Publicaciones, Long> {
    List<Publicaciones> findTop5ByOrderByFechaCreacionDesc();
    List<Publicaciones> findAllByOrderByFechaCreacionDesc();

}

