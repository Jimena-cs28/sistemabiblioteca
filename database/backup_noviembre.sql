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
(1,'Crary','Jonathan','','Vermont','2023-11-10 23:04:46',NULL,NULL),
(2,'Verdy','Luis','','Frances','2023-11-10 23:04:46',NULL,NULL),
(3,'Cortes','Jeremy','','Estadunidence','2023-11-10 23:04:46',NULL,NULL);

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
(1,'Obras Generales',0,'2023-11-10 19:37:30',NULL,NULL),
(2,'Filosofia y Psicologia',100,'2023-11-10 19:37:30',NULL,NULL),
(3,'Religion',200,'2023-11-10 19:37:30',NULL,NULL),
(4,'Ciencias Sociales',300,'2023-11-10 19:37:30',NULL,NULL),
(5,'Lenguas',400,'2023-11-10 19:37:30',NULL,NULL),
(6,'Ciencias Naturales y Matematicas',500,'2023-11-10 19:37:30',NULL,NULL),
(7,'Tecnología, Ciencias Aplicadas',600,'2023-11-10 19:37:30',NULL,NULL),
(8,'Las Artes, Bellas Artes y Artes Decorativas',700,'2023-11-10 19:37:30',NULL,NULL),
(9,'Literatura',800,'2023-11-10 19:37:30',NULL,NULL),
(10,'Historia y Geografía',900,'2023-11-10 19:37:30',NULL,NULL);

/*Table structure for table `detalleautores` */

DROP TABLE IF EXISTS `detalleautores`;

