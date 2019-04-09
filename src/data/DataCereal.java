package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entity.Cereal;
import util.AppDataException;

public class DataCereal {
	
	public ArrayList<Cereal> getAll() throws Exception{
		Statement stmt=null;
		ResultSet rs=null;
		ArrayList<Cereal> cers= new ArrayList<Cereal>();
		try {
		 	stmt = FactoryConexion.getInstancia().getConn().createStatement();
		 	rs = stmt.executeQuery("select * from cereales cer ");
		 	if(rs!=null){
		 		while(rs.next()){
		 			Cereal cer=new Cereal();
		 			cer.setIdcereal(rs.getInt("id_cereal"));
		 			cer.setDescripcion(rs.getString("descripcion"));
		 		    cers.add(cer);
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
		 	
		public Cereal getByIdCereal(Cereal c) throws Exception{
			Cereal cer=null;
		 		PreparedStatement stmt=null;
		 		ResultSet rs=null;
		 		try {
		 			stmt=FactoryConexion.getInstancia().getConn().prepareStatement(
		 					"select id_cereal, descripcion"
		 					+ " from cereales cer "
		 					+ " where id_cereal=?");
		 			//stmt(1, cer.getIdcereal());
		 			rs=stmt.executeQuery();
		 			if(rs!=null && rs.next()){
		 					cer=new Cereal();
		 					cer.setIdcereal(rs.getInt("id_cereal"));
				 			cer.setDescripcion(rs.getString("descripcion"));
				 			
				 		
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
				
		 return cer;
		}
		 	
		public void add(Cereal cer) throws Exception{
		 		PreparedStatement stmt=null;
		 		ResultSet rs=null;
		 		try {
		 			stmt=FactoryConexion.getInstancia().getConn().prepareStatement(
		 					"insert into cereales(id_cereal, descripcion) "
		 					+ "values (?,?,?,?,?)");
		 			stmt.setInt(1, cer.getIdcereal());
		 			stmt.setString(2, cer.getDescripcion());
		 			
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
		
		
		public void modificar(Cereal cer) throws Exception{
	 		PreparedStatement stmt=null;
	 		
	 		try {
	 			stmt=FactoryConexion.getInstancia().getConn().prepareStatement(
	 					"update cereales set  descripcion=?"
	 					+ " where id_cereal=?"
	 					);
	 			stmt.setInt(1, cer.getIdcereal());
	 			stmt.setString(2, cer.getDescripcion());
	 	
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
