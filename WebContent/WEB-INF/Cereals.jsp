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
	<%
		String descripcion = "";
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
		<div class="leftcolumn">

			<div class="buscadorDiv">
				<h1 style="text-align: center; margin-bottom: 0px;" >Cereales</h1>
				<br>

				<form class="form-signin" id="myForm" name="cereal" action=""
					method="post">


					<div class="card" align="center" style="padding: 3px 20px;">
						<button type="submit" name="accion" value="Agregar Cereal"
							onclick="javascript: submitForm('Cereal')">AGREGAR
							CEREAL</button>
					</div>
				</form>
			</div>

		</div>
	</div>

	<form class="form-signin" id="myForm" name="cereal"
		action="Cereal?accion=Editar" method="post">
		<div class="card" style="padding: 3px 20px;">
			<table id="customers" align="center" class="tabla">

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
					<td>
						<button class="buttonGrilla" type="submit"
							value="<%=c.getDescripcion()%>" id="descripcion"
							name="descripcion">EDITAR CEREAL</button>
					</td>


				</tr>
				<%
					}
				%>


			</table>
		</div>
	</form>
</body>
</html>