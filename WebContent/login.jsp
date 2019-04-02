<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <link href="Style/login.css" rel="stylesheet">
 <script> 
function abrir(url) { 
open(url,'','top=600,left=600,width=600,height=600') ; 
} 
</script>
</head>
<body>
<h1 align="center"><u><b><FONT SIZE=7><br>Cámara de Transporte</font></b></u></h1>
<div class="login-page">
  <div class="form">
  <h1>Iniciar Sesión</h1>
    <form class="login-form" name="signin" action="Home" method="post">
      <%if (request.getAttribute("encontrado")!=null){%>
     <h5 style="color: #FF0000;" >usuario o contraseña incorrecta</h5><% }%> 
      <input name="user" id="inputUser" placeholder="Usuario" required="" type="text"/>
      <input name="pass" id="inputPass"  placeholder="Contraseña" required="" type="password"/>
      <a href="javascript:abrir('Home?accion=CambiarPass')" >¿Olvidaste tu contraseña?</a>
      	
       <br><br><input type="submit" name="accion" value="Ingresar"> 
      
    </form>
  </div>
</div>

</body>

</html>