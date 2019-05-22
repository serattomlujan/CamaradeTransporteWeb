package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controles.CtrlABMSocio;
import entity.Socio;
import util.AppDataException;


/**
 * Servlet implementation class ListadoPerServlet
 */
@WebServlet({ "/socio/*", "/Socio/*", "/SOCIO/*"})
public class SocioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SocioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.listaSocios(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion=request.getParameter("accion");
		switch (accion) {
		case "Ingresar":
			this.listaSocios(request,response);
			break;
		case "Buscar":
			this.buscarSocio(request,response);
			break;
		case "Agregar Socio":
			this.agregarSocio(request,response);
			break;
		case "Guardar":
			this.guardarSocio(request,response);
			break;
		}
		}
	
	private void guardarSocio(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		  try {
			    CtrlABMSocio ctrl= new CtrlABMSocio();
			    Socio soc=new Socio();
			    soc.setDni(request.getParameter("dni"));
			    soc.setNombre(request.getParameter("nombre"));
			    soc.setApellido(request.getParameter("apellido"));
			    soc.setTelefono(request.getParameter("telefono"));
				if (request.getParameter("estado")!=null){
					soc.setEstado(true);
				}
				Socio socio=new Socio();
				socio=ctrl.getByDni(soc);
				if(socio!=null){
					soc.setNro_Socio(Integer.parseInt(request.getParameter("nro_socio")));
					ctrl.update(soc);
				}
				else{ ctrl.add(soc);}
				request.setAttribute("actualizado", soc);
				request.getRequestDispatcher("/WEB-INF/ABMSocio.jsp").forward(request, response);
		  }catch (AppDataException ade) {
				request.setAttribute("Error", ade.getMessage());
			} catch (Exception e) {
				response.setStatus(500);
			}
		  
	}

	private void agregarSocio(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dni=request.getParameter("dni");
		Socio soc=new Socio();
		soc.setDni(dni);
		soc.setApellido("");
		soc.setNombre("");
		soc.setTelefono("");
		request.setAttribute("encontrada", soc);
		request.getRequestDispatcher("/WEB-INF/ABMSocio.jsp").forward(request, response);
	}
	private void buscarSocio(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CtrlABMSocio ctrl= new CtrlABMSocio();
		String dni=request.getParameter("dni");
		Socio soc=new Socio();
		soc.setDni(dni);
		try {
			soc=ctrl.getByDni(soc);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (soc!=null){
		request.setAttribute("encontrada", soc);
		request.getRequestDispatcher("/WEB-INF/ABMSocio.jsp").forward(request, response);}
		else {
			this.listaSocios(request,response);}
		
	}

	private void listaSocios(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CtrlABMSocio ctrl1= new CtrlABMSocio();
		System.out.println(ctrl1);
		try {
			request.setAttribute("listaSocios", ctrl1.getAll());
		} catch (AppDataException ade) {
			request.setAttribute("Error", ade.getMessage());
		} catch (Exception e) {
			response.setStatus(502);
		}
		request.getRequestDispatcher("/WEB-INF/Socio.jsp").forward(request, response);
       
	
	}	
	}
	