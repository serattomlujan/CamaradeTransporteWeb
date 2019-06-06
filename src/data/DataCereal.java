package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.google.gson.JsonObject;

import entity.Cereal;
import entity.Socio;
import util.AppDataException;

public class DataCereal {
	
	public com.google.gson.JsonObject getAll() throws Exception{
		Statement stmt=null;
		ResultSet rs=null;
		com.google.gson.JsonObject gson = new JsonObject();
		try {
		 	stmt = FactoryConexion.getInstancia().getConn().createStatement();
		 	rs = stmt.executeQuery("select * from cereales");
		 	if(rs!=null){
		 		com.google.gson.JsonArray array = new com.google.gson.JsonArray();
		 		while(rs.next()){
		 			JsonObject item = new JsonObject();
		 			item.addProperty("id_cereal", String.valueOf(rs.getInt("id_cereal")));
		 			item.addProperty("descripcion", String.valueOf(rs.getString("descripcion")));
		 			item.addProperty("accion", "<button class='buttonGrilla' type='submit' value='"
							+ rs.getString("descripcion") +"' name='descripcion' >EDITAR CEREAL</button>");
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
	public ArrayList<Cereal> getAll2() throws Exception{
		Statement stmt=null;
		ResultSet rs=null;
		ArrayList<Cereal> cers=new ArrayList<Cereal>();
		try {
		 	stmt = FactoryConexion.getInstancia().getConn().createStatement();
		 	rs = stmt.executeQuery("select * from cereales");
		 	if(rs!=null){
		 		com.google.gson.JsonArray array = new com.google.gson.JsonArray();
		 		while(rs.next()){
		 			Cereal c=new Cereal();
		 			c.setIdcereal(rs.getInt("id_cereal"));
		 			c.setDescripcion(rs.getString("descripcion"));
		 			cers.add(c);
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
				
				return cers;
		}
		 	public Cereal getByDescCereal(Cereal cer) throws Exception{
			Cereal c=null;
		 		PreparedStatement stmt=null;
		 		ResultSet rs=null;
		 		try {
		 			stmt=FactoryConexion.getInstancia().getConn().prepareStatement(
		 					"select id_cereal, descripcion"
		 					+ " from cereales cer "
		 					+ " where descripcion=?");
		 			stmt.setString(1, cer.getDescripcion());
		 			rs=stmt.executeQuery();
		 			if(rs!=null && rs.next()){
		 					c=new Cereal();
		 					c.setIdcereal(rs.getInt("id_cereal"));
				 			c.setDescripcion(rs.getString("descripcion"));
				 			
				 		
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
		 	
		
		public void add(Cereal c) throws Exception{
	 		PreparedStatement stmt=null;
	 		ResultSet keyResultSet=null;
	 		try {
	 			stmt=FactoryConexion.getInstancia().getConn().prepareStatement(
	 					"insert into cereales(descripcion) "
	 					+ "values (?)",
	 					PreparedStatement.RETURN_GENERATED_KEYS
	 					);
	 			stmt.setString(1, c.getDescripcion());
	 			stmt.executeUpdate();
	 			keyResultSet=stmt.getGeneratedKeys();
	 			if(keyResultSet!=null && keyResultSet.next()){
	 				c.setIdcereal(keyResultSet.getInt(1));
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
		
		
		public void modificar(Cereal cer) throws Exception{
	 		PreparedStatement stmt=null;
	 		
	 		try {
	 			stmt=FactoryConexion.getInstancia().getConn().prepareStatement(
	 					"update cereales set descripcion=?"
	 					+ " where id_cereal=?"
	 					);
	 			stmt.setString(1, cer.getDescripcion());
	 			stmt.setInt(2, cer.getIdcereal());
	 	
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
