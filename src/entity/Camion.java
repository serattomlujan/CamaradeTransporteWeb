package entity;

import java.sql.Date;

public class Camion {

		private int idcamion;
		private String patente;
		private String marca;
		private String modelo;
		private Date fecha_ingreso;
		private boolean estado;
		
		public int getIdcamion() {
			return idcamion;
		}
		public void setIdcamion(int idcamion) {
			this.idcamion = idcamion;
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
		public Date getFecha_ingreso() {
			return fecha_ingreso;
		}
		public void setFecha_ingreso(Date fecha_ingreso) {
			this.fecha_ingreso = fecha_ingreso;
		}
		public boolean isEstado() {
			return estado;
		}
		public void setEstado(boolean estado) {
			this.estado = estado;
		}
		
		
}
