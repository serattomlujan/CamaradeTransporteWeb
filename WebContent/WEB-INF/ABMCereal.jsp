<%@page import="java.util.ArrayList"%>
<%@page import="entity.Cereal"%>
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
		 location.reload('Cereal');
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
   Cereal encontrada=null;
   int id_cereal = 0;
   String descripcion="";
   
   
   
   %>
<div class="row">
  <div class="leftcolumn" align="center">
    <div class="card">
      <div class="container" >
 
    <form class="form-signin" id="myForm" name="abmcereal" action="" method="post" >
      	         <h2 class="form-signin-heading"> Cereal</h2>
        
    <div class="row">
      <div class="col-25"><label for="inputId_cereal" class="sr-only">ID CEREAL:</label></div>
      <div class="col-75"><input name="id_cereal" id="inputId_cereal"  class="form-control" placeholder=""  required="" autofocus="" type="text" value=<%=id_cereal %>></div>
    </div>
     <div class="row">
      <div class="col-25"><label for="inputDescripcion" class="sr-only">DESCRIPCION:</label></div>
      <div class="col-75"><input name="descripcion" id="inputDescripcion"  class="form-control" placeholder=""  required="" autofocus="" type="text" value=<%=descripcion %>></div>
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