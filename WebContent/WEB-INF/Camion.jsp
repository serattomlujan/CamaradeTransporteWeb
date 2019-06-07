<%@page import="controles.CtrlABMCamion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Socio"%>
<%@page import="entity.Camion"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>CTCarabelas</title>
<link rel="icon" type="iman/png" href="Style/Icono.png">
<link href="Style/webLayout.css" rel="stylesheet">
<link href="Style/tabla.css" rel="stylesheet">
<link href="Style/Layout.css" rel="stylesheet">
<link href="Style/formulario.css" rel="stylesheet">
<link rel="stylesheet" href="Style/jquery.dataTables.min.css">
<script src="Style/jquery-3.4.1.min.js"></script>
<script src="Style/jquery.dataTables.min.js"></script>
<script type="text/javascript">
    	function submitForm(met) {
    		document.myForm.action=met;
    		
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
				url: "Camion?accion=cargarListado",
				dataSrc: "datos"
			},
			columns: [
				{"data": "id_camion"},
				{"data": "patente"},
				{"data": "modelo"},
				{"data": "marca"},
				{"data": "estado"},
				{"data": "fecha_ingreso"},
				{"data": "nro_socio"},
				{"data": "apellido"},
				{"data": "nombre"}
			]
	});
			
});
</script>
</head>
<body>
	<%String patente="";
 patente=request.getParameter("patente"); %>

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
	<div class="row">
		<div class="leftcolumn" align="center">
			<div class="buscadorDiv">
				<h1 style="text-align: center">Camiones</h1>
				<form class="form-signin" id="myForm" name="camion" action=""
					method="post">
					<div class="card">
						<label for="inputpatente" class="sr-only">PATENTE</label> <input
							name="patente" id="inputpatente" class="form-control buscador"
							placeholder="" required="" autofocus="" type="text"
							<% if (patente!=null) {%> value=<%=patente %> <%} %>>
						<button type="submit" name="accion" value="Buscar"
							onclick="javascript: submitForm('Camion')">BUSCAR</button>
						<% if (patente!=null) {%>
						<button type="submit" name="accion" value="Agregar"
							onclick="javascript: submitForm('Camion')">AGREGAR
							CAMION</button>
						<%} %>
					</div>
					<div class="textoError">
					<% if (patente!=null) {%>
						<p style="color: #FF0000; margin-top: 0px">No se encontró camion registrado</p>
						<%} %>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="card">
		<table id="customers" align="center" class="tabla">
  <thead>
			<tr>
				<th>ID CAMION</th>
				<th>PATENTE</th>
				<th>MODELO</th>
				<th>MARCA</th>
				<th>ESTADO</th>
				<th>FECHA INGRESO</th>
				<th>NRO. SOCIO</th>
				<th >APELLIDO</th>
				<th >NOMBRE</th>

			</tr>
 </thead>
<tbody id="employee_data">
        <tr style="visibility: hidden">
					<th>ID Servicio</th>
				</tr>
        </tbody>
		</table>
	</div>


</body>
</html>
