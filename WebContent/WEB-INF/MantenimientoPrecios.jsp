<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
</head>
<body>
	<div class="header">
		<h1>Cámara de Transporte</h1>
		<p>Gestión de servicios</p>
	</div>

	<div class="topnav">
		<a href="Home?accion=menu">Home</a> <a href="Socio">Socios</a> <a
			href="Cliente">Clientes</a>
	</div>
	<div class="row">
		<div class="leftcolumn" align="center">
			<div class="card">
				<div class="container">
					<h1 style="text-align: center">
						<u>Mantenimiento de Precios</u>
					</h1>

	<form name="precio" action="precio?accion=Guardar" method="post" enctype="multipart/form-data"> 
      <input type="file" name="file" multiple/> 
      <input type="submit"> 
    </form>
				</div>
			</div>

		</div>

	</div>

</body>
</html>