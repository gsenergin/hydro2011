<!--
PAGINA PRINCIPAL PARA LA VISUALIZACIÓN DE GRÁFICOS ESTADÍSTICOS DE LOS VALORES HISTÓRICOS DE LOS SENSORES
-->


<?php require_once('Connections/hydroweb.php'); ?>
<?php require('seguridad.php'); ?>
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

/*
*** CONSULTA PARA EL ARMADO DE CONTROL HTML <SELECT> DINÁMICO
*/
mysql_select_db($database_hydroweb, $hydroweb);
$query_sensores = "select sensor.ID_sensor, sensor.descripcion, sensor.unidad_medida from sensor";
$sensores = mysql_query($query_sensores, $hydroweb) or die(mysql_error());
$row_sensores = mysql_fetch_assoc($sensores);
$totalRows_sensores = mysql_num_rows($sensores);


?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset= iso-8859-1" />
<title>SISTEMA DE MONITOREO Y CONTROL</title>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/blue-glass/sidebar.css" />
<link type="text/css" href="css/redmond/jquery-ui-1.8.16.custom.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/jquery.sidebar.js"></script>
<script type="text/javascript" src="js/calendario.js"></script>
<!-- javascript con el jquery para selección de fechas -->
<script type="text/javascript" src="js/menu.js"></script>
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
                    <li><a href="#" ></a></li>
            <li><a href="controlMain.php" >Control</a></li>
            <li><a href="historial.php" >Estadisticas</a></li>
            <!--<li><a href="#" >Less</a></li>
            <li><a href="#" >Do</a></li>-->
            <li><a href="<?php echo $logoutAction ?>" >Salir</a></li>
                </ul>
        	</div>
      </div>
    <div id="right">
      <p id="titulo">Usuario: <?php echo $_SESSION['MM_Username']?></p> 
			<div id="center">
            
            <?php if (isset($_POST["selecSensores"])){
					$seleccionado = $_POST["selecSensores"];
				} ?>
            <form action="" method="post" name="formSensores">
              <p>
            
            <!--ARMADO DEL SELECT PARA SELECCIONAR UN SENSOR-->    
                <select name="selecSensores">
                  <?php
					do {  
						?>
                   <!-- SI YA SELECCIONÓ UNO Y ESTA PÁGINA ES UN POSTBACK DEJA EL SELECCIONADO, SINO MUESTRA DEFAULT -->
                  <?php if ($seleccionado == $row_sensores['ID_sensor']){ ?>
                  <option value="<?php echo $row_sensores['ID_sensor']?>" selected="selected"> <?php echo $row_sensores['descripcion']?> </option>
                  <?php ;} else ?>
				  <option value="<?php echo $row_sensores['ID_sensor']?>"> <?php echo $row_sensores['descripcion']?> </option>
				  
				  <?php } while ($row_sensores = mysql_fetch_assoc($sensores));
  							$rows = mysql_num_rows($sensores);
  							if($rows > 0) {
      									mysql_data_seek($sensores, 0);
	 									$row_sensores = mysql_fetch_assoc($sensores);
  										   }
				?>
                </select>&nbsp; 
                
                <input type="image" src="images/flecha.png" alt="Buscar"/>
              	
                 </p>
             	 <p>&nbsp;</p>
                 
                 <!--ARMADO DEL CONTROL JQUERY PARA SELECCIÓN DE FECHA DESDE Y HASTA-->
                 <?php if (isset($_POST["desde"])){?>
                 <label for="from">Desde: </label>
                	<input type="text" id="desde" name="desde" value="<?php echo $_POST["desde"]?>"/>
                 <label for="to">Hasta: </label>
                	<input type="text" id="hasta" name="hasta" value="<?php echo $_POST["hasta"]?>"/>
                 <?php ;} else {?>
                 <label for="from">Desde: </label>
                	<input type="text" id="desde" name="desde"/>
                 <label for="to">Hasta: </label>
                	<input type="text" id="hasta" name="hasta"/>
                	<?php ;} ?>
                <p>&nbsp;</p>
          		</form>
                
                <!-- SI LA PAGINA ES POSTBACK, YA SE SOLICITO UN GRAFICO, POR LO TANTO LO MOSTRAMOS-->
          		<?php if (isset($_POST["selecSensores"])){
				$fDesde = $_POST["desde"];
				$fHasta = $_POST["hasta"];
				$idSensor = $_POST["selecSensores"];
			  	echo "<div id=\"grafico\">";
                include "./swf/charts.php";
                echo InsertChart ("./swf/charts.swf","./swf/charts_library", "estadisticas.php?idSensor=".$idSensor."&desde=".$fDesde."&hasta=".$fHasta, 900, 700 );
				echo "</div>";
				}
				?>
    		</div>
	</div>
    <script type="text/javascript">
        $("ul#demo_menu1").sidebar({
            position:"left", open:"click",
            events:{
                item : {
                    enter : function(){
                        $(this).find("a").animate({color:"darkblue"}, 250);
                    },
                    leave : function(){
                        $(this).find("a").animate({color:"white"}, 250);
                    }
                }
            }
        });
        </script>
    </div>
</div>
<div id="metamorph1">
    <p>Hydroteam &copy; 2011 | C&aacute;tedra Proyecto Final</p>
    <p><a href="http://validator.w3.org/check/referer" title="This page validates as XHTML 1.0 Transitional"><abbr title="eXtensible HyperText Markup Language">XHTML</abbr></a> | <a href="http://jigsaw.w3.org/css-validator/check/referer" title="This page validates as CSS"><abbr title="Cascading Style Sheets">CSS</abbr></a></p>
</div>
<!-- footer ends -->
</body>

</html>
<?php
mysql_free_result($sensores);
?>
