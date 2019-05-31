package data;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.logging.log4j.Level;

import com.google.gson.JsonObject;

import entity.Camion;
import entity.Cereal;
import entity.Cliente;
import entity.PrecioKM;
import entity.Servicio;
import entity.Socio;
import util.AppDataException;

public class DataServicio {

	public com.google.gson.JsonObject getServiciosSinFinalizar() throws Exception {
		Statement stmt = null;
		ResultSet rs = null;
		com.google.gson.JsonObject gson = new JsonObject();
		try {
			stmt = FactoryConexion.getInstancia().getConn().createStatement();
			rs = stmt.executeQuery("SELECT *  from servicios s inner join cereales c "
					+ "on s.id_cereal=c.id_cereal inner join clientes cl on s.cuit=cl.cuit inner join camiones ca "
					+ "on s.id_camion=ca.id_camion where s.precio_servicio is null");
			if (rs != null) {
				String datos = "";

				com.google.gson.JsonArray array = new com.google.gson.JsonArray();
				while (rs.next()) {

					JsonObject item = new JsonObject();
					item.addProperty("id_servicio", String.valueOf(rs.getInt("id_servicio")));
					item.addProperty("cereal", rs.getString("descripcion"));
					item.addProperty("cuit", rs.getString("cuit"));
					item.addProperty("razon_social", rs.getString("razon_social"));
					item.addProperty("id_camion", String.valueOf(rs.getInt("id_camion")));
					item.addProperty("patente", rs.getString("patente"));
					item.addProperty("fecha", String.valueOf(rs.getDate("fecha")));
					item.addProperty("hora", String.valueOf(rs.getTime("hora")));
					item.addProperty("cant_toneladas", String.valueOf(rs.getFloat("cant_toneladas")));
					item.addProperty("km_transportados", String.valueOf(rs.getInt("nro_km")));
					item.addProperty("precio_servicio", String.valueOf(rs.getFloat("precio_servicio")));
					item.addProperty("accion", "<button class='buttonGrilla' type='submit' value='"
							+ rs.getInt("id_servicio") + "' id='servicio' name='servicio'>EDITAR SERVICIO</button>");
					array.add(item);

				}
				gson.add("datos", array);

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

		return gson;
	}

	public com.google.gson.JsonObject getServiciosFinalizados() throws Exception {
		Statement stmt = null;
		ResultSet rs = null;
		com.google.gson.JsonObject gson = new JsonObject();
		try {
			stmt = FactoryConexion.getInstancia().getConn().createStatement();
			rs = stmt.executeQuery("SELECT *  from servicios s inner join cereales c "
					+ "on s.id_cereal=c.id_cereal inner join clientes cl on s.cuit=cl.cuit inner join camiones ca "
					+ "on s.id_camion=ca.id_camion where s.precio_servicio is not null");
			if (rs != null) {
				String datos = "";

				com.google.gson.JsonArray array = new com.google.gson.JsonArray();
				while (rs.next()) {

					JsonObject item = new JsonObject();
					item.addProperty("id_servicio", String.valueOf(rs.getInt("id_servicio")));
					item.addProperty("cereal", rs.getString("descripcion"));
					item.addProperty("cuit", rs.getString("cuit"));
					item.addProperty("razon_social", rs.getString("razon_social"));
					item.addProperty("id_camion", String.valueOf(rs.getInt("id_camion")));
					item.addProperty("patente", rs.getString("patente"));
					item.addProperty("fecha", String.valueOf(rs.getDate("fecha")));
					item.addProperty("hora", String.valueOf(rs.getTime("hora")));
					item.addProperty("cant_toneladas", String.valueOf(rs.getFloat("cant_toneladas")));
					item.addProperty("km_transportados", String.valueOf(rs.getInt("nro_km")));
					item.addProperty("precio_servicio", String.valueOf(rs.getFloat("precio_servicio")));
					array.add(item);

				}
				gson.add("datos", array);

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

		return gson;
	}

	public com.google.gson.JsonObject getInformeCereal(Date fechaDesde, Date fechaHasta) throws Exception {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		com.google.gson.JsonObject gson = new JsonObject();
		try {
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement(
					"select s.id_cereal,c.descripcion,count(s.id_servicio) as cant_servicio, sum(s.cant_toneladas) as cant_toneladas, "
							+ "sum(s.nro_km) as cant_km from servicios s inner join cereales c on s.id_cereal=c.id_cereal "
							+ "where s.precio_servicio is not null and s.fecha between ? and ? group by s.id_cereal;");
			stmt.setDate(1, fechaDesde);
			stmt.setDate(2, fechaHasta);
			rs = stmt.executeQuery();
			if (rs != null) {
				// String datos = "";

				com.google.gson.JsonArray array = new com.google.gson.JsonArray();
				while (rs.next()) {

					JsonObject item = new JsonObject();
					item.addProperty("string1", String.valueOf(rs.getInt("id_cereal")));
					item.addProperty("string2", rs.getString("descripcion"));
					item.addProperty("cant_servicio", String.valueOf(rs.getInt("cant_servicio")));
					item.addProperty("cant_toneladas", String.valueOf(rs.getFloat("cant_toneladas")));
					item.addProperty("cant_km", String.valueOf(rs.getInt("cant_km")));
					array.add(item);

				}
				gson.add("datos", array);

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

		return gson;
	}

	public com.google.gson.JsonObject getInformeCamion(Date fechaDesde, Date fechaHasta) throws Exception {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		com.google.gson.JsonObject gson = new JsonObject();
		try {
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement(
					"select s.id_camion,c.patente,count(s.id_servicio) as cant_servicio, sum(s.cant_toneladas) as cant_toneladas, "
							+ "sum(s.nro_km) as cant_km from servicios s inner join camiones c on s.id_camion=c.id_camion "
							+ "where s.precio_servicio is not null and s.fecha between ? and ? group by s.id_camion;");
			stmt.setDate(1, fechaDesde);
			stmt.setDate(2, fechaHasta);
			rs = stmt.executeQuery();
			if (rs != null) {
				// String datos = "";

				com.google.gson.JsonArray array = new com.google.gson.JsonArray();
				while (rs.next()) {

					JsonObject item = new JsonObject();
					item.addProperty("string1", String.valueOf(rs.getInt("id_camion")));
					item.addProperty("string2", rs.getString("patente"));
					item.addProperty("cant_servicio", String.valueOf(rs.getInt("cant_servicio")));
					item.addProperty("cant_toneladas", String.valueOf(rs.getFloat("cant_toneladas")));
					item.addProperty("cant_km", String.valueOf(rs.getInt("cant_km")));
					array.add(item);

				}
				gson.add("datos", array);

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

		return gson;
	}

	public com.google.gson.JsonObject getInformeSocio(Date fechaDesde, Date fechaHasta) throws Exception {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		com.google.gson.JsonObject gson = new JsonObject();
		try {
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement(
					"select so.dni,so.nombre,so.apellido,count(s.id_servicio) as cant_servicio, sum(s.cant_toneladas) as cant_toneladas, "
							+ "sum(s.nro_km) as cant_km from servicios s inner join camiones c on s.id_camion=c.id_camion inner join socios so "
							+ "on c.nro_socio=so.nro_socio where s.precio_servicio is not null and s.fecha between ? and ? group by so.dni;");
			stmt.setDate(1, fechaDesde);
			stmt.setDate(2, fechaHasta);
			rs = stmt.executeQuery();
			if (rs != null) {
				// String datos = "";

				com.google.gson.JsonArray array = new com.google.gson.JsonArray();
				while (rs.next()) {

					JsonObject item = new JsonObject();
					item.addProperty("string1", String.valueOf(rs.getInt("dni")));
					item.addProperty("string2", rs.getString("nombre")+", "+rs.getString("apellido"));
					item.addProperty("cant_servicio", String.valueOf(rs.getInt("cant_servicio")));
					item.addProperty("cant_toneladas", String.valueOf(rs.getFloat("cant_toneladas")));
					item.addProperty("cant_km", String.valueOf(rs.getInt("cant_km")));
					array.add(item);

				}
				gson.add("datos", array);

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

		return gson;
	}

	public com.google.gson.JsonObject getInformeCliente(Date fechaDesde, Date fechaHasta) throws Exception {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		com.google.gson.JsonObject gson = new JsonObject();
		try {
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement(
					"select c.cuit,c.razon_social,count(s.id_servicio) as cant_servicio, sum(s.cant_toneladas) as cant_toneladas, "
							+ "sum(s.nro_km) as cant_km from servicios s inner join clientes c on s.cuit=c.cuit "
							+ "where s.precio_servicio is not null and s.fecha between ? and ? group by c.cuit;");
			stmt.setDate(1, fechaDesde);
			stmt.setDate(2, fechaHasta);
			rs = stmt.executeQuery();
			if (rs != null) {
				// String datos = "";

				com.google.gson.JsonArray array = new com.google.gson.JsonArray();
				while (rs.next()) {

					JsonObject item = new JsonObject();
					item.addProperty("string1", rs.getString("cuit"));
					item.addProperty("string2", rs.getString("razon_social"));
					item.addProperty("cant_servicio", String.valueOf(rs.getInt("cant_servicio")));
					item.addProperty("cant_toneladas", String.valueOf(rs.getFloat("cant_toneladas")));
					item.addProperty("cant_km", String.valueOf(rs.getInt("cant_km")));
					array.add(item);

				}
				gson.add("datos", array);

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

		return gson;
	}

	public Servicio getById(int id_servicio) throws Exception {
		Servicio s = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt = FactoryConexion.getInstancia().getConn()
					.prepareStatement("select * from servicios s inner join cereales c "
							+ "on s.id_cereal=c.id_cereal inner join clientes cl on s.cuit=cl.cuit inner join camiones ca "
							+ "on s.id_camion=ca.id_camion where s.id_servicio=?");
			stmt.setInt(1, id_servicio);
			rs = stmt.executeQuery();
			if (rs != null && rs.next()) {
				s = new Servicio();
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
			AppDataException ade = new AppDataException(e,
					"Error al recuperar Persona.\n" + e.getSQLState() + ":" + e.getMessage(), Level.WARN);
			throw ade;
		} catch (AppDataException ade) {
			throw ade;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				FactoryConexion.getInstancia().releaseConn();
			} catch (SQLException e) {
				AppDataException ade = new AppDataException(e, "Error.\n" + e.getSQLState() + ":" + e.getMessage(),
						Level.WARN);
				throw ade;
			}
		}
		return s;

	}

	public void add(Servicio s) throws Exception {
		PreparedStatement stmt = null;
		ResultSet keyResultSet = null;
		try {
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement(
					"insert into servicios(id_cereal, cuit, id_camion, fecha, hora) " + "values (?,?,?,?,?)",
					PreparedStatement.RETURN_GENERATED_KEYS);
			stmt.setInt(1, s.getCereal().getIdcereal());
			stmt.setString(2, s.getCliente().getCuit());
			stmt.setInt(3, s.getCamion().getIdcamion());
			stmt.setDate(4, s.getFecha());
			stmt.setTime(5, s.getHora());
			stmt.executeUpdate();
			keyResultSet = stmt.getGeneratedKeys();
			if (keyResultSet != null && keyResultSet.next()) {
				s.setIdservicio(keyResultSet.getInt(1));
			}
		} catch (SQLException | AppDataException e) {
			throw e;
		}
		try {
			if (keyResultSet != null)
				keyResultSet.close();
			if (stmt != null)
				stmt.close();
			FactoryConexion.getInstancia().releaseConn();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	// public void add(Camion c) throws Exception{
	// PreparedStatement stmt=null;
	// ResultSet keyResultSet=null;
	// try {
	// stmt=FactoryConexion.getInstancia().getConn().prepareStatement(
	// "insert into camiones(patente, marca, modelo, estado, fecha_ingreso,
	// nro_socio) "
	// + "values (?,?,?,?,?,?)",
	// PreparedStatement.RETURN_GENERATED_KEYS
	// );
	// stmt.setString(1, c.getPatente());
	// stmt.setString(2, c.getMarca());
	// stmt.setString(3, c.getModelo());
	// stmt.setBoolean(4, c.isEstado());
	// stmt.setDate(5, c.getFecha_ingreso());
	// stmt.setInt(6, c.getSocio().getNro_Socio());
	// stmt.executeUpdate();
	// keyResultSet=stmt.getGeneratedKeys();
	// if(keyResultSet!=null && keyResultSet.next()){
	// c.setIdcamion(keyResultSet.getInt(1));
	// }
	// } catch (SQLException | AppDataException e) {
	// throw e;
	// }
	// try {
	// if(keyResultSet!=null)keyResultSet.close();
	// if(stmt!=null)stmt.close();
	// FactoryConexion.getInstancia().releaseConn();
	// } catch (SQLException e) {
	// e.printStackTrace();
	// }
	// }
	public void update(Servicio s) throws Exception {
		PreparedStatement stmt = null;

		try {
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement(
					"update servicios set cant_toneladas=?, nro_km=?, precio_servicio=?, observacion=? "
							+ " where id_servicio=?");
			stmt.setFloat(1, s.getCant_toneladas());
			stmt.setInt(2, s.getKm_transportados());
			stmt.setFloat(3, s.getPrecio_servicio());
			stmt.setString(4, s.getObservaciones());
			stmt.setInt(5, s.getIdservicio());
			stmt.executeUpdate();

		} catch (SQLException | AppDataException e) {
			throw e;
		}
		try {
			if (stmt != null)
				stmt.close();
			FactoryConexion.getInstancia().releaseConn();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
