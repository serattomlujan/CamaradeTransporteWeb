package data;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.logging.log4j.Level;

import entity.Administrador;
import util.AppDataException;

public class DataAdministrador {
	public Administrador getValidacionUsario(Administrador adm) throws Exception{ 
		Administrador a = null ;
		PreparedStatement stmt= null;
		ResultSet rs=null;
		try {
			 stmt= FactoryConexion.getInstancia().getConn().prepareStatement( "select * from administradores a where  a.usuario= ? and a.contraseña=? ");
			 stmt.setString(1,adm.getUsuario());
			 stmt.setString(2,adm.getContraseña());
			 rs=stmt.executeQuery();
			 if(rs!=null && rs.next()){
				 a= new Administrador();
				 a.setUsuario(rs.getString("usuario"));
				 a.setContraseña(rs.getString("contraseña"));
			 } 
		} catch (SQLException e) {
			AppDataException ade=new AppDataException(e, "Error al validar persona.\n"+e.getSQLState()+":"+e.getMessage(), Level.WARN);
			throw ade;
		} catch (AppDataException ade){
			throw ade;
		}
		 finally {
		    		try{
		    			if(rs!=null)rs.close();
		    			if (stmt!=null)stmt.close();
		    			FactoryConexion.getInstancia().releaseConn();
		    		}catch (SQLException e ){
		    			throw e;
		    		}
		    	} return a;
		} 
	public Administrador BuscarAdministrador(Administrador adm) throws Exception{ 
		Administrador a = null ;
		PreparedStatement stmt= null;
		ResultSet rs=null;
		try {
			 stmt= FactoryConexion.getInstancia().getConn().prepareStatement( "select * from administradores a where  a.correo=?");
			 stmt.setString(1,adm.getCorreo());
			 rs=stmt.executeQuery();
			 if(rs!=null && rs.next()){
				 a= new Administrador();
				 a.setUsuario(rs.getString("usuario"));
				 a.setContraseña(rs.getString("contraseña"));
				 a.setNombre(rs.getString("nombre"));
				 a.setApellido(rs.getString("apellido"));
				 a.setCorreo(rs.getString("correo"));
				 a.setPreguntaSecreta(rs.getString("pregunta_secreta"));
			 } 
		} catch (SQLException e) {
			AppDataException ade=new AppDataException(e, "Error al validar persona.\n"+e.getSQLState()+":"+e.getMessage(), Level.WARN);
			throw ade;
		} catch (AppDataException ade){
			throw ade;
		}
		 finally {
		    		try{
		    			if(rs!=null)rs.close();
		    			if (stmt!=null)stmt.close();
		    			FactoryConexion.getInstancia().releaseConn();
		    		}catch (SQLException e ){
		    			throw e;
		    		}
		    	} return a;
	}    	
		    	public Administrador validarPregunta(Administrador adm) throws Exception{ 
		    		Administrador a = null ;
		    		PreparedStatement stmt= null;
		    		ResultSet rs=null;
		    		try {
		    			 stmt= FactoryConexion.getInstancia().getConn().prepareStatement( "select * from administradores a where  a.pregunta_secreta= ?");
		    			 stmt.setString(1,adm.getPreguntaSecreta());
		    			 rs=stmt.executeQuery();
		    			 if(rs!=null && rs.next()){
		    				 a= new Administrador();
		    				 a.setUsuario(rs.getString("usuario"));
		    				 a.setContraseña(rs.getString("contraseña"));
		    				 a.setNombre(rs.getString("nombre"));
		    				 a.setApellido(rs.getString("apellido"));
		    				 a.setCorreo(rs.getString("correo"));
		    				 a.setPreguntaSecreta(rs.getString("pregunta_secreta"));
		    			 } 
		    		} catch (SQLException e) {
		    			AppDataException ade=new AppDataException(e, "Error al validar persona.\n"+e.getSQLState()+":"+e.getMessage(), Level.WARN);
		    			throw ade;
		    		} catch (AppDataException ade){
		    			throw ade;
		    		}
		    		 finally {
		    		    		try{
		    		    			if(rs!=null)rs.close();
		    		    			if (stmt!=null)stmt.close();
		    		    			FactoryConexion.getInstancia().releaseConn();
		    		    		}catch (SQLException e ){
		    		    			throw e;
		    		    		}
		    		    	} return a;
		} 
}
