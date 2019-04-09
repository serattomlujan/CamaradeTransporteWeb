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
	private Camion camion;
	private Precio precio;
	private Cereal cereal;
	private Cliente cliente;
	
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
	public Camion getCamion() {
		return camion;
	}
	public void setCamion(Camion camion) {
		this.camion = camion;
	}
	public Precio getPrecio() {
		return precio;
	}
	public void setPrecio(Precio precio) {
		this.precio = precio;
	}
	public Cereal getCereal() {
		return cereal;
	}
	public void setCereal(Cereal cereal) {
		this.cereal = cereal;
	}
	public Cliente getCliente() {
		return cliente;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	

}
