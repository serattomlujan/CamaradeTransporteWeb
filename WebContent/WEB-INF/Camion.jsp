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
<title>Insert title here</title>
 <link href="Style/webLayout.css" rel="stylesheet">
  <link href="Style/tabla.css" rel="stylesheet">
     <link href="Style/formulario.css" rel="stylesheet">
     <script type="text/javascript">
    	function submitForm(met) {
    		document.myForm.action=met;
    		
        }
    </script>
   </head>
<body >
<%
 int id_camion;
 String patente;
 String marca;
 String modelo;
//  boolean estado;
//  Date fecha_ingreso;
//  int nro_socio;
 %>
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
<div class="row">
  <div class="leftcolumn" align="center">
    <div class="card">
      <div class="container" >
 	<h1 style="text-align: center">Camiones </h1>
 	
     <form class="form-signin" id="myForm" name="camiones" action="" method="post" >
    <div class="row">
      <div class="col-25"><label for="inputidCamion" class="sr-only">ID CAMION</label></div>
      <div class="col-75"><input name="id_camion" id="inputidCamion"  class="form-control" type="text"  ></div>
     </div>
   
     <input type="submit"  name ="accion" value="Buscar" onclick="javascript: submitForm('Camion')"> 
<%--         <% if (id_camion!= null) {%> <p style="color:#FF0000">No se encontró camión registrado</p>  <input type="submit" name ="accion" value="Agregar Camion" onclick="javascript: submitForm('Camion')"> <%} %> --%>
     
      </form>
       </div>
    </div>
    <div class="card" >
      <table id="customers" align="center">

       <tr>
            <th>ID CAMION</th>
			<th>PATENTE</th>
			<th>MARCA</th>
			<th>MODELO</th>
			<th>ESTADO</th>
<!-- 			<th>FECHA INGRESO</th> -->
<!-- 			<th>NRO SOCIO</th> -->
				
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