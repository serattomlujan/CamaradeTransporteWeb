<%@page import="controles.CtrlABMSocio"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Socio"%>
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
    		document.myForm.action=met;
    		
        }
    </script>
</head>
<body >
<%String dni="";
 dni=request.getParameter("dni"); %>
<div class="header">
  <h1>Cámara de Transporte</h1>
  <p>Gestión de servicios</p>
</div>

<div class="topnav">
<ul >
 <li> <a href="#">Link</a></li>
 <li> <a href="#">Link</a>
  <ul>
		<li><a href="#">ABMC Persona</a></li>
		<li><a href="#">Listado de Personas</a></li>
	</ul>
</li>
 <li> <a href="#">Link</a></li>
  <li><a href="#" style="float:right">Link</a></li>
  </ul>
</div>
<div class="row">
  <div class="leftcolumn" align="center">
    <div class="card">
      <div class="container" >
 	<h1 style="text-align: center">Socios </h1>
 	
     <form class="form-signin" id="myForm" name="socio" action="" method="post" >
    <div class="row">
      <div class="col-25"><label for="inputdni" class="sr-only">DNI</label></div>
      <div class="col-75"><input name="dni" id="inputdni"  class="form-control" placeholder="" required="" autofocus="" type="text" <% if (dni!=null) {%>value=<%=dni %><%} %>></div>
       <input type="submit"  name ="accion" value="Buscar" onclick="javascript: submitForm('Socio')"> 
   <% if (dni!=null) {%> <p style="color:#FF0000">No se encontró socio registrado</p>  <input type="submit" name ="accion" value="Agregar Socio" onclick="javascript: submitForm('Socio')"> <%} %>
    </div>
      </form>
       </div>
    </div>
    <div class="card" >
      <table id="customers" align="center">

<tr>
            <th>NRO SOCIO</th>
			<th>DNI</th>
			<th>APELLIDO</th>
			<th>NOMBRE</th>
			<th>TELEFONO</th>
			<th>ESTADO</th>
			
			
		</tr>
		
		
		<%ArrayList<Socio>listaSocs= (ArrayList<Socio>)request.getAttribute("listaSocios");
			for(Socio s : listaSocs){
		%>
		
		<tr>
			<td><%=s.getNro_Socio() %></td>
			<td><%=s.getDni() %></td>
			<td><%=s.getApellido() %></td>
			<td><%=s.getNombre() %></td>
			<td><%=s.getTelefono() %></td>
			<%
			String estado="";
			if(s.isEstado()){estado="Activo";} else {estado="Inactivo";}%>
			<td><%=estado%></td>
			
		
			
			
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