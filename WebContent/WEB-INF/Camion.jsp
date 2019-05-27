<%@page import="controles.CtrlABMCamion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Socio"%>
<%@page import="entity.Camion"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CTCarabelas</title>
<link rel="icon" type="iman/png" href="Style/Icono.png">
<link href="Style/webLayout.css" rel="stylesheet">
<link href="Style/tabla.css" rel="stylesheet">
<link href="Style/formulario.css" rel="stylesheet">
<link href="Style/Layout.css" rel="stylesheet">
<script type="text/javascript">
    	function submitForm(met) {
    		document.myForm.action=met;
    		
        }
    </script>
</head>
<body>
	<%String patente="";
 patente=request.getParameter("patente"); %>

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
	<div class="row">
		<div class="leftcolumn" align="center">
			<div class="buscadorDiv">
				<h1 style="text-align: center">Camiones</h1>
				<form class="form-signin" id="myForm" name="camion" action=""
					method="post">
					<div class="card">
						<label for="inputpatente" class="sr-only">PATENTE</label> <input
							name="patente" id="inputpatente" class="form-control buscador"
							placeholder="" required="" autofocus="" type="text"
							<% if (patente!=null) {%> value=<%=patente %> <%} %>>
						<button type="submit" name="accion" value="Buscar"
							onclick="javascript: submitForm('Camion')">BUSCAR</button>
						<% if (patente!=null) {%>
						<button type="submit" name="accion" value="Agregar"
							onclick="javascript: submitForm('Camion')">AGREGAR
							CAMION</button>
						<%} %>
					</div>
					<div class="textoError">
					<% if (patente!=null) {%>
						<p style="color: #FF0000; margin-top: 0px">No se encontró camion registrado</p>
						<%} %>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="card">
		<table id="customers" align="center" class="tabla">

			<tr>
				<th>ID CAMION</th>
				<th>PATENTE</th>
				<th>MARCA</th>
				<th>MODELO</th>
				<th>ESTADO</th>
				<th>FECHA INGRESO</th>
				<th>NRO. SOCIO</th>
				<th >APELLIDO</th>
				<th >NOMBRE</th>

			</tr>


			<%ArrayList<Camion>listaCams= (ArrayList<Camion>)request.getAttribute("listaCamiones");
			for(Camion c : listaCams){
		%>


			<tr>
				<td><%=c.getIdcamion()%></td>
				<td><%=c.getPatente()%></td>
				<td><%=c.getMarca() %></td>
				<td><%=c.getModelo()%></td>
				<%
			String estado="";
			if(c.isEstado()){estado="Activo";} else {estado="Inactivo";}%>
				<td><%=estado%></td>
				<td><%=c.getFecha_ingreso()%></td>
				<td><%=c.getSocio().getNro_Socio()%></td>
				<td><%=c.getSocio().getApellido()%></td>
				<td><%=c.getSocio().getNombre()%></td>

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
