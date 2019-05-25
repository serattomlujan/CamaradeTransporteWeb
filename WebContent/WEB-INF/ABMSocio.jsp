<%@page import="java.util.ArrayList"%>
<%@page import="entity.Socio"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="Style/webLayout.css" rel="stylesheet">
<link href="Style/formulario.css" rel="stylesheet">
<script type="text/javascript">
	function submitForm(met) {
		document.myForm.action = met;

	}
</script>
<script type="text/javascript">
	function alerta() {
		window.onload = alert('Se ha registrado con exito')
		location.assign('Socio');
	}
</script>
<script>
	function Valida(formulario) {

		/* Validación de campos NO VACÍOS */
		if ((formulario.dni.value.length == 0)
				|| (formulario.nombre.value.length == 0)
				|| (formulario.apellido.value.length == 0)
				|| (formulario.telefono.value.length == 0)) {
			alert('Falta información');
			return false;
		}
		if (isNaN(parseInt(formulario.telefono.value))) {
			alert('El telefono debe ser un número');
			formulario.telefono.style.borderColor = "red";
			return false;
		}
		/* validación del DNI */
		var erdni = /(^([0-9]{8,8})|^)$/;
		if (!(erdni.test(formulario.dni.value))) {
			alert('no es un DNI válido.');
			formulario.dni.style.borderColor = "red";
			return false;
		}
		/* validación del e-mail */

		/* si no hemos detectado fallo devolvemos TRUE */
		return true;
	}
</script>

</head>
<body>


	<%
		Socio actualizado = null;
		Socio encontrada = null;
		String nro_socio = "";
		String dni = "";
		String nombre = "";
		String apellido = "";
		String telefono = "";
		boolean estado = true;

		if (request.getAttribute("encontrada") != null) {
			encontrada = (Socio) request.getAttribute("encontrada");
			nro_socio = String.valueOf(encontrada.getNro_Socio());
			dni = encontrada.getDni();
			nombre = encontrada.getNombre();
			apellido = encontrada.getApellido();
			telefono = encontrada.getTelefono();
			estado = encontrada.isEstado();
		}
		if (request.getAttribute("actualizado") != null) {
	%><script type="text/javascript">
			alerta();
		</script>
	<%
		}
	%>

	<div class="header">
		<div class="header" style="background: white;">
			<div>
				<img src="Style/Encabezado.png" width="60%">
			</div>
		</div>
	</div>


	<div class="topnav">
	<a href="Home?accion=menu">Home</a> <a href="Socio">Socios</a> 
		<a href="Cliente">Clientes</a> 
		<a href="Camion">Camiones</a> 
		<a href="Cereal">Cereales</a> 
		<a href="precio?accion=Ingresar"> Actualizar precios</a>
		<a href="Servicio?accion=ABMServicio"> Alta de Servicio</a>
 		<a href="Servicio?accion=FinalizarServicio"> Finalizar Servicio</a> 
	</div>

	<div class="row">
		<div class="leftcolumn" align="center">
			<div class="card">
				<div class="container">
					<form name="miFormulario" onsubmit="return Valida(this);"
						name="abmsocio" action="" method="post">
						<h2 class="form-signin-heading encabezadoContainer">Datos de Socio</h2>

						<div class="row lineaForm">
						<div class="cajaLabel">
								<label for="inputdni" class="sr-only">DNI:</label>
							</div>
							<div class="cajaNumerica">
								<input name="dni" id="inputdni" class="form-control"
									placeholder="" required="" autofocus="" type="text"
									readonly="readonly" value=<%=dni%>>
							</div>
							
						<% if((nro_socio.equals("0")) == false) {%>
							<div class=" cajaLabelDNI">
								<label for="inputnrosocio" class="sr-only">Nro Socio:</label>
							</div>
							<div class="cajaNumerica">
								<input name="nro_socio" class="form-control" type="text"
									readonly="readonly" id="inputNroSocio"  value=<%=nro_socio%>>
										
							</div>
							<%} %>
						</div>
						<div class="row lineaForm">
							<div class="cajaLabel">
								<label for="inputNombre" class="sr-only">Nombre:</label>
							</div>
							<div class="cajaInput">
								<input name="nombre" id="inputnombre" class="form-control"
									placeholder="" required="" autofocus="" type="text"
									value=<%=nombre%>>
							</div>

							<div class="cajaLabel">
								<label for="inputApellido" class="sr-only">Apellido:</label>
							</div>
							<div class="cajaInput">
								<input name="apellido" id="inputapellido" class="form-control"
									placeholder="" required="" autofocus="" type="text"
									value=<%=apellido%>>
							</div>
						</div>
						<div class="row lineaForm">
							<div class="cajaLabel">
								<label for="inputTelefono" class="sr-only">Telefono:</label>
							</div>
							<div class="cajaInput">
								<input name="telefono" id="inputemail" class="form-control"
									placeholder="" required="" autofocus="" type="text"
									value=<%=telefono%>>
							</div>

							<div class="cajaLabel">
								<label for="inputEstado" class="sr-only">Estado:</label>
							</div>
							<div class="cajaEstado">
								<input type="checkbox" name="estado" id="inputestado"
									value="true" <%if (estado) {%> checked <%}%>> <label
									for="inputEstado" class="sr-only">Activo</label>
							</div>
						</div>
						<div class="row">
							<button type="submit" class="botonGuardar" name="accion"
								value="Guardar" onclick="javascript: submitForm('Socio')"
								data-toggle="tooltip" data-placement="top"
								title="Guardaar datos de Socio"> 
								<span class="glyphicon glyphicon-align-left" aria-hidden="true"></span> GUARDAR</button>

						</div>
					</form>



				</div>
			</div>
		</div>
	</div>
</body>
</html>