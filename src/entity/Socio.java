package entity;

import java.sql.Date;
import java.sql.Time;

public class Socio {

	private int nro_Socio;
	private String dni;
	private String nombre;
	private String apellido;
	private String telefono;
	private boolean estado;
	
	public int getNro_Socio() {
		return nro_Socio;
	}
	public void setNro_Socio(int nro_Socio) {
		this.nro_Socio = nro_Socio;
	}
	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni;
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
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public boolean isEstado() {
		return estado;
	}
	public void setEstado(boolean estado) {
		this.estado = estado;
	}
	
	
}
