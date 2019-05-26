<%@page import="controles.CtrlABMCereal"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Servicio"%>
<%@page import="entity.Cereal"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CTCarabelas</title>
<link rel="icon" type="iman/png" href="Style/Icono.png">
<link href="Style/webLayout.css" rel="stylesheet">
<link href="Style/tabla.css" rel="stylesheet">
<link href="Style/Layout.css" rel="stylesheet">
<link href="Style/formulario.css" rel="stylesheet">
<script type="text/javascript">
	function submitForm(met) {
		document.myForm.action = met;

	}
</script>
</head>
<body>
	<%
		String id_servicio = "";
		String fecha_desde = "";
		String fecha_hasta = "";
		String id_camion = "";
		String cuit = "";
		String id_cereal = "";
	%>
	<div class="header">
		<div class="header" style="background: white;">
			<div>
				<img src="Style/Encabezado.png" width="60%">
			</div>
		</div>
	</div>

	<div id="header" class="topnav">
		<ul class="nav">
		<li> <a href="Home?accion=menu">Home</a> </li>
		<li> <a href="Socio">Socios</a> </li>
		<li> <a href="Cliente">Clientes</a> </li>
		<li> <a href="Camion">Camiones</a> </li>
		<li> <a href="Cereal">Cereales</a> </li>
		<li> <a href="#">Servicios</a>
					<ul>
						<li><a href="precio?accion=Ingresar"> Actualizar precios</a></li>
						<li><a href="Servicio?accion=ABMServicio"> Alta de Servicio</a></li>
						<li><a href="Servicio?accion=FinalizarServicio"> Finalizar Servicio</a></li>
					</ul>
		
	
     </ul>
	</div>
	<div class="row">
		<div class="leftcolumn" align="center">
			<div class="card">
				<div class="container">
					<h1 style="text-align: center">Socios</h1>

					<form class="form-signin" id="myForm" name="servicio" action=""
						method="post">
						<div class="row lineaForm">
							<div class="cajalabel">
								<label for="inputidServicio" class="sr-only">ID Servicio</label>
							</div>
							<div class="cajaNumerica">
								<input name="id_servicio" id="inputidServicio"
									class="form-control" placeholder="" required="" autofocus=""
									type="text" value=<%=id_servicio%>>
							</div>
							<div class="cajalabel">
								<label for="inputidCamion" class="sr-only">ID camion</label>
							</div>
							<div class="cajaNumerica">
								<input name="id_camion" id="inputidCamion" class="form-control"
									placeholder="" required="" autofocus="" type="text"
									value=<%=id_camion%>>
							</div>
							<div class="cajalabel">
								<label for="inputCuit" class="sr-only">Cuit</label>
							</div>
							<div class="cajaNumerica">
								<input name="cuit" id="inputCuit" class="form-control"
									placeholder="" required="" autofocus="" type="text"
									value=<%=cuit%>>
							</div>

						</div>
						<div class="row lineaForm">
							<div class="cajalabel">
								<label for="inputFechaDesde" class="sr-only">Fecha Desde</label>
							</div>
							<div class="cajaNumerica">
								<input name="fecha_desde" id="inputFechaDesde"
									class="form-control" placeholder="" required="" autofocus=""
									type="Date" value=<%=fecha_desde%>>
							</div>
							<div class="cajalabel">
								<label for="inputFechaHasta" class="sr-only">Fecha Hasta</label>
							</div>
							<div class="cajaNumerica">
								<input name="fecha_hasta" id="inputFechaHasta"
									class="form-control" placeholder="" required="" autofocus=""
									type="Date" value=<%=fecha_hasta%>>
							</div>

							<div class="cajalabel">
								<label for="inputCereal" class="sr-only">Cereal</label>
							</div>
							<%
								CtrlABMCereal ctrl = new CtrlABMCereal();
								ArrayList<Cereal> cereales = new ArrayList<Cereal>();
								cereales = ctrl.getAll();
							%>
							<div class="cajaInput">
								<select name="cereal" id="inputCereal">
									<%
										for (Cereal c : cereales) {
											if (c.getIdcereal() == 0) {
									%><option value="<%=c.getIdcereal()%>" selected><%=c.getDescripcion()%></option>
									<%
										} else {
									%><option value="<%=c.getIdcereal()%>"><%=c.getDescripcion()%></option>
									<%
										}
										}
									%>
								</select>
							</div>

						</div>
						<button type="submit" name="accion" value="Buscar" class="BuscarSocio"
							onclick="javascript: submitForm('Servicio')"> BUSCAR SERVICIO </button>
					</form>
				</div>
			</div>
			<form class="form-signin" id="myForm" name="servicio"
		action="Servicio?accion=Editar" method="post">
			<div class="card">
				<table id="customers" align="center">

					<tr>
						<th>NRO SERVICIO</th>
						<th>CEREAL</th>
						<th>CUIT</th>
						<th>RAZON SOCIAL</th>
						<th>ID CAMION</th>
						<th>PATENTE</th>
						<th>FECHA SERVICIO</th>
						<th>HORA SERVICIO</th>
						<th>CANT TONELADAS</th>
						<th>NRO KM</th>
						<th>PRECIO SERVICIO</th>
						<th>ACCION</th>


					</tr>


					<%
						ArrayList<Servicio> listaServs = (ArrayList<Servicio>) request.getAttribute("listaServicios");
						for (Servicio s : listaServs) {
					%>

					<tr>
						<td><%=s.getIdservicio()%></td>
						<td><%=s.getCereal().getDescripcion()%></td>
						<td><%=s.getCliente().getCuit()%></td>
						<td><%=s.getCliente().getRazon_social()%></td>
						<td><%=s.getCamion().getIdcamion()%></td>
						<td><%=s.getCamion().getPatente()%></td>
						<td><%=s.getFecha()%></td>
						<td><%=s.getHora()%></td>
						<td><%=s.getCant_toneladas()%></td>
						<td><%=s.getKm_transportados()%></td>
						<td><%=s.getPrecio_servicio()%></td>
						<td><button class="buttonGrilla" type="submit" value="<%=s.getIdservicio()%>"
							id="servicio" name="servicio">EDITAR SERVICIO</button></td>

					</tr>
					<%
						}
					%>
				</table>
			</div>
			</form>
		</div>

	</div>

</body>
</html>