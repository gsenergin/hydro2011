<!--
PÁGINA PRINCIPAL DEL MONITOREO DEL SISTEMA, CON USUARIO REGISTRADO
EN ESTA PÁGINA SE INSERTAN DOS PÁGINAS:
	- controlFrame.php -> visualizacion del estado de los actuadores
    - sensoresFrame.php -> visualización del estado de los sensores
-->


<?php 
//REQUERIMOS EL MÓDULO DE SEGURIDAD
require_once('seguridad.php'); ?>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>SISTEMA DE MONITOREO Y CONTROL</title>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/blue-glass/sidebar.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/jquery.sidebar.js"></script>
</head>
<body>
<div id="main">
<div id="header">
	<div id="logoIng"></div>
</div>
<div id="content">
<div id="left">
<div id="sidebar">
        <ul id="demo_menu1">
            <li><a href="#"></a></li>
            <li><a href="#"></a></li>
            <li><a href="controlMain.php" >Control</a></li>
            <li><a href="historial.php" >Estadisticas</a></li>
            <li><a href="<?php echo $logoutAction ?>" >Salir</a></li>
        </ul>
</div>
</div>
	<div id="right">
		<p id="titulo">BIENVENIDO, usted está registrado como: <?php echo $_SESSION['MM_Username']?></p> 
<div id="center" style="text-align:center; width:auto; position:relative; margin-right:50%; right:-100px;">
<table align="center" style="text-align:center;">
	<tr>
		<td><iframe src="controlFrame.php" name="control" width="800" height="600"  scrolling="auto" frameborder="0"></iframe></td>
        <td><iframe src="sensoresFrame.php" name="sensores" scrolling="auto" width="400" height="600" frameborder="0" ></iframe></td>
	</tr>
</table>
</div>
    </div>
 
</div>
</div>
<script type="text/javascript" src="js/menu.js"></script>
<div id="metamorph1">
	<p>Hydroteam &copy; 2011 | Cátedra Proyecto Final</p>
	<p><a href="http://validator.w3.org/check/referer" title="This page validates as XHTML 1.0 Transitional"><abbr title="eXtensible HyperText Markup Language">XHTML</abbr></a> | <a href="http://jigsaw.w3.org/css-validator/check/referer" title="This page validates as CSS"><abbr title="Cascading Style Sheets">CSS</abbr></a></p>
</div>
<!-- footer ends -->
</body>
</html>