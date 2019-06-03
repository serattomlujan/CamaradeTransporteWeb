<%@page import="controles.CtrlABMCereal"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Servicio"%>
<%@page import="entity.Cereal"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>CTCarabelas</title>
<link rel="icon" type="iman/png" href="Style/Icono.png">
<link href="Style/webLayout.css" rel="stylesheet">
<link href="Style/tabla.css" rel="stylesheet">
<link href="Style/Layout.css" rel="stylesheet">
<link href="Style/formulario.css" rel="stylesheet">
<link rel="stylesheet" href="Style/jquery.dataTables.min.css">
<script src="Style/jquery-3.4.1.min.js"></script>
<script src="Style/jquery.dataTables.min.js"></script>

<script>
$(document).ready(function(){
	var tabla= $('#customers').DataTable({

		"language" : {
			"url" : "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
		},	
		ajax:{
				method: "GET",
				url: "Servicio?accion=listarServicios",
				dataSrc: "datos"
			},
			columns: [
				{"data": "id_servicio"},
				{"data": "cereal"},
				{"data": "cuit"},
				{"data": "razon_social"},
				{"data": "id_camion"},
				{"data": "patente"},
				{"data": "fecha"},
				{"data": "hora"},
				{"data": "cant_toneladas"},
				{"data": "km_transportados"},
				{"data": "precio_servicio"},
				{"data": "accion"}
			]
	});
			
});
</script>
<script type="text/javascript">
	function submitForm(met) {
		document.myForm.action = met;

	}
</script>
<body>
	<%
		String id_servicio = "";
		String fecha_desde = "";
		String fecha_hasta = "";
		String id_camion = "";
		String cuit = "";
		String id_cereal = "";
	%>
	<div class="header">
		<div class="header" style="background: white;">
			<div>
				<img src="Style/Encabezado.png" width="60%">
			</div>
		</div>
	</div>

	<div id="header" class="topnav">
		<ul class="nav">
		<li> <a href="Home?accion=menu">Home</a> </li>
		<li> <a href="Socio?accion=Ingresar">Socios</a> </li>
		<li> <a href="Cliente?accion=Ingresar">Clientes</a> </li>
		<li> <a href="Camion?accion=Ingresar">Camiones</a> </li>
		<li> <a href="Cereal?accion=Ingresar">Cereales</a> </li>
		<li> <a href="#">Servicios</a>
					<ul>
						<li><a href="precio?accion=Ingresar"> Actualizar precios</a></li>
						<li><a href="Servicio?accion=ABMServicio"> Alta de Servicio</a></li>
						<li><a href="Servicio?accion=FinalizarServicio"> Finalizar Servicio</a></li>
						<li><a href="Servicio?accion=informeServicio"> Informe de Servicios</a></li>
					</ul>
		
	
     </ul>
	</div>
	<form class="form-signin" id="myForm" name="servicio" action="Servicio?accion=Editar" method="post">
			<div class="card">

				<table id="customers" class="display" style="width:100%">
        <thead>
            <tr>
            <th>id_servicio</th>
                <th>Cereal</th>
                <th>Cuit</th>
                <th>Razon Social</th>
                <th>id_camion</th>
                <th>Patente</th>
                <th>Fecha</th>
                <th>Hora</th>
                <th>Toneladas</th>
                <th>KM</th>
                <th>Precio Servicio</th>
                <th>Accion</th>
                
            </tr>
        </thead>
        <tbody id="employee_data">
        
        </tbody>
<!--         <tfoot> -->
<!--             <tr> -->
<!--                  <th>id_servicio</th> -->
<!--                 <th>Cereal</th> -->
<!--                 <th>Cuit</th> -->
<!--                 <th>Razon Social</th> -->
<!--                 <th>id_camion</th> -->
<!--                 <th>Patente</th> -->
<!--                 <th>Fecha</th> -->
<!--                 <th>Hora</th> -->
<!--                 <th>Toneladas</th> -->
<!--                 <th>KM</th> -->
<!--                 <th>Precio Servicio</th> -->
                
               
<!--             </tr> -->
<!--         </tfoot> -->
    </table>
    </div>
</form>
</body>
</html>
