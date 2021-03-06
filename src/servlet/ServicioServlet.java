package servlet;

import java.io.*;
import java.sql.Date;
import java.sql.Time;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import controles.CtrlABMCamion;
import controles.CtrlABMCliente;
import controles.CtrlABMPrecio_km;
import controles.CtrlABMServicio;
import entity.Camion;
import entity.Cereal;
import entity.Cliente;
import entity.PrecioKM;
import entity.Servicio;

/**
 * Servlet implementation class ServicioServlet
 */
@WebServlet({ "/servicio/*", "/Servicio/*", "/SERVICIO/*" })
public class ServicioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String clientes;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServicioServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String accion = request.getParameter("accion");
		switch (accion) {
		case "ABMServicio":
			this.ABMServicio(request, response);
			break;
		case "FinalizarServicio":
			this.listaServicios(request, response);
			break;
		case "serviciosFinalizados":
			this.serviciosFinalizados(request, response);
			break;
		case "informeServicio":
			this.informeServicios(request, response);
			break;
		case "listarInfomeServicios":
			this.buscarInformeServicios(request, response);
		case "listarServicios":
			this.buscarListadoServicios(request, response);
		case "Editar":
			this.editarServicio(request, response);
			break;
		case "Buscar":
			this.buscarCliente(request, response);
			break;
		case "AsignarCamion":
			this.asignarCamion(request, response);
			break;
		case "calculaPrecio":
			this.calcularPrecio(request, response);
			break;
		case "Guardar":
			this.guardarServicio(request, response);
			break;
		case "BuscarServicio":
			this.reporteServicio(request, response);
			break;
		}
	}

	private void reporteServicio(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		CtrlABMServicio ctrl = new CtrlABMServicio();

		Date fecha_desde = Date.valueOf(request.getParameter("fecha_desde"));
		Date fecha_hasta = Date.valueOf(request.getParameter("fecha_hasta"));
		String opcion = request.getParameter("opcion");
		com.google.gson.JsonObject gson = new JsonObject();
		try {
			switch (opcion) {
			case "socios":
				gson = ctrl.getInformeSocio(fecha_desde, fecha_hasta);
				break;
			case "clientes":
				gson = ctrl.getInformeCliente(fecha_desde, fecha_hasta);
				break;
			case "cereales":
				gson = ctrl.getInformeCereal(fecha_desde, fecha_hasta);
				break;
			case "camiones":
				gson = ctrl.getInformeCamion(fecha_desde, fecha_hasta);
				break;
			}
			
//			if(request.getAttribute("opcion").toString().equals("cereales")){
//				String entro;
//			}
			out.print(gson.toString());

		} catch (Exception e) {
			response.setStatus(502);
		} finally {
			out.close();
		}

	}

	private void buscarInformeServicios(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		CtrlABMServicio ctrl = new CtrlABMServicio();

		com.google.gson.JsonObject gson = new JsonObject();
		try {
			gson = ctrl.getServiciosFinalizados();
			out.print(gson.toString());

		} catch (Exception e) {
			response.setStatus(502);
		} finally {
			out.close();
		}

	}

	private void buscarListadoServicios(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		CtrlABMServicio ctrl = new CtrlABMServicio();

		com.google.gson.JsonObject gson = new JsonObject();
		try {
			gson = ctrl.getServiciosSinFinalizar();
			out.print(gson.toString());

		} catch (Exception e) {
			response.setStatus(502);
		} finally {
			out.close();
		}

	}

	private void serviciosFinalizados(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher("/WEB-INF/listadoServicios.jsp").forward(request, response);
	}

	private void informeServicios(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher("/WEB-INF/informeServicio.jsp").forward(request, response);
	}

	private void guardarServicio(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			CtrlABMCamion ctrlc = new CtrlABMCamion();
			CtrlABMServicio ctrl = new CtrlABMServicio();
			Servicio s = new Servicio();
			s.setCliente(new Cliente());
			s.setCamion(new Camion());
			s.setCereal(new Cereal());
			s.setPrecio(new PrecioKM());

			String id_servicio = request.getParameter("id_servicio");

			s.getCliente().setCuit(request.getParameter("cuit"));

			s.getCereal().setIdcereal(Integer.valueOf(request.getParameter("cereal")));
			s.setFecha(Date.valueOf(request.getParameter("fecha_servicio")));
			s.setHora(Time.valueOf(request.getParameter("hora_servicio")));
			s.getCamion().setIdcamion(Integer.parseInt(request.getParameter("camion")));
			s.getCamion().setPatente(request.getParameter("patente"));
			Camion c = new Camion();
			c = ctrlc.getByPatente(s.getCamion());

			if (id_servicio == null) {
				if (c.isEstado()) {
					c.setEstado(false);
					ctrlc.update(c);

					ctrl.add(s);
				} else {
					System.out.println("el camion ya no esta disponible");
				}

			} else {
				s.setIdservicio(Integer.parseInt(id_servicio));
				s.setCant_toneladas(Float.parseFloat(request.getParameter("cant_toneladas")));
				s.setKm_transportados(Integer.parseInt(request.getParameter("km_transportados")));
				s.setObservaciones(request.getParameter("observacion"));
				s.setPrecio_servicio(Float.parseFloat(request.getParameter("total")));
				c.setEstado(true);
				ctrlc.update(c);
				ctrl.update(s);
			}
			request.setAttribute("actualizado", s);
			request.getRequestDispatcher("/WEB-INF/ABMServicio.jsp").forward(request, response);
		} catch (Exception e) {
			response.setStatus(500);
		}

	}

	private void calcularPrecio(HttpServletRequest request, HttpServletResponse response) {
		CtrlABMPrecio_km ctrl = new CtrlABMPrecio_km();

		float cant_ton = Float.parseFloat(request.getParameter("toneladas"));
		PrecioKM p = new PrecioKM();
		try {
			p = ctrl.getByKm(Integer.parseInt(request.getParameter("km")));
			float total = cant_ton * p.getValor();
			String precio_total = String.valueOf(total);

			response.setContentType("text/plain");
			response.getWriter().write(precio_total);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void asignarCamion(HttpServletRequest request, HttpServletResponse response) {
		CtrlABMCliente ctrl = new CtrlABMCliente();
		CtrlABMServicio ctrls = new CtrlABMServicio();
		Cliente c = new Cliente();
		c.setCuit(request.getParameter("cuit"));
		Servicio s = new Servicio();
		s.setCliente(new Cliente());
		s.setCamion(new Camion());
		s.setCereal(new Cereal());
		s.setPrecio(new PrecioKM());
		try {
			s.setCliente(ctrl.getByCuit(c));
			s.getCereal().setIdcereal(Integer.valueOf(request.getParameter("cereal")));
			s.setFecha(Date.valueOf(request.getParameter("fecha_servicio")));
			s.setHora(Time.valueOf(request.getParameter("hora_servicio") + ":00"));
			s.setCamion(ctrls.asignarCamion());
			s.setIdservicio(0);
			request.setAttribute("encontrada", s);
			request.getRequestDispatcher("/WEB-INF/ABMServicio.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void buscarCliente(HttpServletRequest request, HttpServletResponse response) {
		Cliente c = new Cliente();
		Servicio s = new Servicio();
		s.setCliente(new Cliente());
		s.setCamion(new Camion());
		s.setCereal(new Cereal());
		s.setPrecio(new PrecioKM());

		CtrlABMCliente ctrl = new CtrlABMCliente();

		try {
			c.setCuit(request.getParameter("cuit"));
			c = ctrl.getByCuit(c);
			if (c == null) {
				s.getCliente().setCuit("0");
				s.getCliente().setRazon_social("");
			} else {
				s.getCliente().setCuit(c.getCuit());
				s.getCliente().setRazon_social(c.getRazon_social());
			}
			s.getCamion().setIdcamion(0);
			s.getCamion().setPatente("");
			request.setAttribute("encontrada", s);
			request.getRequestDispatcher("/WEB-INF/ABMServicio.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void editarServicio(HttpServletRequest request, HttpServletResponse response) {
		CtrlABMServicio ctrl = new CtrlABMServicio();
		int id_servicio = Integer.parseInt(request.getParameter("servicio"));
		try {
			Servicio s = new Servicio();
			s = ctrl.getById(id_servicio);
			s.setObservaciones("");
			request.setAttribute("encontrada", s);
			request.getRequestDispatcher("/WEB-INF/ABMServicio.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void listaServicios(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/Servicio.jsp").forward(request, response);

	}

	private void ABMServicio(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("encontrada", null);
		request.getRequestDispatcher("/WEB-INF/ABMServicio.jsp").forward(request, response);

	}

}
