package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class Menu
 */
@WebServlet({"/Menu/*", "/menu"})
public class Menu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Menu() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//System.out.println("entro");
		
		String action = request.getServletPath();
		 
        try {
            switch (action) {
            
            case "/Reservar":
            	request.getRequestDispatcher("WEB-INF/Reservar.jsp").forward(request, response);
                break;
            case "/Reservas pendientes":
            	request.getRequestDispatcher("WEB-INF/ReservasPendientes.jsp").forward(request, response);
                break;
 	        case "/Personas":
 	        	request.getRequestDispatcher("WEB-INF/ABMCPersona.jsp").forward(request, response);
                break;
 	        case "/Elementos":
 	    	  request.getRequestDispatcher("WEB-INF/ABMCElemento.jsp").forward(request, response);
               break;  
 	        case "/Tipo Elemento":
            	   request.getRequestDispatcher("WEB-INF/ABMCTipoElemento.jsp").forward(request, response);
                   break; 
 	        case "/Listado Elementos":
                	   request.getRequestDispatcher("WEB-INF/ListadoElementos.jsp").forward(request, response);
                       break;
 	        case "/Listado Tipo Elementos":
                	   request.getRequestDispatcher("WEB-INF/ListadoTipoElementos.jsp").forward(request, response);
                       break;
 	        case "/Listado Personas":
                	   request.getRequestDispatcher("WEB-INF/ListadoPersonas.jsp").forward(request, response);
                       break;
 	        
            }
        }
         catch (Exception e) {
			// TODO Bloque catch generado automáticamente
			e.printStackTrace();
			doGet(request, response);
		}
	}
		
		
}


