<%@page import="controles.CtrlABMCereal"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Servicio"%>
<%@page import="entity.Cereal"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	$(document).ready(function() {
		$('#customers').hide();
	});
</script>
<script>
	function table() {
		var opcion = $('input:radio[name=opcion]:checked').val();
		switch (opcion) {
		case "cereales":
			var idCereal = "ID Cereal";
			$('#string1').val(idCereal);
			$('#string1').html(idCereal);
			var descripcion = "Descripcion";
			$('#string2').val(descripcion);
			$('#string2').html(descripcion);
			break;
		case "socios":
			var dni = "DNI";
			$('#string1').val(dni);
			$('#string1').html(dni);
			var apeynom = "Apellido y Nombre";
			$('#string2').val(apeynom);
			$('#string2').html(apeynom);
			break;
		case "clientes":
			var cuit = "CUIT";
			$('#string1').val(cuit);
			$('#string1').html(cuit);
			var razonSocial = "Razon Social";
			$('#string2').val(razonSocial);
			$('#string2').html(razonSocial);
			break;
		case "camiones":
			var idCamion = "ID Camion";
			$('#string1').val(idCamion);
			$('#string1').html(idCamion);
			var patente = "Patente";
			$('#string2').val(patente);
			$('#string2').html(patente);
			break;
		default:
			break;
		}
		if (opcion == "cereales") {
			var th1 = "cereales";
		}
		$('#customers').dataTable().fnDestroy();
		var table = $('#customers')
				.DataTable(
						{
							"language" : {
								"url" : "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
							},
							orderCellsTop : true,
							fixedHeader : true,
							ajax : {
								method : "GET",
								url : "Servicio?opcion="
										+ $('input:radio[name=opcion]:checked')
												.val() + "&fecha_desde="
										+ $(inputFechaDesde).val()
										+ "&fecha_hasta="
										+ $(inputFechaHasta).val()
										+ "&accion=BuscarServicio",
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
							}, {
								"data" : "recaudacion"
							} ]
						});
		$('#customers').show();
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
			<li><a href="Home?accion=menu">Home</a></li>
			<li> <a href="Socio?accion=Ingresar">Socios</a> </li>
		<li> <a href="Cliente?accion=Ingresar">Clientes</a> </li>
		<li> <a href="Camion?accion=Ingresar">Camiones</a> </li>
			<li> <a href="Cereal?accion=Ingresar">Cereales</a> </li>
			<li><a href="#">Servicios</a>
				<ul>
					<li><a href="precio?accion=Ingresar"> Actualizar precios</a></li>
					<li><a href="Servicio?accion=ABMServicio"> Alta de
							Servicio</a></li>
					<li><a href="Servicio?accion=FinalizarServicio"> Finalizar
							Servicio</a></li>
					<li><a href="Servicio?accion=informeServicio"> Informe de
							Servicios</a></li>
				</ul>
		</ul>
	</div>
<!-- <form class="form-signin" id="myForm" name="servicio" action="" -->
<!-- 					method="post">	 -->
	<div class="row">
	<div class="leftcolumn">
		<div class="card">
			<div class="container" align="center">
			
              <h1 style="text-align: center">Informe de servicios</h1>


	<div class="row">
		<div class="leftcolumn" align="center">
			<div >

			<div class="row lineaForm radioRow" >
        		<span class="radioButton"> Seleccione una opcion </span>
         		<span class="radioButton">  <input type = "radio" id="opcion1" name = "opcion" value ="socios"> Socios </span>
        		<span class="radioButton"> <input type = "radio" id="opcion2" name = "opcion" value ="cereales"> Cereales </span>
       			<span class="radioButton"> <input type = "radio" id="opcion3" name = "opcion" value ="camiones"> Camiones </span>
        		<span class="radioButton"> <input type = "radio" id="opcion4" name = "opcion" value ="clientes"> Clientes </span>
    </div>
						
						<div class="row lineaForm">
							<div class="cajaFechaInforme"> <label for="inputFechaDesde" class="sr-only">FECHA DESDE: </label> </div>
							<div class="cajaInput">	<input name="fecha_desde" id="inputFechaDesde" class="form-control" type="date"	value=""> </div>
							
							<div class="cajaFechaInforme">	<label for="inputFechaHasta" class="sr-only">FECHA HASTA: </label>	</div>
							<div class="cajaInput">	<input name="fecha_hasta" id="inputFechaHasta" class="form-control" type="date"	 value=""> </div>
							
							<button type="submit" class="buscarSocio" name="accion" value="BuscarServicio"
								data-toggle="tooltip" data-placement="top" title="Buscar datos del Servicio" onclick="table()"> BUSCAR </button>
					  </div>
				</div>	
			</div>	
	</div>
</div>


			</div>
		</div>
	</div>
<!-- </form> -->

	<div class="card">
		<table id="customers" class="display tabla" style="width: 100%">
			<thead>
				<tr>

					<th id="string1" value=""></th>
					<th id="string2" value=""></th>
					<th>Servicios Realizados</th>
					<th>Total Toneladas</th>
					<th>Total km</th>
					<th>Recaudacion</th>
				</tr>

			</thead>
			<tbody>

			</tbody>
			<tfoot>
				<tr style="visibility: hidden">
					<th></th>
					<th></th>
					<th></th>
					<th>Social</th>
					<th>Camion</th>
					<th>Recaudacion</th>

				</tr>
			</tfoot>
		</table>
	</div>

</body>
</html>
