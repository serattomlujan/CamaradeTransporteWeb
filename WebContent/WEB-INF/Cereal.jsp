<%@page import="controles.CtrlABMCereal"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Cereal"%>
<%@page import="servlet.SocioServlet"%>
<%@page import="servlet.ClienteServlet"%>
<%@page import="servlet.CerealServlet"%>
<%@page import="servlet.CamionServlet"%>
<%@page import="servlet.Home"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="Style/webLayout.css" rel="stylesheet">
<link href="Style/tabla.css" rel="stylesheet">
<link href="Style/menu.css" rel="stylesheet">
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
		<a href="Home">Home</a> 
		<a href="Socio">Socios</a> 
		<a href="Cliente">Clientes</a>
		<a href="Camion">Camiones</a> 
		<a href="Cereal">Cereales</a>
	</div>
	<div class="row">
		<div class="leftcolumn" align="center">
			<div class="card">
				<div class="container">
					<h1 style="text-align: center">Cereales</h1>

					<form class="form-signin" id="myForm" name="cereal" action=""
						method="post">
						<div class="row">
													
							<input type="submit" name="accion" value="Agregar" onclick="javascript: submitForm('Cereal')">
						
						</div>
					</form>
				</div>
			</div>
			<div class="card">
				<table id="customers" align="center">

					<tr>
						<th>ID CEREAL</th>
						<th>DESCRIPCION</th>
					</tr>


					<%
						ArrayList<Cereal> listaCer = (ArrayList<Cereal>) request.getAttribute("listaCereales");
						for (Cereal c : listaCer) {
					%>

					<tr>
						<td><%=c.getIdcereal()%></td>
						<td><%=c.getDescripcion()%></td>

					</tr>
					<%
						}
					%>
				</table>
			</div>
		</div>

	</div>

</body>
</html>