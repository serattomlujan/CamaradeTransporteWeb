<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="entity.PrecioKM"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="Style/webLayout.css" rel="stylesheet">
<link href="Style/tabla.css" rel="stylesheet">
<script type="text/javascript">
	function submitForm(met) {
		document.myForm.action = met;

	}
</script>
<script type="text/javascript">
	function alerta() {
		 window.onload =  alert('Se ha registrado con exito')
		 location.reload('Home?accion=menu');
	}
</script>
<style type="text/css">
* {
  box-sizing: border-box;
}
h1{
	margin-top: 10px;
	margin-bottom: 15px;
}

input[type=submit] {
background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
 } 
 input[type=file] {
background-color: white;
  
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
 }
 .container {
	
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 10px;
}</style>
</head>
<body>
<%if (request.getAttribute("actualizado")!=null){%><script type="text/javascript">alerta(); </script><%} %>
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
	<div class="row">
		<div class="leftcolumn" align="center">
			<div class="card">
				<div class="container">
					<h1 style="text-align: center">
						<u>Mantenimiento de Precios</u>
					</h1>

	<form name="precio" action="precio?accion=Guardar" method="post" enctype="multipart/form-data"> 
      <br><br><br><input type="file" name="file" multiple/><br><br><br><br> 
    <div align="center">
							  <input type="submit" value="Guardar" > </div>
							
    </form>
				</div>
			</div>

		</div>

	</div>

</body>
</html>