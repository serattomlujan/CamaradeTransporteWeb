package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controles.CtrlABMCereal;
import controles.CtrlABMCliente;
import entity.Cereal;
import entity.Cliente;
import util.AppDataException;

/**
 * Servlet implementation class CerealServlet
 */

@WebServlet({"/cereal/*", "/Cereal/*", "/CEREAL/*"})
public class CerealServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CerealServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.listaCereales(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion=request.getParameter("accion");
		switch (accion) {
		case "Ingresar":
			this.listaCereales(request, response);
			break;
		case "Buscar":
			this.buscarCereal(request, response);
			break;
		case "Agregar Cereal":
			this.agregarCereal(request, response);
			break;
		case "Guardar":
			this.guardarCereal(request,response);
			break;
		}
		}
	
	private void guardarCereal(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		  try {
			    CtrlABMCereal ctrl= new CtrlABMCereal();
			    Cereal cer=new Cereal();
			    cer.setIdcereal(Integer.parseInt(request.getParameter("id_cereal")));
			    cer.setDescripcion(request.getParameter("descripcion"));
			    
				Cereal cereal=new Cereal();
				cereal=ctrl.getByIdCereal(cer);
				if(cereal!=null){
					
					ctrl.update(cer);
				}
				else{ ctrl.add(cer);}
				request.setAttribute("actualizado", cer);
				request.getRequestDispatcher("/WEB-INF/ABMCereal.jsp").forward(request, response);
		  }catch (AppDataException ade) {
				request.setAttribute("Error", ade.getMessage());
			} catch (Exception e) {
				response.setStatus(500);
			}
		
	}

	private void agregarCereal(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id_cereal = Integer.parseInt(request.getParameter("id_cereal"));
		Cereal cer=new Cereal();
		cer.setIdcereal(id_cereal);
		cer.setDescripcion("descripcion");
		
		request.setAttribute("encontrada", cer);
		request.getRequestDispatcher("/WEB-INF/ABMCereal.jsp").forward(request, response);
	}
	
	private void buscarCereal(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CtrlABMCereal ctrl= new CtrlABMCereal();
		int id_cereal = Integer.parseInt(request.getParameter("id_cereal"));
		Cereal cer=new Cereal();
		cer.setIdcereal(id_cereal);
		try {
			cer=ctrl.getByIdCereal(cer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (cer!=null){
		request.setAttribute("encontrada", cer);
		request.getRequestDispatcher("/WEB-INF/ABMCereal.jsp").forward(request, response);}
		else {
			this.listaCereales(request,response);}
		
	}

	private void listaCereales(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CtrlABMCereal ctrl1= new CtrlABMCereal();
		try {
			request.setAttribute("listaCereales", ctrl1.getAll());
		} catch (AppDataException ade) {
			request.setAttribute("Error", ade.getMessage());
		} catch (Exception e) {
			response.setStatus(502);
		}
		request.getRequestDispatcher("/WEB-INF/Cereal.jsp").forward(request, response);
	
	
	}	

}