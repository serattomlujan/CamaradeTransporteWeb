package data;

import java.sql.*;

import com.google.gson.JsonObject;

import entity.*;
import util.AppDataException;

public class DataCamion {
	
	public com.google.gson.JsonObject getAll() throws Exception{
		Statement stmt=null;
		ResultSet rs=null;
		com.google.gson.JsonObject gson = new JsonObject();
		try {
		 	stmt = FactoryConexion.getInstancia().getConn().createStatement();

		 	rs = stmt.executeQuery("select * from camiones inner join socios on camiones.nro_socio=socios.nro_socio ");
		 	if(rs!=null){
		 		com.google.gson.JsonArray array = new com.google.gson.JsonArray();
		 		while(rs.next()){
		 			JsonObject item = new JsonObject();
		 			item.addProperty("id_camion", String.valueOf(rs.getInt("id_camion")));
		 			item.addProperty("patente", String.valueOf(rs.getString("patente")));
		 			item.addProperty("modelo", String.valueOf(rs.getString("modelo")));
		 			item.addProperty("marca", String.valueOf(rs.getString("marca")));
		 			item.addProperty("estado", String.valueOf(rs.getBoolean("estado")));
		 			item.addProperty("fecha_ingreso", String.valueOf(rs.getDate("fecha_ingreso")));
		 			item.addProperty("nro_socio", String.valueOf(rs.getInt("nro_socio")));
		 			item.addProperty("apellido", String.valueOf(rs.getString("apellido")));
		 			item.addProperty("nombre", String.valueOf(rs.getString("nombre")));
		 			array.add(item);
		 						}
		 		gson.add("datos", array);
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
				
		return gson;
		}
		
		public Camion getByPatente(Camion cam) throws Exception{
			Camion c=null;
		 		PreparedStatement stmt=null;
		 		ResultSet rs=null;
		 		try {
		 			stmt=FactoryConexion.getInstancia().getConn().prepareStatement(
		 					"select c.id_camion, c.patente, c.marca, c.modelo, c.estado, c.fecha_ingreso, s.nro_socio, s.dni, s.apellido, s.nombre"
		 					+ " from camiones c inner join socios s on c.nro_socio=s.nro_socio "
		 					+ " where patente=?");
		 			stmt.setString(1, cam.getPatente());
		 		
		 			rs=stmt.executeQuery();
		 			if(rs!=null && rs.next()){
		 					c=new Camion();
		 					c.setSocio(new Socio());
		 					c.setIdcamion(rs.getInt("id_camion"));
				 			c.setPatente(rs.getString("patente"));
				 			c.setModelo(rs.getString("modelo"));
				 			c.setMarca(rs.getString("marca"));
				 			c.setEstado(rs.getBoolean("estado"));
				 			c.setFecha_ingreso(rs.getDate("fecha_ingreso"));
				 			c.getSocio().setNro_Socio(rs.getInt("nro_socio"));
				 			c.getSocio().setDni(rs.getString("dni"));
				 			c.getSocio().setApellido(rs.getString("apellido"));
				 			c.getSocio().setNombre(rs.getString("nombre"));
				 			
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
		 	
		public void add(Camion c) throws Exception{
	 		PreparedStatement stmt=null;
	 		ResultSet keyResultSet=null;
	 		try {
	 			stmt=FactoryConexion.getInstancia().getConn().prepareStatement(
	 					"insert into camiones(patente, marca, modelo, estado, fecha_ingreso, nro_socio) "
	 					+ "values (?,?,?,?,?,?)",
	 					PreparedStatement.RETURN_GENERATED_KEYS
	 					);
	 			stmt.setString(1, c.getPatente());
	 			stmt.setString(2, c.getMarca());
	 			stmt.setString(3, c.getModelo());
	 			stmt.setBoolean(4, c.isEstado());
	 			stmt.setDate(5, c.getFecha_ingreso());
	 			stmt.setInt(6, c.getSocio().getNro_Socio());
	 			stmt.executeUpdate();
	 			keyResultSet=stmt.getGeneratedKeys();
	 			if(keyResultSet!=null && keyResultSet.next()){
	 				c.setIdcamion(keyResultSet.getInt(1));
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
		
		public void modificar(Camion cam) throws Exception{
	 		PreparedStatement stmt=null;
	 		
	 		try {
	 			stmt=FactoryConexion.getInstancia().getConn().prepareStatement(
	 					"update camiones set patente=?, marca=?, modelo=?, estado=?, fecha_ingreso=?, nro_socio=?"
	 					+ " where id_camion=?"
	 					);
	 			
	 			stmt.setString(1, cam.getPatente());
	 			stmt.setString(2, cam.getMarca());
	 			stmt.setString(3, cam.getModelo());
	 			stmt.setBoolean(4, cam.isEstado());
       			stmt.setDate(5, cam.getFecha_ingreso());
	 			stmt.setInt(6, cam.getSocio().getNro_Socio());
	 			stmt.setInt(7, cam.getIdcamion());
	 			
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
					
		public Camion asignarCamion() throws Exception{
		 		PreparedStatement stmt=null;
		 		ResultSet rs=null;
		 		Camion c=null;
		 		try {
		 			stmt=FactoryConexion.getInstancia().getConn().prepareStatement(
		 					"select * from camiones where estado=1 order by fecha_ingreso limit 1");
		 		
		 			rs=stmt.executeQuery();
		 			if(rs!=null && rs.next()){
		 					c=new Camion();
		 					c.setSocio(new Socio());
		 					c.setIdcamion(rs.getInt("id_camion"));
				 			c.setPatente(rs.getString("patente"));
				 			c.setModelo(rs.getString("modelo"));
				 			c.setMarca(rs.getString("marca"));
				 			c.setEstado(rs.getBoolean("estado"));
				 			c.setFecha_ingreso(rs.getDate("fecha_ingreso"));
				 			c.getSocio().setNro_Socio(rs.getInt("nro_socio"));
				 			
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
			
		

}
