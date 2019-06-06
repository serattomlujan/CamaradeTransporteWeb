package servlet;

import java.io.Console;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import controles.CtrlABMCamion;
import controles.CtrlABMCereal;
import entity.Cereal;
import util.AppDataException;

/**
 * Servlet implementation class CerealServlet
 */

@WebServlet({ "/cereal/*", "/Cereal/*", "/CEREAL/*" })
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
		System.out.println(accion);
		switch (accion) {
		case "Ingresar":
			this.listaCereales(request, response);
			break;
		case "cargarListado":
			this.cargarListado(request, response);
			break;
		case "Editar":
			this.buscarCereal(request, response);
			break;
		case "AgregarCereal":
			this.agregarCereal(request, response);
			break;
		case "Guardar":
			this.guardarCereal(request, response);
			break;
		}
	}

	private void cargarListado(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		CtrlABMCereal ctrl = new CtrlABMCereal();

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

	private void guardarCereal(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			CtrlABMCereal ctrl = new CtrlABMCereal();
			Cereal cer = new Cereal();
			String id_cereal=request.getParameter("id_cereal");
			cer.setDescripcion(request.getParameter("descripcion"));
			Cereal cereal = new Cereal();
			cereal = ctrl.getByDescCereal(cer);
			if (id_cereal==null) {
				if(cereal!=null){
					System.out.println("cereal ya existe nuevo");
				}
				else{
					ctrl.add(cer);
				}
			}
			else {
				if(cereal!=null){
					System.out.println("cereal ya existe editar");
				}
				else{
					cer.setIdcereal(Integer.parseInt(request.getParameter("id_cereal")));
					ctrl.update(cer);
				}
				}
			
			request.setAttribute("actualizado", cer);
			request.getRequestDispatcher("/WEB-INF/ABMCereal.jsp").forward(request, response);
		} catch (AppDataException ade) {
			request.setAttribute("Error", ade.getMessage());
		} catch (Exception e) {
			response.setStatus(500);
		}

	}

	private void agregarCereal(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/ABMCereal.jsp").forward(request, response);
	}

	private void buscarCereal(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Entro a buscar cereal");
		CtrlABMCereal ctrl = new CtrlABMCereal();
		Cereal cer = new Cereal();
		cer.setDescripcion(request.getParameter("descripcion"));
		try {
			
			cer = ctrl.getByDescCereal(cer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (cer != null) {
			request.setAttribute("encontrada", cer);
			request.getRequestDispatcher("/WEB-INF/ABMCereal.jsp").forward(request, response);
		} else {
			this.listaCereales(request, response);
		}
	}

	private void listaCereales(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/Cereals.jsp").forward(request, response);

	}

}