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
		<a href="Home?accion=menu">Home</a> <a href="Socio">Socios</a> <a
			href="Cliente">Clientes</a> <a href="Camion">Camiones</a> <a
			href="Cereal">Cereales</a> <a href="precio?accion=Ingresar">Actualizar
			precios</a>
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

	<div class="leftcolumn">
		<div class="card">
			<div class="container" align="center">

				<form class="form-signin" id="myForm" name="abmcliente" action=""
					method="post">
					<h2 class="form-signin-heading">Servicio</h2>
					<div class="row">
						<div class="col-25">
							<label for="inputIdCamion">ID SERVICIO</label>
						</div>
						<div class="col-75">
							<input name="id_servicio" id="inputIdServicio"
								class="form-control" type="text" readonly="readonly"
								value=<%=id_servicio%>>
						</div>
					</div>
					<h5>
						<u>Datos del Cliente</u>
					</h5>
					<div class="row">
						<div class="col-25">
							<label for="inputDni">Cuit:</label>
						</div>
						<div class="col-75">
							<% if (cuit == null) { %>
							<h6 style="color: #FF0000;">no existe
								cliente registrado para el cuit ingresado</h6>
							<%}%>
							<input name="cuit" id="inputCuit" class="form-control"
								required="" placeholder="" autofocus="" type="text"
								value=<%=cuit%>> <input type="submit" name="accion"
								value="Buscar"
								onclick="javascript: submitForm('Servicio')">
						</div>

					</div>
					<div class="row">
						<div class="col-25">
							<label for="inputRazonSocial">Razon Social:</label>
						</div>
						<div class="col-75">
							<input style="background: #e9e9e9;" name="razon_social"
								id="inputRazonSocial" class="form-control" type="text"
								readonly="readonly" value=<%=razon_social%>>
						</div>
					</div>
					<div class="row">
     <div class="col-25"><label for="inputCereal" class="sr-only">Cereal</label></div>
      <%CtrlABMCereal ctrl=new CtrlABMCereal();
			ArrayList<Cereal> cereales= new ArrayList<Cereal>();
			cereales=ctrl.getAll();
		%>
      <div class="col-75"><select name="cereal" id="inputCereal"><%	for(Cereal c : cereales){ 
		if(c.getIdcereal()==id_cereal){
				%><option value="<%=c.getIdcereal() %>"selected><%=c.getDescripcion()%></option>
			<%}
			else{%><option value="<%=c.getIdcereal() %>"><%=c.getDescripcion() %></option>
			 <%  } }%>
		</select> </div>
     
    </div>
					<div class="row">
						<div class="col-25">
							<label for="inputFechaServicio">Fecha de Servicio:</label>
						</div>
						<div class="col-75">
							<input name="fecha_servicio" id="inputFechaServicio" 
								class="form-control" placeholder="" type="date"
								 value=<%=fecha_servicio%>>
						</div>
					</div>
					<div class="row">
						<div class="col-25">
							<label for="inputHoraServicio">Hora de Servicio:</label>
						</div>
						<div class="col-75">
							<input name="hora_servicio" id="inputHoraServicio" 
								class="form-control" placeholder="" type="time"
								 value=<%=hora_servicio%>>
						</div>
					</div>
					<h5>
						<u>Datos del Camion</u>
					</h5>
					<div class="row">
						<div class="col-25">
							<label for="inputCamion">Id Camion:</label>
						</div>
						<div class="col-75">
							<input name="camion" id="inputCamion" class="form-control"
								placeholder="" autofocus="" type="text" value=<%=id_camion%>>
								<input type="submit" name="accion"
								value="Asignar Camion"
								onclick="javascript: submitForm('Servicio')">
						</div>
					</div>
					<div class="row">
						<div class="col-25">
							<label for="inputPatente">Patente:</label>
						</div>
						<div class="col-75">
							<input name="patente" id="inputPatente" class="form-control"
								placeholder="" autofocus="" type="text" value=<%=patente%>>
						</div>
					</div>
					<%if(id_servicio!=""){ %>
					<div class="row">
						<div class="col-25">
							<label for="inputKmTransp">Km Transportados:</label>
						</div>
						<div class="col-75">
							<input name="km_transportados" id="inputKmTransp" class="form-control"
								placeholder="" autofocus="" type="text" value="" onblur="calculaPrecio()">
						</div>

					</div>

					<div class="row">
						<div class="col-25">
							<label for="inputCantToneladas">Cantidad de toneladas:</label>
						</div>
						<div class="col-75">
							<input name="cant_toneladas" id="inputCantToneladas"
								class="form-control" placeholder="" type="text"
								value="" onblur="calculaPrecio()">
						</div>
					</div>
					<div class="row">
						<div class="col-25">
							<label for="inputObservacion">Observacion:</label>
						</div>
						<div class="col-75">
							<input name="observacion" id="inputObservacion"
								class="form-control" placeholder="" type="text"
								value=<%=observacion%>>
						</div>
					</div>
					<div class="row">
						<div class="col-25">
							<label for="inputTotal">Total:</label>
						</div>
						<div class="col-75">
							<input name="total" id="inputTotal"
								class="form-control" placeholder="" type="text"
								value=<%=precio_servicio%>>
						</div>
					</div>
					<%} %>
					
					<br> <br>

					<div align="center">
						<input type="submit" name="accion" value="Guardar"
							onclick="javascript: submitForm('Servicio')">
					</div>



				</form>
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
 		url : 'Servicio?accion=Editar',
 		data : datos,
 		success : function(responseText) {
 			$('#inputTotal').val(responseText);
 		}
 	});
	
 }
</script>

</body>
</html>
