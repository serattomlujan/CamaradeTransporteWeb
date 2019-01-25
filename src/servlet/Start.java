package servlet;
import util.AppDataException;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controlers.CtrlABMPersona;
import entity.Persona;
import util.AppDataException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.Level;

/**
 * Servlet implementation class Start
 */
@WebServlet({ "/Start/*", "/start" })
public class Start extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Logger logger;
   
	
	/*Default constructor.*/
 public Start() {
  logger = LogManager.getLogger(getClass());
		
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			String user=request.getParameter("user");
			String pass=request.getParameter("pass");
						
			
			Persona per=new Persona();
			per.setUsuario(user);
			per.setContrasenia(pass);
			
			CtrlABMPersona ctrl= new CtrlABMPersona();
			
			Persona pers=ctrl.login(per);
			
			try {
				request.setAttribute("listaPersonas", ctrl.getAll());
			} catch (AppDataException ade) {
				request.setAttribute("Error", ade.getMessage());
			} catch (Exception e) {
				response.setStatus(502);
			}
			
			if(pers==null) {
				response.getWriter().append("Usuario y/o contraseña incorrectos");
				request.setAttribute("habilitado", "incorrecto");
				//request.getRequestDispatcher("/Login.html").forward(request, response);
				 
			}
			else if(!pers.getHabilitado()){
				response.getWriter().append("Usuario no habilitado. Comuníquese con un Administrador");
				request.setAttribute("habilitado", "no");
				//request.getRequestDispatcher("/Login.html").forward(request, response);
				 }
			
			else {
			request.getSession().setAttribute("user", pers);
			request.getSession().setAttribute("email",pers.getEmail());
			request.setAttribute("habilitado", "ok");
			
			logger.log(Level.INFO,"log in "+pers.getDni());
			
			int categ=pers.getCategoria().getId_categoria();
			switch (categ) {
			case 1:
				request.getRequestDispatcher("WEB-INF/MenuEncargado.jsp").forward(request, response);
				//response.getWriter().append(user).append(" ").append(pass);
				break;
				
			case 2:
				request.getRequestDispatcher("WEB-INF/MenuAdmin.jsp").forward(request, response);
				//response.getWriter().append(user).append(" ").append(pass);
				break;
			case 3:
				request.getRequestDispatcher("WEB-INF/MenuUsuario.jsp").forward(request, response);
				//response.getWriter().append(user).append(" ").append(pass);
				break;
			default:
				break;}}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		doGet(request, response);
	}

}