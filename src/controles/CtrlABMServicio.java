package controles;

import java.sql.Date;
import java.util.ArrayList;
import data.DataCamion;
import data.DataServicio;
import entity.Camion;
import entity.Servicio;

public class CtrlABMServicio {
	
	private ArrayList<Servicio> servicios;
	private DataServicio dataSer;
	private DataCamion dataCam;

	 public CtrlABMServicio(){
		 dataSer= new DataServicio();
		 dataCam= new DataCamion();
		 servicios= new ArrayList<Servicio>();
	   
		}
	public com.google.gson.JsonObject getServiciosFinalizados() throws Exception {
		return dataSer.getServiciosFinalizados();
	}
	public com.google.gson.JsonObject getServiciosSinFinalizar() throws Exception {
		return dataSer.getServiciosSinFinalizar();
	}
	public com.google.gson.JsonObject getInformeCereal(Date fechaDesde, Date fechaHasta) throws Exception {
		return dataSer.getInformeCereal(fechaDesde, fechaHasta);
	}
	public com.google.gson.JsonObject getInformeCliente(Date fechaDesde, Date fechaHasta) throws Exception {
		return dataSer.getInformeCliente(fechaDesde, fechaHasta);
	}
	public com.google.gson.JsonObject getInformeSocio(Date fechaDesde, Date fechaHasta) throws Exception {
		return dataSer.getInformeSocio(fechaDesde, fechaHasta);
	}
	public com.google.gson.JsonObject getInformeCamion(Date fechaDesde, Date fechaHasta) throws Exception {
		return dataSer.getInformeCamion(fechaDesde, fechaHasta);
	}
	public Servicio getById(int id_servicio) throws Exception {
		return dataSer.getById(id_servicio);
	}
	public Camion asignarCamion() throws Exception {
		return dataCam.asignarCamion();
		
	}
	public void add(Servicio s) throws Exception {
		dataSer.add(s);
	}
	public void update(Servicio s) throws Exception {
		dataSer.update(s);
	}
}
