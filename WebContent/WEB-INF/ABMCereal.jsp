<%@page import="java.util.ArrayList"%>
<%@page import="entity.Cereal"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CTCarabelas</title>
<link rel="icon" type="iman/png" href="Style/Icono.png">
<link href="Style/webLayout.css" rel="stylesheet">
<link href="Style/formulario.css" rel="stylesheet">
<link href="Style/Layout.css" rel="stylesheet">
<script type="text/javascript">
	function submitForm(met) {
		document.myForm.action = met;

	}
</script>
<script type="text/javascript">
	function alerta() {
		window.onload = alert('Se ha registrado con exito')
		location.assign('Cereal?accion=Ingresar');
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
						<li><a href="Servicio?accion=ABMServicio"> Alta de Servicio</a></li>
						<li><a href="Servicio?accion=FinalizarServicio"> Finalizar Servicio</a></li>
						<li><a href="Servicio?accion=serviciosFinalizados"> Listado de Servicios</a></li>
						<li><a href="Servicio?accion=informeServicio"> Informe de Servicios</a></li>
						<li><a href="precio?accion=Ingresar"> Actualizar precios</a></li>
					</ul>
		
	
     </ul>
	</div>
	
	<%
		Cereal encontrada = null;
		String id_cereal = "";
		String descripcion = "";

		if (request.getAttribute("encontrada") != null) {
			encontrada = (Cereal) request.getAttribute("encontrada");
			id_cereal = String.valueOf(encontrada.getIdcereal());
			descripcion = encontrada.getDescripcion();
		}
		if (request.getAttribute("actualizado") != null) {
	%><script
		type="text/javascript">
		alerta();
	</script>
	<%
		}
	%>

	<div class="row">
		<div class="leftcolumn" align="center">
			<div class="card">
				<div class="container">

					<form class="form-signin" id="myForm" name="abmcereal" action="Cereal"
						method="post">
						<h2 class="form-signin-heading encabezadoContainer">Datos de Cereal</h2>

						<div class="row lineaForm">
						<% if(id_cereal != "") {%>
					<div class="cajaLabel">
							
								<label for="inputId_cereal" class="sr-only">ID CEREAL:</label>
							</div>
							<div class="cajaNumerica">
								<input name="id_cereal" id="inputId_cereal" class="form-control"
									placeholder="" readonly="readonly" autofocus="" type="text"
									value="<%=id_cereal%>">
							</div>
							<%} %>
						
							
						
							<div class="cajaLabel" style="margin-left: 40px; width: 12%">
								<label for="inputDescripcion" class="sr-only">DESCRIPCION:</label>
							</div>
							<div class="cajaInput">
								<input name="descripcion" id="inputDescripcion"
									class="form-control" placeholder="" required="" autofocus=""
									type="text" value="<%=descripcion%>">
							</div>
						</div>

						<div class="row">
							<button  class="botonGuardar" type="submit" name="accion" value="Guardar"> GUARDAR </button>
						</div>


					</form>
				</div>
			</div>

		</div>

	</div>

</body>
</html>
