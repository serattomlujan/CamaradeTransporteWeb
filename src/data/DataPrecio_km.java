package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.logging.log4j.Level;

import entity.Precio;
import util.AppDataException;

public class DataPrecio_km {
	public void add(Precio p) throws Exception{
 		PreparedStatement stmt=null;
 		try {
 			stmt=FactoryConexion.getInstancia().getConn().prepareStatement(
 					"insert into precio_km(nro_km, valor) "
 					+ "values (?,?)");
 			stmt.setInt(1, p.getNro_km());
 			stmt.setFloat(2, p.getPrecio());
 			stmt.executeUpdate();
 			
 		} catch (SQLException | AppDataException e) {
 			throw e;
 		}
 		
 	}
	public void delete() throws Exception{
		PreparedStatement stmt=null;		
		try {
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement(
					"delete from precio_km");
			stmt.execute();
		}  catch (SQLException e) {
			AppDataException ade=new AppDataException(e, "Error al eliminar persona.\n"+e.getSQLState()+":"+e.getMessage(), Level.WARN);
			throw ade;
		} catch (AppDataException ade){
			throw ade;
		}
		
		
	}
}
