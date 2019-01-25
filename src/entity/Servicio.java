package entity;

import java.sql.Date;
import java.sql.Time;

public class Servicio {

	private int idservicio;
	private float km_transportados;
	private float cant_toneladas;
	private float precio_servicio;
	private Date fecha;
	private Time hora;
	
	public int getIdservicio() {
		return idservicio;
	}
	public void setIdservicio(int idservicio) {
		this.idservicio = idservicio;
	}
	public float getKm_transportados() {
		return km_transportados;
	}
	public void setKm_transportados(float km_transportados) {
		this.km_transportados = km_transportados;
	}
	public float getCant_toneladas() {
		return cant_toneladas;
	}
	public void setCant_toneladas(float cant_toneladas) {
		this.cant_toneladas = cant_toneladas;
	}
	public float getPrecio_servicio() {
		return precio_servicio;
	}
	public void setPrecio_servicio(float precio_servicio) {
		this.precio_servicio = precio_servicio;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public Time getHora() {
		return hora;
	}
	public void setHora(Time hora) {
		this.hora = hora;
	}
	

}
