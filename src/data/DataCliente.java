package data;
import java.util.ArrayList;
import java.sql.*;

import util.AppDataException;
import entity.*;


public class DataCliente {
	
	public ArrayList<Cliente> getAll() throws Exception{
		Statement stmt=null;
		ResultSet rs=null;
		ArrayList<Cliente> clis= new ArrayList<Cliente>();
		try {
		 	stmt = FactoryConexion.getInstancia().getConn().createStatement();
		 	rs = stmt.executeQuery("select * from clientes c ");
		 	if(rs!=null){
		 		while(rs.next()){
		 			Cliente c=new Cliente();
		 			c.setCuit(rs.getString("cuit"));
		 			c.setRazon_social(rs.getString("razon_social"));
		 			c.setDireccion(rs.getString("direccion"));
		 			c.setTelefono(rs.getString("telefono"));
		 			c.setEstado(rs.getBoolean("estado"));
		 		
		 			clis.add(c);
		 						}
		 				}		
			} catch (SQLException e) {throw e;
			} catch (AppDataException ade){
					throw ade;
				 		}
				try {
				if(rs!=null)rs.close();
				if(stmt!=null)stmt.close();
				FactoryConexion.getInstancia().releaseConn();
				} catch (SQLException e) {
					e.printStackTrace();
		 		}
				
		return clis;
		}
		 	
		public Cliente getByCuit(Cliente cli) throws Exception{
			Cliente c=null;
		 		PreparedStatement stmt=null;
		 		ResultSet rs=null;
		 		try {
		 			stmt=FactoryConexion.getInstancia().getConn().prepareStatement(
		 					"select cuit, razon_social, direccion, telefono, estado "
		 					+ " from clientes c "
		 					+ " where cuit=?");
		 			stmt.setString(1, cli.getCuit());
		 			rs=stmt.executeQuery();
		 			if(rs!=null && rs.next()){
		 					c=new Cliente();
		 					c.setCuit(rs.getString("cuit"));
				 			c.setRazon_social(rs.getString("razon_social"));
				 			c.setDireccion(rs.getString("direccion"));
				 			c.setEstado(rs.getBoolean("estado"));
				 			c.setTelefono(rs.getString("telefono"));
				 		
		 			}
		 			
		} catch (Exception e) {
		throw e;
		}
		finally{
		try {
		if(rs!=null)rs.close();
		if(stmt!=null)stmt.close();
		FactoryConexion.getInstancia().releaseConn();
		} catch (SQLException e) {
		throw e;
			}
		 }
				
		 return c;
		}
		 	
		public void add(Cliente c) throws Exception{
		 		PreparedStatement stmt=null;
		 		ResultSet rs=null;
		 		try {
		 			stmt=FactoryConexion.getInstancia().getConn().prepareStatement(
		 					"insert into clientes(cuit, razon_social, direccion, estado, telefono) "
		 					+ "values (?,?,?,?,?)");
		 			stmt.setString(1, c.getCuit());
		 			stmt.setString(2, c.getRazon_social());
		 			stmt.setString(3, c.getDireccion());
		 			stmt.setBoolean(4, c.isEstado());
		 			stmt.setString(5, c.getTelefono());
		 			stmt.executeUpdate();
		 			
		 		} catch (SQLException | AppDataException e) {
		 			throw e;
		 		}
		 		finally{
		 			try {
		 			if(rs!=null)rs.close();
		 			if(stmt!=null)stmt.close();
		 			FactoryConexion.getInstancia().releaseConn();
		 			} catch (SQLException e) {
		 			throw e;
		 				}
		 			 }
		 	}
		
		
		public void modificar(Cliente c) throws Exception{
	 		PreparedStatement stmt=null;
	 		
	 		try {
	 			stmt=FactoryConexion.getInstancia().getConn().prepareStatement(
	 					"update clientes set razon_social=?, direccion=?, estado=?,telefono=? "
	 					+ " where cuit=?"
	 					);
	 			stmt.setString(1, c.getRazon_social());
	 			stmt.setString(2, c.getDireccion());
	 			stmt.setBoolean(3, c.isEstado());
	 			stmt.setString(4, c.getTelefono());
	 			stmt.setString(5, c.getCuit());
	 			stmt.executeUpdate();
	 				 			 			
	 		}catch (SQLException | AppDataException e) {
	 			throw e;
	 		}
	 		try {
	 			if(stmt!=null)stmt.close();
	 			FactoryConexion.getInstancia().releaseConn();		
	 		
	 			
	 			
	 		} catch (SQLException e) {
	 			e.printStackTrace();
	 		}
	 	}
		
	
}		 		 
		 
		
	
	
	
	
	
	
	

