package entity;

import java.sql.Date;
import java.sql.Time;

public class Servicio {

	private int idservicio;
	private int km_transportados;
	private float cant_toneladas;
	private float precio_servicio;
	private Date fecha;
	private Time hora;
	private String observaciones;
	private Camion camion;
	private PrecioKM precio;
	private Cereal cereal;
	private Cliente cliente;

	public int getIdservicio() {
		return idservicio;
	}

	public void setIdservicio(int idservicio) {
		this.idservicio = idservicio;
	}

	public int getKm_transportados() {
		return km_transportados;
	}

	public void setKm_transportados(int km_transportados) {
		this.km_transportados = km_transportados;
	}

	public float getCant_toneladas() {
		return cant_toneladas;
	}

	public void setCant_toneladas(float cant_toneladas) {
		this.cant_toneladas = cant_toneladas;
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

	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

	public float getPrecio_servicio() {
		return precio_servicio;
	}

	public void setPrecio_servicio(float precio_servicio) {
		this.precio_servicio = precio_servicio;
	}

	public PrecioKM getPrecio() {
		return precio;
	}

	public void setPrecio(PrecioKM precio) {
		this.precio = precio;
	}

}
