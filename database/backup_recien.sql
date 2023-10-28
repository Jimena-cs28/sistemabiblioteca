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
  `nombres` varchar(30) NOT NULL,
  `pseudonimio` varchar(50) DEFAULT NULL,
  `nacionalidad` varchar(50) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL,
  PRIMARY KEY (`idautor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `autores` */

insert  into `autores`(`idautor`,`apellidos`,`nombres`,`pseudonimio`,`nacionalidad`,`create_at`,`update_at`,`inactive_at`) values 
(1,'Crary','Jonathan','','Vermont','2023-10-22 18:44:06',NULL,NULL),
(2,'Verdy','Luis','','Frances','2023-10-22 18:44:06',NULL,NULL),
(3,'Cortes','Jeremy','','Estadunidence','2023-10-22 18:44:06',NULL,NULL);

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
(1,'Obras Generales',0,'2023-10-22 18:44:01',NULL,NULL),
(2,'Filosofia y Psicologia',100,'2023-10-22 18:44:01',NULL,NULL),
(3,'Religion',200,'2023-10-22 18:44:01',NULL,NULL),
(4,'Ciencias Sociales',300,'2023-10-22 18:44:01',NULL,NULL),
(5,'Lenguas',400,'2023-10-22 18:44:01',NULL,NULL),
(6,'Ciencias Naturales y Matematicas',500,'2023-10-22 18:44:01',NULL,NULL),
(7,'Tecnología, Ciencias Aplicadas',600,'2023-10-22 18:44:01',NULL,NULL),
(8,'Las Artes, Bellas Artes y Artes Decorativas',700,'2023-10-22 18:44:01',NULL,NULL),
(9,'Literatura',800,'2023-10-22 18:44:01',NULL,NULL),
(10,'Historia y Geografía',900,'2023-10-22 18:44:01',NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `detalleautores` */

insert  into `detalleautores`(`iddetalleautor`,`idlibro`,`idautor`,`creat_at`,`update_at`,`INACTIVE`) values 
(1,1,2,'2023-10-22 18:44:17',NULL,NULL),
(2,2,2,'2023-10-22 18:44:17',NULL,NULL),
(3,3,2,'2023-10-22 18:44:17',NULL,NULL),
(4,4,2,'2023-10-22 18:44:17',NULL,NULL),
(5,5,2,'2023-10-22 18:44:17',NULL,NULL),
(6,7,3,'2023-10-24 21:50:53',NULL,NULL),
(9,10,3,'2023-10-25 18:36:11',NULL,NULL),
(12,13,3,'2023-10-25 18:49:01',NULL,NULL),
(13,14,2,'2023-10-25 18:54:10',NULL,NULL),
(14,15,3,'2023-10-25 19:39:42',NULL,NULL),
(15,16,3,'2023-10-25 19:43:24',NULL,NULL),
(16,17,1,'2023-10-25 22:39:12',NULL,NULL),
(17,18,2,'2023-10-25 22:48:05',NULL,NULL),
(18,19,2,'2023-10-25 22:48:29',NULL,NULL),
(19,20,1,'2023-10-25 22:49:45',NULL,NULL);

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
(1,'Ariel','943883123','','jonathanc@gmail.com','EEUU','2023-10-22 18:43:58',NULL,NULL),
(2,'Paidos','913033923','','max@gmail.com','España','2023-10-22 18:43:58',NULL,NULL);

/*Table structure for table `libros` */

DROP TABLE IF EXISTS `libros`;

CREATE TABLE `libros` (
  `idlibro` int(11) NOT NULL AUTO_INCREMENT,
  `idsubcategoria` int(11) NOT NULL,
  `ideditorial` int(11) NOT NULL,
  `nombre` varchar(70) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `cantidad` smallint(6) NOT NULL,
  `numeropaginas` smallint(6) NOT NULL,
  `codigo` decimal(6,3) NOT NULL,
  `edicion` varchar(50) DEFAULT NULL,
  `formato` varchar(50) DEFAULT NULL,
  `anio` date DEFAULT NULL,
  `idioma` varchar(30) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `imagenportada` varchar(200) DEFAULT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL,
  PRIMARY KEY (`idlibro`),
  KEY `fk_idsubcategoria` (`idsubcategoria`),
  KEY `fk_ideditorial` (`ideditorial`),
  CONSTRAINT `fk_ideditorial` FOREIGN KEY (`ideditorial`) REFERENCES `editoriales` (`ideditorial`),
  CONSTRAINT `fk_idsubcategoria` FOREIGN KEY (`idsubcategoria`) REFERENCES `subcategorias` (`idsubcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `libros` */

insert  into `libros`(`idlibro`,`idsubcategoria`,`ideditorial`,`nombre`,`tipo`,`cantidad`,`numeropaginas`,`codigo`,`edicion`,`formato`,`anio`,`idioma`,`descripcion`,`imagenportada`,`create_at`,`update_at`,`inactive_at`) values 
(1,1,1,'Historia del mundo contemporáneo','texto',9,132,140.053,'','','0000-00-00','castellano','','','2023-10-22 18:44:15',NULL,NULL),
(2,3,2,'El mentor de matematicas','texto',11,102,513.000,'','','0000-00-00','castellano','','','2023-10-22 18:44:15',NULL,NULL),
(3,4,2,'Atlas del cielo','texto',12,100,525.000,'','','0000-00-00','castellano','','','2023-10-22 18:44:15',NULL,NULL),
(4,6,2,'Atlas del cuerpo humano','texto',9,12,574.000,'','','0000-00-00','castellano','','','2023-10-22 18:44:15',NULL,NULL),
(5,7,1,'el guardian entre el enteno','texto',12,232,813.005,'','','0000-00-00','castellano','','','2023-10-22 18:44:15',NULL,NULL),
(6,10,2,'La vuelta al mundo entero en 80 dias','texto',23,22,843.008,'','','0000-00-00','castellano','','','2023-10-22 18:44:15',NULL,NULL),
(7,3,1,'nose','texto',2,33,233.300,'','','0000-00-00','español','','','2023-10-24 21:50:53',NULL,NULL),
(8,9,1,'nise','nose',23,32,344.340,'n','grande','0000-00-00','español','dddddddd','1','2023-10-25 18:31:09',NULL,NULL),
(9,9,1,'nise','nose',23,32,344.340,'n','grande','0000-00-00','español','dddddddd','1','2023-10-25 18:31:18',NULL,NULL),
(10,3,1,'nose','texto',2,33,233.300,'','','0000-00-00','español','','','2023-10-25 18:36:11',NULL,NULL),
(11,9,1,'nise','nose',23,32,344.340,'n','grande','0000-00-00','español','dddddddd','1','2023-10-25 18:45:41',NULL,NULL),
(12,9,1,'nise','nose',23,32,344.340,'n','grande','0000-00-00','español','dddddddd','2','2023-10-25 18:47:03',NULL,NULL),
(13,3,1,'nose','texto',2,33,233.300,'','','0000-00-00','español','','','2023-10-25 18:49:00',NULL,NULL),
(14,9,1,'nise','nose',23,32,344.340,'n','grande','0000-00-00','español','dddddddd','uy356g','2023-10-25 18:54:10',NULL,NULL),
(15,14,1,'nose','texto',2,33,586.100,'nose','Mediano','2023-10-13','Ingles','libro bueno','NULL','2023-10-25 19:39:42',NULL,NULL),
(16,9,1,'nose','texto',2,23,586.100,'nose','Mediano','2023-10-13','Ingles','libro bueno','ba56ec149ae7272f0d581cdab944278aed3da109.jpg','2023-10-25 19:43:24',NULL,NULL),
(17,9,1,'Libro1','texto',2,356,586.200,'nose','Mediano','2023-10-20','Español','3M','NULL','2023-10-25 22:39:12',NULL,NULL),
(18,14,1,'funciona','texto',12,84,586.200,'nose','Mediano','2018-06-05','Ingles','libro bueno','NULL','2023-10-25 22:48:05',NULL,NULL),
(19,14,1,'funciona','texto',12,84,586.200,'nose','Mediano','2018-06-05','Ingles','libro bueno','NULL','2023-10-25 22:48:29',NULL,NULL),
(20,8,2,'funciona','texto',14,35,586.300,'nose','Mediano','2023-09-28','Ingles','3M','41c160acd9a65d21b346ac364aed7fa5f055c3c0.jpg','2023-10-25 22:49:45',NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `librosentregados` */

insert  into `librosentregados`(`idlibroentregado`,`idprestamo`,`idlibro`,`cantidad`,`condicionentrega`,`condiciondevolucion`,`observaciones`,`fechadevolucion`) values 
(1,2,3,2,'Nuevo','mal','5','2023-10-25 23:37:51'),
(2,5,2,1,'Nuevo','Mal','Rayado','2023-10-25 23:50:35'),
(5,6,6,1,'Nuevo',NULL,NULL,'2023-10-25 00:00:00'),
(9,7,16,1,'Nuevo',NULL,NULL,'0000-00-00 00:00:00'),
(13,8,3,2,'Nuevo',NULL,NULL,'2023-10-28 00:00:00'),
(14,9,17,1,'Nuevo',NULL,NULL,'2023-10-29 00:00:00'),
(16,10,10,1,'bien',NULL,NULL,'0000-00-00 00:00:00'),
(19,11,3,2,'Nuevo',NULL,NULL,'0000-00-00 00:00:00'),
(20,11,3,2,'Nuevo',NULL,NULL,'0000-00-00 00:00:00'),
(23,12,3,1,'2023-10-28',NULL,NULL,'0000-00-00 00:00:00'),
(24,12,3,1,'2023-10-28',NULL,NULL,'0000-00-00 00:00:00'),
(26,13,5,2,'Nuevo',NULL,NULL,'0000-00-00 00:00:00'),
(27,13,5,2,'Nuevo',NULL,NULL,'0000-00-00 00:00:00'),
(29,14,3,2,'nuevo',NULL,NULL,'0000-00-00 00:00:00'),
(30,14,3,2,'nuevo',NULL,NULL,'0000-00-00 00:00:00');

/*Table structure for table `personas` */

DROP TABLE IF EXISTS `personas`;

CREATE TABLE `personas` (
  `idpersona` int(11) NOT NULL AUTO_INCREMENT,
  `apellidos` varchar(50) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `nrodocumento` char(8) DEFAULT NULL,
  `tipodocumento` varchar(50) NOT NULL,
  `fechanac` date DEFAULT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` char(9) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL,
  PRIMARY KEY (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `personas` */

insert  into `personas`(`idpersona`,`apellidos`,`nombres`,`nrodocumento`,`tipodocumento`,`fechanac`,`direccion`,`telefono`,`email`,`create_at`,`update_at`,`inactive_at`) values 
(1,'Palma Navarro','Sylvie','74150120','DNI','0000-00-00','Grocio Prado','951207403','','2023-10-22 18:42:13',NULL,NULL),
(2,'Berrocal paima','Luis Fernando','76543001','DNI','0000-00-00','Sunampe','964513274','','2023-10-22 18:42:13',NULL,NULL),
(3,'Cartagena Salas','Maira','83215278','DNI','0000-00-00','Chincha','956432176','','2023-10-22 18:42:13',NULL,NULL),
(4,'Lopez Salas','Sofia','73129045','DNI','0000-00-00','Chincha','956432176','','2023-10-22 18:42:13',NULL,NULL),
(5,'Duren Buenamarca','Layla','78674219','DNI','0000-00-00','Chincha','956432176','','2023-10-22 18:42:13',NULL,NULL),
(6,'Salazar Rojas','Luisa','76401538','DNI','0000-00-00','El carmen','912458130','','2023-10-22 18:42:13',NULL,NULL),
(7,'Fajardo Cordova','Nayla','74102589','DNI','0000-00-00','Chincha Alta','987400335','','2023-10-22 18:42:13',NULL,NULL),
(8,'Urbano Florez','Ariana','76410258','DNI','0000-00-00','Pueblo nuevo','917845230','','2023-10-22 18:42:13',NULL,NULL),
(9,'Moron Roblez','Jasira Angela','6286928','DNI','1986-07-08','Sunampe','952840349','','2023-10-22 18:49:29',NULL,NULL),
(10,'Moron Roblez','Jasira Angela','5484984','DNI','2009-07-26','Grocio Prado','951208484','','2023-10-26 21:18:31',NULL,NULL);

/*Table structure for table `prestamos` */

DROP TABLE IF EXISTS `prestamos`;

CREATE TABLE `prestamos` (
  `idprestamo` int(11) NOT NULL AUTO_INCREMENT,
  `idbeneficiario` int(11) NOT NULL,
  `idbibliotecario` int(11) NOT NULL,
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
  CONSTRAINT `ck_fechas` CHECK (`fechaprestamo` > `fechasolicitud`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `prestamos` */

insert  into `prestamos`(`idprestamo`,`idbeneficiario`,`idbibliotecario`,`fechasolicitud`,`fechaprestamo`,`fecharespuesta`,`fechaentrega`,`descripcion`,`enbiblioteca`,`lugardestino`,`estado`,`activo`) values 
(2,6,11,'2023-10-22 18:45:15','2023-10-28 00:00:00','0000-00-00 00:00:00','2023-10-22 18:50:12','2F','SI','','T','1'),
(5,8,11,'2023-10-22 18:51:51','2023-10-25 00:00:00','0000-00-00 00:00:00','2023-10-22 18:55:43','3M','SI','','T','1'),
(6,9,11,'2023-10-22 18:56:39','2023-10-23 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','5F','SI','','R','1'),
(7,9,11,'2023-10-23 23:41:04','2023-10-25 00:00:00',NULL,NULL,'5F','SI','salon1','R','1'),
(8,8,11,'2023-10-23 23:41:33','2023-10-24 00:00:00',NULL,'2023-10-26 20:15:22','3M','NO','Salon 4','D','1'),
(9,9,11,'2023-10-24 20:31:02','2023-10-27 00:00:00',NULL,'2023-10-26 20:17:20','3M','SI','','D','1'),
(10,8,11,'2023-10-26 20:16:22','2023-10-28 00:00:00',NULL,'2023-10-26 22:03:49','1A','NO','Salon 4','D','1'),
(11,14,11,'2023-10-26 21:19:06','2023-10-30 00:00:00',NULL,'2023-10-27 01:42:13','4A','SI','','D','1'),
(12,10,11,'2023-10-27 01:44:17','2023-11-04 00:00:00',NULL,'2023-10-27 02:05:01','5H','SI','','D','1'),
(13,6,11,'2023-10-27 02:05:32','2023-10-29 00:00:00',NULL,'2023-10-27 02:06:05','2M','SI','','D','1'),
(14,10,11,'2023-10-27 02:06:39','2023-10-28 00:00:00',NULL,NULL,'3M','NO','','R','1'),
(15,10,11,'2023-10-27 21:54:12','2023-10-29 00:00:00',NULL,NULL,'2F','SI','','E','1');

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
(1,'Administrador',5,'2023-10-22 18:42:22',NULL,NULL),
(2,'Profesor',50,'2023-10-22 18:42:22',NULL,NULL),
(3,'Estudiante',3,'2023-10-22 18:42:22',NULL,NULL);

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
(1,2,'Escuelas Filosóficas Específicas',140,'2023-10-22 18:44:03',NULL,NULL),
(2,4,'Educacion',370,'2023-10-22 18:44:03',NULL,NULL),
(3,6,'Matemáticas',510,'2023-10-22 18:44:03',NULL,NULL),
(4,6,'Astronomía y ciencias afines',520,'2023-10-22 18:44:03',NULL,NULL),
(5,6,'Física',530,'2023-10-22 18:44:03',NULL,NULL),
(6,6,'Ciencias de la vida Biología',570,'2023-10-22 18:44:03',NULL,NULL),
(7,9,'Literatura estadounidense',810,'2023-10-22 18:44:03',NULL,NULL),
(8,9,'Literatura inglesa e inglesa antigua(Anglosajona)',820,'2023-10-22 18:44:03',NULL,NULL),
(9,9,'Literatura de lenguas germánicas literatura aleman',830,'2023-10-22 18:44:03',NULL,NULL),
(10,9,'Literatura Francesa y literaturas de las lenguas r',840,'2023-10-22 18:44:03',NULL,NULL),
(11,9,'Literatura española y portuguesa',860,'2023-10-22 18:44:03',NULL,NULL),
(12,10,'Historia Universal',909,'2023-10-22 18:44:03',NULL,NULL),
(13,10,'Geografía y viajes',910,'2023-10-22 18:44:03',NULL,NULL),
(14,10,'Historia de américa del sur',980,'2023-10-22 18:44:03',NULL,NULL);

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
  PRIMARY KEY (`idusuario`),
  KEY `fk_idpersona` (`idpersona`),
  KEY `fk_idrol` (`idrol`),
  CONSTRAINT `fk_idpersona` FOREIGN KEY (`idpersona`) REFERENCES `personas` (`idpersona`),
  CONSTRAINT `fk_idrol` FOREIGN KEY (`idrol`) REFERENCES `roles` (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `usuarios` */

insert  into `usuarios`(`idusuario`,`idpersona`,`idrol`,`nombreusuario`,`claveacceso`,`create_at`,`update_at`,`inactive_at`) values 
(6,3,3,'73129045','sofi12','2023-10-22 18:42:24',NULL,NULL),
(7,4,3,'78674219','121223','2023-10-22 18:42:24',NULL,NULL),
(8,5,3,'76401538','SalaLu23','2023-10-22 18:42:24',NULL,NULL),
(9,6,3,'74102589','Nyla19','2023-10-22 18:42:24',NULL,NULL),
(10,7,3,'76410258','Ari','2023-10-22 18:42:24',NULL,NULL),
(11,1,1,'75123489','$2y$10$1EwQL/puaUQHsn3KpLDQge.QJ5zTmDQ3PmQkd2du.4H91O8UsatWC','2023-10-22 18:43:49',NULL,NULL),
(12,2,3,'75140236','223344','2023-10-22 18:43:49',NULL,NULL),
(13,9,2,'Jasi12','123','2023-10-22 18:49:29',NULL,NULL),
(14,10,3,'Jasi12','1234','2023-10-26 21:18:31',NULL,NULL);

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
	WHERE idrol = 3;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_cantidad_libros` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_cantidad_libros` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_cantidad_libros`()
BEGIN
	SELECT COUNT(idlibro) AS 'libros'
	FROM libros;
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
	WHERE idrol = 2;
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
	SELECT idlibro, nombre, subcategorias.subcategoria, categorias.categoria
	FROM libros
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria;
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
	SELECT usuarios.idusuario, personas.nombres, personas.apellidos
	FROM usuarios
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	INNER JOIN roles ON roles.idrol = usuarios.idrol
	WHERE usuarios.idrol = 3 AND 2;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_libro` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_libro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_libro`(IN _idprestamo INT)
BEGIN
	SELECT idlibroentregado, subcategorias.subcategoria, libros.nombre, librosentregados.cantidad, 
	librosentregados.fechadevolucion, librosentregados.condicionentrega
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idlibroentregado
	INNER JOIN libros ON libros.idlibro = librosentregados.idlibro
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	WHERE librosentregados.idprestamo = _idprestamo;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listado_libros` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listado_libros` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listado_libros`()
BEGIN
	SELECT iddetalleautor, libros.idlibro, subcategorias.subcategoria, categorias.categoria, libros.nombre, libros.tipo, libros.cantidad, libros.numeropaginas,
	libros.codigo, libros.edicion, libros.formato, libros.anio, libros.idioma, libros.descripcion, CONCAT(autores.nombres,' ',autores.apellidos) AS 'autor'
	FROM detalleautores
	INNER JOIN libros ON libros.idlibro = detalleautores.idlibro
	INNER JOIN autores ON autores.idautor = detalleautores.idautor
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria
	order by iddetalleautor desc;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_devolucionpendientes` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_devolucionpendientes` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_devolucionpendientes`()
BEGIN
	SELECT idlibroentregado,prestamos.idprestamo, libros.nombre, personas.nombres, libros.tipo, prestamos.fechasolicitud, 
	prestamos.fechaentrega, librosentregados.fechadevolucion
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN libros ON libros.idlibro = librosentregados.idlibro
	INNER JOIN usuarios ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE prestamos.estado = 'D';
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_entregaspendiente` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_entregaspendiente` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_entregaspendiente`()
BEGIN
	SELECT idlibroentregado, prestamos.idprestamo, libros.nombre, libros.imagenportada, librosentregados.cantidad, personas.nombres, prestamos.descripcion, prestamos.fechasolicitud, prestamos.fechaprestamo, librosentregados.fechadevolucion
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN libros ON libros.idlibro = librosentregados.idlibro
	INNER JOIN usuarios ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE prestamos.estado = 'R';
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_estudiantes` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_estudiantes` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_estudiantes`()
BEGIN
	SELECT idusuario, roles.nombrerol, personas.nombres, personas.apellidos, personas.nrodocumento, personas.telefono, personas.email, personas.direccion, nombreusuario, claveacceso
	FROM usuarios
	INNER JOIN roles ON roles.idrol = usuarios.idrol
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE usuarios.idrol = 3;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_fichaprestamo` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_fichaprestamo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_fichaprestamo`(
	IN _idlibrosentregados INT
)
BEGIN
	SELECT librosentregados.idlibroentregado, roles.nombrerol, personas.nombres, personas.apellidos, prestamos.descripcion,
	categorias.categoria, subcategorias.subcategoria, libros.nombre, prestamos.fechasolicitud, prestamos.fechaentrega, prestamos.fechaprestamo, fechadevolucion
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN libros ON libros.idlibro = librosentregados.idlibro
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria
	INNER JOIN usuarios usu1 ON usu1.idusuario = prestamos.idbeneficiario
	INNER JOIN roles ON roles.idrol = usu1.idrol
	INNER JOIN personas ON personas.idpersona = usu1.idpersona;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_libro` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_libro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_libro`(
	IN _idsubcategoria INT
)
BEGIN
	SELECT idlibro, libros.nombre,subcategorias.subcategoria, categorias.categoria, libros.tipo, libros.numeropaginas,libros.codigo
	FROM libros
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN  categorias ON categorias.idcategoria = subcategorias.idcategoria
	WHERE libros.idsubcategoria = _idsubcategoria;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_prestamos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_prestamos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_prestamos`()
BEGIN
	SELECT prestamos.idprestamo, personas.nombres, personas.apellidos, usuarios.nombreusuario, prestamos.fechasolicitud,
	prestamos.fechaprestamo, roles.nombrerol
	FROM prestamos
	INNER JOIN usuarios ON usuarios.idusuario =  prestamos.idbeneficiario
	INNER JOIN roles ON roles.idrol = usuarios.idrol
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE estado = 'E';
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_profesor` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_profesor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_profesor`()
BEGIN
	SELECT idusuario, roles.nombrerol, personas.nombres, personas.apellidos, personas.nrodocumento, personas.telefono, personas.email, personas.direccion, nombreusuario, claveacceso
	FROM usuarios
	INNER JOIN roles ON roles.idrol = usuarios.idrol
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE usuarios.idrol = 2;
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
begin
	select idsubcategoria, categorias.categoria, subcategorias.subcategoria, subcategorias.codigo
	from subcategorias
	inner join categorias on categorias.idcategoria = subcategorias.idcategoria;
end */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_todoprestamos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_todoprestamos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_todoprestamos`()
BEGIN
	SELECT librosentregados.idlibroentregado, libros.nombre, libros.tipo, prestamos.`fechasolicitud`, 
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
	in _iddetalleautor int
)
begin
	select detalleautores.iddetalleautor, categorias.categoria, subcategorias.subcategoria, concat(editoriales.nombres,' ', editoriales.paisorigen) as 'Editorial',
	libros.nombre, libros.cantidad, libros.numeropaginas, libros.codigo, libros.formato,
	libros.descripcion, libros.idioma, libros.anio, libros.tipo, libros.imagenportada, libros.edicion, concat(autores.nombres,' ',autores.apellidos) as 'Autor'
	from detalleautores
	inner join libros on libros.idlibro = detalleautores.idlibro
	inner join autores on autores.idautor = detalleautores.idautor 
	inner join editoriales on editoriales.ideditorial = libros.ideditorial
	inner join subcategorias on subcategorias.idsubcategoria = libros.idsubcategoria
	inner join categorias on categorias.idcategoria = subcategorias.idcategoria
	where detalleautores.iddetalleautor = _iddetalleautor;
end */$$
DELIMITER ;

/* Procedure structure for procedure `spu_obtener_libroentregado` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_obtener_libroentregado` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_obtener_libroentregado`(
	IN _idlibroentregado INT
)
BEGIN
	SELECT librosentregados.idlibroentregado, personas.nombres, personas.apellidos, librosentregados.cantidad, prestamos.descripcion,
	libros.nombre, prestamos.fechasolicitud, prestamos.fechaprestamo, fechadevolucion
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN libros ON libros.idlibro = librosentregados.idlibro
	INNER JOIN usuarios usu1 ON usu1.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usu1.idpersona
	WHERE estado = 'R';
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
    IN _nombre VARCHAR(70),
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
    INSERT INTO libros (idsubcategoria, ideditorial, nombre, tipo, cantidad, numeropaginas, codigo, edicion,formato,anio,idioma,descripcion,imagenportada)
	VALUES (_idsubcategoria, _ideditorial, _nombre, _tipo, _cantidad, _numeropaginas, _codigo, _edicion,_formato,_anio,_idioma,_descripcion,_imagenportada);
	
     SET @idlibro = LAST_INSERT_ID();
     
     INSERT INTO detalleautores(idlibro,idautor)VALUES
				(@idlibro, _idautor);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_registrar_libroentregado_ahora` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_registrar_libroentregado_ahora` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_registrar_libroentregado_ahora`(
	IN _idprestamo 	INT,
	IN _idlibro 	INT,
	IN _cantidad 	SMALLINT,
	IN _condicionentrega VARCHAR(50),
	IN _fechadevolucion  DATE
)
BEGIN 
	INSERT INTO librosentregados (idprestamo,idlibro,cantidad, condicionentrega, fechadevolucion)VALUES
				(_idprestamo,_idlibro,_cantidad,_condicionentrega,_fechadevolucion);
			
	UPDATE prestamos SET
	estado = 'D',
	fechaentrega = NOW()
	WHERE idprestamo = _idprestamo;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_registrar_libroentregado_reservar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_registrar_libroentregado_reservar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_registrar_libroentregado_reservar`(
	IN _idprestamo 	INT,
	IN _idlibro 	INT,
	IN _cantidad 	SMALLINT,
	IN _condicionentrega VARCHAR(50),
	IN _fechadevolucion  DATE
)
BEGIN 
	INSERT INTO librosentregados (idprestamo,idlibro,cantidad, condicionentrega, fechadevolucion)VALUES
			(_idprestamo,_idlibro,_cantidad,_condicionentrega,_fechadevolucion);
			
	UPDATE prestamos SET
	estado = 'R'
	WHERE idprestamo = _idprestamo;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_registrar_prestamo` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_registrar_prestamo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_registrar_prestamo`(
	IN _idbeneficiario INT, -- s
	IN _idbibliotecario INT, -- n 
	IN _fechaprestamo DATETIME, -- null
	IN _descripcion VARCHAR(40),
	IN _enbiblioteca CHAR(2),
	IN _lugardestino VARCHAR(90)
 )
BEGIN 
-- if cargo = 'estudiante' then set cantidadmax < 10;

INSERT INTO prestamos (idbeneficiario, idbibliotecario,fechaprestamo,descripcion,enbiblioteca,lugardestino) VALUES
	(_idbeneficiario, _idbibliotecario,_fechaprestamo,_descripcion,_enbiblioteca,_lugardestino);
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

/* Procedure structure for procedure `spu_update_devoluciones` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_update_devoluciones` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_update_devoluciones`(
	IN _idlibroentregado INT,
	IN _idprestamo INT,
	IN _condiciondevolucion VARCHAR(50),
	IN _observaciones   VARCHAR(50)
)
BEGIN
	 UPDATE librosentregados SET
	 condiciondevolucion = _condiciondevolucion,
	 observaciones = _observaciones,
	 fechadevolucion = NOW()
	 WHERE idlibroentregado = _idlibroentregado;
	 
	 UPDATE prestamos SET
	 estado = 'T'
	 WHERE idprestamo = _idprestamo;
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
