<!--
PÁGINA INICIAL DEL SISTEMA, CON USUARIO REGISTRADO
-->

<?php require_once('seguridad.php'); ?>

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
        	<li><a href="#" > &nbsp;</a> </li>
            <li><a href="controlMain.php" >Control</a></li>
            <li><a href="historial.php" >Estadisticas</a></li>
            <!--<li><a href="#" >Less</a></li>
            <li><a href="#" >Do</a></li>-->
            <li><a href="<?php echo $logoutAction ?>" >Salir</a></li>
        </ul>
</div>
</div>
	<div id="right">
		<p id="bienvenida">BIENVENIDO, usted está registrado como: <?php echo $_SESSION['MM_Username']?></p> 
<div id="center">

  <h2 ID="titulo">SELECCIONE EN EL MENÚ DE LA IZQUIERDA LA OPCIÓN DESEADA</h2>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
</div>
    </div>
    <script type="text/javascript" src="js/menu.js"></script>
</div>
</div>
<div id="metamorph1">
	<p>Hydroteam &copy; 2011 | Cátedra Proyecto Final</p>
	<p><a href="http://validator.w3.org/check/referer" title="This page validates as XHTML 1.0 Transitional"><abbr title="eXtensible HyperText Markup Language">XHTML</abbr></a> | <a href="http://jigsaw.w3.org/css-validator/check/referer" title="This page validates as CSS"><abbr title="Cascading Style Sheets">CSS</abbr></a></p>
</div>
<!-- footer ends -->
</body>
</html>