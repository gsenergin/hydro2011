<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="css/frame.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Control</title>
</head>
<script type="application/javascript">

//COMIENZO DE SCRIPT PARA EL REFRESCO DE LA IMAGEN DE ACTUADORES
var peticion_php;
if (window.XMLHttpRequest){
		peticion_php= new XMLHttpRequest();
		}
		else{ 
			alert("NO FUNCA");
		}
var nroImagen;
var nrospan;

function inicializarImagenes(){
	var i = 0;
	var nombre;
	for ( i = 0; i < document.images.length; i++){
		nombre = document.images[i].name;
		nroImagen = i;
		peticion_php.onreadystatechange = cargarImagenes;
		peticion_php.open('GET', './consulta.php?nombre='+ nombre, false);
		peticion_php.send(null);
		}
		var spans;
		inicializarSpans();
	}
	
function cargarImagenes(){
		var valorDevuelto;
    	if(peticion_php.readyState == 4) {
      		if(peticion_php.status == 200) {
			valorDevuelto = peticion_php.responseText;
			//alert(valorDevuelto);
				if(valorDevuelto == '0'){
					document.images[nroImagen].src = "./images/cerrado.png";
					} else if (valorDevuelto == '1'){
						document.images[nroImagen].src = "./images/abierto.png";
						} else {
						alert("Error al cargar imagenes");
							}
      				}
    			}
		
		}
var j=0;
function inicializarSpans(){
	var nombre;
	spans = document.getElementsByTagName("span");
	
	for(j = 0; j < spans.length ;j++){
			nrospan = j;
			var nombre = spans.item(j).id;
			peticion_php.onreadystatechange = cargarSpans;
			peticion_php.open('GET', './consulta.php?nombre='+ nombre, false);
			peticion_php.send(null); 
		}
	}
function cargarSpans(){
	var valorDevuelto;
    	if(peticion_php.readyState == 4) {
      		if(peticion_php.status == 200) {
			valorDevuelto = peticion_php.responseText;		
(document.getElementsByTagName("span").item(j).innerHTML) = valorDevuelto + " %";
	}
	}
	}

setInterval('inicializarImagenes()',10000);


</script>
<body onload="inicializarImagenes()">
<div id="content">
<div id="apDiv3"><p>Bypass</p><img name="AT10004" src="" width="60" height="30" alt="" /></div>
<div id="apDiv4"><img name="AT10003" src="" width="60" height="30" alt="" /><p>Mariposa</p></div>
<div id="apDiv5"><p style="font-size:12px;">Mantenimiento</p><img name="ASA0002" src="" width="60" height="30" alt="" /></div>
<div id="apDiv2">
<p>C. Ingreso</p><img name="ACC0004" src="" width="60" height="30" alt="" /></div>
<div id="apDiv1">
  <p>C. Desvio</p>
  <img name="ACC0003" src="" width="60" height="30" alt="" /></div>
<div id="apDiv6"><table width="190" height="160" border="l0" align="right" style="font-size:13px; color:#006; text-align:right; font-weight:bold;">
  <tr>
    <td width="145">U. Sincronismo</td>
    <td width="35"><img src="" alt="" name="AT10019" width="35" height="18" id="sincronismo" /></td>
  </tr>
  <tr>
    <td>Generador</td>
    <td><img src="" alt="" name="AT10016" width="35" height="18" id="generador" /></td>
  </tr>
  <tr>
    <td>Eq. Excitación</td>
    <td><img alt="" name="AT10018" width="35" height="18" id="excitacion" /></td>
  </tr>
  <tr>
    <td>Reg. Velocidad</td>
    <td><img src="" alt="" name="AT10017" width="35" height="18" id="velocidad" /></td>
  </tr>
  <tr>
    <td>Refrigeración</td>
    <td><img src="" alt="" name="AT10011" width="35" height="18" id="refrigeracion" /></td>
  </tr>
</table></div>
<div id="apDiv7">
  <table width="100" height="59" border="0" align="center" style="text-align:center">
    <tr>
      <td width="50" height="32"><p>Frenos generador: </p></td>
  	<td align="left"><span id="AT10015" ></span></td>    
    </tr>
  </table>
</div>
<div id="apDiv8">
  <table width="100" height="56" border="0" align="center"  style="text-align:center; vertical-align:text-top; font-size: 12px;">
    <tr>
      <td width="50"><p>Frenos Turbina: </p></td>
      <td align="left"><span id="AT10006" ></span></td>
    </tr>
      
  </table>
</div>
<div id="apDiv9">
  <table width="100" border="0" align="center" style="text-align:center" height="59">
    <tr>
      <td width="50"><p>Apertura Álaves: </p></td>
      <td align="left"><span id="AT10007" ></span></td>
    </tr>  
  </table>
</div>
</div>
</body>
</html>