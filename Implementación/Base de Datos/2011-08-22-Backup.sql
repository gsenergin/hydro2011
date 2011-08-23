# --------------------------------------------------------
# Host:                         127.0.0.1
# Server version:               5.5.14
# Server OS:                    Win32
# HeidiSQL version:             6.0.0.3603
# Date/time:                    2011-08-22 22:12:16
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

# Dumping database structure for hydrodb
CREATE DATABASE IF NOT EXISTS `hydrodb` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci */;
USE `hydrodb`;


# Dumping structure for table hydrodb.actuador
CREATE TABLE IF NOT EXISTS `actuador` (
  `ID_actuador` int(10) NOT NULL,
  `FK_Actuador_RTU` int(10) NOT NULL,
  `direccion_memoria` int(10) DEFAULT NULL,
  `nomenclatura` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `descripcion` varchar(200) COLLATE latin1_spanish_ci DEFAULT NULL,
  `gradual` int(11) NOT NULL,
  PRIMARY KEY (`ID_actuador`),
  KEY `FK_Actuador_RTU` (`FK_Actuador_RTU`),
  CONSTRAINT `FK_Actuador_RTU` FOREIGN KEY (`FK_Actuador_RTU`) REFERENCES `rtu` (`ID_RTU`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='Tabla de Actuadores y sus características';

# Dumping data for table hydrodb.actuador: ~13 rows (approximately)
/*!40000 ALTER TABLE `actuador` DISABLE KEYS */;
REPLACE INTO `actuador` (`ID_actuador`, `FK_Actuador_RTU`, `direccion_memoria`, `nomenclatura`, `descripcion`, `gradual`) VALUES
	(1, 1, 40003, 'ACC0003', 'Compuerta de Desvío de Agua', 0),
	(2, 1, 40004, 'ACC0004', 'Compuerta de Ingreso de Agua a la Tubería Forzada', 0),
	(3, 2, 40003, 'AT10003', 'Válvula Mariposa', 0),
	(4, 2, 40004, 'AT10004', 'Bypass Válvula Mariposa', 0),
	(5, 2, 40006, 'AT10006', 'Frenos Turbina', 1),
	(6, 2, 40007, 'AT10007', 'Apertura de los alabes', 1),
	(7, 2, 40011, 'AT10011', 'Sistema Integral de Refrigeración por aceite y agua', 0),
	(8, 2, 40015, 'AT10015', 'Frenos Generador', 1),
	(9, 2, 40016, 'AT10016', 'Generador', 0),
	(10, 2, 40017, 'AT10017', 'Regulador de Velocidad', 0),
	(11, 2, 40018, 'AT10018', 'Equipo de Excitación', 0),
	(12, 2, 40019, 'AT10019', 'Unidad de Sincronización', 0),
	(13, 3, 40002, 'ASA0002', 'Compuertas de Mantenimiento', 0);
/*!40000 ALTER TABLE `actuador` ENABLE KEYS */;


# Dumping structure for table hydrodb.alertas
CREATE TABLE IF NOT EXISTS `alertas` (
  `ID_alerta` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `FK_Alertas_Sensor` int(10) DEFAULT NULL,
  `TimeStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_alerta`),
  KEY `FK_Alertas_Sensor` (`FK_Alertas_Sensor`),
  CONSTRAINT `FK_Alertas_Sensor` FOREIGN KEY (`FK_Alertas_Sensor`) REFERENCES `sensor` (`ID_sensor`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

# Dumping data for table hydrodb.alertas: ~0 rows (approximately)
/*!40000 ALTER TABLE `alertas` DISABLE KEYS */;
/*!40000 ALTER TABLE `alertas` ENABLE KEYS */;


# Dumping structure for table hydrodb.historialsensado
CREATE TABLE IF NOT EXISTS `historialsensado` (
  `ID_Historial` int(10) NOT NULL AUTO_INCREMENT,
  `FK_HistorialSensado_Sensor` int(10) NOT NULL DEFAULT '0',
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `valorSensado` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Historial`),
  UNIQUE KEY `ID_Historial` (`ID_Historial`),
  KEY `FK_HistorialSensado_Sensor` (`FK_HistorialSensado_Sensor`),
  CONSTRAINT `FK_HistorialSensado_Sensor` FOREIGN KEY (`FK_HistorialSensado_Sensor`) REFERENCES `sensor` (`ID_sensor`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

# Dumping data for table hydrodb.historialsensado: ~13 rows (approximately)
/*!40000 ALTER TABLE `historialsensado` DISABLE KEYS */;
REPLACE INTO `historialsensado` (`ID_Historial`, `FK_HistorialSensado_Sensor`, `TimeStamp`, `valorSensado`) VALUES
	(51, 7, '2011-08-22 22:00:54', 10),
	(52, 7, '2011-08-22 22:01:36', 10),
	(53, 7, '2011-08-22 22:02:11', 50),
	(54, 7, '2011-08-22 22:03:02', 50),
	(55, 7, '2011-08-22 22:03:08', 50),
	(56, 7, '2011-08-22 22:03:14', 5),
	(57, 7, '2011-08-22 22:04:11', 5),
	(58, 7, '2011-08-22 22:04:28', 5),
	(59, 7, '2011-08-22 22:06:39', 5),
	(60, 7, '2011-08-22 22:06:47', 42),
	(61, 3, '2011-08-22 22:06:55', 2),
	(62, 3, '2011-08-22 22:07:03', 20),
	(64, 6, '2011-08-22 22:08:16', 20);
/*!40000 ALTER TABLE `historialsensado` ENABLE KEYS */;


# Dumping structure for procedure hydrodb.HistorialSensado_Insertar
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `HistorialSensado_Insertar`(IN `dirMem` INT, IN `rtu_num` INT, IN `valor` INT)
    COMMENT 'Inserta un elemento en la tabla historial'
BEGIN
	declare ID INT;
   Select @ID:=ID_Sensor From SENSOR where (FK_Sensor_RTU = rtu_num)and(direccion_Memoria=dirMem);
			  		
	INSERT INTO HistorialSensado (valorSensado,FK_HistorialSensado_Sensor)
	VALUES (valor,@ID);		

END//
DELIMITER ;


# Dumping structure for table hydrodb.log
CREATE TABLE IF NOT EXISTS `log` (
  `ID_Log` int(10) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FK_Log_Usuario` int(11) NOT NULL,
  PRIMARY KEY (`ID_Log`),
  UNIQUE KEY `ID_Log` (`ID_Log`),
  KEY `FK_Log_Usuario` (`FK_Log_Usuario`),
  CONSTRAINT `FK_Log_Usuario` FOREIGN KEY (`FK_Log_Usuario`) REFERENCES `usuario` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='Registro de lo que hizo un usuario';

# Dumping data for table hydrodb.log: ~0 rows (approximately)
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
/*!40000 ALTER TABLE `log` ENABLE KEYS */;


# Dumping structure for table hydrodb.permisos
CREATE TABLE IF NOT EXISTS `permisos` (
  `ID_Permiso` int(10) NOT NULL AUTO_INCREMENT,
  `FK_Permisos_TipoUsuario` int(10) NOT NULL DEFAULT '0',
  `Read` int(10) NOT NULL DEFAULT '1',
  `Write` int(10) NOT NULL DEFAULT '0',
  `Config` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_Permiso`),
  UNIQUE KEY `ID_Permiso` (`ID_Permiso`),
  KEY `FK_Permisos_TipoUsuario` (`FK_Permisos_TipoUsuario`),
  CONSTRAINT `FK_Permisos_TipoUsuario` FOREIGN KEY (`FK_Permisos_TipoUsuario`) REFERENCES `tipousuario` (`ID_TipoUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='Permisos de cada usuario';

# Dumping data for table hydrodb.permisos: ~4 rows (approximately)
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
REPLACE INTO `permisos` (`ID_Permiso`, `FK_Permisos_TipoUsuario`, `Read`, `Write`, `Config`) VALUES
	(1, 1, 1, 0, 0),
	(2, 2, 1, 1, 0),
	(3, 3, 1, 1, 1),
	(4, 4, 1, 1, 1);
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;


# Dumping structure for table hydrodb.registroeventos
CREATE TABLE IF NOT EXISTS `registroeventos` (
  `ID_Evento` int(10) NOT NULL AUTO_INCREMENT,
  `FK_RegistroEventos_Actuador` int(10) NOT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `valorSeteado` int(10) NOT NULL,
  PRIMARY KEY (`ID_Evento`),
  UNIQUE KEY `ID_Evento` (`ID_Evento`),
  KEY `FK_RegistroEventos_Actuador` (`FK_RegistroEventos_Actuador`),
  CONSTRAINT `FK_RegistroEventos_Actuador` FOREIGN KEY (`FK_RegistroEventos_Actuador`) REFERENCES `actuador` (`ID_actuador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='Registra los cambios en los actuadores';

# Dumping data for table hydrodb.registroeventos: ~0 rows (approximately)
/*!40000 ALTER TABLE `registroeventos` DISABLE KEYS */;
/*!40000 ALTER TABLE `registroeventos` ENABLE KEYS */;


# Dumping structure for procedure hydrodb.RegistroEventos_Insertar
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `RegistroEventos_Insertar`(IN `dirMem` INT, IN `rtu_num` INT, IN `valor` INT)
    COMMENT 'Inserta un elemento en la tabla Registro Eventos'
BEGIN
	declare ID INT;
   Select @ID:=ID_Actuador From ACTUADOR where (FK_Actuador_RTU = rtu_num)and(direccion_Memoria=dirMem);
			  		
	INSERT INTO REGISTROEVENTOS (valorSeteado,FK_RegistroEventos_Actuador)
	VALUES (valor,@ID);		

END//
DELIMITER ;


# Dumping structure for table hydrodb.rtu
CREATE TABLE IF NOT EXISTS `rtu` (
  `ID_RTU` int(20) NOT NULL,
  `numero_serie` int(20) NOT NULL,
  `sector` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `ubicacion` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `descripcion` varchar(200) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`ID_RTU`),
  UNIQUE KEY `ID_RTU` (`ID_RTU`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='Engloba las unidades de transmisión remota (RTU)';

# Dumping data for table hydrodb.rtu: ~3 rows (approximately)
/*!40000 ALTER TABLE `rtu` DISABLE KEYS */;
REPLACE INTO `rtu` (`ID_RTU`, `numero_serie`, `sector`, `ubicacion`, `descripcion`) VALUES
	(1, 124500712, 'Camara de Carga', 'Exterior', 'RTU que obtiene datos del ingreso de agua a la central'),
	(2, 304972034, 'Turbina1', 'Interior', 'RTU que obtiene datos de la turbina'),
	(3, 155148221, 'Salida', 'Exterior', 'RTU que obtiene datos del desfogue de la planta');
/*!40000 ALTER TABLE `rtu` ENABLE KEYS */;


# Dumping structure for table hydrodb.sensor
CREATE TABLE IF NOT EXISTS `sensor` (
  `ID_sensor` int(11) NOT NULL,
  `FK_Sensor_RTU` int(11) NOT NULL,
  `nomenclatura` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `descripcion` varchar(200) COLLATE latin1_spanish_ci DEFAULT NULL,
  `direccion_memoria` int(11) NOT NULL,
  `unidad_medida` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `min` int(11) NOT NULL DEFAULT '0',
  `valorLL` int(11) NOT NULL,
  `valorL` int(11) NOT NULL,
  `valorH` int(11) NOT NULL,
  `valorHH` int(11) NOT NULL,
  `max` int(11) NOT NULL,
  `TipoAlerta` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_sensor`),
  KEY `FK_Sensor_RTU` (`FK_Sensor_RTU`),
  CONSTRAINT `FK_Sensor_RTU` FOREIGN KEY (`FK_Sensor_RTU`) REFERENCES `rtu` (`ID_RTU`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='Tabla de Sensores y sus características';

# Dumping data for table hydrodb.sensor: ~15 rows (approximately)
/*!40000 ALTER TABLE `sensor` DISABLE KEYS */;
REPLACE INTO `sensor` (`ID_sensor`, `FK_Sensor_RTU`, `nomenclatura`, `descripcion`, `direccion_memoria`, `unidad_medida`, `min`, `valorLL`, `valorL`, `valorH`, `valorHH`, `max`, `TipoAlerta`) VALUES
	(1, 1, 'SCC0001', 'Caudal de Entrada', 40001, 'm^3/seg', 0, 10, 25, 55, 70, 100, 0),
	(2, 1, 'SCC0002', 'Nivel Desborde en Cámara de carga (Diferencia de Agua respecto a la cota superior)', 40002, 'mm', 0, 10, 20, 30, 40, 5000, 0),
	(3, 1, 'SCC0005', 'Presión Tubería Forzada', 40005, 'bar', 0, 3, 5, 12, 15, 30, 3),
	(4, 2, 'ST10001', 'Presión del Lado A de la Válvula Mariposa', 40001, 'bar', 0, 3, 5, 12, 15, 30, 3),
	(5, 2, 'ST10002', 'Presión del Lado B de la Válvula Mariposa', 40002, 'bar', 0, 3, 5, 12, 15, 30, 3),
	(6, 2, 'ST10005', 'Presión Sobre Tapa Turbina', 40005, 'bar', 0, 3, 5, 12, 15, 30, 0),
	(7, 2, 'ST10008', 'Temperatura Cojinetes Guía Superior (CGS)', 40008, 'ºC', 0, 10, 20, 40, 80, 130, 2),
	(8, 2, 'ST10009', 'Temperatura Cojinetes Guía Inferior (CGI)', 40009, 'ºC', 0, 10, 20, 40, 80, 130, 2),
	(9, 2, 'ST10010', 'Temperatura Cojinetes Guía Turbina (CGT)', 40010, 'ºC', 0, 10, 30, 60, 80, 130, 2),
	(10, 2, 'ST10012', 'Estado Sistema Enfriamiento', 40012, 'OK\\ERR', 0, 0, 0, 1, 1, 1, 2),
	(11, 2, 'ST10013', 'Caudal Turbinado', 40013, 'm^3/s', 0, 10, 15, 25, 35, 40, 0),
	(12, 2, 'ST10014', 'Valocidad Giro Turbina', 40014, 'rpm', 0, 50, 100, 200, 300, 333, 0),
	(13, 2, 'ST10020', 'Intensidad Corriente', 40020, 'Amper', 0, 100, 500, 750, 900, 1000, 0),
	(14, 2, 'ST10021', 'Voltaje Generado', 40021, 'Volts', 0, 2000, 5000, 15000, 20000, 24000, 0),
	(15, 3, 'SSA0001', 'Nivel Desfogue', 40001, 'm^3/seg', 0, 10, 20, 25, 30, 40, 0);
/*!40000 ALTER TABLE `sensor` ENABLE KEYS */;


# Dumping structure for table hydrodb.tipousuario
CREATE TABLE IF NOT EXISTS `tipousuario` (
  `ID_TipoUsuario` int(10) NOT NULL AUTO_INCREMENT,
  `Codigo` int(10) NOT NULL,
  `Descripcion` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`ID_TipoUsuario`),
  UNIQUE KEY `Codigo` (`Codigo`),
  UNIQUE KEY `ID_TipoUsuario` (`ID_TipoUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='Describe los posibles tipos de usuario del sistema';

# Dumping data for table hydrodb.tipousuario: ~4 rows (approximately)
/*!40000 ALTER TABLE `tipousuario` DISABLE KEYS */;
REPLACE INTO `tipousuario` (`ID_TipoUsuario`, `Codigo`, `Descripcion`) VALUES
	(1, 1, 'Visitante'),
	(2, 2, 'Operario'),
	(3, 3, 'Jefe de Planta'),
	(4, 4, 'Administrador');
/*!40000 ALTER TABLE `tipousuario` ENABLE KEYS */;


# Dumping structure for table hydrodb.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `ID_Usuario` int(10) NOT NULL AUTO_INCREMENT,
  `user` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `FK_Usuario_TipoUsuario` int(11) NOT NULL,
  `password` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `baja` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_Usuario`),
  UNIQUE KEY `user` (`user`),
  UNIQUE KEY `ID_Usuario` (`ID_Usuario`),
  KEY `FK_Usuario_TipoUsuario` (`FK_Usuario_TipoUsuario`),
  CONSTRAINT `FK_Usuario_TipoUsuario` FOREIGN KEY (`FK_Usuario_TipoUsuario`) REFERENCES `tipousuario` (`ID_TipoUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='Usuarios del Sistema';

# Dumping data for table hydrodb.usuario: ~7 rows (approximately)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
REPLACE INTO `usuario` (`ID_Usuario`, `user`, `FK_Usuario_TipoUsuario`, `password`, `baja`) VALUES
	(1, 'visitante', 1, '1234', 0),
	(2, 'operario', 2, '1234', 0),
	(3, 'jefe', 3, '1234', 0),
	(4, 'admin', 4, '1234', 0),
	(9, 'adrian', 4, 'adrian', 0),
	(10, 'juan', 1, 'juan', 0),
	(11, 'roberto', 3, 'roberto', 0);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;


# Dumping structure for procedure hydrodb.Usuario_Delete
DELIMITER //
CREATE DEFINER=`root`@`` PROCEDURE `Usuario_Delete`(IN `nombre_usuario` VARCHAR(50))
BEGIN
	UPDATE USUARIO 
	SET BAJA=1 WHERE usuario.user = nombre_usuario;
END//
DELIMITER ;


# Dumping structure for procedure hydrodb.Usuario_Insertar
DELIMITER //
CREATE DEFINER=`root`@`` PROCEDURE `Usuario_Insertar`(IN `nombre_usuario` VARCHAR(50), IN `IDTipoUsuario` INT)
BEGIN
	declare ID INT;
   set id = 0;
	Select @ID:=ID_Usuario From usuario where usuario.user=nombre_usuario;
   
   if @id >0 then 
      UPDATE usuario SET Baja=0, password=nombre_usuario 
      WHERE usuario.ID_Usuario = @ID;
   ELSE
		INSERT INTO usuario (usuario.user, usuario.password, usuario.FK_Usuario_TipoUsuario)
   	VALUES (nombre_usuario, nombre_usuario, IDTipoUsuario);	

   END IF;
END//
DELIMITER ;


# Dumping structure for procedure hydrodb.Usuario_Restaurar
DELIMITER //
CREATE DEFINER=`root`@`` PROCEDURE `Usuario_Restaurar`(IN `nombre_usuario` VARCHAR(50))
BEGIN
	UPDATE USUARIO
	SET BAJA=0
	WHERE usuario.user = nombre_usuario;
END//
DELIMITER ;


# Dumping structure for procedure hydrodb.Usuario_RestorePassword
DELIMITER //
CREATE DEFINER=`root`@`` PROCEDURE `Usuario_RestorePassword`(IN `nombre_usuario` varCHAR(50), IN `nueva_clave` VARCHAR(50))
BEGIN
	UPDATE usuario
	SET password=nueva_clave
	WHERE usuario.user=nombre_usuario;
END//
DELIMITER ;


# Dumping structure for trigger hydrodb.historialsensado_AfterInsert_Alertas
SET SESSION SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `historialsensado_AfterInsert_Alertas` AFTER INSERT ON `historialsensado` FOR EACH ROW BEGIN

	declare TAlearta,H,HH,L,LL INT;
	declare descrip VARCHAR(50);
   
	SET descrip = '0';
	
--	Select @TAlearta := sensor.TipoAlerta, @LL:= sensor.valorLL, @L:= sensor.valorL , @H:= sensor.valorH , @HH:= sensor.valorHH 
--		FROM sensor Where sensor.ID_sensor = new.FK_HistorialSensado_Sensor;
  
	SET TAlearta = (SELECT TipoAlerta FROM sensor Where ID_sensor = new.FK_HistorialSensado_Sensor);
	SET LL = (SELECT valorLL FROM sensor Where ID_sensor = new.FK_HistorialSensado_Sensor);
	SET L  = (SELECT valorL  FROM sensor Where ID_sensor = new.FK_HistorialSensado_Sensor);
	SET H  = (SELECT valorH  FROM sensor Where ID_sensor = new.FK_HistorialSensado_Sensor);
	SET HH = (SELECT valorHH FROM sensor Where ID_sensor = new.FK_HistorialSensado_Sensor);
	
	
	case TAlearta
		WHEN 3  then 

			if NEW.valorSensado > HH then 
				SET descrip = 'Valor mayor a <HH>';
			ELSEIF NEW.valorSensado < LL then 
				SET descrip = 'Valor menor a <LL>';
			END IF;
	
	
		WHEN 2 then

			if NEW.valorSensado > H then 
				SET descrip = 'Valor mayor a <H>';
			ELSEIF NEW.valorSensado < L then 
				SET descrip = 'Valor menor a <L>';
			END IF;
			
		ELSE SET descrip = '0';
			
	end case;
	
  IF descrip<>'0' THEN
  		INSERT INTO ALERTAS (ALERTAS.FK_Alertas_Sensor, alertas.descripcion) values (new.FK_HistorialSensado_Sensor,descrip);
  	END iF;


END//
DELIMITER ;
SET SESSION SQL_MODE=@OLD_SQL_MODE;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
