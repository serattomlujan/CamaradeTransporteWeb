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
</head>
<body>
 <form class="form-signin" id="myForm" name="cereal" action="" method="post" >
  <input type="submit" name ="accion" value="Agregar" onclick="javascript: submitForm('Cereal')">
   </form>
</body>
</html>