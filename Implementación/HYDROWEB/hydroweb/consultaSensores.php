<?php require_once('Connections/hydroweb.php'); ?>
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

mysql_select_db($database_hydroweb, $hydroweb);
/*$query_sensoresUltimo = "select sensor.ID_sensor,sensor.descripcion, hs.valorSensado, sensor.unidad_medida,hs.TimeStamp from sensor 	left join historialsensado as hs on FK_HistorialSensado_Sensor = sensor.ID_sensor  	order by hs.TimeStamp desc limit 0,15 	";*/
$query_sensoresUltimo = "select * from (select sensor.ID_sensor,sensor.descripcion, hs.valorSensado, sensor.unidad_medida,hs.TimeStamp from sensor left join historialsensado as hs on FK_HistorialSensado_Sensor = sensor.ID_sensor order by hs.TimeStamp desc limit 0,15 ) as sens order by ID_sensor";
$sensoresUltimo = mysql_query($query_sensoresUltimo, $hydroweb) or die(mysql_error());
$totalRows_sensoresUltimo = mysql_num_rows($sensoresUltimo);
?>
