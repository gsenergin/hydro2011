<!--
PAGINA - FRAME CON LA TABLA DE DATOS DE LOS SENSORES PARA LA PÁGINA controlMain.php
-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="refresh" content="5;URL=sensoresFrame.php">
<meta http-equiv="Content-Type" content="text/html; charset= iso-8859-1"/>
<title>Documento sin t&iacute;tulo</title>
<style>
table, tr, td, th{
	border:1px solid black;
	border-color:#666;
	font-size:12px;
	}
	
th{
	background-color:#09C;
	color:#FFF;
	}
.valor{
	color:#F00;
	width:20%;}
	
.par{
	background-color:#DDF9FF;
	}
.impar{
	background-color:#FFF;
	}
</style>
</head>
<body>

<?php 
// Incluimos el archivo para armar la tabla con los sensores...
include('armaComponentes.php');
	armarTabla();
?>
</body>
</html>