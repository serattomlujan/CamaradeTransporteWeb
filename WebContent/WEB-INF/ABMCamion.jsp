<%@page import="java.util.ArrayList"%>
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
<link href="Style/formulario.css" rel="stylesheet">
<script type="text/javascript">
    	function submitForm(met) {
    		document.myForm.action=met;
    		
        }
 </script>
 <script type="text/javascript">
	function alerta() {
		 window.onload =  alert('Se ha registrado con exito')
		 location.reload('Camion');
	}
</script>
</head>
<body >
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
<%
   Camion encontrada=null;
   int id_camion = 0;
   String patente="";
   String marca="";
   String modelo="";
   boolean estado= true;
   Date fecha_ingreso;
   int nro_socio= 0;
  
   
   
   if(request.getAttribute("encontrada")!=null){
	   encontrada =(Camion)request.getAttribute("encontrada");
	   id_camion = encontrada.getIdcamion();
	   patente = encontrada.getPatente();
	   marca = encontrada.getMarca();
	   modelo = encontrada.getModelo();
	   estado=encontrada.isEstado();
	  // fecha_ingreso = encontrada.getFecha_ingreso();
	  // nro_socio = encontrada.getSocio().getNro_Socio();
   }
   if (request.getAttribute("actualizado")!=null){%><script type="text/javascript">alerta(); </script>
	<%} %>
<div class="row">
  <div class="leftcolumn" align="center">
    <div class="card">
      <div class="container" >
 
      	 <form class="form-signin" id="myForm" name="abmcliente" action="" method="post" >
      	         <h2 class="form-signin-heading"> Camion</h2>
        
    <div class="row">
     <div class="col-25"><label for="inputIdCamion" class="sr-only">ID CAMION</label></div>
     <div class="col-75"> <input  name="idcamion" class="form-control" type="text" readonly="readonly" value=<%=id_camion %>> </div>
    </div>
     <div class="row">
      <div class="col-25"><label for="inputPatente" class="sr-only">PATENTE:</label></div>
      <div class="col-75"><input name="patente" id="inputPatente"  class="form-control" placeholder=""  required="" autofocus="" type="text" value=<%=patente %>></div>
    </div>
    <div class="row">
      <div class="col-25"><label for="inputMarca" class="sr-only">MARCA:</label></div>
      <div class="col-75"><input name="marca" id="inputMarca"  class="form-control" placeholder=""  required=""  autofocus="" type="text" value=<%=marca %>></div>
    </div>
     <div class="row">
      <div class="col-25"><label for="inputModelo" class="sr-only">MODELO:</label></div>
      <div class="col-75"><input name="modelo" id="inputeModelo"  class="form-control" placeholder=""  required=""   autofocus="" type="text" value=<%=modelo %>></div>
    </div>
    
     <div class="row">  
     <div class="col-25"><label for="inputEstado" class="sr-only">ESTADO:</label></div>  
    <div class="col-75"> <input type="checkbox" name="estado" id="inputestado" value="true" 
			<%if(estado){ %>checked<%} %>><label for="inputEstado" class="sr-only">Activo</label></div>
		</div>
<!-- 		<div class="row"> -->
<!--       <div class="col-25"><label for="inputFechaIngreso" class="sr-only">FECHA INGREO:</label></div> -->
<%--       <div class="col-75"><input name="fecha_ingreso" id="inputFechaIngreso"  class="form-control" placeholder=""  required="" type="text" value=<%=fecha_ingreso %>></div> --%>
<!--     </div> -->
    <div class="row">
      <div class="col-25"><label for="inputNroSocio" class="sr-only">NRO. SOCIO:</label></div>
      <div class="col-75"><input name="Nro_socio" id="inputNroSocio"  class="form-control" placeholder=""  required=""   autofocus="" type="text" value=<%=nro_socio %>></div>
    </div>
      <div class="row">
        <input type="submit" name="accion" value="Guardar" onclick="javascript: submitForm('Cereal')"> 
            </div> 
       
		
      </form>
    </div>
    </div>
   
  </div>
 
  </div>

</body>
</html>