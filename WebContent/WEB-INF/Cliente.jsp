<%@page import="controles.CtrlABMCliente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Cliente"%>
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
<link rel="stylesheet" href="Style/jquery.dataTables.min.css">
<script src="Style/jquery-3.4.1.min.js"></script>
<script src="Style/jquery.dataTables.min.js"></script>
<script type="text/javascript">
	function submitForm(met) {
		document.myForm.action = met;

	}
</script>

    <script>
$(document).ready(function(){
	var tabla= $('#customers').DataTable({
bFilter:false,
		"language" : {
			"url" : "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
		},	
		ajax:{
				method: "GET",
				url: "Cliente?accion=cargarListado",
				dataSrc: "datos"
			},
			columns: [
				{"data": "cuit"},
				{"data": "razon_social"},
				{"data": "direccion"},
				{"data": "telefono"},
				{"data": "estado"},
				
			]
	});
			
});
</script>

</head>
<body>
	<%
		String cuit = "";
		cuit = request.getParameter("cuit");
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
						<li><a href="Servicio?accion=ABMServicio"> Alta de Servicio</a></li>
						<li><a href="Servicio?accion=FinalizarServicio"> Finalizar Servicio</a></li>
						<li><a href="Servicio?accion=serviciosFinalizados"> Listado de Servicios</a></li>
						<li><a href="Servicio?accion=informeServicio"> Informe de Servicios</a></li>
						<li><a href="precio?accion=Ingresar"> Actualizar precios</a></li>
					</ul>
		
	
     </ul>
	</div>
	<div class="row">
		<div class="leftcolumn" align="center">
			<div class="buscadorDiv">

				<h1 style="text-align: center">Clientes</h1>

				<form class="form-signin" id="myForm" name="cliente" action="Cliente"
					method="post">
					<div class="card">
						<label for="inputcuit" class="sr-only">CUIT</label> <input
							name="cuit" id="inputcuit" class="form-control buscador"
							placeholder="" required="" autofocus="" type="text"
							<%if (cuit != null) {%> value=<%=cuit%> <%}%>>
						<button type="submit" name="accion" value="Buscar">BUSCAR</button>
						<%
							if (cuit != null) {
						%>
						<button type="submit" name="accion" value="Agregar Cliente">AGREGAR
							CLIENTE</button>
						<%
							}
						%>
					</div>
					<div class="textoError">
					<%
							if (cuit != null) {
						%>
						<p style="color: #FF0000; margin-top: 0px">No se encontr� cliente registrado</p>
						<%
							}
						%>
					</div>
				</form>

			</div>
			<div class="card">
				<table id="customers" align="center" class="tabla" style="width: 100%">
  <thead>
					<tr>
						<th>CUIT</th>
						<th >RAZON SOCIAL</th>
						<th >DIRECCION</th>
						<th>TELEFONO</th>
						<th>ESTADO</th>

					</tr>

</thead>
<tbody id="employee_data">
        
        </tbody>
				</table>
			</div>
		</div>

	</div>

</body>
</html>
