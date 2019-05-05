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
<link href="Style/formulario.css" rel="stylesheet">
<script type="text/javascript">
    	function submitForm(met) {
    		document.myForm.action=met;
    		
        }
 </script>
 <script type="text/javascript">
	function alerta() {
		 window.onload =  alert('Se ha registrado con exito')
		 location.reload('Cliente');
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
		<a href="precio?accion=Ingresar">Actualizar precios</a>
	</div>
<%
   Cliente encontrada=null;
   String cuit="";
   String razon_social="";
   String direccion="";
   String telefono="";
   boolean estado= true;
  
   
   
   if(request.getAttribute("encontrada")!=null){
	   encontrada =(Cliente)request.getAttribute("encontrada");
	   cuit=encontrada.getCuit();
	   razon_social=encontrada.getRazon_social();
	   direccion=encontrada.getDireccion();
	   telefono=encontrada.getTelefono();;
	   estado=encontrada.isEstado();
   }
   if (request.getAttribute("actualizado")!=null){%><script type="text/javascript">alerta(); </script>
	<%} %>
<div class="row">
  <div class="leftcolumn" align="center">
    <div class="card">
      <div class="container" >
 
      	 <form name="miFormulario" onsubmit="return Valida(this);" name="abmcliente" action="" method="post" >
      	         <h2 class="form-signin-heading"> Cliente</h2>
        
    <div class="row">
     <div class="col-25"><label for="inputcuit" class="sr-only">Cuit</label></div>
     <div class="col-75"> <input  name="cuit" class="form-control" type="text" readonly="readonly" value=<%=cuit %>> </div>
    </div>
     <div class="row">
      <div class="col-25"><label for="inputRazonSocial" class="sr-only">Razon Social:</label></div>
      <div class="col-75"><input name="razon_social" id="inputrazonsocial"  class="form-control" placeholder=""  required="" autofocus="" type="text" value=<%=razon_social %>></div>
    </div>
    <div class="row">
      <div class="col-25"><label for="inputDireccion" class="sr-only">Direccion:</label></div>
      <div class="col-75"><input name="direccion" id="inputdireccion"  class="form-control" placeholder=""  required=""  autofocus="" type="text" value=<%=direccion %>></div>
    </div>
     <div class="row">
      <div class="col-25"><label for="inputTelefono" class="sr-only">Telefono:</label></div>
      <div class="col-75"><input name="telefono" id="inputemail"  class="form-control" placeholder=""  required=""   autofocus="" type="text" value=<%=telefono %>></div>
    </div>
    
     <div class="row">  
     <div class="col-25"><label for="inputEstado" class="sr-only">Estado:</label></div>  
    <div class="col-75"> <input type="checkbox" name="estado" id="inputestado" value="true" 
			<%if(estado){ %>checked<%} %>><label for="inputEstado" class="sr-only">Activo</label></div>
		</div>
      <div class="row">
        <input type="submit" name="accion" value="Guardar" onclick="javascript: submitForm('Cliente')"> 
            </div> 
       
		
      </form>
    </div>
    </div>
   
  </div>
 
  </div>

</body>
</html>