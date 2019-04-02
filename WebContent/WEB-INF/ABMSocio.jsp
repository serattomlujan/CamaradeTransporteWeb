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
		 window.onload =  alert('Se ha registrado con exito')
		 location.reload('Socio');
	}
</script>


</head>
<body>
<%	Socio actualizado= null;
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
		if (request.getAttribute("actualizado")!=null){%><script type="text/javascript">alerta(); </script>
		<%} %>
	<div class="header">
		<h1>Cámara de Transporte</h1>
		<p>Gestión de servicios</p>
	</div>

	<div class="topnav">
		<a href="Home">Home</a> <a href="Socio">Socios</a> <a href="Cliente">Clientes</a>
	</div>
	 <div class="row">
		<div class="leftcolumn" align="center">
			<div class="card">
				<div class="container">

					<form class="form-signin" id="myForm" name="abmsocio" action="" method="post">
						<h2 class="form-signin-heading">Socio</h2>
						
						<div class="row">
							<div class="col-25">
								<label for="inputnrosocio" class="sr-only">Nro Socio</label>
							</div>
							<div class="col-75">
								<input name="nro_socio" class="form-control" type="text"
									readonly="readonly" <%if (nro_socio.equals("0")) {%> value=""
									<%} else {%> value=<%=nro_socio%> <%}%>>
							</div>
						</div>
						<div class="row">
							<div class="col-25">
								<label for="inputdni" class="sr-only">DNI</label>
							</div>
							<div class="col-75">
								<input name="dni" id="inputdni" class="form-control" placeholder="" required="" autofocus="" type="text" readonly="readonly" value=<%=dni%>>
							</div>
						</div>
						<div class="row">
							<div class="col-25">
								<label for="inputNombre" class="sr-only">Nombre:</label>
							</div>
							<div class="col-75">
								<input name="nombre" id="inputnombre" class="form-control" placeholder=""  required="" autofocus="" type="text" value=<%=nombre%>>
							</div>
						</div>
						<div class="row">
							<div class="col-25">
								<label for="inputApellido" class="sr-only">Apellido:</label>
							</div>
							<div class="col-75">
								<input name="apellido" id="inputapellido" class="form-control" placeholder=""  required=""  autofocus="" type="text" value=<%=apellido%>>
							</div>
						</div>
						<div class="row">
							<div class="col-25">
								<label for="inputTelefono" class="sr-only">Telefono:</label>
							</div>
							<div class="col-75">
								<input name="telefono" id="inputemail" class="form-control" placeholder=""  required="" autofocus="" type="text" value=<%=telefono%>>
							</div>
						</div>

						<div class="row">
							<div class="col-25">
								<label for="inputEstado" class="sr-only">Estado:</label>
							</div>
							<div class="col-75">
								<input type="checkbox" name="estado" id="inputestado"	value="true" <%if (estado) {%> checked <%}%>>
								<label	for="inputEstado" class="sr-only">Activo</label>
							</div>
						</div>
						<div class="row">
							<input type="submit" name="accion" value="Guardar" onclick="javascript: submitForm('Socio')">
						</div> 
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>