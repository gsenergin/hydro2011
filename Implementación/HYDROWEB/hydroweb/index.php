<!-- 
PAGINA DE LOGIN DEL SISTEMA
-->


<?php /*COMIENZO DE LA LÓGICA DE LOGIN Y SESION: UTILIZAMOS ARCHIVO DE CONEXION A LA BD */ ?>

<?php require_once('Connections/hydroweb.php'); ?>

<?php /**/ ?>
<?php
if (!function_exists("GetSQLValueString")) {
function GetSQLValueString($theValue, $theType, $theDefinedValue = "", $theNotDefinedValue = "") 
{
  if (PHP_VERSION < 6) {
    $theValue = get_magic_quotes_gpc() ? stripslashes($theValue) : $theValue;
  }

  $theValue = function_exists("mysql_real_escape_string") ? mysql_real_escape_string($theValue) : mysql_escape_string($theValue);

  switch ($theType) {
    case "text":
      $theValue = ($theValue != "") ? "'" . $theValue . "'" : "NULL";
      break;    
    case "long":
    case "int":
      $theValue = ($theValue != "") ? intval($theValue) : "NULL";
      break;
    case "double":
      $theValue = ($theValue != "") ? doubleval($theValue) : "NULL";
      break;
    case "date":
      $theValue = ($theValue != "") ? "'" . $theValue . "'" : "NULL";
      break;
    case "defined":
      $theValue = ($theValue != "") ? $theDefinedValue : $theNotDefinedValue;
      break;
  }
  return $theValue;
}
}
?>
<?php
// Validacion de pedido para entrar al sitio
if (!isset($_SESSION)) {
  session_start();
}

$loginFormAction = $_SERVER['PHP_SELF'];



if (isset($_GET['accesscheck'])) {
  $_SESSION['PrevUrl'] = $_GET['accesscheck'];
}

// Solicita los datos ingresados por el usuario
if (isset($_POST['usuario'])) {
  $loginUsername=$_POST['usuario'];
  $password=$_POST['password'];
  $MM_fldUserAuthorization = NULL;
// Pagina para login satisfactorio
  $MM_redirectLoginSuccess = "home.php";
// Pagina para login incorrecto  
  $MM_redirectLoginFailed = "index.php";
  $MM_redirecttoReferrer = false;

//selecciono la BD
  mysql_select_db($database_hydroweb, $hydroweb);

//creamos la consulta
  $LoginRS__query=sprintf("SELECT user, password FROM usuario WHERE user=%s AND password=%s",
    GetSQLValueString($loginUsername, "text"), GetSQLValueString($password, "text")); 
   
  $LoginRS = mysql_query($LoginRS__query, $hydroweb) or die(mysql_error());
  $loginFoundUser = mysql_num_rows($LoginRS);
// Si se encuentra el usuario 
  if ($loginFoundUser) {
     $loginStrGroup = "";
    
	if (PHP_VERSION >= 5.1) {session_regenerate_id(true);} else {session_regenerate_id();}

//declaramos dos variables de sesión y las asignamos
    $_SESSION['MM_Username'] = $loginUsername;
    $_SESSION['MM_UserGroup'] = $loginStrGroup;	      

    if (isset($_SESSION['PrevUrl']) && false) {
      $MM_redirectLoginSuccess = $_SESSION['PrevUrl'];	
	  
    }
	//Redireccionamos hacia la siguiente página
	header("Location: " . $MM_redirectLoginSuccess );
  }
  else {
	  //Sino redireccionamos hacia un nuevo intento
	  $attemp=1;
      header("Location: ". $MM_redirectLoginFailed ."?attemp= ".$attemp);
  }
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>SISTEMA DE MONITOREO Y CONTROL</title>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="main">
  <div id="header">
    <div id="logoIng"></div>
  </div>
  <div id="content" style="text-align:center;">
    <div id="rightIng"  style="text-align:center;">
      <p id="titulo">&nbsp;</p>
      <div id="formulario" style="text-align:center;">
       <?php 
	  if ($_GET['attemp']>0){
		echo '<div id="apDiv1" style="position:absolute;
		left:530px;
		width:298px;
		clear:none;
		height:17px;
		text-align:center; color:#F00"><p style="font-size:10px;">*Usuario y/o contraseña incorrectos</p> </div>';	
	}
	?> 
    <!-- FORMULARIO PARA DATOS DE LOGIN -->
        <form id="formIngreso" method="POST" action="<?php echo $loginFormAction; ?>">    
          <br />
     <table style="text-align:center;"> 
            
  <tr>
    <td width="66" style="text-align:right;"><label for="usuario">Usuario</label></td>
    <td width="158"><input class="inputs" type="text" name="usuario" id="usuario" width="150"/></td>
  </tr>
  <tr>
    <td style="text-align:right;"><label for="password">Contraseña</label></td>
    <td><input class="inputs" type="password" name="password"  id="password" width="150" /></td>
    <tr>
    <td></td>
    <td><input type="image" src="images/ingresar.png" name="ingresar" id="ingresar" value="Ingresar" ></td>
    <td></td>
    </tr>
  </tr>
  </table>
     <p>&nbsp;</p>
     <p></p>
        </form>
      </div>
    </div>
  </div>
</div>
<div id="metamorph1">
  <p>Hydroteam &copy; 2011 | Cátedra Proyecto Final</p>
  <p><a href="http://validator.w3.org/check/referer" title="This page validates as XHTML 1.0 Transitional"><abbr title="eXtensible HyperText Markup Language">XHTML</abbr></a> | <a href="http://jigsaw.w3.org/css-validator/check/referer" title="This page validates as CSS"><abbr title="Cascading Style Sheets">CSS</abbr></a></p>
</div>
<!-- footer ends -->
</body>
</html>