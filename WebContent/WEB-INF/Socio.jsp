<%@page import="controles.CtrlABMSocio"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Socio"%>
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
<link href="Style/formulario.css" rel="stylesheet">
<link href="Style/Layout.css" rel="stylesheet">
<script type="text/javascript">
	function submitForm(met) {
		document.myForm.action = met;

	}
</script>
</head>
<body>
	<%
		String dni = "";
		dni = request.getParameter("dni");
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
			<div class="buscadorDiv">

				<h1 style="text-align: center">Socios</h1>

				<form class="form-signin" id="myForm" name="socio" action=""
					method="post">
					<div class="card">
						<label for="inputdni" class="sr-only">DNI</label> 
						<input name="dni" id="inputdni" class="form-control buscador"
									placeholder="" required="" autofocus="" type="text"
									<%if (dni != null) {%> value=<%=dni%> <%}%>>
						
							<button type="submit" name="accion" value="Buscar"
							onclick="javascript: submitForm('Socio')">
							<i class="fas fa-search"></i> BUSCAR
						</button>
							<%
								if (dni != null) {
							%>
							<button type="submit" name="accion" value="Agregar Socio"
							onclick="javascript: submitForm('Socio')">AGREGAR SOCIO</button>
							<%
								}
							%>
					</div>
					<div class="textoError">
					<%
								if (dni != null) {
							%>
							<p style="color: #FF0000; margin-top: 0px">No se encontró socio registrado</p>
							<%
								}
							%>
					</div>
				</form>

			</div>
			

			<div class="card">
				<table  id="customers" align="center" class="tabla">

					<tr>
						<th>NRO SOCIO</th>
						<th>DNI</th>
						<th style="width: 30%">APELLIDO</th>
						<th style="width: 30%">NOMBRE</th>
						<th>TELEFONO</th>
						<th>ESTADO</th>


					</tr>


					<%
						ArrayList<Socio> listaSocs = (ArrayList<Socio>) request.getAttribute("listaSocios");
						for (Socio s : listaSocs) {
					%>
                  
					<tr>
						<td><%=s.getNro_Socio()%></td>
						<td><%=s.getDni()%></td>
						<td><%=s.getApellido()%></td>
						<td><%=s.getNombre()%></td>
						<td><%=s.getTelefono()%></td>
						<%
							String estado = "";
								if (s.isEstado()) {
									estado = "Activo";
								} else {
									estado = "Inactivo";
								}
						%>
						<td><%=estado%></td>

</tr>
					<%
						}
					%>
			
				</table>
			</div>
		</div>

	</div>

</body>
</html>