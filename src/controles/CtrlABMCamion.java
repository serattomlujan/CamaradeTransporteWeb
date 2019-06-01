package controles;

import java.util.ArrayList;

import data.DataCamion;
import data.DataCereal;
import entity.Camion;
import entity.Cereal;

public class CtrlABMCamion {
	
	private ArrayList<Camion> cams;
	private DataCamion dataCam;
	
	public CtrlABMCamion(){
    	dataCam= new DataCamion();
    	cams= new ArrayList<Camion>();
   
	}

	public void add(Camion cam) throws Exception {
		dataCam.add(cam);
	}

	public void update(Camion cam) throws Exception {
		dataCam.modificar(cam);
	}

//	public Camion getByIdCamion(Camion cam) throws Exception {
//		return this.dataCam.getByIdCamion(cam);
//	}
	
	public Camion getByPatente(Camion cam) throws Exception {
		return this.dataCam.getByPatente(cam);
	}
	

	public com.google.gson.JsonObject getAll() throws Exception {
		return dataCam.getAll();
	}
}
