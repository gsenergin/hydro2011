<?php 
/*
*** MÓDULO DE SEGURIDAD ENCARGADO DE LA VERIFICACIÓN, ACCESO O RESTRICCIÓN DE USUARIOS AL SITIO
*/

//Inicializa la sesion actual
if (!isset($_SESSION)) {
  session_start();
}

// ** En caso de haber dos usuarios iguales conectados, desconecta. **
$logoutAction = $_SERVER['PHP_SELF']."?doLogout=true";
if ((isset($_SERVER['QUERY_STRING'])) && ($_SERVER['QUERY_STRING'] != "")){
  $logoutAction .="&". htmlentities($_SERVER['QUERY_STRING']);
}

if ((isset($_GET['doLogout'])) &&($_GET['doLogout']=="true")){
  //Si es cierre de sesión, vaciar la variables
  $_SESSION['MM_Username'] = NULL;
  $_SESSION['MM_UserGroup'] = NULL;
  $_SESSION['PrevUrl'] = NULL;
  unset($_SESSION['MM_Username']);
  unset($_SESSION['MM_UserGroup']);
  unset($_SESSION['PrevUrl']);
	
  $logoutGoTo = "index.php";
  if ($logoutGoTo) {
    header("Location: $logoutGoTo");
    exit;
  }
}


// *** Funcion para Restringir o brindar el acceso
function isAuthorized($strUsers, $strGroups, $UserName, $UserGroup) { 
  // Por seguridad, se comienza que el usuario NO es válido.
  $isValid = False; 

	//Cuando se loggea en el sitio, la variable MM_Username es igual a su nombre de usuario, por lo tanto
	//sabemos que el usuario no esta loggeado si la variable de session está vacia.
  if (!empty($UserName)) { 
    // Si el usuario tiene permisos para ver la página...
    $arrUsers = Explode(",", $strUsers); 
    $arrGroups = Explode(",", $strGroups); 
    if (in_array($UserName, $arrUsers)) { 
      $isValid = true; 
    } 
    // Extensión para restringir a cierto grupo de usuarios --> NO IMPLEMENTADO 
    if (in_array($UserGroup, $arrGroups)) { 
      $isValid = true; 
    } 
    if (($strUsers == "") && true) { 
      $isValid = true; 
    } 
  } 
  return $isValid; 
}

if (!isset($_SESSION)) {
  session_start();
}
$MM_authorizedUsers = "";
$MM_donotCheckaccess = "true";

$MM_restrictGoTo = "index.php";
if (!((isset($_SESSION['MM_Username'])) && (isAuthorized("",$MM_authorizedUsers, $_SESSION['MM_Username'], $_SESSION['MM_UserGroup'])))) {   
  $MM_qsChar = "?";
  $MM_referrer = $_SERVER['PHP_SELF'];
  if (strpos($MM_restrictGoTo, "?")) $MM_qsChar = "&";
  if (isset($_SERVER['QUERY_STRING']) && strlen($_SERVER['QUERY_STRING']) > 0) 
  $MM_referrer .= "?" . $_SERVER['QUERY_STRING'];
  $MM_restrictGoTo = $MM_restrictGoTo. $MM_qsChar . "accesscheck=" . urlencode($MM_referrer);
  header("Location: ". $MM_restrictGoTo); 
  exit;
}
?>