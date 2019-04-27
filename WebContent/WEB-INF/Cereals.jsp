<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="controles.CtrlABMCereal"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Cereal"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link href="Style/webLayout.css" rel="stylesheet">
<link href="Style/tabla.css" rel="stylesheet">
<link href="Style/menu.css" rel="stylesheet">
<link href="Style/formulario.css" rel="stylesheet">

<title>Insert title here</title>
<script type="text/javascript">
	function submitForm(met) {
		document.myForm.action = met;

	}
</script>
</head>
<body>
<%String descripcion="";
descripcion=request.getParameter("dni"); %>
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
						<th>ACCIONES</th>
					</tr>


					<%
						ArrayList<Cereal> listaCer = (ArrayList<Cereal>) request.getAttribute("listaCereales");
						for (Cereal c : listaCer) {
					%>

					<tr>
						<td><%=c.getIdcereal()%></td>
						<td><%=c.getDescripcion()%></td>
						<td> 
						<form class="form-signin" id="myForm" name="cereal" action=""
						method="post">
						<div class="row">
							<input type="submit" name="accion" value="Editar" onclick="javascript: submitForm('Cereal')">
						</div>
					   </form>  
					   </td>
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