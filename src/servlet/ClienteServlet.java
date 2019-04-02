package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controles.CtrlABMCliente;
import entity.Cliente;
import util.AppDataException;

/**
 * Servlet implementation class ClienteServlet
 */
@WebServlet({"/cliente/*", "/Cliente/*", "/CLIENTE/*"})
public class ClienteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClienteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.listaClientes(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion=request.getParameter("accion");
		switch (accion) {
		case "Ingresar":
			this.listaClientes(request,response);
			break;
		case "Buscar":
			this.buscarCliente(request,response);
			break;
		case "Agregar Cliente":
			this.agregarCliente(request,response);
			break;
		case "Guardar":
			this.guardarCliente(request,response);
			break;
		}
		}
	
	private void guardarCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		  try {
			    CtrlABMCliente ctrl= new CtrlABMCliente();
			    Cliente cli=new Cliente();
			    cli.setCuit(request.getParameter("cuit"));
			    cli.setRazon_social(request.getParameter("razon_social"));
			    cli.setDireccion(request.getParameter("direccion"));
			    cli.setTelefono(request.getParameter("telefono"));
				if (request.getParameter("estado")!=null){
					cli.setEstado(true);
				}
				Cliente cliente=new Cliente();
				cliente=ctrl.getByCuit(cli);
				if(cliente!=null){
					//cli.setCuit(request.getParameter("cuit"));
					ctrl.update(cli);
				}
				else{ ctrl.add(cli);}
				request.setAttribute("actualizado", cli);
				request.getRequestDispatcher("/WEB-INF/ABMCliente.jsp").forward(request, response);
		  }catch (AppDataException ade) {
				request.setAttribute("Error", ade.getMessage());
			} catch (Exception e) {
				response.setStatus(500);
			}
		
	}

	private void agregarCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cuit=request.getParameter("cuit");
		Cliente cli=new Cliente();
		cli.setCuit(cuit);
		cli.setRazon_social("");
		cli.setDireccion("");
		cli.setTelefono("");
		request.setAttribute("encontrada", cli);
		request.getRequestDispatcher("/WEB-INF/ABMCliente.jsp").forward(request, response);
	}
	private void buscarCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CtrlABMCliente ctrl= new CtrlABMCliente();
		String cuit=request.getParameter("cuit");
		Cliente cli=new Cliente();
		cli.setCuit(cuit);
		try {
			cli=ctrl.getByCuit(cli);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (cli!=null){
		request.setAttribute("encontrada", cli);
		request.getRequestDispatcher("/WEB-INF/ABMCliente.jsp").forward(request, response);}
		else {
			this.listaClientes(request,response);}
		
	}

	private void listaClientes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CtrlABMCliente ctrl1= new CtrlABMCliente();
		try {
			request.setAttribute("listaClientes", ctrl1.getAll());
		} catch (AppDataException ade) {
			request.setAttribute("Error", ade.getMessage());
		} catch (Exception e) {
			response.setStatus(502);
		}
		request.getRequestDispatcher("/WEB-INF/Cliente.jsp").forward(request, response);
	
	
	}	

}
