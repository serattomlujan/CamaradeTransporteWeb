<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="controles.CtrlABMCereal"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Cereal"%>
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
<link rel="stylesheet" href="Style/jquery.dataTables.min.css">
<script src="Style/jquery-3.4.1.min.js"></script>
<script src="Style/jquery.dataTables.min.js"></script>
<script>
	$(document)
			.ready(
					function() {
						var tabla = $('#customers').DataTable({
											bFilter : false,
											"language" : {
												"url" : "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
											},
											ajax : {
												method : "GET",
												url : "Cereal?accion=cargarListado",
												dataSrc : "datos"
											},
											columns : [ {
												"data" : "id_cereal"
											}, {
												"data" : "descripcion"
											}, {
												"data" : "accion"
											} ]
										});

					});
</script>
<script type="text/javascript">
	function submitForm(met) {
		document.myForm.action = met;

	}
</script>

</head>
<body>
	<%
		String descripcion = "";
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
		<li> <a href="Socio?accion=Ingresar">Socios</a> </li>
		<li> <a href="Cliente?accion=Ingresar">Clientes</a> </li>
		<li> <a href="Camion?accion=Ingresar">Camiones</a> </li>
		<li> <a href="Cereal?accion=Ingresar">Cereales</a> </li>
		<li> <a href="#">Servicios</a>
					<ul>
						<li><a href="precio?accion=Ingresar"> Actualizar precios</a></li>
						<li><a href="Servicio?accion=ABMServicio"> Alta de Servicio</a></li>
						<li><a href="Servicio?accion=FinalizarServicio"> Finalizar Servicio</a></li>
						<li><a href="Servicio?accion=informeServicio"> Informe de Servicios</a></li>
					</ul>
		
	
     </ul>
	</div>
	<form class="form-signin" id="myForm" name="abmcereal" action="Cereal?accion=Editar"
						method="post">
	<div class="row">
		<div class="leftcolumn">

			<div class="buscadorDiv">
				<h1 style="text-align: center; margin-bottom: 0px;">Cereales</h1>
				<br>

				


					<div class="card" align="center" style="padding: 3px 20px;">
						<button type="submit" name="accion" value="AgregarCereal" onclick="javascript: submitForm('Cereal')">AGREGAR
							CEREAL</button>
					</div>
				
			</div>

		</div>
	</div>

	
		<div class="card" style="padding: 3px 20px;">
<!-- 		<form class="form-signin" id="myForm" name="cereal" -->
<!-- 		action="Cereal?accion=Editar" method="post"> -->
			<table id="customers" align="center" class="tabla">
				<thead>
					<tr>
						<th style="width: 20%">ID CEREAL</th>
						<th style="width: 50%">DESCRIPCION</th>
						<th style="width: 30%">ACCION</th>
					</tr>

				</thead>
				<tbody id="employee_data">
				</tbody>
				<tfoot>
				
				</tfoot>
			</table>
<!-- 			</form> -->
		</div>
	</form>
</body>
</html>
