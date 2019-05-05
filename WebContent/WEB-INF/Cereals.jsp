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
<!-- <link href="Style/formulario.css" rel="stylesheet"> -->

<title>Insert title here</title>
<script type="text/javascript">
	function submitForm(met) {
		document.myForm.action = met;

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
	<%
		String descripcion = "";
	%>
	<div class="header">
		<h1>Cámara de Transporte</h1>
		<p>Gestión de servicios</p>
	</div>
	<div class="topnav">
		<a href="Home?accion=menu">Home</a> <a href="Socio">Socios</a> <a
			href="Cliente">Clientes</a> <a href="Camion">Camiones</a> <a
			href="Cereal">Cereales</a> <a href="precio?accion=Ingresar">Actualizar
			precios</a>
	</div>

	<div class="row">
		<div class="leftcolumn" >
			<div class="card">
				<div class="container">
					<h1 style="text-align: center">Cereales</h1><br>

					<form class="form-signin" id="myForm" name="cereal" action=""
						method="post">

						
					<div align="center"><input type="submit" name="accion" value="Agregar Cereal"
								onclick="javascript: submitForm('Cereal')"></div>	
						

					</form>
				</div>
			</div>
		</div>
	</div>

	<form class="form-signin" id="myForm" name="cereal"
		action="Cereal?accion=Editar" method="post">
		<div class="card">
			<table id="customers" align="center">

				<tr>
					<th>ID CEREAL</th>
					<th>DESCRIPCION</th>
					<th>ACCION</th>
				</tr>


				<%
					ArrayList<Cereal> listaCer = (ArrayList<Cereal>) request.getAttribute("listaCereales");
					for (Cereal c : listaCer) {
				%>
				<tr>
					<td><%=c.getIdcereal()%></td>
					<td><%=c.getDescripcion()%></td>
					<td><button type="submit" value="<%=c.getDescripcion()%>"
							id="descripcion" name="descripcion">Editar</button></td>


				</tr>
				<%
					}
				%>


			</table>
		</div>
	</form>
</body>
</html>