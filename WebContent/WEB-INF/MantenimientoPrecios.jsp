<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="entity.Precio"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="Style/webLayout.css" rel="stylesheet">
<link href="Style/tabla.css" rel="stylesheet">
<link href="Style/formulario.css" rel="stylesheet">
<script type="text/javascript">
	function submitForm(met) {
		document.myForm.action = met;

	}
</script>
<script type="text/javascript">
	function alerta() {
		window.onload = alert('Se ha registrado con exito')
		location.reload('Home?accion=menu');
	}
</script>

</head>
<body>
	<%
		if (request.getAttribute("actualizado") != null) {
	%><script
		type="text/javascript">
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
		<a href="Home?accion=menu">Home</a> <a href="Socio">Socios</a> <a
			href="Cliente">Clientes</a> <a href="Camion">Camiones</a> <a
			href="Cereal">Cereales</a> <a href="precio?accion=Ingresar">Actualizar
			precios</a>
	</div>
	<div class="row">
		<div class="leftcolumn"  align="center">
			<div class="buscadorDiv">
				
				
					<form  name="precio" action="precio?accion=Guardar" method="post"
						enctype="multipart/form-data">
						
						<div class="container">
						<h1>Mantenimiento de Precios</h1>
						<div class="row" style="text-align: left">
							<input type="file" class="archivo" name="file" multiple />
						</div>
						<div class="row">
							<button type="submit" value="Guardar" class="botonGuardar">
								GUARDAR</button>
						</div>
						</div>

					</form>
				</div>

			</div>

		</div>

	</div>

</body>
</html>