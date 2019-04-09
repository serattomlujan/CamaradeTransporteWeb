package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import controles.CtrlAdministrador;


import entity.Administrador;
import util.AppDataException;
import util.Emailer;

/**
 * Servlet implementation class Home
 */
@WebServlet({"/home/*", "/Home/*", "/HOME/*"})
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Home() {
    	super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion=request.getParameter("accion");
		switch (accion) {
		case "menu":
			request.getRequestDispatcher("/WEB-INF/menu.jsp").forward(request, response);
			break;
		case "CambiarPass":
			this.CambiarContraseña(request,response);
			break;
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion=request.getParameter("accion");
		System.out.println(accion);
		switch (accion) {
		case "Ingresar":
			this.login(request,response);
			break;
		case "CambiarPass":
			this.CambiarContraseña(request,response);
			break;
	case "Enviar":
		this.ValidaPreguntaSecreta(request,response);
		break;
	}
	}

	private void ValidaPreguntaSecreta(HttpServletRequest request, HttpServletResponse response) {
		CtrlAdministrador  ctrl =new CtrlAdministrador();
		Administrador a=new Administrador();
		a.setCorreo(request.getParameter("correo"));
		System.out.println(a.getCorreo());
		a.setCorreo(request.getParameter("pregunta"));
		try {
			a=ctrl.buscarAdministrador(a);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (a!=null){
			try {
				a=ctrl.validarPregunta(a);
			} catch (Exception e) {
					e.printStackTrace();
			}
			if (a!=null){
				Emailer.getInstance().send("julietachaparro94@gmail.com","restaurar cuenta",a.getContraseña());
			}
		}
		else{
			System.out.println("no existe correo");
		}
		
		
	}

	private void CambiarContraseña(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/CambiarContraseña.jsp").forward(request, response);
		
	}

	private void login(HttpServletRequest request, HttpServletResponse response) {
	try {
		Administrador a= new Administrador();
		a.setUsuario(request.getParameter("user"));
		a.setContraseña(request.getParameter("pass"));
		CtrlAdministrador ctrl= new CtrlAdministrador();
		
		Administrador adm=ctrl.getValidacionUsario(a);
		if (adm!=null){
				request.getSession().setAttribute("user", adm);
				request.getRequestDispatcher("/WEB-INF/menu.jsp").forward(request, response);
			}
		else{request.setAttribute("encontrado", a);
		request.getRequestDispatcher("login.jsp").forward(request, response);}
		
	} catch (AppDataException ade) {
		request.setAttribute("Error", ade.getMessage());
	} catch (Exception e) {
		response.setStatus(502);
	}
		
	}

}
