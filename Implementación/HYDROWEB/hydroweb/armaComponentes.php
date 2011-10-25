<?php
function armarTabla(){
	require('consultaSensores.php');
	$encabezadoTabla = "<thead><tr><th> SENSOR </th><th> VALOR </th></tr></thead>";
	$datos = "<tbody>";
	for($i = 0; $i <$totalRows_sensoresUltimo; $i++){
		if($i % 2){
			$tipo = "impar";
			}else $tipo = "par";
		$fila = mysql_fetch_array($sensoresUltimo);
		$datos = $datos . "<tr class=\"".$tipo."\"><td>".$fila['descripcion']."</td><td class=\"valor\">".$fila['valorSensado']." ".$fila['unidad_medida']."</td></tr>";
			}
	$datos ="<tbody>".$datos."</tbody>";	
	$tabla = "<table class=\"tablaSensores\">" . $encabezadoTabla . $datos . "</table>";
	echo $tabla;
	 }
?>
<?php
mysql_free_result($sensoresUltimo);
?>