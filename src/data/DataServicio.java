package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.logging.log4j.Level;

import entity.Camion;
import entity.Cereal;
import entity.Cliente;
import entity.PrecioKM;
import entity.Servicio;
import entity.Socio;
import util.AppDataException;

public class DataServicio {
	public ArrayList<Servicio> getAll() throws Exception {
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Servicio> servs = new ArrayList<Servicio>();
		try {
			stmt = FactoryConexion.getInstancia().getConn().createStatement();
			rs = stmt.executeQuery("SELECT *  from servicios s inner join cereales c "
					+ "on s.id_cereal=c.id_cereal inner join clientes cl on s.cuit=cl.cuit inner join camiones ca "
					+ "on s.id_camion=ca.id_camion");
			if (rs != null) {
				while (rs.next()) {
					Servicio s = new Servicio();
					s.setCamion(new Camion());
					s.setCereal(new Cereal());
					s.setCliente(new Cliente());
					s.setPrecio(new PrecioKM());
					s.setIdservicio(rs.getInt("id_servicio"));
					s.setFecha(rs.getDate("fecha"));
					s.setHora(rs.getTime("hora"));
					s.setCant_toneladas(rs.getFloat("cant_toneladas"));
					s.setKm_transportados(rs.getInt("nro_km"));
					s.setObservaciones(rs.getString("observacion"));
					s.getCamion().setIdcamion(rs.getInt("id_camion"));
					s.getCamion().setPatente(rs.getString("patente"));
					s.getCereal().setIdcereal(rs.getInt("id_cereal"));
					s.getCereal().setDescripcion(rs.getString("descripcion"));
					s.getCliente().setCuit(rs.getString("cuit"));
					s.getCliente().setRazon_social(rs.getString("razon_social"));
					s.getPrecio().setNro_km(rs.getInt("nro_km"));
					s.setPrecio_servicio(rs.getFloat("precio_servicio"));

					servs.add(s);
				}
			}
		} catch (SQLException e) {
			throw e;
		} catch (AppDataException ade) {
			throw ade;
		}
		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			FactoryConexion.getInstancia().releaseConn();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return servs;
	}
	public Servicio getById(int id_servicio) throws Exception{
    	Servicio s = null ;
    	PreparedStatement stmt= null;
    	ResultSet rs=null;
    	try {
    		 stmt= FactoryConexion.getInstancia().getConn().prepareStatement( "select * from servicios s inner join cereales c "
					+ "on s.id_cereal=c.id_cereal inner join clientes cl on s.cuit=cl.cuit inner join camiones ca "
					+ "on s.id_camion=ca.id_camion where s.id_servicio=?");
    		 stmt.setInt(1, id_servicio);
    		 rs=stmt.executeQuery();
    		 if(rs!=null && rs.next()){
    			 s=new Servicio();
    			 s.setCamion(new Camion());
					s.setCereal(new Cereal());
					s.setCliente(new Cliente());
					s.setPrecio(new PrecioKM());
					s.setIdservicio(rs.getInt("id_servicio"));
					s.setFecha(rs.getDate("fecha"));
					s.setHora(rs.getTime("hora"));
					s.setCant_toneladas(rs.getFloat("cant_toneladas"));
					s.setKm_transportados(rs.getInt("nro_km"));
					s.setObservaciones(rs.getString("observacion"));
					s.getCamion().setIdcamion(rs.getInt("id_camion"));
					s.getCamion().setPatente(rs.getString("patente"));
					s.getCereal().setIdcereal(rs.getInt("id_cereal"));
					s.getCereal().setDescripcion(rs.getString("descripcion"));
					s.getCliente().setCuit(rs.getString("cuit"));
					s.getCliente().setRazon_social(rs.getString("razon_social"));
					s.getPrecio().setNro_km(rs.getInt("nro_km"));
					s.setPrecio_servicio(rs.getFloat("precio_servicio"));
    		 }
    		 
    	} catch (SQLException e) {
			AppDataException ade=new AppDataException(e, "Error al recuperar Persona.\n"+e.getSQLState()+":"+e.getMessage(), Level.WARN);
			throw ade;
		} catch (AppDataException ade){
			throw ade;
		}finally {
    		try{
    			if(rs!=null)rs.close();
    			if (stmt!=null)stmt.close();
    			FactoryConexion.getInstancia().releaseConn();
    		} catch (SQLException e) {
    			AppDataException ade=new AppDataException(e, "Error.\n"+e.getSQLState()+":"+e.getMessage(), Level.WARN);
    			throw ade;
    		}
    	} return s;
    	
    }
	public void add(Servicio s) throws Exception {
		PreparedStatement stmt=null;
 		ResultSet keyResultSet=null;
 		try {
 			stmt=FactoryConexion.getInstancia().getConn().prepareStatement(
 					"insert into servicios(id_cereal, cuit, id_camion, fecha, hora) "
 					+ "values (?,?,?,?,?)",
 					PreparedStatement.RETURN_GENERATED_KEYS
 					);
 			stmt.setInt(1, s.getCereal().getIdcereal());
 			stmt.setString(2, s.getCliente().getCuit());
 			stmt.setInt(3, s.getCamion().getIdcamion());
 			stmt.setDate(4, s.getFecha());
 			stmt.setTime(5, s.getHora());
 			stmt.executeUpdate();
 			keyResultSet=stmt.getGeneratedKeys();
 			if(keyResultSet!=null && keyResultSet.next()){
 				s.setIdservicio(keyResultSet.getInt(1));
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
//	public void add(Camion c) throws Exception{
// 		PreparedStatement stmt=null;
// 		ResultSet keyResultSet=null;
// 		try {
// 			stmt=FactoryConexion.getInstancia().getConn().prepareStatement(
// 					"insert into camiones(patente, marca, modelo, estado, fecha_ingreso, nro_socio) "
// 					+ "values (?,?,?,?,?,?)",
// 					PreparedStatement.RETURN_GENERATED_KEYS
// 					);
// 			stmt.setString(1, c.getPatente());
// 			stmt.setString(2, c.getMarca());
// 			stmt.setString(3, c.getModelo());
// 			stmt.setBoolean(4, c.isEstado());
// 			stmt.setDate(5, c.getFecha_ingreso());
// 			stmt.setInt(6, c.getSocio().getNro_Socio());
// 			stmt.executeUpdate();
// 			keyResultSet=stmt.getGeneratedKeys();
// 			if(keyResultSet!=null && keyResultSet.next()){
// 				c.setIdcamion(keyResultSet.getInt(1));
// 			}
// 		} catch (SQLException | AppDataException e) {
// 			throw e;
// 		}
// 		try {
// 			if(keyResultSet!=null)keyResultSet.close();
// 			if(stmt!=null)stmt.close();
// 			FactoryConexion.getInstancia().releaseConn();
// 		} catch (SQLException e) {
// 			e.printStackTrace();
// 		}
// 	}
	public void update(Servicio s) throws Exception{
 		PreparedStatement stmt=null;
 		
 		try {
 			stmt=FactoryConexion.getInstancia().getConn().prepareStatement(
 					"update servicios set cant_toneladas=?, nro_km=?, precio_servicio=?, observacion=? "
 					+ " where id_servicio=?"
 					);
 			stmt.setFloat(1, s.getCant_toneladas());
 			stmt.setInt(2, s.getKm_transportados());
 			stmt.setFloat(3, s.getPrecio_servicio());
 			stmt.setString(4, s.getObservaciones());
 			stmt.setInt(5, s.getIdservicio());
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
