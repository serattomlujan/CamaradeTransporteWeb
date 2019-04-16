<%@page import="controles.CtrlABMCliente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Cliente"%>
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
<%String cuit="";
 cuit=request.getParameter("cuit"); %>
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
</div>
<div class="row">
  <div class="leftcolumn" align="center">
    <div class="card">
      <div class="container" >
 	<h1 style="text-align: center">Clientes </h1>
 	
     <form class="form-signin" id="myForm" name="cliente" action="" method="post" >
    <div class="row">
      <div class="col-25"><label for="inputcuit" class="sr-only">CUIT</label></div>
      <div class="col-75"><input name="cuit" id="inputcuit"  class="form-control" placeholder="" required="" autofocus="" type="text" <% if (cuit!=null) {%>value=<%=cuit %><%} %>></div>
       <input type="submit"  name ="accion" value="Buscar" onclick="javascript: submitForm('Cliente')"> 
   <% if (cuit!=null) {%> <p style="color:#FF0000">No se encontró cliente registrado</p>  <input type="submit" name ="accion" value="Agregar Cliente" onclick="javascript: submitForm('Cliente')"> <%} %>
    </div>
      </form>
       </div>
    </div>
    <div class="card" >
      <table id="customers" align="center">

<tr>
            <th>CUIT</th>
			<th>RAZON SOCIAL</th>
			<th>DIRECCION</th>
			<th>TELEFONO</th>
			<th>ESTADO</th>
			
		</tr>
		
		
		<%ArrayList<Cliente>listaCli= (ArrayList<Cliente>)request.getAttribute("listaClientes");
			for(Cliente c : listaCli){
		%>
		
		<tr>
			<td><%=c.getCuit() %></td>
			<td><%=c.getRazon_social() %></td>
			<td><%=c.getDireccion() %></td>
			<td><%=c.getTelefono() %></td>
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