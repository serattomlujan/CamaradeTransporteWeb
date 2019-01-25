<%@page import="controles.CtrlABMSocio"%>
<%@page import="entity.Socio"%>
<%@page import="java.util.*"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Socios</title>
<script type="text/javascript">
   	function submitForm(met) {
   		document.signin.action=met;
   		//document.getElementById("myFrom").submit();
      }
      
  function validarSiNumero(numero){
    if (!/^([0-9])*$/.test(numero))
      alert("El DNI debe contener sólo números");
  }
  
   function validarNoNumero(letra){
    if (!/^([a-zA-ZáéíóúÁÉÍÓÚ ])*$/.test(letra))
       alert("El campo no puede contener caracteres inválidos");
  }
  
  function validarSiVacio(valor){
  if(valor==null)
  	alert("El DNI ingresado no está registrado");}
  	
 function validarEmail(email) {
    expr = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if(email=='')alert("El campo no puede estar vacío");
    if ( !expr.test(email) )
        alert("Ingrese una dirección de mail válida");
}
  	
  	</script>

</head>
<body>
<%
	Socio encontrado=null;
	String nro_socio="";
	String dni="";
	String nombre="";
	String apellido="";
	String telefono="";
	boolean estado=false;
	
	
	if(request.getAttribute("encontrado")!=null){
		encontrado = (Socio)request.getAttribute("encontrado");
		nro_socio=String.valueOf(encontrado.getNro_Socio());
		dni=encontrado.getDni();
		nombre= encontrado.getNombre();
		apellido=encontrado.getApellido();
		telefono= encontrado.getTelefono();
		estado= encontrado.isEstado();
		
		}
		else{
			
			dni=request.getParameter("dni");
		}
		
		
		%>
		

<center>

<form class="form-signin" name="signin" action="" method="POST"> <h2 class="form-signin-heading" >
	<hr color="PINK">
	<font face="arial" color="PINK"> <b>SOCIOS</b><br></font></h2>
		<hr color="PINK"><br><br>
	
	<strong><font face="arial">ID: <input name="nro_socio" id="nro_socio" type="text" size="5"readonly="readonly" value="<%=nro_socio%>"></font>
	 <font face="arial">&nbsp;&nbsp;DNI: <input  required name="dni" id="dni" <%if (dni!=null){  %> value="<%=dni%>"<%} %> 
	 size="8" maxlength="8" onChange="validarSiNumero(this.value);">
	 <i><b></b></i></font> 
	

	<font face="arial"><br>Nombre:  <input type="text" name="nombre" id="nombre" size="15" value="<%=nombre%>" >
	<i><b></b></i></font>
	<font face="arial">&nbsp;&nbsp;Apellido:  <input type="text" name="apellido" id="apellido" size="15" value="<%=apellido%>" >
	<i><b></b></i></font>
	<font face="arial">&nbsp;&nbsp;Telefono:  <input name="telefono" id="telefono" value="<%=telefono%>" ><i><b></b></i></font>
	

		
	</font>
	<input type="checkbox" name="estado" id="estado" value="estado" 
	<%if(estado) {%> checked <%}%>> <font face="arial">Estado<br></font>
	
	<%if(request.getAttribute("nueva")==null)
	{ %><div style="visibility:hidden;"><% }
	else if(request.getAttribute("nueva")=="error"){ %><div style="visibility:visible; color: blue">
	<b><font face="arial" color="blue"><br>NO PUEDE REALIZARSE LA OPERACION</font></b></div><%}
	else if(request.getAttribute("nueva")=="ok"){ %><div style="visibility:visible; color: blue">
	<b><font face="arial" color="blue"><br>LA PERSONA FUE REGISTRADA</font></b></div><%}
	else if(request.getAttribute("nueva")=="modif"){ %><div style="visibility:visible; color: blue">
	<b><font face="arial" color="blue"><br>LOS DATOS FUERON MODIFICADOS</font></b></div><%;}
	else if(request.getAttribute("nueva")=="elim") {%><div style="visibility:visible; color: blue">
	<b><font face="arial" color="blue"><br>LA PERSONA FUE ELIMINADA</font><%;}%></b><br><br></div>
	
	
	<button class="btn btn-lg" id="insert"
	<%if(request.getAttribute("buscar")!=null) {%> onclick="javascript: submitForm('insert')"<%} else {%> disabled<%} %> style="color: black;  background-color: Pink; width: 120px"><strong>Agregar</strong></button>
	<button name="update" id="update" onclick="javascript: submitForm('update');" style="color: black;  background-color: Pink; width: 115px" type="submit"><strong>Modificar</strong></button>
		
		<br>

	<a href="#" title="Regresar a página anterior" onclick="history.back()"><h6 align="right"><font face="arial">Atrás</h6></a>
	<a href="#" title="salir" onclick="window.close()"> <h6 align="right">Salir</h6></a><br><font>
	<hr color="pink">
	<center><font face="verdana" size="1" color="pink">
			   <a href='/CamaradeTransporteWeb/ReservaAb'>RESERVAR ELEMENTO</a>
<!-- 			   <a href="/TP_Web3/ReservasPendientes"> RESERVAS PENDIENTES</a> -->
<!-- 			   <a href="/TP_Web3/PersonaAb">PERSONAS</a> -->
<!-- 			   <a href="/TP_Web3/ElementoAb">ELEMENTOS</a> -->
<!-- 			   <a href="/TP_Web3/TipoElementoAb">TIPOS de ELEMENTOS</a> -->
<!-- 			   <a href="/TP_Web3/ListadoElementos">LISTADO de ELEMENTOS</a> -->
<!-- 			   <a href="/TP_Web3/ListadoTipoElementos">LISTADO de TIPOS de ELEMENTOS</a> -->
<!-- 			   <a href="/TP_Web3/ListadodePersona">LISTADO de PERSONAS</a> -->
<!-- 			   <a href="/TP_Web3/Login.html">CERRAR SESIÓN</a><hr color="pink"> -->
			   <hr color="purple">
		
	
 
</form></center>

</body>

</html>