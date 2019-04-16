<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="servlet.SocioServlet"%>
<%@page import="servlet.ClienteServlet"%>
<%@page import="servlet.CerealServlet"%>
<%@page import="servlet.CamionServlet"%>
<%@page import="servlet.Home"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="Style/webLayout.css" rel="stylesheet">
</head>
<body>
	<div class="header">
		<h1>Cámara de Transporte</h1>
		<p>Gestión de servicios</p>
	</div>

	<div class="topnav">
		<a href="Home?accion=menu">Home</a> 
		<a href="Socio">Socios</a> 
		<a href="Cliente">Clientes</a>
		<a href="Camion">Camiones</a>
        <a href="Cereal">Cereales</a>
	</div>
	
	<img src="WebContent/Style/camion.jpg" width="100%" height="600px">
</body>
</html>