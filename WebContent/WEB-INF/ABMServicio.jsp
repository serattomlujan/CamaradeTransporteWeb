<%@page import="entity.Servicio"%>
<%@page import="entity.Camion"%>
<%@page import="entity.Cliente"%>
<%@page import="entity.PrecioKM"%>
<%@page import="entity.Cereal"%>
<%@page import="controles.CtrlABMCereal"%>
<%@page import="controles.CtrlABMPrecio_km"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.Time"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"	type="text/javascript"></script>
<script src="js/app-ajax.js" type="text/javascript"></script>
<link href="Style/webLayout.css" rel="stylesheet">
<link href="Style/formulario.css" rel="stylesheet">
<!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
<script type="text/javascript">
	function submitForm(met) {
		document.myForm.action = met;

	}
</script>
<script type="text/javascript">
	function alerta() {
		window.onload = alert('Se ha registrado con exito')
		location.assign('Servicio');
	}
</script>
</head>
<body>
	<div class="header">
		<div class="header" style="background: white;">
			<div>
				<img src="Style/Encabezado.png" width="60%">
			</div>
		</div>
	</div>

	<div class="topnav">
		<a href="Home?accion=menu">Home</a> <a href="Socio">Socios</a> 
		<a href="Cliente">Clientes</a> 
		<a href="Camion">Camiones</a> 
		<a href="Cereal">Cereales</a> 
		<a href="precio?accion=Ingresar"> Actualizar precios</a>
		<a href="Servicio?accion=ABMServicio"> Alta de Servicio</a>
 		<a href="Servicio?accion=FinalizarServicio"> Finalizar Servicio</a> 
	</div>
	<%
		Servicio encontrada = null;
		String id_servicio = "";
		String cuit = "";
		String razon_social = "";
		Date fecha_servicio =null;
		Time hora_servicio =null;
		String km_transportados = "";
		String cant_toneladas = "";
		String observacion = "";
		int id_cereal=0;
		String desc_cereal = "";
		String id_camion = "";
		String patente = "";
		String precio_servicio="";

		if (request.getAttribute("encontrada") != null) {
			encontrada = (Servicio) request.getAttribute("encontrada");
			id_servicio=String.valueOf(encontrada.getIdservicio());
			if(id_servicio.equals("0")){
				id_servicio="";
			}
			cuit = encontrada.getCliente().getCuit();
			razon_social = encontrada.getCliente().getRazon_social();
			id_cereal= encontrada.getCereal().getIdcereal();
			desc_cereal = encontrada.getCereal().getDescripcion();
			fecha_servicio = encontrada.getFecha();
			hora_servicio = encontrada.getHora();
			id_camion = String.valueOf(encontrada.getCamion().getIdcamion());
			patente = encontrada.getCamion().getPatente();
			km_transportados= String.valueOf(encontrada.getKm_transportados());
			cant_toneladas = String.valueOf(encontrada.getCant_toneladas());
			observacion = encontrada.getObservaciones();
			precio_servicio= String.valueOf(encontrada.getPrecio_servicio());
// 			if(encontrada.getIdservicio()==0){
// 				id_servicio = "";
// 				hora_servicio =null;
// 				patente = "";
// 			    id_camion = "";
// 				km_transportados="";
// 				cant_toneladas="";
// 				observacion="";
// 				precio_servicio="";
				
// 			}

		}
		if (request.getAttribute("actualizado") != null) {
	%><script type="text/javascript">
		alerta();
	</script>
	<%
		}
	%>

	<div class="leftcolumn" align="center">
		<div class="card">
			<div class="container" align="center">

				<form class="form-signin" id="myForm" name="abmcliente" action=""
					method="post">
					<h2 class="form-signin-heading encabezadoContainer">Datos de alta Servicio</h2>
					
					
					<div class="row lineaForm">
						<div class="cajaLabel" style="margin-left: 10px;">
							<label for="inputIdCamion">ID SERVICIO:</label>
						</div>
						<div class="cajaNumerica">
							<input name="id_servicio" id="inputIdServicio"
								class="form-control" type="text" readonly="readonly"
								value=<%=id_servicio%>>
						</div>
					</div>
					<p> <strong> Datos del Cliente </strong> </p>
					<hr>
					
					
					<div class="row lineaForm">
						<div class="cajaLabel">
							<label for="inputDni">CUIT:</label>
						</div>
						<div class="cajaNumerica">
							<% if (cuit == null) { %>
							<p style="color: #FF0000; margin-top: 0px">No existe
								cliente registrado para el cuit ingresado</p>
							<%}%>
							
							<input name="cuit" id="inputCuit" class="form-control"
								required="" placeholder="" autofocus="" type="text"
								value=<%=cuit%>> 
						</div>
								<button type="submit" name="accion"
								value="Buscar" class="buscarSocio"
								onclick="javascript: submitForm('Servicio')"> BUSCAR </button>
						

						<div class="cajaLabel" style="width: 15%">
							<label for="inputRazonSocial">RAZON SOCIAL:</label>
						</div>
						<div class="cajaInput">
							<input style="background: #e9e9e9;" name="razon_social"
								id="inputRazonSocial" class="form-control" type="text"
								readonly="readonly" value=<%=razon_social%>>
						</div>
					</div>
					<div class="row lineaForm">
     <div class="cajaLabel">
     <label for="inputCereal" class="sr-only">CEREAL:</label></div>
      <%CtrlABMCereal ctrl=new CtrlABMCereal();
			ArrayList<Cereal> cereales= new ArrayList<Cereal>();
			cereales=ctrl.getAll();
		%>
      <div class="cajaInput"><select name="cereal" id="inputCereal"><%	for(Cereal c : cereales){ 
		if(c.getIdcereal()==id_cereal){
				%><option value="<%=c.getIdcereal() %>"selected><%=c.getDescripcion()%></option>
			<%}
			else{%><option value="<%=c.getIdcereal() %>"><%=c.getDescripcion() %></option>
			 <%  } }%>
		</select> </div>
     
   
						<div class="cajaLabel">
							<label for="inputFechaServicio">FECHA:</label>
						</div>
						<div class="cajaInput">
							<input name="fecha_servicio" id="inputFechaServicio" 
								class="form-control" placeholder="" type="date"
								style="height: 25px;"
								 value=<%=fecha_servicio%>>
						</div>
					
						<div class="cajaLabel">
							<label for="inputHoraServicio">HORA:</label>
						</div>
						<div class="cajaHora">
							<input name="hora_servicio" id="inputHoraServicio" 
								class="form-control cajaHora" placeholder="" type="time"
								style="font-size: 20px; height: 35px; border-radius: 4px; margin-top: 6px;"
								 value=<%=hora_servicio%>>
						</div>
					</div>
					<p> <strong> Datos del Camion </strong> </p>
					<hr>
					<div class="row lineaForm">
						<div class="cajaLabel">
							<label for="inputCamion">ID CAMION:</label>
						</div>
						<div class="cajaNumerica">
							<input name="camion" id="inputCamion" class="form-control"
								placeholder="" autofocus="" type="text" value=<%=id_camion%>>
								
						</div>
						<button type="submit" name="accion"
								value="Asignar Camion" class="buscarSocio"
								onclick="javascript: submitForm('Servicio')"> ASIGNAR CAMION </button>
					
						<div class="cajaLabel">
							<label for="inputPatente">PATENTE:</label>
						</div>
						<div class="cajaNumerica">
							<input name="patente" id="inputPatente" class="form-control"
								placeholder="" autofocus="" type="text" value=<%=patente%>>
						</div>
					</div>
					<%if(id_servicio!=""){ %>
					<div class="row lineaForm">
						<div class="cajaLabel" style="width: 19%">
							<label for="inputKmTransp">KM TRANSPORTADOS:</label>
						</div>
						<div class="cajaNumerica">
							<input name="km_transportados" id="inputKmTransp" class="form-control"
								placeholder="" autofocus="" type="text" value="" onblur="calculaPrecio()">
						</div>

					
						<div class="cajaLabel" style="width: 21%">
							<label for="inputCantToneladas">CANT. DE TONELADAS:</label>
						</div>
						<div class="cajaNumerica">
							<input name="cant_toneladas" id="inputCantToneladas"
								class="form-control" placeholder="" type="text"
								value="" onblur="calculaPrecio()">
						</div>
						
						<div class="cajaLabel">
							<label for="inputTotal">TOTAL:</label>
						</div>
						<div class="cajaNumerica">
							<input name="total" id="inputTotal"
								class="form-control" placeholder="" type="text"
								value=<%=precio_servicio%>>
						</div>
						
					</div>
					<div class="row lineaForm">
						<div class="cajaLabel" style="width: 19%">
							<label for="inputObservacion">OBSERVASION:</label>
						</div>
						<div class="col-75">
							<input name="observacion" id="inputObservacion"
								class="form-control" placeholder="" type="text"
								value=<%=observacion%>>
						</div>
					</div>
					<%} %>
					
					

					<div align="center">
						<button type="submit" name="accion" value="Guardar" class="botonGuardar"
							onclick="javascript: submitForm('Servicio')"> GUARDAR </button>
					</div>



				</form>
			</div>
		</div>

	</div>
	</div>
<script type="text/javascript">
 function calculaPrecio() {
 	var toneladas = $('#inputCantToneladas').val();
 	var km = $('#inputKmTransp').val();
 	var accion='calculaPrecio'
 	console.log(toneladas);
 	var datos = 'accion='+ accion + '&toneladas='+ toneladas + '&km='+ km;
 	$.ajax({
 		url : 'Servicio',
 		data : datos,
 		success : function(responseText) {
 			$('#inputTotal').val(responseText);
 		}
 	});
	
 }
</script>

</body>
</html>
