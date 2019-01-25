package controles;

import java.util.ArrayList;

import data.DataSocio;

import entity.Socio;


public class CtrlABMSocio {
	
	private ArrayList<Socio> socs;
	private DataSocio dataSoc;
    
    public CtrlABMSocio(){
    	dataSoc= new DataSocio();
    	socs= new ArrayList<Socio>();
   
	}
	
	
	public void add(Socio s) throws Exception{
		dataSoc.add(s);}
	
	
		
	public void update(Socio s) throws Exception{
		
		dataSoc.modificar(s);
	}
		
		
		
	public Socio getByDni(Socio s) throws Exception{
	return this.dataSoc.getByDni(s);
	}	
		
	
	public Socio getByDni(String dni) throws Exception{
	Socio s=new Socio();
	s.setDni(dni);
	return getByDni(s);
	}
	
//	
//	public Socio getById(int id) throws Exception{
//		Socio s=new Socio();
//		s.setIdSocio(id);
//		return getById(s);
//		}
	

	
	
	public ArrayList<Socio>getAll() throws Exception{
		return dataSoc.getAll();}
	
		
	}
