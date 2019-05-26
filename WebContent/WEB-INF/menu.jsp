<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="servlet.SocioServlet"%>
<%@page import="servlet.ClienteServlet"%>
<%@page import="servlet.CerealServlet"%>
<%@page import="servlet.CamionServlet"%>
<%@page import="servlet.Home"%>
<%@page import="entity.Administrador"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CTCarabelas</title>
<link href="Style/Layout.css" rel="stylesheet">
<link href="Style/webLayout.css" rel="stylesheet">
<link rel="icon" type="iman/png" href="Style/Icono.png">

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
		<li> <a href="Socio">Socios</a> </li>
		<li> <a href="Cliente">Clientes</a> </li>
		<li> <a href="Camion">Camiones</a> </li>
		<li> <a href="Cereal">Cereales</a> </li>
		<li> <a href="#">Servicios</a>
					<ul>
						<li><a href="precio?accion=Ingresar"> Actualizar precios</a></li>
						<li><a href="Servicio?accion=ABMServicio"> Alta de Servicio</a></li>
						<li><a href="Servicio?accion=FinalizarServicio"> Finalizar Servicio</a></li>
						<li><a href="Servicio?accion=informeServicio"> Informe de Servicios</a></li>
					</ul>
		
	
     </ul>
	</div>


	<img src="Style/fondo-Camiones.jpg" width="100%" height="600px">

</body>
</html>
