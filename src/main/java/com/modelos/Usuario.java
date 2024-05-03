package com.modelos;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="usuarios")
public class Usuario {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	
	@Size(min=2, message="Por favor, proporciona tu nombre")
	private String nombre;
	
	@Size(min=2, message="Por favor, proporciona tu apellido")
	private String apellido;
	
	@Size(min=2, message="Por favor, proporciona tu RUT")
	private String rut;
	
	@Size(min=2, message="Por favor, proporciona tu correo")
	private String correo;
	
	private String contraseña;
	
	@Transient
	private String confirmacionContraseña;
	
	private String municipalidad;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-ss")
	private Date fechaCreacion;
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getRut() {
		return rut;
	}

	public void setRut(String rut) {
		this.rut = rut;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getContraseña() {
		return contraseña;
	}

	public void setContraseña(String contraseña) {
		this.contraseña = contraseña;
	}

	public String getConfirmacionContraseña() {
		return confirmacionContraseña;
	}

	public void setConfirmacionContraseña(String confirmacionContraseña) {
		this.confirmacionContraseña = confirmacionContraseña;
	}

	public String getMunicipalidad() {
		return municipalidad;
	}

	public void setMunicipalidad(String municipalidad) {
		this.municipalidad = municipalidad;
	}

	public Date getFechaCreacion() {
		return fechaCreacion;
	}

	public void setFechaCreacion(Date fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}


}
