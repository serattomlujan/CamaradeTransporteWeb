package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entity.Camion;
import controles.CtrlABMCamion;
import util.AppDataException;

/**
 * Servlet implementation class CaamionServlet
 */
@WebServlet({"/camion/*", "/Camion/*", "/CAMION/*"})

public class CamionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CamionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		this.listaCamiones(request, response);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion=request.getParameter("accion");
		
		switch (accion) {
		case "Ingresar":
			this.listaCamiones(request, response);
			break;
		case "Buscar":
			this.buscarCamion(request, response);
			break;
		case "Agregar":
			this.agregarCamion(request, response);
			break;
		case "Guardar":
			this.guardarCamion(request, response);
			break;
		}
	}
	
	
	private void guardarCamion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		  try {
			    CtrlABMCamion ctrl= new CtrlABMCamion();
			    Camion cam=new Camion();
			    cam.setIdcamion(Integer.parseInt(request.getParameter("id_camion")));
			    cam.setPatente(request.getParameter("patente"));
			    cam.setMarca(request.getParameter("marca"));
			    cam.setModelo(request.getParameter("modelo"));
			  //  cam.setSocio(Integer.parseInt(request.getParameter("socio")));
			    if (request.getParameter("estado")!=null){
					cam.setEstado(true);
				}
			    //cam.setFecha_ingreso("fecha_ingreso");

			   
			    
				Camion camion=new Camion();
				
				if(camion!=null){
				cam.setIdcamion(Integer.parseInt(request.getParameter("id_camion")));
					ctrl.update(cam);
				}
				else{ ctrl.add(cam);}
				request.setAttribute("actualizado", cam);
				request.getRequestDispatcher("/WEB-INF/ABMCamion.jsp").forward(request, response);
		  }catch (AppDataException ade) {
				request.setAttribute("Error", ade.getMessage());
			} catch (Exception e) {
				response.setStatus(500);
			}
		
	}

	private void agregarCamion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String patente=request.getParameter("patente");
		System.out.println("entro aAgregar");
		Camion cam=new Camion();
		cam.setIdcamion(0);
		cam.setPatente(patente);
		cam.setMarca("");
		cam.setModelo("");
		cam.setEstado(true);
		//cam.setSocio("Socio");
		//cam.setFecha_ingreso(Date);
		request.setAttribute("encontrada", cam);
		request.getRequestDispatcher("/WEB-INF/ABMCamion.jsp").forward(request, response);
	}
	
	
	private void buscarCamion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CtrlABMCamion ctrl= new CtrlABMCamion();
		System.out.println("entro a buscar camiones");
//		int id_camion=Integer.parseInt(request.getParameter("id_camion"));
		String patente = request.getParameter("patente");
		Camion cam=new Camion();
//		cam.setIdcamion(id_camion);
		cam.setPatente(patente);
		try {
			cam=ctrl.getByPatente(cam);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (cam!=null){
		request.setAttribute("encontrada", cam);
		request.getRequestDispatcher("/WEB-INF/ABMCamion.jsp").forward(request, response);}
		else {
			this.listaCamiones(request,response);}
		
	}

	private void listaCamiones(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CtrlABMCamion ctrl1= new CtrlABMCamion();
		try {System.out.println("entro");
			request.setAttribute("listaCamiones", ctrl1.getAll());
		} catch (AppDataException ade) {
			request.setAttribute("Error", ade.getMessage());
		} catch (Exception e) {
			System.out.println(e);
		}
		request.getRequestDispatcher("/WEB-INF/Camion.jsp").forward(request, response);
	
	}	

}
