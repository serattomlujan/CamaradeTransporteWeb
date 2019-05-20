<%@page import="java.util.ArrayList"%>
<%@page import="entity.Cereal"%>
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
		location.reload('Cereal');
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
			href="Cliente">Clientes</a> <a href="Camion">Camiones</a> <a
			href="Cereal">Cereales</a> <a href="precio?accion=Ingresar">Actualizar
			precios</a>
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

					<form class="form-signin" id="myForm" name="abmcereal" action=""
						method="post">
						<h2 class="form-signin-heading encabezadoContainer">Datos de Cereal</h2>

						<div class="row lineaForm">
							<div class="cajaLabel">
								<label for="inputId_cereal" class="sr-only">ID CEREAL:</label>
							</div>
							<div class="cajaNumerica">
								<input name="id_cereal" id="inputId_cereal" class="form-control"
									placeholder="" readonly="readonly" autofocus="" type="text"
									value=<%=id_cereal%>>
							</div>
						
							<div class="cajaLabel" style="margin-left: 40px; width: 12%">
								<label for="inputDescripcion" class="sr-only">DESCRIPCION:</label>
							</div>
							<div class="cajaInput">
								<input name="descripcion" id="inputDescripcion"
									class="form-control" placeholder="" required="" autofocus=""
									type="text" value=<%=descripcion%>>
							</div>
						</div>

						<div class="row">
							<button  class="botonGuardar" type="submit" name="accion" value="Guardar"
								onclick="javascript: submitForm('Cereal')"> GUARDAR </button>
						</div>


					</form>
				</div>
			</div>

		</div>

	</div>

</body>
</html>