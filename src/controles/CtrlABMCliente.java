package controles;

import java.util.ArrayList;

import data.DataCliente;

import entity.Cliente;


public class CtrlABMCliente {
	
	private ArrayList<Cliente> clis;
	private DataCliente dataCli;
    
    public CtrlABMCliente(){
    	dataCli= new DataCliente();
    	clis= new ArrayList<Cliente>();
   
	}
	
	
	public void add(Cliente c) throws Exception{
		dataCli.add(c);}
	
	
		
	public void update(Cliente c) throws Exception{
		
		dataCli.modificar(c);
	}
		
		
		
	public Cliente getByCuit(Cliente c) throws Exception{
	return this.dataCli.getByCuit(c);
	}	
		
	
	public Cliente getByDni(String cuit) throws Exception{
	Cliente c=new Cliente();
	c.setCuit(cuit);
	return getByCuit(c);
	}
	

	
	
	public com.google.gson.JsonObject getAll() throws Exception{
		return dataCli.getAll();}
	
		
	}