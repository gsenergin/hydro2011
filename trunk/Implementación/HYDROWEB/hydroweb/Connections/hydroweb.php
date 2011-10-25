<?php
# FileName="Connection_php_mysql.htm"
# Type="MYSQL"
# HTTP="true"
$hostname_hydroweb = "localhost";
$database_hydroweb = "hydrodb";
$username_hydroweb = "root";
$password_hydroweb = "123456";
$hydroweb = mysql_pconnect($hostname_hydroweb, $username_hydroweb, $password_hydroweb) or trigger_error(mysql_error(),E_USER_ERROR); 
?>