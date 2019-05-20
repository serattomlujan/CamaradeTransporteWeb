package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.logging.log4j.Level;

import entity.PrecioKM;
import util.AppDataException;

public class DataPrecio_km {
	public void add(PrecioKM p) throws Exception {
		PreparedStatement stmt = null;
		try {
			stmt = FactoryConexion.getInstancia().getConn()
					.prepareStatement("insert into precio_km(nro_km, valor) " + "values (?,?)");
			stmt.setInt(1, p.getNro_km());
			stmt.setFloat(2, p.getValor());
			stmt.executeUpdate();

		} catch (SQLException | AppDataException e) {
			throw e;
		}

	}

	public void delete() throws Exception {
		PreparedStatement stmt = null;
		try {
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("delete from precio_km");
			stmt.execute();
		} catch (SQLException e) {
			AppDataException ade = new AppDataException(e,
					"Error al eliminar persona.\n" + e.getSQLState() + ":" + e.getMessage(), Level.WARN);
			throw ade;
		} catch (AppDataException ade) {
			throw ade;
		}

	}

	public PrecioKM getByKm(int nro_km) {
		PrecioKM p = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt = FactoryConexion.getInstancia().getConn()
					.prepareStatement("select * from precio_km p where p.nro_km=?");
			stmt.setInt(1, nro_km);
			rs = stmt.executeQuery();
			if (rs != null && rs.next()) {
				p = new PrecioKM();
				p.setNro_km(rs.getInt("nro_km"));
				p.setValor(rs.getFloat("valor"));
			}

		} catch (Exception e) {
			System.out.println(e);
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
			}
		}
		return p;

	}
}
