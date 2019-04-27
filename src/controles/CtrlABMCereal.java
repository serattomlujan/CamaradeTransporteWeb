package controles;

import java.util.ArrayList;

import data.DataCereal;
import entity.Cereal;;

public class CtrlABMCereal {
	private ArrayList<Cereal> cers;
	private DataCereal dataCer;
    
    public CtrlABMCereal(){
    	dataCer= new DataCereal();
    	cers= new ArrayList<Cereal>();
   
	}
	
	public void add(Cereal cer) throws Exception{
		dataCer.add(cer); }
	
	
		
	public void update(Cereal cer) throws Exception{
		
		dataCer.modificar(cer);
	}
		
		
		
	public Cereal getByDescCereal(Cereal cer) throws Exception{
	return this.dataCer.getByDescCereal(cer);
	}	
		
	
	
	public ArrayList<Cereal>getAll() throws Exception{
		return dataCer.getAll();}
	
}
