<?php require_once('Connections/hydroweb.php'); ?>
<?php

include "swf/charts.php";
if(isset($_REQUEST["idSensor"])){
$id = $_REQUEST["idSensor"];
$Desde = $_REQUEST["desde"];
list($mesDesde, $diaDesde, $anioDesde) = split('[/]', $Desde);
$Desde = $anioDesde."-".$mesDesde."-".$diaDesde;
$Hasta = $_REQUEST["hasta"];
list($mesHasta, $diaHasta, $anioHasta) = split('[/]', $Hasta);
$Hasta = $anioHasta."-".$mesHasta."-".$diaHasta;
} else {
	$id=0;
	}
mysql_select_db($database_hydroweb, $hydroweb);
$query_historiaEst = "SELECT historialsensado.ID_Historial,nueva.ID_sensor, nueva.descripcion , historialsensado.TimeStamp, historialsensado.valorSensado FROM historialsensado inner join ( SELECT sensor.ID_sensor, sensor.descripcion FROM sensor WHERE sensor.ID_sensor = ".$id.") as nueva on historialsensado.FK_HistorialSensado_Sensor = nueva.ID_sensor where historialsensado.TimeStamp BETWEEN '".$Desde. "' and '".$Hasta."'"  ;
$historiaEst = mysql_query($query_historiaEst, $hydroweb) or die(mysql_error());
$row_historiaEst = mysql_fetch_assoc($historiaEst);
$totalRows_historiaEst = mysql_num_rows($historiaEst);

if($totalRows_historiaEst >0){
	$chart['chart_data'][0][$i] = $row_historiaEst['TimeStamp'];
	$chart['chart_data'][1][0]="SENSOR: ". $row_historiaEst['descripcion'];
		for($i = 1;  $i <$totalRows_historiaEst; $i++){
		$filai = mysql_fetch_array($historiaEst);
		$fecha = $filai["TimeStamp"];
		$fechaYhora = substr($fecha,0,9)."\r".substr($fecha,9);
		$chart['chart_data'][0][$i] = $fechaYhora;
		$chart['chart_data'][1][$i] = $filai["valorSensado"];
		}
	}else {
		$chart['chart_data'][0][$i] = "ERROR";
		$chart['chart_data'][1][0]= "ERROR, NO SE ENCONTRARON VALORES EN EL RANGO ESPECIFICADO...";
		}

$chart [ 'legend_label' ] = array (   'layout'  =>  "vertical",
                                      'bullet'  =>  "circle",
                                      'font'    =>  "Arial", 
                                      'bold'    =>  true, 
                                      'size'    =>  14, 
                                      'color'   =>  "88FF00", 
                                      'alpha'   =>  90
                                  ); 
$chart['axis_category'] = array(
								'size' => 8,
								);
					
$chart ['chart_grid_h'] = array (   'thickness'  =>  2,
                                      'color'      =>  "FF0000",
                                      'alpha'      =>  15,
                                      'type'       =>  "solid"
                                   );
$chart [ 'chart_type' ] = "line";
$chart [ 'chart_pref' ] = array (   
                                    'fill_shape'      =>  boolean);
									
$chart [ 'chart_value' ] = array (  'prefix'         =>  "", 
                                    'suffix'         =>  "", 
                                    'decimals'       =>  0,
                                    'decimal_char'   =>  ".",  
                                    'separator'      =>  "",
                                    'position'       =>  "above",
                                    'hide_zero'      =>  false, 
                                    'as_percentage'  =>  false, 
                                    'font'           =>  "Arial", 
                                    'bold'           =>  true, 
                                    'size'           =>  14, 
                                    'color'          =>  "FFFFFF", 
                                    'alpha'          =>  90
                                  );

	
//include charts.php to access the SendChartData function


SendChartData ($chart);


mysql_free_result($historiaEst);
?>