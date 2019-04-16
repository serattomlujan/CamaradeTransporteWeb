package controles;

import java.util.ArrayList;

import data.DataPrecio_km;
import data.DataSocio;
import entity.Precio;
import entity.Socio;

public class CtrlABMPrecio_km {
	private ArrayList<Precio> precs;
	private DataPrecio_km dataPrec;
	
	public CtrlABMPrecio_km(){
		dataPrec= new DataPrecio_km();
		precs= new ArrayList<Precio>();
   
	}
	public void add(Precio p) throws Exception{
		dataPrec.add(p);
		}
	public void delete() throws Exception{
		dataPrec.delete();
		}
}
