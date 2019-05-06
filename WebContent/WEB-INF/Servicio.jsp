<%@page import="controles.CtrlABMCereal"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Servicio"%>
<%@page import="entity.Cereal"%>
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
<%int id_servicio=0;
 Date fecha_desde=null;
 Date fecha_hasta=null;
 int id_camion=0;
 String cuit="";
 int id_cereal=0;
 %>
<div class="header">
		<div class="header" style="background: white;">
			<div>
				<img src="Style/Encabezado.png" width="60%">
			</div>
		</div>
	</div>

<div class="topnav">
  <a href="Home?accion=menu">Home</a>
  <a href="Socio">Socios</a>
  <a href="Cliente">Clientes</a>
</div>
<div class="row">
  <div class="leftcolumn" align="center">
    <div class="card">
      <div class="container" >
 	<h1 style="text-align: center">Socios </h1>
 	
     <form class="form-signin" id="myForm" name="servicio" action="" method="post" >
    <div class="row">
      <div class="col-25"><label for="inputidServicio" class="sr-only">ID SERVICIO</label></div>
      <div class="col-75"><input name="id_servicio" id="inputidServicio"  class="form-control" placeholder="" required="" autofocus="" type="text" value=<%=id_servicio %>></div>
     <div class="col-25"><label for="inputidCamion" class="sr-only">ID camion</label></div>
      <div class="col-75"><input name="id_camion" id="inputidCamion"  class="form-control" placeholder="" required="" autofocus="" type="text" value=<%=id_camion %>></div>
     <div class="col-25"><label for="inputCuit" class="sr-only">CUIT</label></div>
      <div class="col-75"><input name="cuit" id="inputCuit"  class="form-control" placeholder="" required="" autofocus="" type="text" value=<%=cuit %>></div>
    
     </div>
    <div class="row">
      <div class="col-25"><label for="inputFechaDesde" class="sr-only">FECHA DESDE</label></div>
      <div class="col-75"><input name="fecha_desde" id="inputFechaDesde"  class="form-control" placeholder="" required="" autofocus="" type="text" value=<%=fecha_desde %>></div>
     <div class="col-25"><label for="inputFechaHasta" class="sr-only">FECHA HASTA</label></div>
      <div class="col-75"><input name="fecha_hasta" id="inputFechaHasta"  class="form-control" placeholder="" required="" autofocus="" type="text" value=<%=fecha_hasta %>></div>
   <%CtrlABMCereal ctrl= new CtrlABMCereal();
		ArrayList<Cereal> cereales=new ArrayList<Cereal>();
    		 Cereal ce=new Cereal();
		cereales=ctrl.getAll(); %>
   
    <select name="cereal" id="cereal" required style="width: 154px; height: 29px">
		
		<%for(Cereal c : cereales){%>
		<option value="<%=c.getIdcereal()%>"><%=c.getDescripcion()%></option><%} %>
		<%if(ce.getDescripcion() == null){ %>
			 <option selected>Seleccione un tipo</option><%;}
			else {%><option selected value="<%=ce.getIdcereal()%>"><%=ce.getDescripcion()%> 
			</option><%;}%>
	
		
		</select>
    </div>
     <input type="submit"  name ="accion" value="Buscar" onclick="javascript: submitForm('Servicio')"> 
      </form>
       </div>
    </div>
    <div class="card" >
      <table id="customers" align="center">

<tr>
            <th>NRO SERVICIO</th>
			<th>CEREAL</th>
			<th>CUIT</th>
			<th>CAMION</th>
			<th>FECHA</th>
			<th>HORA</th>
			<th>CANT TONELADAS</th>
			<th>NRO KM</th>
			<th>PRECIO</th>
			
			
		</tr>
		
		
		<%ArrayList<Servicio>listaServs= (ArrayList<Servicio>)request.getAttribute("listaServicios");
			for(Servicio s : listaServs){
		%>
		
		<tr>
			<td><%=s.getIdservicio() %></td>
			<td><%=s.getCereal().getDescripcion() %></td>
			<td><%=s.getCliente().getCuit() %></td>
			<td><%=s.getCamion().getIdcamion() %></td>
			<td><%=s.getFecha() %></td>
			<td><%=s.getHora()%></td>
			<td><%=s.getCant_toneladas() %></td>
			<td><%=s.getKm_transportados() %></td>
			<td><%=s.getPrecio_servicio() %></td>
			
			
				
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