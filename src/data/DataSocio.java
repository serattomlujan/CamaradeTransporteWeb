package data;
import java.util.ArrayList;
import java.sql.*;

import util.AppDataException;
import entity.*;


public class DataSocio {
	
	public ArrayList<Socio> getAll() throws Exception{
		Statement stmt=null;
		ResultSet rs=null;
		ArrayList<Socio> socs= new ArrayList<Socio>();
		try {
		 	stmt = FactoryConexion.getInstancia().getConn().createStatement();
		 	rs = stmt.executeQuery("select * from socios s ");
		 	if(rs!=null){
		 		while(rs.next()){
		 			Socio s=new Socio();
		 			s.setDni(rs.getString("dni"));
		 			s.setNombre(rs.getString("nombre"));
		 			s.setApellido(rs.getString("apellido"));
		 			s.setNro_Socio(rs.getInt("nro_socio"));
		 			s.setEstado(rs.getBoolean("estado"));
		 			s.setTelefono(rs.getString("telefono"));
		 		
		 			socs.add(s);
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
				
		return socs;
		}
		 	
		public Socio getByDni(Socio soc) throws Exception{
			Socio s=null;
		 		PreparedStatement stmt=null;
		 		ResultSet rs=null;
		 		try {
		 			stmt=FactoryConexion.getInstancia().getConn().prepareStatement(
		 					"select nro_socio, nombre, apellido, dni, estado,telefono "
		 					+ " from socios s "
		 					+ " where dni=?");
		 			stmt.setString(1, soc.getDni());
		 			rs=stmt.executeQuery();
		 			if(rs!=null && rs.next()){
		 					s=new Socio();
		 					s.setDni(rs.getString("dni"));
				 			s.setNombre(rs.getString("nombre"));
				 			s.setApellido(rs.getString("apellido"));
				 			s.setNro_Socio(rs.getInt("nro_socio"));
				 			s.setEstado(rs.getBoolean("estado"));
				 			s.setTelefono(rs.getString("telefono"));
				 		
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
				
		 return s;
		}
		 	
		public void add(Socio s) throws Exception{
		 		PreparedStatement stmt=null;
		 		ResultSet keyResultSet=null;
		 		try {
		 			stmt=FactoryConexion.getInstancia().getConn().prepareStatement(
		 					"insert into socios(dni, nombre, apellido, estado, telefono) "
		 					+ "values (?,?,?,?,?)",
		 					PreparedStatement.RETURN_GENERATED_KEYS
		 					);
		 			stmt.setString(1, s.getDni());
		 			stmt.setString(2, s.getNombre());
		 			stmt.setString(3, s.getApellido());
		 			stmt.setBoolean(4, s.isEstado());
		 			stmt.setString(5, s.getTelefono());
		 			stmt.executeUpdate();
		 			keyResultSet=stmt.getGeneratedKeys();
		 			if(keyResultSet!=null && keyResultSet.next()){
		 				s.setNro_Socio(keyResultSet.getInt(1));
		 			}
		 		} catch (SQLException | AppDataException e) {
		 			throw e;
		 		}
		 		try {
		 			if(keyResultSet!=null)keyResultSet.close();
		 			if(stmt!=null)stmt.close();
		 			FactoryConexion.getInstancia().releaseConn();
		 		} catch (SQLException e) {
		 			e.printStackTrace();
		 		}
		 	}
		

			
		public void modificar(Socio s) throws Exception{
	 		PreparedStatement stmt=null;
	 		
	 		try {
	 			stmt=FactoryConexion.getInstancia().getConn().prepareStatement(
	 					"update socios set dni=?, nombre=?, apellido=?, estado=?,telefono=? "
	 					+ " where nro_socio=?"
	 					);
	 			stmt.setString(1, s.getDni());
	 			stmt.setString(2, s.getNombre());
	 			stmt.setString(3, s.getApellido());
	 			stmt.setBoolean(4, s.isEstado());;
	 			stmt.setString(5, s.getTelefono());
	 			stmt.setInt(6, s.getNro_Socio());
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
		 
		
	
	
	
	
	
	
	

