package com.modelos;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="publicaciones")
public class Publicaciones {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	
	@Size(min=1, message="Proporciona un título para esta publicación")
	private String titulo;
	
	@Size(min=1, message="Por favor, proporciona el tipo de publicación")
	private String tipo;
	
	@Size(min=1, message="Por favor, proporciona la descripción de la publicación")	
	private String descripcion;
	
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-ss")
	private Date fechaCreacion;
	
	@DateTimeFormat(pattern="yyyy-MM-ss")
	private Date fechaActualizacion;
	
	@PrePersist
	protected void onCreate() {
		this.fechaCreacion = new Date(id);
	}
	
	@PreUpdate
	protected void onUpdate() {
		this.fechaActualizacion = new Date(id);
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Date getFechaCreacion() {
		return fechaCreacion;
	}

	public void setFechaCreacion(Date fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}

	public Date getFechaActualizacion() {
		return fechaActualizacion;
	}

	public void setFechaActualizacion(Date fechaActualizacion) {
		this.fechaActualizacion = fechaActualizacion;
	}
}
