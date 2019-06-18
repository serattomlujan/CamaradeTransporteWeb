<%@page import="entity.Servicio"%>
<%@page import="entity.Camion"%>
<%@page import="entity.Cliente"%>
<%@page import="entity.PrecioKM"%>
<%@page import="entity.Cereal"%>
<%@page import="controles.CtrlABMCereal"%>
<%@page import="controles.CtrlABMPrecio_km"%>
<%-- <%@page import="java.sql.Date"%> --%>
<%@page import="java.sql.Time"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>CTCarabelas</title>

<link rel="icon" type="iman/png" href="Style/Icono.png">

<script src="https://code.jquery.com/jquery-1.10.2.js"
	type="text/javascript"></script>

<script src="js/app-ajax.js" type="text/javascript"></script>

<link href="Style/webLayout.css" rel="stylesheet">

<link href="Style/formulario.css" rel="stylesheet">

<link href="Style/Layout.css" rel="stylesheet">
<!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
<script type="text/javascript">
	function submitForm(met) {
		document.myForm.action = met;

	}
</script>
<script type="text/javascript">
	function Valida(formulario) {
		var fecha = $("#inputFechaServicio").val();
		var hora = $("#inputHoraServicio").val();
		var razon_social = $("#inputRazonSocial").val();
		var valido = true;

		//VALIDACION MAC
		if (fecha === "" || fecha === "0") {
			$("#fechaMsgError").html("Este campo no puede estar vac&iacute;o");
			valido = false;
		} else {
			$("#fechaMsgError").html("");
		}
		if (hora === "" || hora === "0") {
			$("#horaMsgError").html("Este campo no puede estar vac&iacute;o");
			valido = false;
		} else {
			$("#horaMsgError").html("");
		}
		if (razon_social === "" || razon_social === "0") {
			$("#razSocMsgError").html(
					"Este campo no puede estar vac&iacute;o ni ser cero");
			valido = false;
		} else {
			$("#razSocMsgError").html("");
		}
		return valido;
	}
</script>
<script type="text/javascript">
	function ValidaGuardar(formulario) {
		var id_servicio = $("#inputIdServicio").val();
		var km_trans = $("#inputKmTransp").val();
		var cant_ton = $("#inputCantToneladas").val();
		var total = $("#inputTotal").val();
		var cuit = $("#inputCuit").val();
		var razon_social = $("#inputRazonSocial").val();
		var id_camion = $("#inputCamion").val();
		var patente = $("#inputPatente").val();
		var valido = true;

		//VALIDACION MAC
		if (id_servicio == undefined || id_servicio === "0") {
			if (cuit === "" || cuit === "0") {
				$("#cuitMsgError").html(
						"Este campo no puede estar vac&iacute;o ni ser cero");
				valido = false;
			} else {
				$("#cuitMsgError").html("");
			}
			if (razon_social === "" || razon_social === "0") {
				$("#razSocMsgError").html(
						"Este campo no puede estar vac&iacute;o ni ser cero");
				valido = false;
			} else {
				$("#razSocMsgError").html("");
			}
			if (id_camion === "" || id_camion === "0") {
				$("#idCamMsgError").html(
						"Este campo no puede estar vac&iacute;o ni ser cero");
				valido = false;
			} else {
				$("#idCamMsgError").html("");
			}
			if (patente === "" || patente === "0") {
				$("#patMsgError").html(
						"Este campo no puede estar vac&iacute;o ni ser cero");
				valido = false;
			} else {
				$("#patMsgError").html("");
			}
		} else {
			if (km_trans === "" || km_trans === "0") {
				$("#kmMsgError").html(
						"Este campo no puede estar vac&iacute;o ni ser cero");
				valido = false;
			} else if (km_trans > 1000) {
				$("#tonMsgError").html(
						"Las km transportados no pueden ser superior a los 1000 km");
				valido = false;
			} else if (isNaN(km_trans)) {
				$("#kmMsgError").html(
						"El campo debe ser un valor num&eacute;rico");
				valido = false;
			} else {
				$("#kmMsgError").html("");
			}
			if (cant_ton === "" || cant_ton === "0") {
				$("#tonMsgError").html(
						"Este campo no puede estar vac&iacute;o ni ser cero");
				valido = false;
			} else if (cant_ton > 35) {
				$("#tonMsgError").html(
						"La cantidad de toneladas no puede ser superior a 35");
				valido = false;
			} else if (isNaN(cant_ton)) {
				$("#tonMsgError").html(
						"El campo debe ser un valor num&eacute;rico");
				valido = false;
			} else {
				$("#tonMsgError").html("");
			}
			if (total === "" || total === "0.0") {
				$("#totalMsgError").html(
						"Este campo no puede estar vac&iacute;o ni ser cero");
				valido = false;
			} else if (isNaN(km_trans)) {
				$("#totalMsgError").html(
						"El campo debe ser un valor num&eacute;rico");
				valido = false;
			} else {
				$("#totalMsgError").html("");
			}
		}
		return valido;
	}
