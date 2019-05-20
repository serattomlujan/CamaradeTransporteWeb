<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
	function submitForm(met) {
		document.myForm.action = met;

	}
</script>
<style>
div {
	background-color: #f2f2f2;
	width: 520px;
	height: 500px;
	border: 1px solid black;
	margin-left: 30px;
	margin-right: 300px;
	margin-top: 30px;
}
</style>
</head>
<body>
	<div align="center">

		<%
			if (request.getAttribute("adm") != null) {
		%><h1>
			<u><b>Se ha enviado la contraseña a su casilla de correo</b></u>
		</h1>
		<%
			} else {
		%>
		<form class="form-signin" id="myForm" name="contraseña" action=""
			method="post">
			<h1>
				<u><b>Reestablecer contraseña</b></u>
			</h1>
			<h3>
				<br>
				<br>Correo Electrónico
			</h3>
			<input name="correo" id="inputcorreo" placeholder="" required=""
				type="text"> <br>
			<br>
			<br>
			<h3>Pregunta Secreta ¿cual es el nombre de mascota?</h3>
			<input name="pregunta" id="inputpregunta" placeholder="" required=""
				type="text"> <br>
			<br>
			<br>
			<h4>
				si la respuesta es correcta se enviará un correo con la nueva
				contraseña<br>
				<br>
				<br>
			</h4>
			<input type="submit" name="accion" value="Enviar"
				onclick="javascript: submitForm('Home')">
		</form>
		<%} %>
	</div>

</body>
</html>