package controles;

import java.util.ArrayList;

import data.DataAdministrador;
import entity.Administrador;

public class CtrlAdministrador {
	
	private DataAdministrador dataAdm;
	private ArrayList<Administrador> admins;
	public CtrlAdministrador(){
		dataAdm = new DataAdministrador();
		admins= new ArrayList<Administrador>();
			  
	}
	public Administrador getValidacionUsario(Administrador adm) throws Exception{
		return dataAdm.getValidacionUsario(adm);
	}
	public Administrador buscarAdministrador(Administrador adm) throws Exception{
		return dataAdm.BuscarAdministrador(adm);
	}
	public Administrador validarPregunta(Administrador adm) throws Exception{
		return dataAdm.validarPregunta(adm);
	}
}