</script>
<script type="text/javascript">
	function alerta() {
		window.onload = alert('Se ha registrado con exito')
		location.assign('Servicio?accion=FinalizarServicio');
	}
</script>
<script>
	$(document).ready(function readonly() {
		var id_servicio = $("#inputIdServicio").val();
		if (id_servicio != undefined) {
			$('#inputCuit').prop('readonly', true);
			$('#inputFechaServicio').prop('readonly', true);
			$('#inputHoraServicio').prop('readonly', true);
			$('#inputCereal option:not(:selected)').prop('disabled', true);
			$('#asignar').attr("disabled", true);
			$('#buscar').attr("disabled", true);
		}
	}

	);
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
			<li><a href="Socio?accion=Ingresar">Socios</a></li>
			<li><a href="Cliente?accion=Ingresar">Clientes</a></li>
			<li><a href="Camion?accion=Ingresar">Camiones</a></li>
			<li><a href="Cereal?accion=Ingresar">Cereales</a></li>
			<li><a href="#">Servicios</a>
				<ul>
					<li><a href="Servicio?accion=ABMServicio"> Alta de
							Servicio</a></li>
					<li><a href="Servicio?accion=FinalizarServicio"> Finalizar
							Servicio</a></li>
					<li><a href="Servicio?accion=serviciosFinalizados">
							Listado de Servicios</a></li>
					<li><a href="Servicio?accion=informeServicio"> Informe de
							Servicios</a></li>
					<li><a href="precio?accion=Ingresar"> Actualizar precios</a></li>
				</ul>
		</ul>
	</div>
	<%java.util.Date fechaAct = new Date();
	 SimpleDateFormat objSDF = new SimpleDateFormat("yyyy-MM-dd"); 
	 String fechaAc=objSDF.format(fechaAct);

		Servicio encontrada = null;
		String id_servicio = "";
		String cuit = "";
		String razon_social = "";
		Date fecha_servicio = null;
		Time hora_servicio = null;
		String km_transportados = "";
		String cant_toneladas = "";
		String observacion = "";
		int id_cereal = 0;
		String desc_cereal = "";
		String id_camion = "";
		String patente = "";
		String precio_servicio = "";

		if (request.getAttribute("encontrada") != null) {
			encontrada = (Servicio) request.getAttribute("encontrada");
			id_servicio = String.valueOf(encontrada.getIdservicio());
			if (id_servicio.equals("0")) {
				id_servicio = "";
				id_camion = "";
				patente = "";

			}
			cuit = encontrada.getCliente().getCuit();
			razon_social = encontrada.getCliente().getRazon_social();
			id_cereal = encontrada.getCereal().getIdcereal();
			desc_cereal = encontrada.getCereal().getDescripcion();
			fecha_servicio = encontrada.getFecha();
			hora_servicio = encontrada.getHora();
			id_camion = String.valueOf(encontrada.getCamion().getIdcamion());
			patente = encontrada.getCamion().getPatente();
			km_transportados = String.valueOf(encontrada.getKm_transportados());
			cant_toneladas = String.valueOf(encontrada.getCant_toneladas());
			observacion = encontrada.getObservaciones();
			precio_servicio = String.valueOf(encontrada.getPrecio_servicio());

		}
		if (request.getAttribute("actualizado") != null) {
	%><script type="text/javascript">
		alerta();
	</script>
	<%
		}
	%>
	<div class="row">
		<div class="leftcolumn">
			<div class="card">
				<div class="container" align="center">
					<form name="miFormulario" name="abmservicio" action="Servicio"
						method="post">
						<!-- 			<form id="myForm" name="abmcliente" action="Servicio" -->
						<!-- 					method="post"> -->
						<h2 class="form-signin-heading encabezadoContainer">Datos de
							alta Servicio</h2>

						<div class="row lineaForm">

							<%
								if (id_servicio != "") {
							%>
							<div class="cajaLabel" style="margin-left: 10px;">
								<label for="inputIdCamion">ID SERVICIO:</label>
							</div>
							<div class="cajaNumerica">
								<input name="id_servicio" id="inputIdServicio"
									class="form-control" type="text" readonly="readonly"
									value="<%=id_servicio%>">
							</div>

							<%
								}
							%>

						</div>
						<p>
							<strong> Datos del Cliente </strong>
						</p>
						<hr>


						<div class="row lineaForm">
							<div class="cajaLabel">
								<label for="inputDni">CUIT:</label>
							</div>
							<div class="cajaNumerica">
								<%
									if (cuit == "0") {
								%>
								<p style="color: #FF0000; margin-top: 0px">No existe cliente
									registrado para el cuit ingresado</p>
								<%
									}
								%>

								<input name="cuit" id="inputCuit" class="form-control"
									required="" placeholder="" autofocus="" type="text"
									value="<%=cuit%>"> <label id="cuitMsgError"
									style="color: red;"></label>
							</div>
							<button type="submit" name="accion" id="buscar" value="Buscar"
								class="buscarSocio">BUSCAR</button>


							<div class="cajaLabel" style="width: 15%">
								<label for="inputRazonSocial">RAZON SOCIAL:</label>
							</div>
							<div class="cajaInput">
								<input style="background: #e9e9e9;" name="razon_social"
									id="inputRazonSocial" class="form-control" type="text"
									readonly="readonly" value="<%=razon_social%>"> <label
									id="razSocMsgError" style="color: red;"></label>
							</div>
						</div>
						<div class="row lineaForm">
							<div class="cajaLabel">
								<label for="inputCereal" class="sr-only">CEREAL:</label>
							</div>
							<%
								CtrlABMCereal ctrl = new CtrlABMCereal();
								ArrayList<Cereal> cereales = new ArrayList<Cereal>();
								cereales = ctrl.getAll2();
							%>
							<div class="cajaInput">
								<select name="cereal" id="inputCereal">
									<%
										for (Cereal c : cereales) {
											if (c.getIdcereal() == id_cereal) {
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


							<div class="cajaLabel">
								<label for="inputFechaServicio">FECHA:</label>
							</div>
							<div class="cajaInput">
								<input name="fecha_servicio" id="inputFechaServicio"
									class="form-control" placeholder="" type="date"
									style="height: 25px;" min="<%=fechaAc%>" value="<%=fecha_servicio%>"> <label
									id="fechaMsgError" style="color: red;"></label>
							</div>

							<div class="cajaLabel">
								<label for="inputHoraServicio">HORA:</label>
							</div>
							<div class="cajaHora">
								<input name="hora_servicio" id="inputHoraServicio"
									class="form-control cajaHora" placeholder="" type="time"
									style="font-size: 20px; height: 35px; border-radius: 4px; margin-top: 6px;"
									value="<%=hora_servicio%>"> <label id="horaMsgError"
									style="color: red;"></label>
							</div>
						</div>
						<p>
							<strong> Datos del Camion </strong>
						</p>
						<hr>
						<div class="row lineaForm">
							<div class="cajaLabel">
								<label for="inputCamion">ID CAMION:</label>
							</div>
							<div class="cajaNumerica">
								<input name="camion" id="inputCamion" class="form-control"
									placeholder="" autofocus="" readonly="readonly" type="text"
									value="<%=id_camion%>"> <label id="idCamMsgError"
									style="color: red;"></label>
							</div>
							<button type="submit" name="accion" id="asignar"
								value="AsignarCamion" class="buscarSocio"
								onclick="return Valida(this);">ASIGNAR CAMION</button>

							<div class="cajaLabel">
								<label for="inputPatente">PATENTE:</label>
							</div>
							<div class="cajaNumerica">
								<input name="patente" id="inputPatente" class="form-control"
									placeholder="" autofocus="" readonly="readonly" type="text"
									value="<%=patente%>"> <label id="patMsgError"
									style="color: red;"></label>
							</div>
						</div>
						<%
							if (id_servicio != "") {
						%>
						<div class="row lineaForm">
							<div class="cajaLabel" style="width: 19%">
								<label for="inputKmTransp">KM TRANSPORTADOS:</label>
							</div>
							<div class="cajaNumerica">
								<input name="km_transportados" id="inputKmTransp"
									class="form-control" type="text" value=""
									onblur="calculaPrecio()"> <label id="kmMsgError"
									style="color: red;"></label>
							</div>


							<div class="cajaLabel" style="width: 21%">
								<label for="inputCantToneladas">CANT. DE TONELADAS:</label>
							</div>
							<div class="cajaNumerica">
								<input name="cant_toneladas" id="inputCantToneladas"
									class="form-control" type="text" value=""
									onblur="calculaPrecio()"> <label id="tonMsgError"
									style="color: red;"></label>
							</div>

							<div class="cajaLabel">
								<label for="inputTotal">TOTAL:</label>
							</div>
							<div class="cajaNumerica">
								<input name="total" id="inputTotal" class="form-control"
									placeholder="" type="text" readonly="readonly"
									value="<%=precio_servicio%>"> <label id="totalMsgError"
									style="color: red;"></label>
							</div>

						</div>
						<div class="row lineaForm">
							<div class="cajaLabel" style="width: 19%">
								<label for="inputObservacion">OBSERVACION:</label>
							</div>
							<div class="col-75">
								<input name="observacion" id="inputObservacion"
									class="form-control" placeholder="" type="text"
									value="<%=observacion%>">
							</div>
						</div>
						<%
							}
						%>


						<div align="center">
							<button type="submit" name="accion" value="Guardar"
								class="botonGuardar" onclick="return ValidaGuardar(this);">
								GUARDAR</button>
						</div>

					</form>
				</div>
			</div>

		</div>

	</div>
	<script type="text/javascript">
		function calculaPrecio() {

			var toneladas = $('#inputCantToneladas').val();

			var km = $('#inputKmTransp').val();

			var accion = 'calculaPrecio'

			console.log(toneladas);

			var datos = 'accion=' + accion + '&toneladas=' + toneladas + '&km='
					+ km;

			$.ajax({

				url : 'Servicio?accion=calculaPrecio',

				data : datos,

				success : function(responseText) {

					$('#inputTotal').val(responseText);

				}

			});

		}
	</script>


</body>
</html>
