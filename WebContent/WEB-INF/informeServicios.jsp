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
<title>Insert title here</title>
<link href="Style/webLayout.css" rel="stylesheet">
<link href="Style/tabla.css" rel="stylesheet">
<link href="Style/formulario.css" rel="stylesheet">
<link rel="stylesheet" href="Style/jquery.dataTables.min.css">
<script src="Style/jquery-3.4.1.min.js"></script>
<script src="Style/jquery.dataTables.min.js"></script>
<%if(request.getAttribute("reporteServ")==null){ %>
<script>
	$(document)
			.ready(
					function() {
						//  Setup - add a text input to each footer cell 
						$('#example thead tr').clone(true).appendTo(
								'#example thead');
						$('#example thead tr:eq(1) th')
								.each(
										function(i) {
											var title = $(this).text();
											$(this)
													.html(
															'<input type="text" placeholder="Buscar '+title+'" />');

											$('input', this)
													.on(
															'keyup change',
															function() {
																if (table
																		.column(
																				i)
																		.search() !== this.value) {
																	table
																			.column(
																					i)
																			.search(
																					this.value)
																			.draw();
																}
															});
										});

						var table = $('#example')
								.DataTable(
										{
											"language" : {
												"url" : "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
											},
											orderCellsTop : true,
											fixedHeader : true,
											ajax : {
												method : "GET",
												url : "Servicio?accion=listarInfomeServicios",
												dataSrc : "datos"
											},
											columns : [ {
												"data" : "id_servicio"
											}, {
												"data" : "cereal"
											}, {
												"data" : "cuit"
											}, {
												"data" : "razon_social"
											}, {
												"data" : "id_camion"
											}, {
												"data" : "patente"
											}, {
												"data" : "fecha"
											}, {
												"data" : "hora"
											}, {
												"data" : "cant_toneladas"
											}, {
												"data" : "km_transportados"
											}, {
												"data" : "precio_servicio"
											} ]
										});
					});
</script>
<%} %>
<script>
function table() {

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
												url : "Servicio?fecha_desde="+$(inputFechaDesde).val()+"&fecha_hasta="+$(inputFechaHasta).val()+"&accion=BuscarServicio",
												dataSrc : "datos"
											},
											columns : [ {
												"data" : "id_cereal"
											}, {
												"data" : "descripcion"
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

	<div class="topnav">
		<a href="Home?accion=menu">Home</a> <a href="Socio">Socios</a> <a
			href="Cliente">Clientes</a>
	</div>

<div class="row">
		<div class="leftcolumn" align="center">
			<div class="">

				<h1 style="text-align: center">Servicios</h1>

				<form class="form-signin" id="myForm" name="servicio" action=""
					method="post">
					<div class="card">
				 <div>
        <label>Seleccione una opcion</label>
        <input type = "radio" id="opcion" name = "opcion" value ="socios" /> Socios
        <br>
        <input type = "radio" id="opcion" name = "opcion" value ="cereales" /> Cereales
        <br>
        <input type = "radio" id="opcion" name = "opcion" value ="camiones" /> Camiones
        <br>
        <input type = "radio" id="opcion" name = "opcion" value ="clientes" /> Clientes
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
				</form>

			</div>	</div>	</div>

	<div class="card">
		<table id="example" class="display" style="width: 100%">
			<thead>
				<tr>
					<th>ID Servicio</th>
					<th>Cereal</th>
					<th>Cuit</th>
					<th>Razon Social</th>
					<th>ID Camion</th>
					<th>Patente</th>
					<th>Fecha</th>
					<th>Hora</th>
					<th>Toneladas</th>
					<th>KM</th>
					<th>Precio Servicio</th>

				</tr>

			</thead>
			<tbody>

			</tbody>
			<tfoot>
				<tr>
					<th>ID Servicio</th>
					<th>Cereal</th>
					<th>Cuit</th>
					<th>Razon Social</th>
					<th>ID Camion</th>
					<th>Patente</th>
					<th>Fecha</th>
					<th>Hora</th>
					<th>Toneladas</th>
					<th>KM</th>
					<th>Precio Servicio</th>

				</tr>


			</tfoot>
		</table>
	</div>
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
					<th>ID Cereal</th>
					<th>Descripcion</th>
					<th>Servicios Realizados</th>
					<th>Total Toneladas</th>
					<th>Total km</th>

				</tr>


			</tfoot>
		</table>
	</div>

</body>
</html>