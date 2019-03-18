<%@page import="entity.Administrador"%>

<!DOCTYPE html>
<html><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="http://getbootstrap.com/favicon.ico">

    <title>Camara de Transporte</title>
    <link href="Style/form.css" rel="stylesheet">
    <!-- Bootstrap core CSS -->
    <link href="style/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="style/start.css" rel="stylesheet">
     <link href="style/formulario.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="style/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

  <body bgcolor=#D8F6CE >
  <div><h1 style="text-align: center;"><br><br>Sistema de Reservas<br><br><br></h1></div>
    <div class="container" >

      <form class="form-signin-heading"  name="signin" action="Socio" method="post">
        <h2 class="form-signin-heading" >Login</h2>
     
      <div class="row">
      <div class="col-25"><label for="inputUser" class="sr-only">Usuario:</label></div>
      <div class="col-75"><input name="user" id="inputUser"  class="form-control" placeholder="User" required="" autofocus="" type="text"></div>
    </div>   
       <div class="row">
      <div class="col-25"><label for="inputPass" class="sr-only">Contraseña:</label></div>
      <div class="col-75"><input name="pass" id="inputPass"  class="form-control" placeholder="Password" required="" autofocus="" type="password"></div>
    </div>  
            <input type="submit" name="accion" value="Ingresar"> 
      <%if (request.getAttribute("encontrado")!=null){
    	  Administrador a=(Administrador)request.getAttribute("encontrado");
    	  if(a.getUsuario()!=null){%><h5 style="color: #FF0000;" class="form-signin-heading">usuario inhabilitado</h5><% }
    	  else{%><h5 style="color: #FF0000;" class="form-signin-heading">usuario o contraseña incorrecta</h5><% }
      }%>
      
      
      </form>

    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="style/ie10-viewport-bug-workaround.js"></script>
  

</body></html>
    <script src="style/ie10-viewport-bug-workaround.js"></script>
  

</body></html>