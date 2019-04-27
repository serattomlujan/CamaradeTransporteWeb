package entity;

import java.sql.Date;

public class Camion {

		private int id_camion;
		private String patente;
		private String marca;
		private String modelo;
//		private Date fecha_ingreso;
		private boolean estado;
//		private Socio socio;
		
//		public Socio getSocio() {
//			return socio;
//		}
//		public void setSocio(Socio socio) {
//			this.socio = socio;
//		}
		
		public int getIdcamion() {
			return id_camion;
		}
		public void setIdcamion(int idcamion) {
			this.id_camion = idcamion;
		}
		public String getPatente() {
			return patente;
		}
		public void setPatente(String patente) {
			this.patente = patente;
		}
		public String getMarca() {
			return marca;
		}
		public void setMarca(String marca) {
			this.marca = marca;
		}
		public String getModelo() {
			return modelo;
		}
		public void setModelo(String modelo) {
			this.modelo = modelo;
		}
//		public Date getFecha_ingreso() {
//			return fecha_ingreso;
//		}
//		public void setFecha_ingreso(Date Date) {
//			this.fecha_ingreso = Date;
//		}
		public boolean isEstado() {
			return estado;
		}
		public void setEstado(boolean estado) {
			this.estado = estado;
		}
		
		
}
