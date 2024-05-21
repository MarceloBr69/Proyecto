package com.repositorios;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.modelos.Usuario;

@Repository
public interface RepositorioUsuarios extends JpaRepository<Usuario, Long>{
	List<Usuario> findAll();
	Usuario getByCorreo(String correo);
	Usuario getById(Long id);
	
}
