package data;

import java.util.Calendar;
import java.sql.*;
import java.util.Date;

import entity.*;
import java.util.ArrayList;
import util.AppDataException;

public class DataCamion {
	
	public ArrayList<Camion> getAll() throws Exception{
		Statement stmt=null;
		ResultSet rs=null;
		ArrayList<Camion> cams= new ArrayList<Camion>();
		try {
		 	stmt = FactoryConexion.getInstancia().getConn().createStatement();
		 	rs = stmt.executeQuery("select * from camiones as cam ");
		 	if(rs!=null){
		 		while(rs.next()){
		 			Camion cam=new Camion();
		 			cam.setIdcamion(rs.getInt("id_camion"));
		 			cam.setPatente(rs.getString("patente"));
		 			cam.setModelo(rs.getString("modelo"));
		 			cam.setMarca(rs.getString("marca"));
		 			cam.setEstado(rs.getBoolean("estado"));
//		 			cam.setFecha_ingreso(rs.getDate("fecha_ingreso"));
//		 			cam.getSocio().setNro_Socio(rs.getInt("nro_socio"));
	 			
		 			cams.add(cam);
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
				
		return cams;
		}
		 	
//		public Camion getByIdCamion(Camion cam) throws Exception{
//			Camion c=null;
//		 		PreparedStatement stmt=null;
//		 		ResultSet rs=null;
//		 		try {
//		 			stmt=FactoryConexion.getInstancia().getConn().prepareStatement(
//		 					"select cuit, razon_social, direccion, telefono, estado "
//		 					+ " from clientes c "
//		 					+ " where cuit=?");
//		 			stmt.setInt(1, cam.getIdcamion());
//		 			rs=stmt.executeQuery();
//		 			if(rs!=null && rs.next()){
//		 					cam=new Camion();
//		 					cam.setIdcamion(rs.getInt("id_camion"));
//				 			cam.setPatente(rs.getString("patente"));
//				 			cam.setModelo(rs.getString("modelo"));
//				 			cam.setMarca(rs.getString("marca"));
//				 			cam.setEstado(rs.getBoolean("estado"));
////				 			cam.setFecha_ingreso(rs.getDate("fecha_ingreso"));
////				 			cam.getSocio().setNro_Socio(rs.getInt("nro_Socio"));
//				 			
//				 		}
//		 			
//		} catch (Exception e) {
//		throw e;
//		}
//		finally{
//		try {
//		if(rs!=null)rs.close();
//		if(stmt!=null)stmt.close();
//		FactoryConexion.getInstancia().releaseConn();
//		} catch (SQLException e) {
//		throw e;
//			}
//		 }
//				
//		 return c;
//		}
		
		public Camion getByPatente(Camion cam) throws Exception{
			Camion c=null;
		 		PreparedStatement stmt=null;
		 		ResultSet rs=null;
		 		try {
		 			stmt=FactoryConexion.getInstancia().getConn().prepareStatement(
		 					"select id_camion,patente, marca, modelo, estado "
		 					+ " from clientes c "
		 					+ " where patente=?");
		 			stmt.setString(1, cam.getPatente());
		 		
		 			rs=stmt.executeQuery();
		 			if(rs!=null && rs.next()){
		 					cam=new Camion();
		 					cam.setIdcamion(rs.getInt("id_camion"));
				 			cam.setPatente(rs.getString("patente"));
				 			cam.setModelo(rs.getString("modelo"));
				 			cam.setMarca(rs.getString("marca"));
				 			cam.setEstado(rs.getBoolean("estado"));
//				 			cam.setFecha_ingreso(rs.getDate("fecha_ingreso"));
//				 			cam.getSocio().setNro_Socio(rs.getInt("nro_Socio"));
				 			
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
		 	
		public void add(Camion cam) throws Exception{
		 		PreparedStatement stmt=null;
		 		ResultSet rs=null;
		 		try {
		 			stmt=FactoryConexion.getInstancia().getConn().prepareStatement(
		 					"insert into camiones(id_camion, patente, marca, modelo, estado) "
		 					+ "values (?,?,?,?,?)");
		 			stmt.setInt(1, cam.getIdcamion());
		 			stmt.setString(2, cam.getPatente());
		 			stmt.setString(3, cam.getMarca());
		 			stmt.setString(4, cam.getModelo());
		 			stmt.setBoolean(5, cam.isEstado());
//		 			stmt.setDate(6, cam.getFecha_ingreso());
//     	 			stmt.setInt(7, cam.getSocio().getNro_Socio());
		 			
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
		
		
		public void modificar(Camion cam) throws Exception{
	 		PreparedStatement stmt=null;
	 		
	 		try {
	 			stmt=FactoryConexion.getInstancia().getConn().prepareStatement(
	 					"update camiones set id_camion=?, patente=?, marca=?,modelo=?,estado=?"
	 					+ " where cuit=?"
	 					);
	 			stmt.setInt(1, cam.getIdcamion());
	 			stmt.setString(2, cam.getPatente());
	 			stmt.setString(3, cam.getMarca());
	 			stmt.setString(4, cam.getModelo());
	 			stmt.setBoolean(5, cam.isEstado());
//       			stmt.setDate(6, cam.getFecha_ingreso());
//	 			stmt.setInt(7, cam.getSocio().getNro_Socio());
//	 			
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
