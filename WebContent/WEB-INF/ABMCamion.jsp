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
<title>Insert title here</title>
<link href="Style/webLayout.css" rel="stylesheet">
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
		location.reload('Camion');
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
		<a href="Home?accion=menu">Home</a>
		<a href="Socio">Socios</a> 
		<a href="Cliente">Clientes</a>
		<a href="Camion">Camiones</a> 
		<a href="Cereal">Cereales</a> 
		<a href="precio?accion=Ingresar">Actualizar precios</a>
	</div>
	<%  Socio socio=null;
		Camion encontrada = null;
		int id_camion = 0;
		String patente = "";
		String marca = "";
		String modelo = "";
		boolean estado = true;
		Date fecha_ingreso = null;
		int nro_socio = 0;
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

	<div class="leftcolumn">
		<div class="card">
			<div class="container" align="center">

				<form class="form-signin" id="myForm" name="abmcliente" action=""
					method="post">
					<h2 class="form-signin-heading">Camion</h2>
					<div class="row">
						<div class="col-25">
							<label for="inputIdCamion">ID CAMION</label>
						</div>
						<div class="col-75">
							<input name="id_camion" id="inputIdCamion" class="form-control"
								type="text" readonly="readonly" value=<%=id_camion%>>
						</div>
					</div>
					<h5>
						<u>Datos del Socio</u>
					</h5>
					<div class="row">
						<div class="col-25">
							<label for="inputDni">DNI:</label>
						</div>
						<div class="col-75">
						<%if(nro_socio==0) {%><h6 style="color: #FF0000;">no existe socio registrado para el dni ingresado</h6><%} %>
							<input name="dni" id="inputDni" class="form-control" required=""
								placeholder="" autofocus="" type="text" value=<%=dni%>>
							<input type="submit" name="accion" value="BuscarSocio"
								onclick="javascript: submitForm('Camion')">
						</div>
						
					</div>
					<div class="row">
						<div class="col-25">
							<label for="inputNroSocio">NRO. SOCIO:</label>
						</div>
						<div class="col-75">
							<input style="background: #e9e9e9;" name="nro_socio"
								id="inputNroSocio" class="form-control" type="text"
								readonly="readonly" value=<%=nro_socio%>>
						</div>
					</div>

					<div class="row">
						<div class="col-25">
							<label for="inputApellido">APELLIDO:</label>
						</div>
						<div class="col-75">
							<input style="background: #e9e9e9;" name="apellido"
								id="inputApellido" class="form-control" type="text"
								readonly="readonly" value=<%=apellido%>>
						</div>
						</div>
<div class="row">
						<div class="col-25">
							<label for="inputNombre">NOMBRE:</label>
						</div>
						<div class="col-75">
							<input style="background: #e9e9e9;" name="nombre"
								id="inputNombre" class="form-control" type="text"
								readonly="readonly" value=<%=nombre%>>
						</div>
					</div>
					<h5>
						<u>Datos del Camion</u>
					</h5>
					<div class="row">
						<div class="col-25">
							<label for="inputPatente">PATENTE:</label>
						</div>
						<div class="col-75">
							<input name="patente" id="inputPatente" class="form-control"
								placeholder="" autofocus="" type="text"
								value=<%=patente%>>
						</div>
					</div>
					<div class="row">
						<div class="col-25">
							<label for="inputMarca">MARCA:</label>
						</div>
						<div class="col-75">
							<input name="marca" id="inputMarca" class="form-control"
								placeholder="" autofocus="" type="text"
								value=<%=marca%>>
						</div>
						</div>
						<div class="row">
						<div class="col-25">
							<label for="inputModelo">MODELO:</label>
						</div>
						<div class="col-75">
							<input name="modelo" id="inputeModelo" class="form-control"
								placeholder=""  autofocus="" type="text"
								value=<%=modelo%>>
						</div>

					</div>

					<div class="row">
						<div class="col-25">
							<label for="inputFechaIngreso">FECHA INGRESO:</label>
						</div>
						<div class="col-75">
							<input name="fecha_ingreso" id="inputFechaIngreso"
								class="form-control" placeholder="" type="date"
								value=<%=fecha_ingreso%>>
						</div>
						</div>
						<div class="row">
						<div class="col-25">
							<label for="inputEstado">ESTADO:</label>
						</div>
						<div class="col-75">
							<!-- 							<select name="estado" required="id" id="categoria"> -->
							<!-- 								<option value="1" selected>Activo</option> -->
							<!-- 								<option value="0">Inactivo</option> -->
							<!-- 							</select> -->

							<input type="checkbox" name="estado" id="inputestado"
								value="true" <%if (estado) {%> checked <%}%>><label
								for="inputEstado"> Activo</label>
						</div>
					</div>

					<br> <br>

					<div align="center">
						<input type="submit" name="accion" value="Guardar"
							onclick="javascript: submitForm('Camion')">
					</div>



				</form>
			</div>
		</div>

	</div>


</body>
</html>
