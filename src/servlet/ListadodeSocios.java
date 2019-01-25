package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controles.CtrlABMSocio;
import entity.Socio;



@WebServlet("/ListadodeSocios/*")
public class ListadodeSocios extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * Default constructor. 
     */
   
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	};

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	 try {
		list(request, response);
	} catch (Exception e) {
		// TODO Bloque catch generado automáticamente
		e.printStackTrace();
	} 
	       
		 }

		 private void list(HttpServletRequest request, HttpServletResponse response)
		            throws Exception {
			 	CtrlABMSocio	cpers = new CtrlABMSocio();
		        List<Socio> listSocios = cpers.getAll();
		        request.setAttribute("list", listSocios);
		        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/ListadoSocios.jsp");
		        dispatcher.forward(request, response);
		       
		    }
		 
		 
		
}

