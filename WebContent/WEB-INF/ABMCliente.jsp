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
<link href="Style/formulario.css" rel="stylesheet">
<link href="Style/Layout.css" rel="stylesheet">
<script type="text/javascript">
	function submitForm(met) {
		document.myForm.action = met;

	}
</script>
<script type="text/javascript">
	function alerta() {
 		window.onload = alert('Se ha registrado con exito');
 		location.assign('Cliente?accion=Ingresar');
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
		Cliente encontrada = null;
		String cuit = "";
		String razon_social = "";
		String direccion = "";
		String telefono = "";
		boolean estado = true;

		if (request.getAttribute("encontrada") != null) {
			encontrada = (Cliente) request.getAttribute("encontrada");
			cuit = encontrada.getCuit();
			razon_social = encontrada.getRazon_social();
			direccion = encontrada.getDireccion();
			telefono = encontrada.getTelefono();;
			estado = encontrada.isEstado();
		}
		if (request.getAttribute("actualizado") != null) {
			request.setAttribute("actualizado", null);
	%>
	<script
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
					<form name="miFormulario" onsubmit="return Valida(this);"
						name="abmcliente" action="" method="post">
						<h2 class="form-signin-heading encabezadoContainer">Datos de
							Cliente</h2>

						<div class="row lineaForm">
							<div class="cajaLabel">
								<label for="inputcuit" class="sr-only">Cuit: </label>
							</div>
							<div class="cajaNumericaCuit">
								<input name="cuit" class="form-control" type="text"
									readonly="readonly" value="<%=cuit%>">
							</div>

							<div class="cajaLabel">
								<label for="inputRazonSocial" class="sr-only">Razon
									Social:</label>
							</div>
							<div class="cajaInput">
								<input name="razon_social" id="inputrazonsocial"
									class="form-control" placeholder="" required="" autofocus=""
									type="text" value="<%=razon_social%>">
							</div>
						</div>
						<div class="row">
							<div class="cajaLabel">
								<label for="inputDireccion" class="sr-only">Direccion:</label>
							</div>
							<div class="cajaInput">
								<input name="direccion" id="inputdireccion" class="form-control"
									placeholder="" required="" autofocus="" type="text"
									value="<%=direccion%>">
							</div>

							<div class="cajaLabel">
								<label for="inputTelefono" class="sr-only">Telefono:</label>
							</div>
							<div class="cajaInput">
								<input name="telefono" id="inputemail" class="form-control"
									placeholder="" required="" autofocus="" type="text"
									value="<%=telefono%>">
							</div>
						</div>

						<div class="row">
							<div class="cajaLabel">
								<label for="inputEstado" class="sr-only">Estado:</label>
							</div>
							<div class="cajaEstado">
								<input type="checkbox" name="estado" id="inputestado"
									value="true" <%if (estado) {%> checked <%}%>><label
									for="inputEstado" class="sr-only">Activo</label>
							</div>
						</div>
						<div class="row">
							<button class="botonGuardar" type="submit" name="accion"
								value="Guardar" onclick="javascript: submitForm('Cliente')">
								GUARDAR</button>
						</div>


					</form>
				</div>
			</div>

		</div>

	</div>

</body>
</html>
