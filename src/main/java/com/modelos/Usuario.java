package com.modelos;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="usuarios")
public class Usuario {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	
	@Size(min=2, message="Proporciona tu nombre")
	private String nombre;
	
	@Size(min=2, message="Proporciona ambos apellidos")
	private String apellidos;
	
	@Size(min=7, message="Proporciona tu RUT")
	private String rut;
	
	@Size(min=2, message="Proporciona tu correo")
	private String correo;
	
	private String contraseña;
	
	@OneToMany(mappedBy="usuario", fetch=FetchType.LAZY)
	private List<Publicaciones> publicaciones;

	@Transient
	private String confirmarContraseña;
	
	private Long municipalidadId;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-ss")
	private Date fechaCreacion;
	
	@DateTimeFormat(pattern="yyyy-MM-ss")
	private Date fechaActualizacion;
	
	private String descripcion;
	
	public List<Publicaciones> getPublicaciones() {
		return publicaciones;
	}

	public void setPublicaciones(List<Publicaciones> publicaciones) {
		this.publicaciones = publicaciones;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	@PrePersist
	protected void onCreate() {
		this.fechaCreacion = new Date();
	}
	
	@PreUpdate
	protected void onUpdate() {
		this.fechaActualizacion = new Date();
	}

	public Usuario() {}


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

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
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

	public String getConfirmarContraseña() {
		return confirmarContraseña;
	}

	public void setConfirmarContraseña(String confirmarContraseña) {
		this.confirmarContraseña = confirmarContraseña;
	}

	public Long getMunicipalidadId() {
		return municipalidadId;
	}

	public void setMunicipalidadId(Long municipalidadId) {
		this.municipalidadId = municipalidadId;
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