CREATE TABLE `detalleautores` (
  `iddetalleautor` int(11) NOT NULL AUTO_INCREMENT,
  `idlibro` int(11) NOT NULL,
  `idautor` int(11) NOT NULL,
  `creat_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `INACTIVE` datetime DEFAULT NULL,
  PRIMARY KEY (`iddetalleautor`),
  KEY `fk_idlibro` (`idlibro`),
  KEY `fk_idautor_text` (`idautor`),
  CONSTRAINT `fk_idautor_text` FOREIGN KEY (`idautor`) REFERENCES `autores` (`idautor`),
  CONSTRAINT `fk_idlibro` FOREIGN KEY (`idlibro`) REFERENCES `libros` (`idlibro`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `detalleautores` */

insert  into `detalleautores`(`iddetalleautor`,`idlibro`,`idautor`,`creat_at`,`update_at`,`INACTIVE`) values 
(3,1,2,'2023-11-10 23:04:59',NULL,NULL),
(4,2,2,'2023-11-10 23:04:59',NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `editoriales` */

insert  into `editoriales`(`ideditorial`,`nombres`,`telefono`,`website`,`email`,`paisorigen`,`create_at`,`update_at`,`inactive_at`) values 
(1,'Ariel','943883123','','jonathanc@gmail.com','EEUU','2023-11-10 19:37:28',NULL,NULL),
(2,'Paidos','913033923','','max@gmail.com','España','2023-11-10 19:37:28',NULL,NULL);

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
  UNIQUE KEY `uk_libro` (`libro`),
  KEY `fk_idsubcategoria` (`idsubcategoria`),
  KEY `fk_ideditorial` (`ideditorial`),
  CONSTRAINT `fk_ideditorial` FOREIGN KEY (`ideditorial`) REFERENCES `editoriales` (`ideditorial`),
  CONSTRAINT `fk_idsubcategoria` FOREIGN KEY (`idsubcategoria`) REFERENCES `subcategorias` (`idsubcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `libros` */

insert  into `libros`(`idlibro`,`idsubcategoria`,`ideditorial`,`libro`,`tipo`,`cantidad`,`numeropaginas`,`codigo`,`edicion`,`formato`,`anio`,`idioma`,`descripcion`,`imagenportada`,`create_at`,`update_at`,`inactive_at`,`estado`) values 
(1,1,1,'Historia del mundo contemporáneo','texto',35,132,140.053,'','','0000-00-00','castellano','','','2023-11-10 19:37:39',NULL,'2023-11-11 08:14:06','1'),
(2,3,2,'El mentor de matematicas','texto',11,102,513.000,'','','0000-00-00','castellano','','','2023-11-10 19:37:39',NULL,'2023-11-10 23:28:26','0');

/*Table structure for table `librosentregados` */

DROP TABLE IF EXISTS `librosentregados`;

CREATE TABLE `librosentregados` (
  `idlibroentregado` int(11) NOT NULL AUTO_INCREMENT,
  `idprestamo` int(11) NOT NULL,
  `idlibro` int(11) NOT NULL,
  `cantidad` smallint(6) NOT NULL,
  `condicionentrega` varchar(50) DEFAULT NULL,
  `condiciondevolucion` varchar(50) DEFAULT NULL,
  `observaciones` varchar(40) DEFAULT NULL,
  `fechadevolucion` datetime DEFAULT NULL,
  PRIMARY KEY (`idlibroentregado`),
  KEY `fk_libro_prestamo` (`idlibro`),
  KEY `fk_prestamo_libentre` (`idprestamo`),
  CONSTRAINT `fk_libro_prestamo` FOREIGN KEY (`idlibro`) REFERENCES `libros` (`idlibro`),
  CONSTRAINT `fk_prestamo_libentre` FOREIGN KEY (`idprestamo`) REFERENCES `prestamos` (`idprestamo`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `librosentregados` */

insert  into `librosentregados`(`idlibroentregado`,`idprestamo`,`idlibro`,`cantidad`,`condicionentrega`,`condiciondevolucion`,`observaciones`,`fechadevolucion`) values 
(1,3,2,1,'bien','MAL','MAL','2023-11-10 23:28:26'),
(2,4,2,1,'Nuevo',NULL,NULL,'2023-11-19 00:00:00'),
(3,4,2,1,'Nuevo','mal','mal','2023-11-11 00:17:19'),
(4,5,2,1,'bien','bien','bien','2023-11-11 01:27:06'),
(5,6,2,1,'bien',NULL,NULL,'2023-11-19 00:00:00'),
(6,7,1,1,'Nuevo',NULL,NULL,'2023-11-12 00:00:00'),
(7,22,1,1,'Nuevo','Bien','Bien','2023-11-11 08:43:06'),
(8,8,2,1,'bien',NULL,NULL,'2023-11-19 00:00:00'),
(9,23,1,1,'Nuevo',NULL,NULL,'2023-11-16 00:00:00'),
(10,9,2,1,'Nuevo',NULL,NULL,'2023-11-19 00:00:00'),
(11,25,1,1,'Nuevo',NULL,NULL,'2023-11-13 00:00:00'),
(12,10,2,1,'bien','bien','bien','2023-11-11 08:55:35'),
(13,27,1,1,'Nuevo','bien','bien','2023-11-11 08:56:23'),
(14,28,1,1,'Nuevo','bien','bien','2023-11-11 08:56:40'),
(15,29,1,1,'Nuevo','bien','bien','2023-11-11 08:56:52'),
(16,30,1,1,'Nuevo','bien','bien','2023-11-11 08:49:13');

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
  PRIMARY KEY (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `personas` */

insert  into `personas`(`idpersona`,`apellidos`,`nombres`,`nrodocumento`,`tipodocumento`,`fechanac`,`direccion`,`telefono`,`email`,`create_at`,`update_at`,`inactive_at`) values 
(1,'Berrocal paima','Luis Fernando','76543001','DNI','0000-00-00','Sunampe','964513274','','2023-11-10 19:36:46',NULL,NULL),
(2,'Cartagena Salazar','Jimena Adriana','73194180','DNI','0000-00-00','El carmen','','95107563','2023-11-10 19:36:46',NULL,NULL),
(3,'Palma Navarro','Sylvie','74150120','DNI','0000-00-00','Grocio Prado','951207403','','2023-11-10 19:36:46',NULL,NULL),
(4,'Cartagena Salas','Maira','83215278','DNI','0000-00-00','Chincha','956432176','','2023-11-10 19:36:46',NULL,NULL),
(5,'Lopez Salas','Sofia','73129045','DNI','0000-00-00','Chincha','956432176','','2023-11-10 19:36:46',NULL,NULL),
(6,'Duren Buenamarca','Layla','78674219','DNI','0000-00-00','Chincha','956432176','','2023-11-10 19:36:46',NULL,NULL),
(7,'Salazar Rojas','Luisa','76401538','DNI','0000-00-00','El carmen','912458130','','2023-11-10 19:36:46',NULL,NULL),
(8,'Fajardo Cordova','Nayla','74102589','DNI','0000-00-00','Chincha Alta','987400335','','2023-11-10 19:36:46',NULL,NULL),
(9,'Urbano Florez','Ariana','76410258','DNI','0000-00-00','Pueblo nuevo','917845230','','2023-11-10 19:36:46',NULL,NULL),
(10,'Francia Minaya','Jhon ','76846846','DNI','0000-00-00','Chincha','968545874','','2023-11-11 00:23:53',NULL,NULL),
(11,'Belleza Quispe','Kiara','72568787','DNI','0000-00-00','Sunampe','998476349','','2023-11-11 00:24:55',NULL,NULL);

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
  CONSTRAINT `ck_estado_ore` CHECK (`estado` in ('E','S','R','D','T','N')),
  CONSTRAINT `ck_fechas` CHECK (`fechaprestamo` >= `fechasolicitud`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `prestamos` */

insert  into `prestamos`(`idprestamo`,`idbeneficiario`,`idbibliotecario`,`fechasolicitud`,`fechaprestamo`,`fecharespuesta`,`fechaentrega`,`descripcion`,`enbiblioteca`,`lugardestino`,`estado`,`activo`) values 
(3,4,3,'2023-11-10 19:53:11','2023-11-11 00:00:00',NULL,'2023-11-10 23:09:11','3M','SI',NULL,'T','1'),
(4,4,3,'2023-11-10 19:54:35','2023-11-12 00:00:00',NULL,NULL,'3L','SI',NULL,'T','1'),
(5,4,3,'2023-11-10 20:02:35','2023-11-13 00:00:00',NULL,NULL,'3M','SI',NULL,'T','1'),
(6,4,3,'2023-11-10 20:03:56','2023-11-11 00:00:00',NULL,'2023-11-11 00:22:39','3M','SI',NULL,'T','1'),
(7,4,3,'2023-11-10 20:06:06','2023-11-13 00:00:00',NULL,NULL,'','SI',NULL,'N','1'),
(8,4,3,'2023-11-10 20:07:06','2023-11-23 00:00:00',NULL,NULL,'3M','SI',NULL,'T','1'),
(9,4,3,'2023-11-10 20:08:00','2023-11-23 00:00:00',NULL,NULL,'3M','SI',NULL,'T','1'),
(10,4,3,'2023-11-10 20:09:42','2023-11-12 00:00:00',NULL,NULL,'4A','SI',NULL,'T','1'),
(11,4,3,'2023-11-10 20:10:37','2023-11-18 00:00:00',NULL,NULL,'3M','SI',NULL,'E','1'),
(12,4,3,'2023-11-10 20:13:51','2023-11-18 00:00:00',NULL,NULL,'3M','SI',NULL,'E','1'),
(15,3,4,'2023-11-10 23:44:17','2023-11-10 23:44:17',NULL,'2023-11-10 23:44:17','3B','SI',NULL,'E','1'),
(16,4,3,'2023-11-11 00:00:33','2023-11-11 00:00:33',NULL,'2023-11-11 00:00:33','5H','SI',NULL,'E','1'),
(17,4,3,'2023-11-11 00:03:48','2023-11-12 00:00:00',NULL,NULL,'3M','SI',NULL,'E','1'),
(18,6,3,'2023-11-11 06:47:53','2023-11-13 00:00:00',NULL,NULL,'3M','SI',NULL,'E','1'),
(19,4,3,'2023-11-11 06:51:03','2023-11-14 00:00:00',NULL,NULL,'3M','SI',NULL,'E','1'),
(20,4,3,'2023-11-11 06:53:02','2023-11-24 00:00:00',NULL,NULL,'3M','SI',NULL,'E','1'),
(21,4,3,'2023-11-11 06:53:49','2023-11-23 00:00:00',NULL,NULL,'3M','SI',NULL,'E','1'),
(22,6,3,'2023-11-11 07:10:17','2023-11-12 00:00:00',NULL,'2023-11-11 07:54:39','3M','SI',NULL,'T','1'),
(23,6,3,'2023-11-11 07:24:00','2023-11-12 00:00:00',NULL,'2023-11-11 07:54:25','3M','SI',NULL,'T','1'),
(24,6,3,'2023-11-11 07:27:30','2023-11-12 00:00:00',NULL,NULL,'3M','SI',NULL,'E','1'),
(25,6,3,'2023-11-11 07:27:38','2023-11-12 00:00:00',NULL,'2023-11-11 07:53:56','3M','SI',NULL,'T','1'),
(26,6,3,'2023-11-11 07:34:33','2023-11-12 00:00:00',NULL,NULL,'1A','SI',NULL,'E','1'),
(27,4,3,'2023-11-11 07:37:07','2023-11-17 00:00:00',NULL,'2023-11-11 07:53:56','3M','SI',NULL,'T','1'),
(28,6,3,'2023-11-11 07:45:05','2023-11-11 07:45:05',NULL,'2023-11-11 07:45:05','3M','SI',NULL,'T','1'),
(29,6,3,'2023-11-11 07:46:14','2023-11-23 00:00:00',NULL,'2023-11-11 07:53:55','3M','SI',NULL,'T','1'),
(30,5,3,'2023-11-11 08:31:53','2023-11-14 00:00:00',NULL,'2023-11-11 08:45:05','3M','SI',NULL,'D','1');

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
(1,'Administrador',5,'2023-11-10 19:36:57',NULL,NULL),
(2,'Profesor',40,'2023-11-10 19:36:57',NULL,NULL),
(3,'Estudiante',3,'2023-11-10 19:36:57',NULL,NULL);

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
(1,2,'Escuelas Filosóficas Específicas',140,'2023-11-10 19:37:32',NULL,NULL),
(2,4,'Educacion',370,'2023-11-10 19:37:32',NULL,NULL),
(3,6,'Matemáticas',510,'2023-11-10 19:37:32',NULL,NULL),
(4,6,'Astronomía y ciencias afines',520,'2023-11-10 19:37:32',NULL,NULL),
(5,6,'Física',530,'2023-11-10 19:37:32',NULL,NULL),
(6,6,'Ciencias de la vida Biología',570,'2023-11-10 19:37:32',NULL,NULL),
(7,9,'Literatura estadounidense',810,'2023-11-10 19:37:32',NULL,NULL),
(8,9,'Literatura inglesa e inglesa antigua(Anglosajona)',820,'2023-11-10 19:37:32',NULL,NULL),
(9,9,'Literatura de lenguas germánicas literatura aleman',830,'2023-11-10 19:37:32',NULL,NULL),
(10,9,'Literatura Francesa y literaturas de las lenguas r',840,'2023-11-10 19:37:32',NULL,NULL),
(11,9,'Literatura española y portuguesa',860,'2023-11-10 19:37:32',NULL,NULL),
(12,10,'Historia Universal',909,'2023-11-10 19:37:32',NULL,NULL),
(13,10,'Geografía y viajes',910,'2023-11-10 19:37:32',NULL,NULL),
(14,10,'Historia de américa del sur',980,'2023-11-10 19:37:32',NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `usuarios` */

insert  into `usuarios`(`idusuario`,`idpersona`,`idrol`,`nombreusuario`,`claveacceso`,`create_at`,`update_at`,`inactive_at`,`estado`) values 
(3,1,1,'75123489','$2y$10$1EwQL/puaUQHsn3KpLDQge.QJ5zTmDQ3PmQkd2du.4H91O8UsatWC','2023-11-10 19:37:00',NULL,NULL,'1'),
(4,2,3,'78674219','$2y$10$1EwQL/puaUQHsn3KpLDQge.QJ5zTmDQ3PmQkd2du.4H91O8UsatWC','2023-11-10 19:37:00',NULL,'2023-11-11 08:14:06','1'),
(5,10,2,'Jhon12','$2y$10$gFl6xNnn8N7go9Jntlwfm.tcSxYk1sEkjPKW8SI7..vdBZz0KOare','2023-11-11 00:23:53',NULL,NULL,'1'),
(6,11,3,'Kiarabq','$2y$10$9PrrxRLPp4sCS1aD/XQKreeIEglqe0unJzXxNDDUpZKzBZCXP/HGq','2023-11-11 00:24:55',NULL,NULL,'1');

/* Procedure structure for procedure `GRAFICO_INDEX` */

/*!50003 DROP PROCEDURE IF EXISTS  `GRAFICO_INDEX` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GRAFICO_INDEX`()
BEGIN
	SELECT  COUNT(librosentregados.idlibro) AS 'totales', libros.libro
	FROM librosentregados
	INNER JOIN libros ON libros.idlibro = librosentregados.idlibro
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	WHERE prestamos.estado = 'T'
	GROUP BY librosentregados.idlibro DESC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_abilitar_libro` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_abilitar_libro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_abilitar_libro`(
	IN _idlibro	INT
)
BEGIN
	UPDATE libros SET
	estado = '1'
	WHERE idlibro = _idlibro;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_abilitar_usuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_abilitar_usuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_abilitar_usuario`(
	IN _idusuario	INT
)
BEGIN
	UPDATE usuarios SET
	estado = '1'
	WHERE idusuario = _idusuario;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_aceptar_solicitud` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_aceptar_solicitud` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_aceptar_solicitud`(
	_idprestamo INT
)
BEGIN
	
	UPDATE prestamos SET
	fecharespuesta = NOW(),
	estado = 'R'
	WHERE idprestamo = _idprestamo;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_buscar_libro` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_buscar_libro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_buscar_libro`(
	IN _idlibro INT
)
BEGIN
	SELECT libros.idlibro, libros.libro,subcategorias.subcategoria, categorias.categoria, libros.tipo, libros.numeropaginas,libros.codigo,
	autores.autor AS "autor", editoriales.nombres AS "editorial", libros.descripcion, libros.cantidad
	FROM libros
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN detalleautores ON detalleautores.idlibro = libros.idlibro
	INNER JOIN autores ON autores.idautor = detalleautores.idautor
	INNER JOIN  categorias ON categorias.idcategoria = subcategorias.idcategoria
	INNER JOIN editoriales ON editoriales.ideditorial = libros.ideditorial 
	WHERE libros.idlibro = _idlibro;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_cancelar_reserva` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_cancelar_reserva` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_cancelar_reserva`(
	in _idprestamo int,
	in _idlibro int, -- estado N
	in _cantidad int
)
BEGIN
	 DECLARE cantidad_actual INT;
	 
	 UPDATE prestamos SET
	 estado = 'N'
	 WHERE idprestamo = _idprestamo;
	 
	-- Obtiene la cantidad actual del libro
	SELECT cantidad INTO cantidad_actual
	FROM libros
	WHERE idlibro = _idlibro;
	
        -- SE actualiza la cantidad del libro
        UPDATE libros
        SET cantidad = cantidad_actual + _cantidad
        WHERE idlibro = _idlibro;
end */$$
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

/* Procedure structure for procedure `spu_editar_Ependientes` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_editar_Ependientes` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_editar_Ependientes`(
	IN _idlibroentregado INT,
	IN _idprestamo INT,
	IN _fechadevolucion DATETIME,
	IN _fechaprestamo DATETIME
)
BEGIN
	UPDATE librosentregados SET
	fechadevolucion = _fechadevolucion
	WHERE idlibroentregado = _idlibroentregado;
	
	UPDATE prestamos SET
	fechaprestamo = _fechaprestamo,
	estado = 'R'
	WHERE idprestamo = _idprestamo;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_filtro_categoria` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_filtro_categoria` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_filtro_categoria`(IN _idcategoria INT)
BEGIN 
	SELECT *
	FROM subcategorias
	WHERE idcategoria =  _idcategoria;
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
	WHERE usuarios.idrol in(2,3) AND usuarios.estado = 1;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_grafico_rol` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_grafico_rol` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_grafico_rol`( IN _idrol INT)
BEGIN
	SELECT  COUNT(librosentregados.idlibro) AS 'totales', libros.libro
	FROM librosentregados
	INNER JOIN libros ON libros.idlibro = librosentregados.idlibro
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN usuarios ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN roles ON roles.idrol = usuarios.idrol
	WHERE usuarios.idrol = _idrol AND prestamos.estado = 'T'
	GROUP BY librosentregados.idlibro DESC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_historial` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_historial` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_historial`(
	IN _idusuario INT
)
BEGIN
	SELECT idlibroentregado,  prestamos.idprestamo, libros.libro AS 'libro', prestamos.descripcion,fechasolicitud, 
	DATE(fechaprestamo) AS 'fechaprestamo', DATE(fechadevolucion) AS 'fechadevolucion', prestamos.estado
	FROM librosentregados
	INNER JOIN prestamos ON prestamos. idprestamo = librosentregados.idprestamo
	INNER JOIN libros ON libros.idlibro = librosentregados.idlibro
	INNER JOIN usuarios  ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE prestamos.idbeneficiario = _idusuario;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_inabilitar_libro` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_inabilitar_libro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_inabilitar_libro`(
	IN _idlibro	INT
)
BEGIN
	UPDATE libros SET
	estado = '0',
	inactive_at = NOW()
	WHERE idlibro = _idlibro;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_inabilitar_usuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_inabilitar_usuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_inabilitar_usuario`(
	IN _idusuario	INT
)
BEGIN
	UPDATE usuarios SET
	estado = '0',
	inactive_at = NOW()
	WHERE idusuario = _idusuario;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_inactivo_estudiantes` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_inactivo_estudiantes` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_inactivo_estudiantes`()
BEGIN
	SELECT idusuario, roles.nombrerol, CONCAT(personas.nombres, ' ', personas.apellidos) AS 'Nombres', personas.nrodocumento, personas.telefono, personas.email, personas.direccion, nombreusuario,usuarios.inactive_at
	FROM usuarios
	INNER JOIN roles ON roles.idrol = usuarios.idrol
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE usuarios.idrol = 3 AND estado = 0;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_inactivo_libros` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_inactivo_libros` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_inactivo_libros`()
BEGIN
	SELECT iddetalleautor, libros.idlibro, subcategorias.subcategoria, categorias.categoria, libros.libro, libros.tipo, libros.cantidad, libros.numeropaginas,
	libros.codigo, libros.edicion, libros.formato, libros.anio, libros.idioma, libros.descripcion, CONCAT(autores.autor,' ',autores.apellidos) AS 'autor', libros.inactive_at
	FROM detalleautores
	INNER JOIN libros ON libros.idlibro = detalleautores.idlibro
	INNER JOIN autores ON autores.idautor = detalleautores.idautor
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria
	WHERE estado = 0
	ORDER BY iddetalleautor DESC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_inactivo_profesores` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_inactivo_profesores` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_inactivo_profesores`()
BEGIN
	SELECT idusuario, roles.nombrerol, personas.nombres, personas.apellidos, personas.nrodocumento, personas.telefono, personas.email, personas.direccion, nombreusuario
	FROM usuarios
	INNER JOIN roles ON roles.idrol = usuarios.idrol
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE usuarios.idrol = 2 AND estado = 0;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_libro` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_libro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_libro`(IN _idprestamo INT)
BEGIN
	SELECT idlibroentregado, subcategorias.subcategoria, libros.libro, librosentregados.cantidad, 
	librosentregados.fechadevolucion, librosentregados.condicionentrega
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idlibroentregado
	INNER JOIN libros ON libros.idlibro = librosentregados.idlibro
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	WHERE librosentregados.idprestamo = _idprestamo;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_libroentregado_AddAhora` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_libroentregado_AddAhora` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_libroentregado_AddAhora`(
	IN _idprestamo INT,
	IN _idlibro INT,
	IN _cantidad SMALLINT,
	IN _condicionEntrega VARCHAR(40),
	IN _fechadevolución DATETIME
)
BEGIN
	DECLARE cantidad_actual INT;
	IF _fechadevolución = "" THEN SET _fechadevolución = NULL; END IF;
			
	SELECT cantidad INTO cantidad_actual
	FROM libros
	WHERE idlibro = _idlibro;	
	    -- Verifica si hay suficientes libros disponibles para restar
    IF cantidad_actual >= _cantidad THEN
        -- Registra el libro entregado
	INSERT INTO librosentregados (idprestamo, idlibro, cantidad, condicionentrega,fechadevolucion) VALUES
			(_idprestamo,_idlibro,_cantidad, _condicionEntrega,_fechadevolución);
        
        -- SE actualiza la cantidad del libro
        UPDATE libros
        SET cantidad = cantidad_actual - _cantidad
        WHERE idlibro = _idlibro;
        
        UPDATE prestamos SET
        estado = 'D'
        WHERE idprestamo = _idprestamo;

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
	IN _idlibro INT,
	IN _cantidad SMALLINT,
	IN _condicionEntrega VARCHAR(40),
	IN _fechadevolución DATETIME
)
BEGIN
	DECLARE cantidad_actual INT;
	IF _fechadevolución = "" THEN SET _fechadevolución = NULL; END IF;
			
	SELECT cantidad INTO cantidad_actual
	FROM libros
	WHERE idlibro = _idlibro;	
	    -- Verifica si hay suficientes libros disponibles para restar
    IF cantidad_actual >= _cantidad THEN
        -- Registra el libro entregado
	INSERT INTO librosentregados (idprestamo, idlibro, cantidad, condicionentrega,fechadevolucion) VALUES
			(_idprestamo,_idlibro,_cantidad, _condicionEntrega,_fechadevolución);
        
        -- SE actualiza la cantidad del libro
        UPDATE libros
        SET cantidad = cantidad_actual - _cantidad
        WHERE idlibro = _idlibro;
        
        UPDATE prestamos SET
        estado = 'R'
        WHERE idprestamo = _idprestamo;

        -- SELECT 'Libro entregado y cantidad actualizada correctamente.' AS mensaje;
    ELSE
        SELECT 'No hay suficientes libros disponibles para realizar la entrega.' AS mensaje;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listado_libros` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listado_libros` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listado_libros`()
BEGIN
	SELECT iddetalleautor, libros.idlibro, subcategorias.subcategoria, categorias.categoria, libros.libro, libros.tipo, libros.cantidad, libros.numeropaginas,
	libros.codigo, libros.edicion, libros.formato, libros.anio, libros.idioma, libros.descripcion, CONCAT(autores.autor,' ',autores.apellidos) AS 'autor'
	FROM detalleautores
	INNER JOIN libros ON libros.idlibro = detalleautores.idlibro
	INNER JOIN autores ON autores.idautor = detalleautores.idautor
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria
	WHERE estado = 1
	ORDER BY iddetalleautor DESC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_devolucionpendientes` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_devolucionpendientes` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_devolucionpendientes`()
BEGIN
	SELECT idlibroentregado,prestamos.idprestamo, libros.idlibro, libros.libro, librosentregados.cantidad, usuarios.idusuario, CONCAT( personas.nombres, ' ', personas.apellidos) AS 'nombres', 
	libros.tipo, prestamos.fechasolicitud,prestamos.fechaentrega, DATE(fechadevolucion) AS 'fechadevolucion'
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN libros ON libros.idlibro = librosentregados.idlibro
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
	SELECT idlibroentregado, prestamos.idprestamo, libros.libro, libros.idlibro, libros.imagenportada, librosentregados.cantidad, personas.nombres, prestamos.descripcion, prestamos.fechasolicitud, DATE(fechaprestamo) AS 'fechaprestamo', 
	DATE(fechadevolucion) AS 'fechadevolucion'
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN libros ON libros.idlibro = librosentregados.idlibro
	INNER JOIN usuarios ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE prestamos.estado = 'R'
	ORDER BY idlibroentregado DESC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_estudiantes` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_estudiantes` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_estudiantes`()
BEGIN
	SELECT idusuario, roles.nombrerol, personas.nombres, personas.apellidos, personas.nrodocumento, personas.telefono, personas.email, personas.direccion, nombreusuario
	FROM usuarios
	INNER JOIN roles ON roles.idrol = usuarios.idrol
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE usuarios.idrol = 3 AND estado = 1;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_fichaprestamo` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_fichaprestamo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_fichaprestamo`(
	IN _idlibrosentregados INT
)
BEGIN
	SELECT librosentregados.idlibroentregado, libros.imagenportada, roles.nombrerol, CONCAT(personas.nombres, ' ',personas.apellidos) AS 'nombres', 
	prestamos.descripcion,librosentregados.condicionentrega,librosentregados.condiciondevolucion, librosentregados.observaciones, categorias.categoria, 
	subcategorias.subcategoria, libros.libro, prestamos.fechasolicitud, prestamos.fechaentrega, prestamos.fechaprestamo, fechadevolucion,
	prestamos.fecharespuesta
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN libros ON libros.idlibro = librosentregados.idlibro
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria
	INNER JOIN usuarios usu1 ON usu1.idusuario = prestamos.idbeneficiario
	INNER JOIN roles ON roles.idrol = usu1.idrol
	INNER JOIN personas ON personas.idpersona = usu1.idpersona
	WHERE idlibroentregado = _idlibrosentregados;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_libro` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_libro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_libro`(
	IN _idsubcategoria INT
)
BEGIN
	SELECT idlibro, libros.libro,subcategorias.subcategoria, categorias.categoria, libros.tipo, libros.numeropaginas,libros.codigo
	FROM libros
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN  categorias ON categorias.idcategoria = subcategorias.idcategoria
	WHERE libros.idsubcategoria = _idsubcategoria;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_libro_user` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_libro_user` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_libro_user`(
	IN _idsubcategoria INT,
	IN _idcategoria INT,
	IN _nombre VARCHAR(70)
)
BEGIN
	SELECT libros.idlibro,libros.imagenportada,libros.libro,subcategorias.subcategoria, categorias.categoria, libros.tipo, libros.numeropaginas,libros.codigo,
	autores.autor AS "autor", editoriales.nombres AS "editorial"
	FROM libros
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN detalleautores ON detalleautores.idlibro = libros.idlibro
	INNER JOIN autores ON autores.idautor = detalleautores.idautor
	INNER JOIN  categorias ON categorias.idcategoria = subcategorias.idcategoria
	INNER JOIN editoriales ON editoriales.ideditorial = libros.ideditorial 
	WHERE (_idsubcategoria ="" OR libros.idsubcategoria = _idsubcategoria) 
	AND (_idcategoria ="" OR categorias.idcategoria = _idcategoria)
	AND (_nombre ="" OR libros.libro LIKE CONCAT("%", _nombre, "%"));
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_profesor` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_profesor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_profesor`()
BEGIN
	SELECT idusuario, roles.nombrerol, personas.nombres, personas.apellidos, personas.nrodocumento, personas.telefono, personas.email, personas.direccion, nombreusuario
	FROM usuarios
	INNER JOIN roles ON roles.idrol = usuarios.idrol
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE usuarios.idrol = 2 AND estado = 1;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_subcategoria` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_subcategoria` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_subcategoria`( IN _idcat INT)
BEGIN 
SELECT * FROM subcategorias 
WHERE idcategoria = _idcat;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_subcategorias` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_subcategorias` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_subcategorias`()
BEGIN
	SELECT idsubcategoria, categorias.categoria, subcategorias.subcategoria, subcategorias.codigo
	FROM subcategorias
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_subcategoria_user` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_subcategoria_user` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_subcategoria_user`( IN _idcat INT)
BEGIN 
SELECT * FROM subcategorias 
WHERE idcategoria = _idcat;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_todoprestamos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_todoprestamos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_todoprestamos`()
BEGIN
	SELECT librosentregados.idlibroentregado, libros.libro, libros.tipo, prestamos.`fechasolicitud`, 
	prestamos.fechaentrega, librosentregados.fechadevolucion, personas.nombres
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN libros ON libros.idlibro = librosentregados.idlibro
	INNER JOIN usuarios usu2 ON usu2.idusuario = prestamos.idbeneficiario
	INNER JOIN usuarios usu1 ON usu1.idusuario = prestamos.`idbibliotecario`
	INNER JOIN personas ON personas.`idpersona` = usu2.`idpersona`
	WHERE prestamos.estado = 'T'
	ORDER BY idlibroentregado ASC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_list_libro` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_list_libro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_libro`(	
)
BEGIN
	SELECT libros.idlibro, libros.libro, libros.imagenportada, subcategorias.subcategoria, categorias.categoria, libros.tipo, libros.numeropaginas,libros.codigo,
	autores.autor AS "autor", editoriales.nombres AS "editorial"
	FROM libros
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN detalleautores ON detalleautores.idlibro = libros.idlibro
	INNER JOIN autores ON autores.idautor = detalleautores.idautor
	INNER JOIN  categorias ON categorias.idcategoria = subcategorias.idcategoria
	INNER JOIN editoriales ON editoriales.ideditorial = libros.ideditorial; 
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_login` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_login` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_login`( 
	IN _nombreusuarios VARCHAR(30)
)
BEGIN
SELECT usuarios.idusuario, personas.nombres, personas.apellidos, usuarios.nombreusuario, roles.nombrerol,
	usuarios.claveacceso
	FROM usuarios
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	INNER JOIN roles ON roles.idrol = usuarios.idrol
	WHERE nombreusuario = _nombreusuarios;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_obtener_detalleautores` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_obtener_detalleautores` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_obtener_detalleautores`(
	IN _iddetalleautor INT
)
BEGIN
	SELECT detalleautores.iddetalleautor, categorias.categoria, subcategorias.subcategoria, CONCAT(editoriales.nombres,' ', editoriales.paisorigen) AS 'Editorial',
	libros.libro, libros.cantidad, libros.numeropaginas, libros.codigo, libros.formato,
	libros.descripcion, libros.idioma, libros.anio, libros.tipo, libros.imagenportada, libros.edicion, CONCAT(autores.autor,' ',autores.apellidos) AS 'Autor'
	FROM detalleautores
	INNER JOIN libros ON libros.idlibro = detalleautores.idlibro
	INNER JOIN autores ON autores.idautor = detalleautores.idautor 
	INNER JOIN editoriales ON editoriales.ideditorial = libros.ideditorial
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria
	WHERE detalleautores.iddetalleautor = _iddetalleautor;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_obtener_libroentregado` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_obtener_libroentregado` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_obtener_libroentregado`(
	IN _idlibroentregado INT
)
BEGIN
	SELECT librosentregados.idlibroentregado, personas.nombres, personas.apellidos, librosentregados.cantidad, prestamos.descripcion,
	libros.libro, prestamos.fechasolicitud, DATE(fechaprestamo) AS 'fechaprestamo', DATE(fechadevolucion) AS 'fechadevolucion'
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN libros ON libros.idlibro = librosentregados.idlibro
	INNER JOIN usuarios usu1 ON usu1.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usu1.idpersona
	WHERE prestamos.estado = 'R' AND idlibroentregado = _idlibroentregado;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_obtener_prestamo` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_obtener_prestamo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_obtener_prestamo`(
	IN _idprestamo INT
)
BEGIN 
	SELECT * FROM prestamos WHERE idprestamo = _idprestamo;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_prestamo_usuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_prestamo_usuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_prestamo_usuario`(
	IN _idlibro INT,
	IN _idbeneficiario INT,
	IN _cantidad INT,
	IN _descripcion VARCHAR(20),
	IN _enbiblioteca CHAR(2),
	IN _lugardestino VARCHAR(100),
	IN _fechaprestamo DATETIME,
	IN _fechadevolución DATETIME
)
BEGIN
	DECLARE cantidad_actual INT;
	-- DECLARE lastinsert INT;	
	INSERT INTO prestamos(idbeneficiario, fechaprestamo, descripcion, enbiblioteca, lugardestino, estado) 
	VALUES (_idbeneficiario, _fechaprestamo, _descripcion, _enbiblioteca, _lugardestino, 'S');
	
	SET @idprestamo = LAST_INSERT_ID();

    -- Obtiene la cantidad actual del libro
    SELECT cantidad INTO cantidad_actual
    FROM libros
    
    WHERE idlibro = _idlibro;

    -- Verifica si hay suficientes libros disponibles para restar
    IF cantidad_actual >= _cantidad THEN
        -- Registra el libro entregado
        INSERT INTO librosentregados (idprestamo, idlibro, cantidad, fechadevolucion)
	VALUES (@idprestamo, _idlibro, _cantidad, _fechadevolucion);
        
        -- SE actualiza la cantidad del libro
        UPDATE libros
        SET cantidad = cantidad_actual - _cantidad
        WHERE idlibro = _idlibro;

        -- SELECT 'Libro entregado y cantidad actualizada correctamente.' AS mensaje;
    ELSE
        SELECT 'No hay suficientes libros disponibles para realizar la entrega.' AS mensaje;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_registrar_estudiante` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_registrar_estudiante` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_registrar_estudiante`(
    IN _apellidos VARCHAR(50),
    IN _nombres VARCHAR(30),
    IN _nrodocumento CHAR(8),
    IN _tipodocumento VARCHAR(50),
    IN _fechanac DATE,
    IN _direccion VARCHAR(100),
    IN _telefono CHAR(9),
    IN _email VARCHAR(100),
    IN _nombreusuario VARCHAR(50),
    IN _claveacceso VARCHAR(200)
)
BEGIN
    -- Insertar el registro en la tabla "personas"
    INSERT INTO personas (apellidos, nombres, nrodocumento, tipodocumento, fechanac, direccion, telefono, email)
    VALUES (_apellidos, _nombres, _nrodocumento, _tipodocumento, _fechanac, _direccion, _telefono, _email);

    -- Obtiene el ID de persona recién insertada
    SET @idpersona = LAST_INSERT_ID();

    -- Insertar el registro en la tabla "usuarios" con el rol de Estudiante (idrol = 3)
    INSERT INTO usuarios (idpersona, idrol, nombreusuario, claveacceso)
    VALUES (@idpersona, 3, _nombreusuario, _claveacceso);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_registrar_libro` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_registrar_libro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_registrar_libro`(
    IN _idsubcategoria INT,
    IN _ideditorial INT,
    IN _libro VARCHAR(70),
    IN _tipo VARCHAR(50),
    IN _cantidad SMALLINT,
    IN _numeropaginas VARCHAR(100),
    IN _codigo DECIMAL(6,3),
    IN _edicion VARCHAR(50),
    IN _formato VARCHAR(50),
    IN _anio DATE,
    IN _idioma VARCHAR(30),
    IN _descripcion TEXT,
    IN _imagenportada VARCHAR(200),
    IN _idautor  INT
)
BEGIN
    INSERT INTO libros (idsubcategoria, ideditorial, libro, tipo, cantidad, numeropaginas, codigo, edicion,formato,anio,idioma,descripcion,imagenportada)
	VALUES (_idsubcategoria, _ideditorial, _libro, _tipo, _cantidad, _numeropaginas, _codigo, _edicion,_formato,_anio,_idioma,_descripcion,_imagenportada);
	
     SET @idlibro = LAST_INSERT_ID();
     
     INSERT INTO detalleautores(idlibro,idautor)VALUES
				(@idlibro, _idautor);
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
			(_idbeneficiario, _idbibliotecario,NOW(),now(),_descripcion,_enbiblioteca,_lugardestino);
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

/* Procedure structure for procedure `spu_registrar_profesor` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_registrar_profesor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_registrar_profesor`(
    IN _apellidos VARCHAR(50),
    IN _nombres VARCHAR(30),
    IN _nrodocumento CHAR(8),
    IN _tipodocumento VARCHAR(50),
    IN _fechanac DATE,
    IN _direccion VARCHAR(100),
    IN _telefono CHAR(9),
    IN _email VARCHAR(100),
    IN _nombreusuario VARCHAR(50),
    IN _claveacceso VARCHAR(200)
)
BEGIN
    -- Inserta el registro en la tabla "personas"
    INSERT INTO personas (apellidos, nombres, nrodocumento, tipodocumento, fechanac, direccion, telefono, email)
    VALUES (_apellidos, _nombres, _nrodocumento, _tipodocumento, _fechanac, _direccion, _telefono, _email);

    -- Obtiene el ID de persona recién insertada
    SET @idpersona = LAST_INSERT_ID();

    -- Inserta el registro en la tabla "usuarios" con el rol de Profesor (idrol = 2)
    INSERT INTO usuarios (idpersona, idrol, nombreusuario, claveacceso)
    VALUES (@idpersona, 2, _nombreusuario, _claveacceso);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_registrar_subcategory` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_registrar_subcategory` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_registrar_subcategory`(
	IN _idcategoria INT,
	IN _subcategoria VARCHAR(50),
	IN _codigo 	SMALLINT
)
BEGIN 
	INSERT INTO subcategorias (idcategoria, subcategoria, codigo) VALUES
				(_idcategoria, _subcategoria, _codigo );
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_reporte_descripcion` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_reporte_descripcion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_reporte_descripcion`(
	IN _descripcion VARCHAR(10)
)
BEGIN
	SELECT idlibroentregado, categorias.categoria, subcategorias.subcategoria, libros.libro, librosentregados.cantidad, 
	CONCAT(personas.nombres, ' ' ,personas.apellidos) AS 'nombres',	prestamos.descripcion
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN libros ON libros.idlibro = librosentregados.idlibro
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria
	INNER JOIN usuarios ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE prestamos.estado = 'T' AND prestamos.descripcion = _descripcion
	GROUP BY personas.nombres;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_select_descripcion` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_select_descripcion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_select_descripcion`()
BEGIN
	SELECT prestamos.descripcion
	FROM librosentregados 
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	WHERE prestamos.estado = 'T'
	GROUP BY prestamos.descripcion
	ORDER BY prestamos.descripcion;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_solicitud_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_solicitud_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_solicitud_listar`()
BEGIN
	SELECT idlibroentregado,  prestamos.idprestamo, CONCAT(personas.nombres, '' , personas.apellidos) AS 'Nombres', libros.libro AS 'libro', prestamos.descripcion,fechasolicitud, 
	DATE(fechaprestamo) AS 'fechaprestamo', DATE(fechadevolucion) AS 'fechadevolucion'
	FROM librosentregados
	INNER JOIN prestamos ON prestamos. idprestamo = librosentregados.idprestamo
	INNER JOIN libros ON libros.idlibro = librosentregados.idlibro
	INNER JOIN usuarios  ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE prestamos.estado = 'S';
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_traer_datosD` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_traer_datosD` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_traer_datosD`(
	IN _idlibroentregado INT
)
BEGIN
	SELECT * FROM librosentregados WHERE idlibroentregado = _idlibroentregado;
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

/* Procedure structure for procedure `spu_update_devoluciones` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_update_devoluciones` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_update_devoluciones`(
	IN _idlibroentregado INT,
	IN _idprestamo INT,
	IN _condiciondevolucion VARCHAR(50),
	IN _observaciones   VARCHAR(50),
	IN _idlibro INT,
	IN _cantidad SMALLINT
)
BEGIN
	 DECLARE cantidad_actual INT;
	 
	 UPDATE librosentregados SET
	 condiciondevolucion = _condiciondevolucion,
	 observaciones = _observaciones,
	 fechadevolucion = NOW()
	 WHERE idlibroentregado = _idlibroentregado;
	 
	 UPDATE prestamos SET
	 estado = 'T'
	 WHERE idprestamo = _idprestamo;
	 
	-- Obtiene la cantidad actual del libro
	SELECT cantidad INTO cantidad_actual
	FROM libros
	WHERE idlibro = _idlibro;
	
        -- SE actualiza la cantidad del libro
        UPDATE libros
        SET cantidad = cantidad_actual + _cantidad
        WHERE idlibro = _idlibro;
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

/* Procedure structure for procedure `spu_validar_libroprestado` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_validar_libroprestado` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_validar_libroprestado`(
	IN _idusuario INT
)
BEGIN
	SELECT COUNT(*) AS 'cantidad' FROM prestamos WHERE idbeneficiario = _idusuario AND estado IN ('S') ;

END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
