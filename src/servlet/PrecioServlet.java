package servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import controles.CtrlABMPrecio_km;
import entity.Precio;


/**
 * Servlet implementation class FileUpload
 */
@WebServlet({ "/precio/*", "/Precio/*", "/PRECIO/*" })
public class PrecioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PrecioServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String accion=request.getParameter("accion");
			switch (accion) {
			case "Ingresar":
				request.getRequestDispatcher("/WEB-INF/MantenimientoPrecios.jsp").forward(request, response);
				break;
			case "Guardar":
				SubirExcel(request,response);
				LeerExcel();
				break;

			default:
				break;
			}
				
			}
		catch (Exception e) {
			System.out.println(e);
		}
		
	}

	private void SubirExcel(HttpServletRequest request, HttpServletResponse response) throws IOException{
		try{
		ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
		List<FileItem> multifiles = sf.parseRequest(request);
		File archivo = new File("C:/Users/julie/OneDrive/Documentos/UTN/HP/upload/Precios.xlsx");

			for (FileItem item : multifiles) {
				archivo.delete();
				item.write(new File("C:/Users/julie/OneDrive/Documentos/UTN/HP/upload/Precios.xlsx"));
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		
	}

	private void LeerExcel() throws Exception {
		try {
			CtrlABMPrecio_km ctrl = new CtrlABMPrecio_km();
			ctrl.delete();
			Precio p = new Precio();
			FileInputStream file = new FileInputStream(new File("C:/Users/julie/OneDrive/Documentos/UTN/HP/upload/Precios.xlsx"));
		
			XSSFWorkbook wb = new XSSFWorkbook(file);
			XSSFSheet sheet = wb.getSheetAt(0);
			
			int numFilas = sheet.getLastRowNum();
			
			for (int a=0; a<=numFilas; a++){
				Row fila = sheet.getRow(a);
				p.setNro_km((int)(fila.getCell(0).getNumericCellValue()));
				p.setPrecio((float)(fila.getCell(1).getNumericCellValue()));
				ctrl.add(p);
			}
		
		
		} catch (FileNotFoundException e) {
			System.out.println(e);
		}
		
	}

	
}
