<%@page import="java.util.ArrayList"%>
<%@page import="entity.Camion"%>
<%@page import="entity.Socio"%>
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
<link href="Style/Layout.css" rel="stylesheet">
<link href="Style/formulario.css" rel="stylesheet">
<!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
<script type="text/javascript">
	function submitForm(met) {
		document.myForm.action = met;

	}
</script>
<script type="text/javascript">
	function alerta() {
		window.onload = alert('Se ha registrado con exito')
		location.assign('Camion');
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
	
	<%  Socio socio=null;
		Camion encontrada = null;
		int id_camion = 0;
		String patente = "";
		String marca = "";
		String modelo = "";
		boolean estado = true;
		Date fecha_ingreso = null;
		int nro_socio = -1;
		String dni = "";
		String apellido = "";
		String nombre = "";

		if (request.getAttribute("encontrada") != null) {
			encontrada = (Camion) request.getAttribute("encontrada");
			id_camion = encontrada.getIdcamion();
			patente = encontrada.getPatente();
			marca = encontrada.getMarca();
			modelo = encontrada.getModelo();
			estado = encontrada.isEstado();
			fecha_ingreso = encontrada.getFecha_ingreso();
			nro_socio = encontrada.getSocio().getNro_Socio();
			dni = encontrada.getSocio().getDni();
			apellido = encontrada.getSocio().getApellido();
			nombre = encontrada.getSocio().getNombre();
			
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

				<form id="myForm" name="abmcliente" action=""
					method="post">
					<h2 class="form-signin-heading encabezadoContainer" style="padding-left: 0px;">Datos de Camion</h2>
					<% if(id_camion != 0) {%>
					<div class="row lineaForm">
						<div class="cajaLabel">
							<label for="inputIdCamion">ID CAMION</label>
						</div>
						<div class="cajaNumerica">
							<input name="id_camion" id="inputIdCamion" class="form-control"
								type="text" readonly="readonly" value=<%=id_camion%>>
						</div>
					</div>
							<%} %>
					
					
					<p> <strong> Datos del Socio </strong> </p>
					<hr>
					
					<div class="row lineaForm">
						<div class="cajaLabel">
							<label for="inputDni">DNI:</label>
						</div>
						<div class="cajaNumerica">

							<input name="dni" id="inputDni" class="form-control" required=""
								placeholder="" autofocus="" type="text" 
								<%if (dni == null) {%> value="" <%} 
								else {%> value=<%=dni%> <%}%>>
							
						</div>
						<button type="submit" name="accion" value="BuscarSocio" class="buscarSocio"
								onclick="javascript: submitForm('Camion')"> BUCAR SOCIO </button>

						<div class="cajaLabel">
							<label for="inputNroSocio"> NRO. SOCIO:</label>
						</div>
						<div class="cajaNumerica">
							<input style="background: #e9e9e9;" name="nro_socio"
								id="inputNroSocio" class="form-control" type="text"
								readonly="readonly"  
								<%if (nro_socio ==  -1)  {%> value="" <%} 
								else {%> value=<%=nro_socio%> <%}%> >
						</div>
					</div>
					<div class="row lineaForm">
					<%if(nro_socio == 0) {%>
					<p style="color: #FF0000; margin-top: 0px">
					No existe socio registrado para el dni ingresado </p>
							<%} %>
					</div>

					<div class="row lineaForm">
						<div class="cajaLabel">
							<label for="inputApellido">APELLIDO:</label>
						</div>
						<div class="cajaInput">
							<input style="background: #e9e9e9;" name="apellido"
								id="inputApellido" class="form-control" type="text"
								readonly="readonly"
								<%if (apellido == null) {%> value="" <%} 
								else {%> value=<%=apellido%> <%}%> >
						</div>
					
						<div class="cajaLabel">
							<label for="inputNombre">NOMBRE:</label>
						</div>
						<div class="cajaInput">
							<input style="background: #e9e9e9;" name="nombre"
								id="inputNombre" class="form-control" type="text"
								readonly="readonly" 
								<%if (nombre == null) {%> value="" <%} 
								else {%> value=<%=nombre%> <%}%>>
						</div>
					</div>
					<p> <strong> Datos del Camion </strong> </p>
					<hr>
					
					<div class="row lineaForm">
						<div class="cajaLabel">
							<label for="inputPatente">PATENTE:</label>
						</div>
						<div class="cajaNumerica">
							<input name="patente" id="inputPatente" class="form-control"
								placeholder="" autofocus="" type="text" 
								<%if (patente==null) {%> value="" <%} 
								else {%> value=<%=patente%> <%}%>
								>
						</div>
						
							<div class="cajaLabel">
							<label for="inputEstado">ESTADO:</label>
						</div>
						<div class="cajaEstado">
							<input type="checkbox" name="estado" id="inputestado"
								value="true" <%if (estado) {%> checked <%}%>><label
								for="inputEstado"> Disponible </label>
						</div>
						
					</div>
					
					<div class="row lineaForm">
						<div class="cajaLabel">
							<label for="inputMarca">MARCA:</label>
						</div>
						<div class="cajaNumerica">
							<input name="marca" id="inputMarca" class="form-control"
								placeholder="" autofocus="" type="text" 
								<%if (marca==null) {%> value="" <%} 
								else {%> value=<%=marca%> <%}%>
								>
						</div>
						
						<div class="cajaLabel">
							<label for="inputModelo">MODELO:</label>
						</div>
						<div class="cajaNumerica">
							<input name="modelo" id="inputeModelo" class="form-control"
								placeholder="" autofocus="" type="text"
							<%if (modelo==null) {%> value="" <%} 
								else {%> value=<%=modelo%> <%}%>
								>
						</div>

						<div class="cajaLabel" style="width: 17%">
							<label for="inputFechaIngreso">FECHA INGRESO:</label>
						</div>
						<div class="cajaInput">
							<input name="fecha_ingreso" id="inputFechaIngreso"
								class="form-control" placeholder="" type="date"
								value=<%=fecha_ingreso%>>
						</div>
					</div>
					

					<div class="row">
						<button class="botonGuardar" type="submit" name="accion" value="Guardar"
							onclick="javascript: submitForm('Camion')"> GUARDAR </button>
					</div>



				</form>
			</div>
		</div>

	</div>

</div>
</body>
</html>
