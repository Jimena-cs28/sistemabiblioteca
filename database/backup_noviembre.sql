/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 10.4.27-MariaDB : Database - sistemabiblioteca
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sistemabiblioteca` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `sistemabiblioteca`;

/*Table structure for table `autores` */

DROP TABLE IF EXISTS `autores`;

CREATE TABLE `autores` (
  `idautor` int(11) NOT NULL AUTO_INCREMENT,
  `apellidos` varchar(50) NOT NULL,
  `autor` varchar(30) NOT NULL,
  `pseudonimio` varchar(50) DEFAULT NULL,
  `nacionalidad` varchar(50) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL,
  PRIMARY KEY (`idautor`),
  UNIQUE KEY `uk_autor` (`autor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `autores` */

insert  into `autores`(`idautor`,`apellidos`,`autor`,`pseudonimio`,`nacionalidad`,`create_at`,`update_at`,`inactive_at`) values 
(1,'Crary','Jonathan','','Vermont','2023-11-14 20:09:45',NULL,NULL),
(2,'Verdy','Luis','','Frances','2023-11-14 20:09:45',NULL,NULL),
(3,'Cortes','Jeremy','','Estadunidence','2023-11-14 20:09:45',NULL,NULL);

/*Table structure for table `categorias` */

DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(100) NOT NULL,
  `codigo` smallint(6) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL,
  PRIMARY KEY (`idcategoria`),
  UNIQUE KEY `uk_codigo` (`codigo`,`categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `categorias` */

insert  into `categorias`(`idcategoria`,`categoria`,`codigo`,`create_at`,`update_at`,`inactive_at`) values 
(1,'Obras Generales',0,'2023-11-14 20:09:39',NULL,NULL),
(2,'Filosofia y Psicologia',100,'2023-11-14 20:09:39',NULL,NULL),
(3,'Religion',200,'2023-11-14 20:09:39',NULL,NULL),
(4,'Ciencias Sociales',300,'2023-11-14 20:09:39',NULL,NULL),
(5,'Lenguas',400,'2023-11-14 20:09:39',NULL,NULL),
(6,'Ciencias Naturales y Matematicas',500,'2023-11-14 20:09:39',NULL,NULL),
(7,'Tecnología, Ciencias Aplicadas',600,'2023-11-14 20:09:39',NULL,NULL),
(8,'Las Artes, Bellas Artes y Artes Decorativas',700,'2023-11-14 20:09:39',NULL,NULL),
(9,'Literatura',800,'2023-11-14 20:09:39',NULL,NULL),
(10,'Historia y Geografía',900,'2023-11-14 20:09:39',NULL,NULL);

/*Table structure for table `detalleautores` */

DROP TABLE IF EXISTS `detalleautores`;

CREATE TABLE `detalleautores` (
  `iddetalleautor` int(11) NOT NULL AUTO_INCREMENT,
  `idlibro` int(11) NOT NULL,
  `idautor` int(11) NOT NULL,
  `creat_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL,
  PRIMARY KEY (`iddetalleautor`),
  KEY `fk_idlibro` (`idlibro`),
  KEY `fk_idautor_text` (`idautor`),
  CONSTRAINT `fk_idautor_text` FOREIGN KEY (`idautor`) REFERENCES `autores` (`idautor`),
  CONSTRAINT `fk_idlibro` FOREIGN KEY (`idlibro`) REFERENCES `libros` (`idlibro`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `detalleautores` */

insert  into `detalleautores`(`iddetalleautor`,`idlibro`,`idautor`,`creat_at`,`update_at`,`inactive_at`) values 
(1,2,2,'2023-11-14 20:10:38',NULL,NULL);

/*Table structure for table `editoriales` */

DROP TABLE IF EXISTS `editoriales`;

CREATE TABLE `editoriales` (
  `ideditorial` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) NOT NULL,
  `telefono` char(9) DEFAULT NULL,
  `website` varchar(150) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `paisorigen` varchar(50) DEFAULT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL,
  PRIMARY KEY (`ideditorial`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `editoriales` */

insert  into `editoriales`(`ideditorial`,`nombres`,`telefono`,`website`,`email`,`paisorigen`,`create_at`,`update_at`,`inactive_at`) values 
(1,'Ariel','943883123','','jonathanc@gmail.com','EEUU','2023-11-14 20:10:11',NULL,NULL),
(2,'Paidos','913033923','','max@gmail.com','España','2023-11-14 20:10:11',NULL,NULL),
(3,'Ariel','943883123','','jonathanc@gmail.com','EEUU','2023-11-14 20:10:15',NULL,NULL),
(4,'Paidos','913033923','','max@gmail.com','España','2023-11-14 20:10:15',NULL,NULL);

/*Table structure for table `ejemplares` */

DROP TABLE IF EXISTS `ejemplares`;

CREATE TABLE `ejemplares` (
  `idejemplar` int(11) NOT NULL AUTO_INCREMENT,
  `idlibro` int(11) NOT NULL,
  `codigo_libro` int(11) NOT NULL,
  `ocupado` char(2) NOT NULL DEFAULT 'NO',
  `estado` char(1) NOT NULL DEFAULT '1',
  `creat_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL,
  PRIMARY KEY (`idejemplar`),
  UNIQUE KEY `uk_codigo_ejemplar` (`codigo_libro`,`idlibro`),
  KEY `fk_idlibro_ejemplar` (`idlibro`),
  CONSTRAINT `fk_idlibro_ejemplar` FOREIGN KEY (`idlibro`) REFERENCES `libros` (`idlibro`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ejemplares` */

insert  into `ejemplares`(`idejemplar`,`idlibro`,`codigo_libro`,`ocupado`,`estado`,`creat_at`,`update_at`,`inactive_at`) values 
(1,2,1,'NO','1','2023-11-14 20:11:01',NULL,NULL),
(2,2,2,'NO','1','2023-11-14 20:11:01',NULL,NULL),
(3,2,3,'NO','1','2023-11-14 20:11:01',NULL,NULL),
(4,2,4,'NO','1','2023-11-14 20:11:01',NULL,NULL),
(5,2,5,'NO','1','2023-11-14 20:11:01',NULL,NULL),
(6,2,6,'NO','1','2023-11-14 20:11:01',NULL,NULL),
(7,2,7,'NO','1','2023-11-14 20:11:01',NULL,NULL),
(8,2,8,'NO','1','2023-11-14 20:11:01',NULL,NULL),
(9,2,9,'NO','1','2023-11-14 20:11:01',NULL,NULL);

/*Table structure for table `libros` */

DROP TABLE IF EXISTS `libros`;

CREATE TABLE `libros` (
  `idlibro` int(11) NOT NULL AUTO_INCREMENT,
  `idsubcategoria` int(11) NOT NULL,
  `ideditorial` int(11) NOT NULL,
  `libro` varchar(70) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `cantidad` smallint(6) NOT NULL,
  `numeropaginas` smallint(6) NOT NULL,
  `codigo` decimal(6,3) NOT NULL,
  `edicion` varchar(50) DEFAULT NULL,
  `formato` varchar(50) DEFAULT NULL,
  `anio` date DEFAULT NULL,
  `idioma` varchar(30) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `imagenportada` varchar(200) DEFAULT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL,
  `estado` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idlibro`),
  KEY `fk_idsubcategoria` (`idsubcategoria`),
  KEY `fk_ideditorial` (`ideditorial`),
  CONSTRAINT `fk_ideditorial` FOREIGN KEY (`ideditorial`) REFERENCES `editoriales` (`ideditorial`),
  CONSTRAINT `fk_idsubcategoria` FOREIGN KEY (`idsubcategoria`) REFERENCES `subcategorias` (`idsubcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `libros` */

insert  into `libros`(`idlibro`,`idsubcategoria`,`ideditorial`,`libro`,`tipo`,`cantidad`,`numeropaginas`,`codigo`,`edicion`,`formato`,`anio`,`idioma`,`descripcion`,`imagenportada`,`create_at`,`update_at`,`inactive_at`,`estado`) values 
(2,1,1,'Historia del mundo contemporáneo','texto',7,132,140.053,'','','0000-00-00','castellano','','','2023-11-14 20:10:19',NULL,NULL,'1');

/*Table structure for table `librosentregados` */

DROP TABLE IF EXISTS `librosentregados`;

CREATE TABLE `librosentregados` (
  `idlibroentregado` int(11) NOT NULL AUTO_INCREMENT,
  `idprestamo` int(11) NOT NULL,
  `idejemplar` int(11) NOT NULL,
  `cantidad` smallint(6) DEFAULT NULL,
  `condicionentrega` varchar(50) DEFAULT NULL,
  `condiciondevolucion` varchar(50) DEFAULT NULL,
  `observaciones` varchar(40) DEFAULT NULL,
  `fechadevolucion` datetime DEFAULT NULL,
  PRIMARY KEY (`idlibroentregado`),
  KEY `fk_idejemplar_libroentre` (`idejemplar`),
  KEY `fk_prestamo_libentre` (`idprestamo`),
  CONSTRAINT `fk_idejemplar_libroentre` FOREIGN KEY (`idejemplar`) REFERENCES `ejemplares` (`idejemplar`),
  CONSTRAINT `fk_prestamo_libentre` FOREIGN KEY (`idprestamo`) REFERENCES `prestamos` (`idprestamo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `librosentregados` */

insert  into `librosentregados`(`idlibroentregado`,`idprestamo`,`idejemplar`,`cantidad`,`condicionentrega`,`condiciondevolucion`,`observaciones`,`fechadevolucion`) values 
(1,1,1,NULL,'Nuevo','bien','bien','2023-11-15 03:12:36'),
(2,1,2,NULL,'Nuevo','bien','bien','2023-11-15 03:13:04');

/*Table structure for table `personas` */

DROP TABLE IF EXISTS `personas`;

CREATE TABLE `personas` (
  `idpersona` int(11) NOT NULL AUTO_INCREMENT,
  `apellidos` varchar(50) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `nrodocumento` char(8) DEFAULT NULL,
  `tipodocumento` varchar(50) NOT NULL,
  `fechanac` date DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` char(9) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL,
  PRIMARY KEY (`idpersona`),
  UNIQUE KEY `ukDNI` (`nrodocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `personas` */

insert  into `personas`(`idpersona`,`apellidos`,`nombres`,`nrodocumento`,`tipodocumento`,`fechanac`,`direccion`,`telefono`,`email`,`create_at`,`update_at`,`inactive_at`) values 
(1,'Berrocal paima','Luis Fernando','76543001','DNI','0000-00-00','Sunampe','964513274','','2023-11-14 20:04:43',NULL,NULL),
(2,'Cartagena Salazar','Jimena Adriana','73194180','DNI','0000-00-00','El carmen','','95107563','2023-11-14 20:04:43',NULL,NULL);

/*Table structure for table `prestamos` */

DROP TABLE IF EXISTS `prestamos`;

CREATE TABLE `prestamos` (
  `idprestamo` int(11) NOT NULL AUTO_INCREMENT,
  `idbeneficiario` int(11) NOT NULL,
  `idbibliotecario` int(11) DEFAULT NULL,
  `fechasolicitud` datetime NOT NULL DEFAULT current_timestamp(),
  `fechaprestamo` datetime DEFAULT NULL,
  `fecharespuesta` datetime DEFAULT NULL,
  `fechaentrega` datetime DEFAULT NULL,
  `descripcion` varchar(20) DEFAULT NULL,
  `enbiblioteca` char(2) NOT NULL,
  `lugardestino` varchar(100) DEFAULT NULL,
  `estado` char(1) NOT NULL DEFAULT 'E',
  `activo` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idprestamo`),
  KEY `fk_idbene_prestamo` (`idbeneficiario`),
  KEY `fk_idbiblio_prestamo` (`idbibliotecario`),
  CONSTRAINT `fk_idbene_prestamo` FOREIGN KEY (`idbeneficiario`) REFERENCES `usuarios` (`idusuario`),
  CONSTRAINT `fk_idbiblio_prestamo` FOREIGN KEY (`idbibliotecario`) REFERENCES `usuarios` (`idusuario`),
  CONSTRAINT `ck_enbiblio_presta` CHECK (`enbiblioteca` in ('SI','NO')),
  CONSTRAINT `ck_estado_ore` CHECK (`estado` in ('E','S','R','D','T','N'))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `prestamos` */

insert  into `prestamos`(`idprestamo`,`idbeneficiario`,`idbibliotecario`,`fechasolicitud`,`fechaprestamo`,`fecharespuesta`,`fechaentrega`,`descripcion`,`enbiblioteca`,`lugardestino`,`estado`,`activo`) values 
(1,2,1,'2023-11-14 20:11:48','2023-11-14 20:11:48',NULL,'2023-11-14 20:11:48','3M','SI',NULL,'T','1');

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `idrol` int(11) NOT NULL AUTO_INCREMENT,
  `nombrerol` varchar(50) NOT NULL,
  `cantidadmax` smallint(6) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL,
  PRIMARY KEY (`idrol`),
  UNIQUE KEY `uk_nombrerol_roles` (`nombrerol`),
  CONSTRAINT `ck_nombrerol_roles` CHECK (`nombrerol` in ('Administrador','Profesor','Estudiante'))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `roles` */

insert  into `roles`(`idrol`,`nombrerol`,`cantidadmax`,`create_at`,`update_at`,`inactive_at`) values 
(1,'Administrador',5,'2023-11-14 20:04:52',NULL,NULL),
(2,'Profesor',40,'2023-11-14 20:04:52',NULL,NULL),
(3,'Estudiante',3,'2023-11-14 20:04:52',NULL,NULL);

/*Table structure for table `subcategorias` */

DROP TABLE IF EXISTS `subcategorias`;

CREATE TABLE `subcategorias` (
  `idsubcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `idcategoria` int(11) NOT NULL,
  `subcategoria` varchar(50) DEFAULT NULL,
  `codigo` smallint(6) DEFAULT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL,
  PRIMARY KEY (`idsubcategoria`),
  UNIQUE KEY `uk_subcategoria` (`subcategoria`),
  KEY `fk_idcategoria` (`idcategoria`),
  CONSTRAINT `fk_idcategoria` FOREIGN KEY (`idcategoria`) REFERENCES `categorias` (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `subcategorias` */

insert  into `subcategorias`(`idsubcategoria`,`idcategoria`,`subcategoria`,`codigo`,`create_at`,`update_at`,`inactive_at`) values 
(1,2,'Escuelas Filosóficas Específicas',140,'2023-11-14 20:09:42',NULL,NULL),
(2,4,'Educacion',370,'2023-11-14 20:09:42',NULL,NULL),
(3,6,'Matemáticas',510,'2023-11-14 20:09:42',NULL,NULL),
(4,6,'Astronomía y ciencias afines',520,'2023-11-14 20:09:42',NULL,NULL),
(5,6,'Física',530,'2023-11-14 20:09:42',NULL,NULL),
(6,6,'Ciencias de la vida Biología',570,'2023-11-14 20:09:42',NULL,NULL),
(7,9,'Literatura estadounidense',810,'2023-11-14 20:09:42',NULL,NULL),
(8,9,'Literatura inglesa e inglesa antigua(Anglosajona)',820,'2023-11-14 20:09:42',NULL,NULL),
(9,9,'Literatura de lenguas germánicas literatura aleman',830,'2023-11-14 20:09:42',NULL,NULL),
(10,9,'Literatura Francesa y literaturas de las lenguas r',840,'2023-11-14 20:09:42',NULL,NULL),
(11,9,'Literatura española y portuguesa',860,'2023-11-14 20:09:42',NULL,NULL),
(12,10,'Historia Universal',909,'2023-11-14 20:09:42',NULL,NULL),
(13,10,'Geografía y viajes',910,'2023-11-14 20:09:42',NULL,NULL),
(14,10,'Historia de américa del sur',980,'2023-11-14 20:09:42',NULL,NULL);

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `idpersona` int(11) NOT NULL,
  `idrol` int(11) NOT NULL,
  `nombreusuario` varchar(50) NOT NULL,
  `claveacceso` varchar(200) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL,
  `estado` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `uk_usu` (`nombreusuario`),
  KEY `fk_idpersona` (`idpersona`),
  KEY `fk_idrol` (`idrol`),
  CONSTRAINT `fk_idpersona` FOREIGN KEY (`idpersona`) REFERENCES `personas` (`idpersona`),
  CONSTRAINT `fk_idrol` FOREIGN KEY (`idrol`) REFERENCES `roles` (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `usuarios` */

insert  into `usuarios`(`idusuario`,`idpersona`,`idrol`,`nombreusuario`,`claveacceso`,`create_at`,`update_at`,`inactive_at`,`estado`) values 
(1,1,1,'75123489','$2y$10$1EwQL/puaUQHsn3KpLDQge.QJ5zTmDQ3PmQkd2du.4H91O8UsatWC','2023-11-14 20:04:56',NULL,NULL,'1'),
(2,2,3,'78674219','$2y$10$1EwQL/puaUQHsn3KpLDQge.QJ5zTmDQ3PmQkd2du.4H91O8UsatWC','2023-11-14 20:04:56',NULL,'2023-11-14 20:11:51','1');

/* Procedure structure for procedure `spu_actualizar_estado_prestamo` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_actualizar_estado_prestamo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_actualizar_estado_prestamo`(
    IN _idprestamo INT,
    in _idejemplar int,
    IN _condiciondevolucion varchar(50),
    in _observaciones varchar(50),
    in _idlibroentregado int
)
BEGIN
    DECLARE _count_ocupados INT;
    declare _idbene int;
    
    select idbeneficiario into _idbene
    from prestamos where idprestamo = _idprestamo;
    
    update ejemplares set
    ocupado = 'NO'
    where idejemplar = _idejemplar;
    
    update librosentregados set
    fechadevolucion =  now(),
    condiciondevolucion = _condiciondevolucion,
    observaciones = _observaciones
    where idlibroentregado = _idlibroentregado;
	
	
    -- Contar los idejemplar asociados al idprestamo que tienen ocupado='SI'
    SELECT COUNT(*) INTO _count_ocupados
    FROM ejemplares ej
    JOIN librosentregados le ON ej.idejemplar = le.idejemplar
    WHERE le.idprestamo = _idprestamo
        AND ej.ocupado = 'SI';

    -- Actualizar el estado del préstamo en función de la cantidad de ejemplares ocupados
    IF _count_ocupados = 0 THEN
        UPDATE prestamos SET estado = 'T' WHERE idprestamo = _idprestamo;
        update usuarios set estado = 1 where idusuario = _idbene;
    ELSE
        UPDATE prestamos SET estado = 'D' WHERE idprestamo = _idprestamo;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_cantidad_Administrador` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_cantidad_Administrador` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_cantidad_Administrador`()
BEGIN
	SELECT COUNT(idusuario) AS 'administrador'
	FROM usuarios
	WHERE idrol = 1;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_cantidad_categorias` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_cantidad_categorias` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_cantidad_categorias`()
BEGIN
	SELECT COUNT(idcategoria) AS 'categorias'
	FROM categorias;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_cantidad_devoluciones` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_cantidad_devoluciones` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_cantidad_devoluciones`()
BEGIN
	SELECT COUNT(idprestamo) AS 'devoluciones'
	FROM prestamos
	WHERE estado = 'D';
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_cantidad_estudiantes` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_cantidad_estudiantes` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_cantidad_estudiantes`()
BEGIN
	SELECT COUNT(idusuario) AS 'estudiantes'
	FROM usuarios
	WHERE idrol = 3 AND estado = 1;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_cantidad_libros` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_cantidad_libros` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_cantidad_libros`()
BEGIN
	SELECT COUNT(idlibro) AS 'libros'
	FROM libros
	WHERE estado = 1;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_cantidad_prestamos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_cantidad_prestamos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_cantidad_prestamos`()
BEGIN
	SELECT COUNT(idprestamo) AS 'prestamo'
	FROM prestamos;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_cantidad_profesor` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_cantidad_profesor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_cantidad_profesor`()
BEGIN
	SELECT COUNT(idusuario) AS 'profesor'
	FROM usuarios
	WHERE idrol = 2 AND estado = 1;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_cantidad_reservaciones` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_cantidad_reservaciones` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_cantidad_reservaciones`()
BEGIN
	SELECT COUNT(idprestamo) AS 'reservaciones'
	FROM prestamos 
	WHERE estado = 'R';
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_conseguir_libro` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_conseguir_libro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_conseguir_libro`()
BEGIN 
	SELECT idlibro, libro, subcategorias.subcategoria, categorias.categoria
	FROM libros
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria
	WHERE estado = 1;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_filtrar_ejemplares` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_filtrar_ejemplares` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_filtrar_ejemplares`(
	IN _idlibro INT
)
BEGIN
	SELECT ejemplares.idejemplar, CONCAT(libros.libro, ' ',codigo_libro) AS 'Ejemplares'
	FROM ejemplares
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	WHERE libros.idlibro = _idlibro AND ejemplares.ocupado = 'NO' AND ejemplares.estado = 1;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_filtro_student` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_filtro_student` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_filtro_student`()
BEGIN
	SELECT usuarios.idusuario, CONCAT(personas.nombres,' ', personas.apellidos) AS 'nombres', usuarios.estado
	FROM usuarios
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	INNER JOIN roles ON roles.idrol = usuarios.idrol
	WHERE usuarios.idrol IN(2,3) AND usuarios.estado = 1;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_libroentregado_AddAhora` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_libroentregado_AddAhora` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_libroentregado_AddAhora`(
	IN _idprestamo INT,
	IN _idejemplar INT,
	IN _condicionEntrega VARCHAR(40),
	IN _fechadevolución DATETIME
)
BEGIN
	DECLARE cantidad_actual INT;
	DECLARE _idlibro INT;
	DECLARE _idbene INT;
	
	IF _fechadevolución = "" THEN SET _fechadevolución = NULL; END IF;
	SELECT idlibro INTO _idlibro
	FROM ejemplares
	WHERE idejemplar = _idejemplar;	
			
	SELECT cantidad INTO cantidad_actual
	FROM libros
	WHERE idlibro = _idlibro;
	
	SELECT idbeneficiario INTO _idbene
	FROM prestamos
	WHERE idprestamo = _idprestamo;
	-- select * from prestamos
		
	    -- Verifica si hay suficientes libros disponibles para restar
    IF cantidad_actual >= 1 THEN
	START TRANSACTION;
        -- Registra el libro entregado
	INSERT INTO librosentregados (idprestamo, idejemplar, condicionentrega,fechadevolucion) VALUES
			(_idprestamo,_idejemplar, _condicionEntrega,_fechadevolución);
        
        -- SE actualiza la cantidad del libro
        UPDATE libros
        SET cantidad = cantidad_actual - 1
        WHERE idlibro = _idlibro;
        
        UPDATE prestamos SET
        estado = 'D'
        WHERE idprestamo = _idprestamo;
        
        UPDATE ejemplares SET
        ocupado = 'SI'
        WHERE idejemplar = _idejemplar;
        
        UPDATE usuarios SET
        estado = '0',
        inactive_at = NOW()
        WHERE idusuario = _idbene;
        -- select * from usuarios
        COMMIT;

        -- SELECT 'Libro entregado y cantidad actualizada correctamente.' AS mensaje;
    ELSE
        SELECT 'No hay suficientes libros disponibles para realizar la entrega.' AS mensaje;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_libroentregado_register` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_libroentregado_register` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_libroentregado_register`(
	IN _idprestamo INT,
	IN _idejemplar INT,
	IN _condicionEntrega VARCHAR(40),
	IN _fechadevolución DATETIME
)
BEGIN
	DECLARE cantidad_actual INT;
	DECLARE _idlibro INT;
	DECLARE _idbene INT;
	
	IF _fechadevolución = "" THEN SET _fechadevolución = NULL; END IF;
	SELECT idlibro INTO _idlibro
	FROM ejemplares
	WHERE idejemplar = _idejemplar;	
			
	SELECT cantidad INTO cantidad_actual
	FROM libros
	WHERE idlibro = _idlibro;
	
	SELECT idbeneficiario INTO _idbene
	FROM prestamos
	WHERE idprestamo = _idprestamo;
	-- select * from prestamos
		
	    -- Verifica si hay suficientes libros disponibles para restar
    IF cantidad_actual >= 1 THEN
	START TRANSACTION;
        -- Registra el libro entregado
	INSERT INTO librosentregados (idprestamo, idejemplar, condicionentrega,fechadevolucion) VALUES
			(_idprestamo,_idejemplar, _condicionEntrega,_fechadevolución);
        
        -- SE actualiza la cantidad del libro
        UPDATE libros
        SET cantidad = cantidad_actual - 1
        WHERE idlibro = _idlibro;
        
        UPDATE prestamos SET
        estado = 'R'
        WHERE idprestamo = _idprestamo;
        
        UPDATE ejemplares SET
        ocupado = 'SI'
        WHERE idejemplar = _idejemplar;
        
        UPDATE usuarios SET
        estado = '0',
        inactive_at = NOW()
        WHERE idusuario = _idbene;
        -- select * from usuarios
        COMMIT;

        -- SELECT 'Libro entregado y cantidad actualizada correctamente.' AS mensaje;
    ELSE
        SELECT 'No hay suficientes libros disponibles para realizar la entrega.' AS mensaje;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_devolucionpendientes` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_devolucionpendientes` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_devolucionpendientes`()
BEGIN
	SELECT idlibroentregado,prestamos.idprestamo, libros.idlibro, ejemplares.codigo_libro, libros.libro,usuarios.idusuario, CONCAT( personas.nombres, ' ', personas.apellidos) AS 'nombres', 
	libros.tipo, prestamos.fechasolicitud,prestamos.fechaentrega, DATE(fechadevolucion) AS 'fechadevolucion'
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN ejemplares ON ejemplares.idejemplar = librosentregados.idejemplar
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	INNER JOIN usuarios ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE prestamos.estado = 'D'
	ORDER BY idlibroentregado DESC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_entregaspendiente` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_entregaspendiente` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_entregaspendiente`()
BEGIN
	SELECT idlibroentregado, prestamos.idprestamo, libros.libro, ejemplares.codigo_libro, libros.idlibro, libros.imagenportada, personas.nombres, prestamos.descripcion, 
	prestamos.fechasolicitud, DATE(fechaprestamo) AS 'fechaprestamo', 
	DATE(fechadevolucion) AS 'fechadevolucion'
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN ejemplares ON ejemplares.idejemplar = librosentregados.idejemplar
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	INNER JOIN usuarios ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE prestamos.estado = 'R'
	ORDER BY idlibroentregado DESC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_registrar_prestamo_ahora` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_registrar_prestamo_ahora` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_registrar_prestamo_ahora`(
	IN _idbeneficiario INT, -- s
	IN _idbibliotecario INT, -- n 
	IN _descripcion VARCHAR(40),
	IN _enbiblioteca CHAR(2),
	IN _lugardestino VARCHAR(90)
)
BEGIN
	-- DECLARE lastinsert INT;
	IF _lugardestino = "" THEN SET _lugardestino = NULL; END IF;	
	INSERT INTO prestamos (idbeneficiario, idbibliotecario,fechaprestamo,fechaentrega,descripcion,enbiblioteca,lugardestino) VALUES
			(_idbeneficiario, _idbibliotecario,NOW(),NOW(),_descripcion,_enbiblioteca,_lugardestino);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_registrar_prestamo_reservar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_registrar_prestamo_reservar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_registrar_prestamo_reservar`(
	IN _idbeneficiario INT, -- s
	IN _idbibliotecario INT, -- n 
	IN _fechaprestamo DATETIME, -- null
	IN _descripcion VARCHAR(40),
	IN _enbiblioteca CHAR(2),
	IN _lugardestino VARCHAR(90)
)
BEGIN
	-- DECLARE lastinsert INT;
	IF _lugardestino = "" THEN SET _lugardestino = NULL; END IF;	
	INSERT INTO prestamos (idbeneficiario, idbibliotecario,fechaprestamo,descripcion,enbiblioteca,lugardestino, estado) VALUES
			(_idbeneficiario, _idbibliotecario,_fechaprestamo,_descripcion,_enbiblioteca,_lugardestino, 'E');
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_traer_prestamo` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_traer_prestamo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_traer_prestamo`(
	IN _idbeneficiario INT
)
BEGIN
	SELECT prestamos.idprestamo, prestamos.idbeneficiario
	FROM prestamos
	INNER JOIN usuarios ON usuarios.idusuario = prestamos.idbeneficiario
	WHERE prestamos.idbeneficiario = _idbeneficiario AND DATE(prestamos.fechasolicitud) = CURDATE()
	ORDER BY prestamos.idprestamo DESC LIMIT 1;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_update_pentregasp` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_update_pentregasp` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_update_pentregasp`(
	IN _idprestamo  INT
)
BEGIN 
	UPDATE prestamos SET
	fechaentrega = NOW(),
	estado =  'D'
	WHERE idprestamo = _idprestamo;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
