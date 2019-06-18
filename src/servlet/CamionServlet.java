package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import entity.Camion;
import entity.Socio;
import controles.CtrlABMCamion;
import controles.CtrlABMServicio;
import controles.CtrlABMSocio;
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
		doPost(request, response);
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
		case "cargarListado":
			this.cargarListado(request, response);
			break;
		case "Buscar":
			this.buscarCamion(request, response);
			break;
		case "BuscarSocio":
			this.buscarSocio(request,response);
			break;
		case "Agregar":
			this.agregarCamion(request, response);
			break;
		case "Guardar":
			this.guardarCamion(request, response);
			break;
		}
	}
	
	
	private void cargarListado(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		CtrlABMCamion ctrl = new CtrlABMCamion();

		com.google.gson.JsonObject gson = new JsonObject();
		try {
			gson = ctrl.getAll();
			out.print(gson.toString());

		} catch (Exception e) {
			response.setStatus(502);
		} finally {
			out.close();
		}
	}

	private void buscarSocio(HttpServletRequest request, HttpServletResponse response) {
		
		Socio s= new Socio();
		Camion c=new Camion();
		CtrlABMSocio ctrl=new CtrlABMSocio();
		CtrlABMCamion ctrlc=new CtrlABMCamion();
		c.setPatente(request.getParameter("patente"));
		s.setDni(request.getParameter("dni"));	
		try {
			c=ctrlc.getByPatente(c);
			s=ctrl.getByDni(s);
			if(s!=null & c!=null){
				c.getSocio().setDni(s.getDni());
				c.getSocio().setApellido(s.getApellido());
				c.getSocio().setNombre(s.getNombre());
				c.getSocio().setNro_Socio(s.getNro_Socio());
				
			}
			else if(s!=null & c==null){
				c=new Camion();
				c.setPatente(request.getParameter("patente"));
				c.setSocio(new Socio());
				c.getSocio().setDni(s.getDni());
				c.getSocio().setApellido(s.getApellido());
				c.getSocio().setNombre(s.getNombre());
				c.getSocio().setNro_Socio(s.getNro_Socio());
				c.setEstado(true);
				
			}
			else if(s==null & c!=null){
				c.setSocio(new Socio());
				c.getSocio().setDni("");
				c.getSocio().setApellido("");
				c.getSocio().setNombre("");
				c.getSocio().setDni("0");
				
			}
			else{
				c=new Camion();
				c.setPatente(request.getParameter("patente"));
				c.setSocio(new Socio());
				c.getSocio().setDni("");
				c.getSocio().setApellido("");
				c.getSocio().setNombre("");
				c.getSocio().setDni("0");
				c.setEstado(true);
			}
			request.setAttribute("encontrada", c);
			request.getRequestDispatcher("/WEB-INF/ABMCamion.jsp").forward(request, response);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		
		
	}

	private void guardarCamion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		  try {
			  System.out.println("guardar camion");
			    CtrlABMCamion ctrl= new CtrlABMCamion();
			    Camion cam=new Camion();
			    cam.setSocio(new Socio());
			    cam.setPatente(request.getParameter("patente"));
			    cam.setMarca(request.getParameter("marca"));
			    cam.setModelo(request.getParameter("modelo"));
			    if (request.getParameter("estado")!=null){
					cam.setEstado(true);
				}
			    cam.setFecha_ingreso(Date.valueOf(request.getParameter("fecha_ingreso")));
			   cam.getSocio().setNro_Socio(Integer.parseInt(request.getParameter("nro_socio")));
			   
			    Camion camion=new Camion();
			    camion=ctrl.getByPatente(cam);
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
		cam.setSocio(new Socio());
		cam.getSocio().setDni("");
		cam.setIdcamion(0);
		cam.setPatente(patente);
		cam.setMarca("");
		cam.setModelo("");
		cam.setEstado(true);
//		cam.setFecha_ingreso(null);
		request.setAttribute("encontrada", cam);
		request.getRequestDispatcher("/WEB-INF/ABMCamion.jsp").forward(request, response);
	}
	
	
	private void buscarCamion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CtrlABMCamion ctrl= new CtrlABMCamion();
		System.out.println("entro a buscar camiones");
		String patente = request.getParameter("patente");
		System.out.println(patente);
		Camion cam=new Camion();
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

		request.getRequestDispatcher("/WEB-INF/Camion.jsp").forward(request, response);
	
	}	

}
