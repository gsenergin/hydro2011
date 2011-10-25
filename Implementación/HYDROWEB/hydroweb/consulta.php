<?php require_once('Connections/hydroweb.php'); ?>
<?php
$nombre = trim($_GET['nombre']);
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


$colname_estadoCompuertas = "-1";
if (isset($_GET['nombre'])) {
  $colname_estadoCompuertas = $_GET['nombre'];
}

mysql_select_db($database_hydroweb, $hydroweb);
$query_estadoCompuertas = "select registroeventos.valorSeteado,registroeventos.TimeStamp from registroeventos where registroeventos.FK_RegistroEventos_Actuador =  (select actuador.ID_actuador FROM actuador WHERE nomenclatura = '". $nombre ."') order by registroeventos.TimeStamp desc limit 0,1" ;
$estadoCompuertas = mysql_query($query_estadoCompuertas, $hydroweb) or die(mysql_error());
$row_estadoCompuertas = mysql_fetch_assoc($estadoCompuertas);
$totalRows_estadoCompuertas = mysql_num_rows($estadoCompuertas);


echo $row_estadoCompuertas['valorSeteado'];

 mysql_free_result($estadoCompuertas);
?>
