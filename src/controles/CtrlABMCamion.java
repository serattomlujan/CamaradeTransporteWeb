package controles;

import java.util.ArrayList;

import data.DataCamion;
import entity.Camion;

public class CtrlABMCamion {
	private ArrayList<Camion> cams;
	private DataCamion dataCam;

	public void add(Camion cam) throws Exception {
		dataCam.add(cam);
	}

	public void update(Camion cam) throws Exception {
		dataCam.modificar(cam);
	}

	public Camion getByIdCamion(Camion cam) throws Exception {
		return this.dataCam.getByIdCamion(cam);
	}

	public ArrayList<Camion> getAll() throws Exception {
		return dataCam.getAll();
	}
}
