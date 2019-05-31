<%@page import="controles.CtrlABMCereal"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Servicio"%>
<%@page import="entity.Cereal"%>
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
<link href="Style/Layout.css" rel="stylesheet">
<link href="Style/tabla.css" rel="stylesheet">
<link href="Style/formulario.css" rel="stylesheet">
<link rel="stylesheet" href="Style/jquery.dataTables.min.css">
<script src="Style/jquery-3.4.1.min.js"></script>
<script src="Style/jquery.dataTables.min.js"></script>

<script>
function table() {
	$('#reporte').dataTable().fnDestroy();
						var table = $('#reporte')
								.DataTable(
										{
											"language" : {
												"url" : "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
											},
											orderCellsTop : true,
											fixedHeader : true,
											ajax : {
												method : "GET",
												url : "Servicio?opcion="+$('input:radio[name=opcion]:checked').val()+"&fecha_desde="+$(inputFechaDesde).val()+"&fecha_hasta="+$(inputFechaHasta).val()+"&accion=BuscarServicio",
												dataSrc : "datos"
											},
											columns : [ {
												"data" : "string1"
											}, {
												"data" : "string2"
											}, {
												"data" : "cant_servicio"
											}, {
												"data" : "cant_toneladas"
											}, {
												"data" : "cant_km"
											}]
										});
					}
</script>

<script type="text/javascript">
	function submitForm(met) {
		document.myForm.action = met;

	}
</script>
</head>
<body>
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
						<li><a href="Servicio?accion=informeServicio"> Informe de Servicios</a></li>
					</ul>
		
	
     </ul>
	</div>

<div class="row">
		<div class="leftcolumn" align="center">
			<div class="">

				<h1 style="text-align: center">Servicios</h1>

					<div class="card">
				 <div>
        <label>Seleccione una opcion</label>
        <input type = "radio" id="opcion1" name = "opcion" value ="socios" > Socios
        <br>
        <input type = "radio" id="opcion2" name = "opcion" value ="cereales" > Cereales
        <br>
        <input type = "radio" id="opcion3" name = "opcion" value ="camiones" > Camiones
        <br>
        <input type = "radio" id="opcion4" name = "opcion" value ="clientes" > Clientes
    </div>
							
						
							<label for="inputFechaDesde">FECHA DESDE:</label>
							<input name="fecha_desde" id="inputFechaDesde" 
								class="form-control" placeholder="" type="date"
								style="height: 25px;"
								 value="">
					
							<label for="inputFechaHasta">FECHA HASTA:</label>
						
					
							<input name="fecha_hasta" id="inputFechaHasta" 
								class="form-control" placeholder="" type="date"
								style="height: 25px;"
								 value="">
								 
								 <div class="row">
							<button type="submit" class="botonGuardar" name="accion"
								value="BuscarServicio" onclick="table()"
								data-toggle="tooltip" data-placement="top"
								title="Buscar datos del Servicio"> 
								<span class="glyphicon glyphicon-align-left" aria-hidden="true"></span> BUSCAR</button>

						</div>
						
					</div>
				

			</div>	</div>	</div>

	
	<div class="card">
		<table id="reporte" class="display" style="width: 100%">
			<thead>
				<tr>
					<th>ID Cereal</th>
					<th>Descripcion</th>
					<th>Servicios Realizados</th>
					<th>Total Toneladas</th>
					<th>Total km</th>
				</tr>

			</thead>
			<tbody>

			</tbody>
			<tfoot>
				<tr>
				
					<th>Cuit</th>
					<th>Razon Social</th>
					<th>Servicios Realizados</th>
					<th>Total Toneladas</th>
					<th>Total km</th>

				</tr>


			</tfoot>
		</table>
	</div>

</body>
</html>
