package data;
import java.sql.*;

import util.AppDataException;

public class FactoryConexion {
	private String driver="com.mysql.cj.jdbc.Driver";
		
	private static FactoryConexion instancia;
	
		
	private FactoryConexion(){
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		
	}
	
	public static FactoryConexion getInstancia(){
		if (FactoryConexion.instancia == null){		
			FactoryConexion.instancia=new FactoryConexion();
		}
		return FactoryConexion.instancia;
		
	}
	
	private Connection conn;
	private int cantConn=0;
	public Connection getConn() throws SQLException, AppDataException{
		try {
			if(conn==null || conn.isClosed()){	
				conn = DriverManager.getConnection(
						 "jdbc:mysql://localhost:3306/camaradetransporte?useTimezone=true&serverTimezone=UTC","root","admin");
			}
		} catch (SQLException e) {
			throw new AppDataException(e, "Error al conectar a la base de datos");
		}
		cantConn++;
		return conn;
	}
	
public void  releaseConn()throws SQLException{
	try{cantConn--; if(cantConn==0){conn.close();}
	}catch(SQLException e){throw e;}}
}







