package controles;

import java.util.ArrayList;

import data.DataPrecio_km;
import entity.PrecioKM;

public class CtrlABMPrecio_km {
	private ArrayList<PrecioKM> precs;
	private DataPrecio_km dataPrec;
	
	public CtrlABMPrecio_km(){
		dataPrec= new DataPrecio_km();
		precs= new ArrayList<PrecioKM>();
   
	}
	public void add(PrecioKM p) throws Exception{
		dataPrec.add(p);
		}
	public void delete() throws Exception{
		dataPrec.delete();
		}
	public PrecioKM getByKm(int nro_km) throws Exception{
		return dataPrec.getByKm(nro_km);
		}
}
