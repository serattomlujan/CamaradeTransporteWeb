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
    <link href="Style/menu.css" rel="stylesheet">
     <link href="Style/formulario.css" rel="stylesheet">
     <script type="text/javascript">
    	function submitForm(met) {
    		document.myForm.action=met;
    		
        }
    </script>
</head>
<body >
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
<%
   Socio encontrada=null;
   String nro_socio="";
   String dni="";
   String nombre="";
   String apellido="";
   String telefono="";
   boolean estado= true;
  
   
   
   if(request.getAttribute("encontrada")!=null){
	   encontrada =(Socio)request.getAttribute("encontrada");
	   nro_socio=String.valueOf(encontrada.getNro_Socio());
	   dni=encontrada.getDni();
	   nombre=encontrada.getNombre();
	   apellido=encontrada.getApellido();
	   telefono=encontrada.getTelefono();;
	   estado=encontrada.isEstado(); 
   } %>
<div class="row">
  <div class="leftcolumn" align="center">
    <div class="card">
      <div class="container" >
 
      	 <form class="form-signin" id="myForm" name="abmsocio" action="" method="post" >
      	         <h2 class="form-signin-heading"> Socio</h2>
        
    <div class="row">
     <div class="col-25"><label for="inputnrosocio" class="sr-only">Nro Socio</label></div>
     <div class="col-75"> <input  name="nro_socio" class="form-control" type="text" readonly="readonly" value=<%=nro_socio %>> </div>
    </div>
    <div class="row">
      <div class="col-25"><label for="inputdni" class="sr-only">DNI</label></div>
      <div class="col-75"><input name="dni" id="inputdni"  class="form-control" placeholder="" required="" autofocus="" type="text" value=<%=dni %>></div>  
    </div>
     <div class="row">
      <div class="col-25"><label for="inputNombre" class="sr-only">Nombre:</label></div>
      <div class="col-75"><input name="nombre" id="inputnombre"  class="form-control" placeholder="" autofocus="" type="text" value=<%=nombre %>></div>
    </div>
    <div class="row">
      <div class="col-25"><label for="inputApellido" class="sr-only">Apellido:</label></div>
      <div class="col-75"><input name="apellido" id="inputapellido"  class="form-control" placeholder=""  autofocus="" type="text" value=<%=apellido %>></div>
    </div>
     <div class="row">
      <div class="col-25"><label for="inputTelefono" class="sr-only">Telefono:</label></div>
      <div class="col-75"><input name="telefono" id="inputemail"  class="form-control" placeholder=""  autofocus="" type="text" value=<%=telefono %>></div>
    </div>
    
     <div class="row">  
     <div class="col-25"><label for="inputEstado" class="sr-only">Estado:</label></div>  
    <div class="col-75"> <input type="checkbox" name="estado" id="inputestado" value="true" 
			<%if(estado){ %>checked<%} %>><label for="inputEstado" class="sr-only">Activo</label></div>
		</div>
      <div class="row">
        <input type="submit" name="accion" value="Guardar" onclick="javascript: submitForm('Socio')"> 
            </div> 
       
		
      </form>
    </div>
    </div>
   
  </div>
 
  </div>

</body>
</html>