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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `detalleautores` */

insert  into `detalleautores`(`iddetalleautor`,`idlibro`,`idautor`,`creat_at`,`update_at`,`inactive_at`) values 
(1,2,2,'2023-11-14 20:10:38',NULL,NULL),
(2,4,2,'2023-11-17 23:43:29',NULL,NULL),
(3,3,3,'2023-11-17 23:46:32',NULL,NULL),
(4,5,2,'2023-11-18 01:01:51',NULL,NULL),
(5,6,2,'2023-11-18 02:29:30',NULL,NULL),
(6,7,3,'2023-11-18 02:32:15',NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ejemplares` */

insert  into `ejemplares`(`idejemplar`,`idlibro`,`codigo_libro`,`ocupado`,`estado`,`creat_at`,`update_at`,`inactive_at`) values 
(1,2,1,'NO','1','2023-11-14 20:11:01',NULL,'2023-11-18 00:13:52'),
(2,2,2,'NO','1','2023-11-14 20:11:01',NULL,NULL),
(3,2,3,'NO','1','2023-11-14 20:11:01',NULL,NULL),
(4,2,4,'NO','0','2023-11-14 20:11:01',NULL,'2023-11-18 00:35:37'),
(5,2,5,'NO','1','2023-11-14 20:11:01',NULL,NULL),
(6,2,6,'NO','1','2023-11-14 20:11:01',NULL,NULL),
(7,2,7,'NO','1','2023-11-14 20:11:01',NULL,NULL),
(8,2,8,'NO','1','2023-11-14 20:11:01',NULL,NULL),
(9,2,9,'NO','1','2023-11-14 20:11:01',NULL,NULL),
(10,3,10,'NO','0','2023-11-17 23:28:38',NULL,'2023-11-18 00:38:58'),
(11,3,11,'SI','1','2023-11-17 23:28:38',NULL,NULL),
(12,3,12,'SI','1','2023-11-17 23:28:38',NULL,NULL),
(13,3,13,'NO','1','2023-11-17 23:28:38',NULL,NULL),
(14,3,14,'NO','1','2023-11-17 23:28:38',NULL,NULL),
(15,3,15,'NO','1','2023-11-17 23:28:38',NULL,NULL),
(16,3,16,'NO','1','2023-11-17 23:28:38',NULL,NULL),
(17,3,17,'NO','1','2023-11-17 23:28:38',NULL,NULL),
(18,3,18,'NO','1','2023-11-17 23:28:38',NULL,NULL),
(19,4,19,'NO','1','2023-11-17 23:43:29',NULL,NULL),
(20,4,20,'NO','1','2023-11-17 23:43:29',NULL,NULL),
(21,4,21,'NO','1','2023-11-17 23:43:29',NULL,NULL),
(22,4,22,'NO','1','2023-11-17 23:43:30',NULL,NULL),
(23,5,23,'SI','1','2023-11-18 01:01:51',NULL,NULL),
(24,5,24,'SI','1','2023-11-18 01:01:51',NULL,NULL),
(25,5,25,'NO','1','2023-11-18 01:01:51',NULL,NULL),
(26,5,26,'NO','1','2023-11-18 01:01:51',NULL,NULL),
(27,5,27,'NO','1','2023-11-18 01:01:51',NULL,NULL),
(28,5,28,'NO','1','2023-11-18 01:01:51',NULL,NULL),
(29,5,29,'NO','1','2023-11-18 01:01:51',NULL,NULL),
(30,5,30,'NO','1','2023-11-18 01:01:51',NULL,NULL),
(31,5,31,'NO','1','2023-11-18 01:01:51',NULL,NULL),
(32,5,32,'NO','1','2023-11-18 01:01:51',NULL,NULL),
(33,5,33,'NO','1','2023-11-18 01:01:51',NULL,NULL),
(34,5,34,'NO','1','2023-11-18 01:01:51',NULL,NULL),
(35,5,35,'NO','1','2023-11-18 01:01:51',NULL,NULL),
(36,5,36,'NO','1','2023-11-18 01:01:51',NULL,NULL),
(37,5,37,'NO','1','2023-11-18 01:01:51',NULL,NULL),
(38,5,38,'NO','1','2023-11-18 01:01:51',NULL,NULL),
(39,5,39,'NO','1','2023-11-18 01:01:51',NULL,NULL),
(40,5,40,'NO','1','2023-11-18 01:01:51',NULL,NULL),
(41,5,41,'NO','1','2023-11-18 01:01:51',NULL,NULL),
(42,5,42,'NO','1','2023-11-18 01:01:51',NULL,NULL),
(43,5,43,'NO','1','2023-11-18 01:01:51',NULL,NULL),
(44,6,44,'NO','1','2023-11-18 02:29:30',NULL,NULL),
(45,6,45,'NO','1','2023-11-18 02:29:30',NULL,NULL),
(46,6,46,'NO','1','2023-11-18 02:29:30',NULL,NULL),
(47,6,47,'NO','1','2023-11-18 02:29:31',NULL,NULL),
(48,6,48,'NO','1','2023-11-18 02:29:31',NULL,NULL),
(49,6,49,'NO','1','2023-11-18 02:29:31',NULL,NULL),
(50,6,50,'NO','1','2023-11-18 02:29:31',NULL,NULL),
(51,6,51,'NO','1','2023-11-18 02:29:31',NULL,NULL),
(52,6,52,'NO','1','2023-11-18 02:29:31',NULL,NULL),
(53,6,53,'NO','1','2023-11-18 02:29:31',NULL,NULL),
(54,6,54,'NO','1','2023-11-18 02:29:31',NULL,NULL),
(55,6,55,'NO','1','2023-11-18 02:29:31',NULL,NULL),
(56,7,56,'NO','1','2023-11-18 02:32:15',NULL,NULL),
(57,7,57,'NO','1','2023-11-18 02:32:15',NULL,NULL),
(58,7,58,'NO','1','2023-11-18 02:32:15',NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `libros` */

insert  into `libros`(`idlibro`,`idsubcategoria`,`ideditorial`,`libro`,`tipo`,`cantidad`,`numeropaginas`,`codigo`,`edicion`,`formato`,`anio`,`idioma`,`descripcion`,`imagenportada`,`create_at`,`update_at`,`inactive_at`,`estado`) values 
(2,1,1,'Historia del mundo contemporáneo','texto',10,132,140.053,'','','0000-00-00','castellano','','','2023-11-14 20:10:19',NULL,'2023-11-17 16:46:34','1'),
(3,6,3,'Atlas del Cuerpo Humano','texto',8,200,574.000,'','Grande','2010-03-14','Español','','5ebd3a899d16780ea9262bcfca2dbb0862dc0711.jpg','2023-11-17 23:28:38',NULL,NULL,'1'),
(4,4,2,'prueba','texto',4,23,23.200,'','mediano','0000-00-00','','','','2023-11-17 23:43:29',NULL,NULL,'1'),
(5,8,4,'Dracula','Historieta',19,112,820.080,'','Pequeño','2002-04-22','Español','','ca5187750b3191148ad5c97ac0a5f4abb93ac1cd.jpg','2023-11-18 01:01:51',NULL,NULL,'1'),
(6,5,2,'La Biblia de la física y química','texto',12,400,533.000,'','Mediano','0000-00-00','Español','','9215482f122d95dd5f419b17b8ae2ea990d9bf73.jpg','2023-11-18 02:29:30',NULL,NULL,'1'),
(7,5,3,'Física conceptual','texto',3,100,534.000,'','Mediano','2010-11-11','Ingles','','5b4c73af96a588fee2853d208a86bb21a697de9a.jpg','2023-11-18 02:32:14',NULL,NULL,'1');

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
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `librosentregados` */

insert  into `librosentregados`(`idlibroentregado`,`idprestamo`,`idejemplar`,`cantidad`,`condicionentrega`,`condiciondevolucion`,`observaciones`,`fechadevolucion`) values 
(1,1,1,NULL,'Nuevo','bien','bien','2023-11-15 04:13:01'),
(2,1,2,NULL,'Nuevo','nuevo','bien','2023-11-15 04:15:27'),
(3,2,1,NULL,'Nuevo','bien','bien','2023-11-15 04:38:56'),
(5,2,2,NULL,'Nuevo',NULL,NULL,'2023-11-14 00:00:00'),
(6,2,3,NULL,'Nuevo','','',NULL),
(9,3,4,NULL,'Nuevo','bien','bien','2023-11-15 17:42:05'),
(10,4,1,NULL,'Nuevo','bien','bien','2023-11-15 17:42:53'),
(11,4,6,NULL,'Nuevo',NULL,NULL,'2023-11-17 00:00:00'),
(13,5,5,NULL,'Nuevo','nuevo','bien','2023-11-15 17:45:32'),
(15,5,8,NULL,'Nuevo','nuevo','bien','2023-11-15 17:46:17'),
(16,5,9,NULL,'Nuevo','nuevo','bien','2023-11-15 17:46:57'),
(17,6,1,NULL,'Nuevo','nuevo','bien','2023-11-15 18:14:23'),
(18,6,7,NULL,'Nuevo','nuevo','bien','2023-11-15 18:20:27'),
(19,6,5,NULL,'Nuevo','nuevo','bien','2023-11-15 18:21:20'),
(20,6,4,NULL,'Nuevo','nuevo','bien','2023-11-15 18:22:06'),
(21,7,9,NULL,'LALA',NULL,'CACA','2023-11-15 22:37:07'),
(22,7,8,NULL,'LALA',NULL,'CACA','2023-11-15 22:37:07'),
(23,8,1,NULL,'Nuevo','bien','bien','2023-11-16 01:08:35'),
(24,8,4,NULL,'Nuevo','bien','bien','2023-11-16 01:13:08'),
(25,8,5,NULL,'Nuevo','bien','igual','2023-11-16 01:14:19'),
(26,9,1,NULL,'bien','LALA','CACA','2023-11-16 01:19:34'),
(27,9,2,NULL,'bien','LALA','CACA','2023-11-16 01:19:34'),
(28,10,1,NULL,'Nuevo','Todo','undefined','2023-11-16 01:28:41'),
(29,10,2,NULL,'Nuevo','Todo','undefined','2023-11-16 01:28:41'),
(30,10,3,NULL,'Nuevo','Todo','undefined','2023-11-16 01:28:41'),
(31,11,1,NULL,'Nuevo','bien','bien','2023-11-16 22:49:09'),
(32,11,2,NULL,'Nuevo','bien','bien','2023-11-16 22:49:27'),
(33,12,1,NULL,'Nuevo','mal','mal','2023-11-17 18:12:23'),
(34,12,2,NULL,'Nuevo','mal','mal','2023-11-17 18:12:23'),
(35,12,3,NULL,'Nuevo','mal','mal','2023-11-17 18:12:23'),
(36,13,4,NULL,'Nuevo','LALA','CACA','2023-11-17 18:17:13'),
(37,13,5,NULL,'Nuevo','LALA','CACA','2023-11-17 18:17:13'),
(38,13,6,NULL,'Nuevo','LALA','CACA','2023-11-17 18:17:13'),
(39,14,1,NULL,'Nuevo','bien','bien','2023-11-17 18:47:20'),
(40,14,2,NULL,'Nuevo','bien','bien','2023-11-17 18:47:20'),
(41,14,3,NULL,'Nuevo','bien','bien','2023-11-17 18:47:20'),
(42,15,4,NULL,'Bien','bien','bien','2023-11-17 18:44:25'),
(43,15,5,NULL,'Bien','bien','bien','2023-11-17 18:44:25'),
(44,15,6,NULL,'Bien','bien','bien','2023-11-17 18:44:25'),
(45,16,2,NULL,'Nuevo','bien','bien','2023-11-17 18:48:48'),
(46,16,3,NULL,'Nuevo','bien','bien','2023-11-17 18:48:48'),
(47,16,1,NULL,'Nuevo','bien','bien','2023-11-17 18:48:48'),
(48,17,1,NULL,'Nuevo','bien','bien','2023-11-17 18:57:56'),
(49,17,2,NULL,'Nuevo','bien','bien','2023-11-17 19:29:51'),
(50,17,3,NULL,'Nuevo','bien','bien','2023-11-17 19:30:17'),
(51,18,2,NULL,'Nuevo','bien','bien','2023-11-17 19:32:12'),
(52,18,1,NULL,'Nuevo','bien','bien','2023-11-17 19:31:54'),
(53,19,1,NULL,'Eliminar','mal','mal','2023-11-18 00:54:26'),
(54,19,3,NULL,'Eliminar','mal','mal','2023-11-18 00:54:26'),
(55,19,2,NULL,'Eliminar','mal','mal','2023-11-18 00:54:26'),
(56,20,5,NULL,'Nuevo','mal','mal','2023-11-18 00:49:27'),
(57,20,4,NULL,'Nuevo','mal','mal','2023-11-18 00:49:27'),
(58,21,10,NULL,'Nuevo','mal','mal','2023-11-18 00:39:00'),
(59,23,11,NULL,'Nuevo',NULL,NULL,'2023-11-20 00:00:00'),
(60,23,12,NULL,'Nuevo',NULL,NULL,'2023-11-20 00:00:00'),
(61,24,23,NULL,'Nuevo',NULL,NULL,'2023-11-18 00:00:00'),
(62,25,24,NULL,'Nuevo',NULL,NULL,'2023-11-20 00:00:00');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `personas` */

insert  into `personas`(`idpersona`,`apellidos`,`nombres`,`nrodocumento`,`tipodocumento`,`fechanac`,`direccion`,`telefono`,`email`,`create_at`,`update_at`,`inactive_at`) values 
(1,'Berrocal paima','Luis Fernando','76543001','DNI','0000-00-00','Sunampe','964513274','','2023-11-14 20:04:43',NULL,NULL),
(2,'Cartagena Salazar','Jimena Adriana','73194180','DNI','0000-00-00','El carmen','','95107563','2023-11-14 20:04:43',NULL,NULL),
(3,'Cardenas Martinez','Maria Luisa','88678671','DNI','0000-00-00','','961770778','','2023-11-15 17:34:31',NULL,NULL),
(4,'Cartagena Salazar','Adriana Jimena','68754574','DNI','0000-00-00','Grocio Prado','950478703','','2023-11-17 22:10:26',NULL,NULL),
(5,'Flores Vilcapuma','Juan Miguel','65742687','DNI','0000-00-00','Grocio Prado','930704500','','2023-11-17 23:09:29',NULL,NULL),
(6,'Belleza Quispe','Kiara ','68276870','DNI','0000-00-00','Chincha Baja','','','2023-11-17 23:10:50',NULL,NULL),
(7,'Nicaragua Navarro','Jhon Francia','78710787','DNI','0000-00-00','Sunampe','950847870','','2023-11-17 23:12:24',NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `prestamos` */

insert  into `prestamos`(`idprestamo`,`idbeneficiario`,`idbibliotecario`,`fechasolicitud`,`fechaprestamo`,`fecharespuesta`,`fechaentrega`,`descripcion`,`enbiblioteca`,`lugardestino`,`estado`,`activo`) values 
(1,2,1,'2023-11-14 20:11:48','2023-11-14 20:11:48',NULL,'2023-11-14 20:11:48','3M','SI',NULL,'T','1'),
(2,2,1,'2023-11-14 23:21:34','2023-11-14 23:21:34',NULL,'2023-11-14 23:21:34','3M','SI',NULL,'T','1'),
(3,2,1,'2023-11-15 17:28:43','2023-11-15 17:28:43',NULL,'2023-11-15 17:28:43','4A','SI',NULL,'T','1'),
(4,3,1,'2023-11-15 17:35:08','2023-11-20 00:00:00',NULL,'2023-11-15 17:38:01','4A','SI',NULL,'T','1'),
(5,3,1,'2023-11-15 17:37:30','2023-11-20 00:00:00',NULL,'2023-11-15 17:38:07','5H','SI',NULL,'T','1'),
(6,2,1,'2023-11-15 17:48:55','2023-11-15 17:48:55',NULL,'2023-11-15 17:48:55','3M','SI',NULL,'T','1'),
(7,3,1,'2023-11-15 17:50:16','2023-11-16 00:00:00',NULL,'2023-11-15 18:13:21','4A','SI',NULL,'T','1'),
(8,3,1,'2023-11-15 23:04:51','2023-11-15 23:04:51',NULL,'2023-11-15 23:04:51','1A','SI',NULL,'T','1'),
(9,3,1,'2023-11-16 01:18:00','2023-11-16 01:18:00',NULL,'2023-11-16 01:18:00','1A','SI',NULL,'T','1'),
(10,2,1,'2023-11-16 01:20:30','2023-11-16 01:20:30',NULL,'2023-11-16 01:20:30','1A','SI',NULL,'T','1'),
(11,3,1,'2023-11-16 01:30:49','2023-11-16 01:30:49',NULL,'2023-11-16 01:30:49','3M','SI',NULL,'T','1'),
(12,3,1,'2023-11-17 18:05:26','2023-11-20 00:00:00',NULL,'2023-11-17 18:11:43','3M','SI',NULL,'T','1'),
(13,2,1,'2023-11-17 18:10:07','2023-11-12 00:00:00',NULL,'2023-11-17 18:16:14','2A','SI',NULL,'T','1'),
(14,3,1,'2023-11-17 18:19:05','2023-11-17 18:19:05',NULL,'2023-11-17 18:19:05','1A','SI',NULL,'T','1'),
(15,3,1,'2023-11-17 18:41:14','2023-11-17 18:41:14',NULL,'2023-11-17 18:41:14','5B','SI',NULL,'T','1'),
(16,2,1,'2023-11-17 18:48:27','2023-11-17 18:48:27',NULL,'2023-11-17 18:48:27','3M','SI',NULL,'T','1'),
(17,3,1,'2023-11-17 18:49:52','2023-11-20 00:00:00',NULL,'2023-11-17 18:55:09','3M','SI',NULL,'T','1'),
(18,3,1,'2023-11-17 19:31:29','2023-11-17 19:31:29',NULL,'2023-11-17 19:31:29','3M','SI',NULL,'T','1'),
(19,4,1,'2023-11-17 22:27:41','2023-11-17 22:27:41',NULL,'2023-11-17 22:27:41','3M','SI',NULL,'T','1'),
(20,3,1,'2023-11-17 22:31:03','2023-11-20 00:00:00',NULL,'2023-11-17 22:59:45','3M','SI',NULL,'T','1'),
(21,6,1,'2023-11-17 23:49:03','2023-11-20 00:00:00',NULL,'2023-11-18 00:38:36','3M','SI',NULL,'T','1'),
(22,7,1,'2023-11-18 01:34:37','2023-11-18 01:34:37',NULL,'2023-11-18 01:34:37','3M','SI',NULL,'E','1'),
(23,7,1,'2023-11-18 01:34:39','2023-11-19 00:00:00',NULL,'2023-11-18 01:34:39','3M','SI',NULL,'D','1'),
(24,5,1,'2023-11-18 01:50:31','2023-11-18 01:50:31',NULL,'2023-11-18 01:50:31','3M','SI',NULL,'D','1'),
(25,2,1,'2023-11-18 02:15:51','2023-11-20 00:00:00',NULL,NULL,'5H','SI',NULL,'R','1');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `usuarios` */

insert  into `usuarios`(`idusuario`,`idpersona`,`idrol`,`nombreusuario`,`claveacceso`,`create_at`,`update_at`,`inactive_at`,`estado`) values 
(1,1,1,'75123489','$2y$10$1EwQL/puaUQHsn3KpLDQge.QJ5zTmDQ3PmQkd2du.4H91O8UsatWC','2023-11-14 20:04:56',NULL,NULL,'1'),
(2,2,3,'78674219','$2y$10$1EwQL/puaUQHsn3KpLDQge.QJ5zTmDQ3PmQkd2du.4H91O8UsatWC','2023-11-14 20:04:56',NULL,'2023-11-18 02:15:52','0'),
(3,3,3,'Maria12','$2y$10$pjvcVk3.cIXv36rbkzd1se1x3hMkwJuhFb9hxWzntIVVJXXHJ4aOO','2023-11-15 17:34:31',NULL,'2023-11-18 00:49:27','1'),
(4,4,3,'Adri12','$2y$10$BAFdgrEAUrbCiAvJqXK1JewmEmWD4z6elZ/SbjfPL6AtlAdtycXyK','2023-11-17 22:10:26',NULL,'2023-11-18 00:54:26','1'),
(5,5,2,'Juan12','$2y$10$DO47kyJla58I/3HnjIfwqODpmZpT0d92aC98PJvnhzt0iA.CAu.0a','2023-11-17 23:09:29',NULL,'2023-11-18 01:50:32','0'),
(6,6,3,'Kiarabq','$2y$10$uwF4lFXTH1mw4yw.lXX7HeVTMGAr10dRPE4DnypxrX5oYb3quMvum','2023-11-17 23:10:50',NULL,'2023-11-18 00:55:11','1'),
(7,7,3,'JhonF','$2y$10$Cp0BSJyKCFSKllRAZ/.DA.8Eu3BR/IC4IdUi0.Yj3rWAGUz7hPSRG','2023-11-17 23:12:24',NULL,'2023-11-18 01:34:40','0');

/* Procedure structure for procedure `GRAFICO_INDEX` */

/*!50003 DROP PROCEDURE IF EXISTS  `GRAFICO_INDEX` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GRAFICO_INDEX`()
BEGIN
	SELECT  COUNT(librosentregados.idejemplar) AS 'totales', libros.libro
	FROM librosentregados
	inner join ejemplares on ejemplares.idejemplar = librosentregados.idejemplar
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	WHERE prestamos.estado = 'T' and libros.idlibro = 2
	GROUP BY librosentregados.idejemplar DESC;
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

/* Procedure structure for procedure `spu_actualizar_ocupado_por_idprestamo` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_actualizar_ocupado_por_idprestamo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_actualizar_ocupado_por_idprestamo`(
    IN _idprestamo INT
)
BEGIN
    -- Actualizar el valor de ocupado a 'NO' para los idejemplar asociados al idprestamo
    UPDATE ejemplares ej
    JOIN librosentregados le ON ej.idejemplar = le.idejemplar
    SET ej.ocupado = 'NO'
    WHERE le.idprestamo = _idprestamo;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_actualizar_ocupado_si_prestamo_terminado` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_actualizar_ocupado_si_prestamo_terminado` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_actualizar_ocupado_si_prestamo_terminado`(
    IN _idprestamo INT
)
BEGIN
    DECLARE _count_prestamos_terminados INT;

    -- Verificar si el préstamo está terminado ('T')
    SELECT COUNT(*) INTO _count_prestamos_terminados
    FROM prestamos
    WHERE idprestamo = _idprestamo AND estado = 'T';

    -- Si el préstamo está terminado, actualizar el valor de ocupado a 'NO'
    IF _count_prestamos_terminados > 0 THEN
        UPDATE ejemplares ej
        JOIN librosentregados le ON ej.idejemplar = le.idejemplar
        SET ej.ocupado = 'NO'
        WHERE le.idprestamo = _idprestamo;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_actualizar_ocupado_y_estado_prestamo` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_actualizar_ocupado_y_estado_prestamo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_actualizar_ocupado_y_estado_prestamo`(
    IN _idprestamo INT,
    IN _idlibroentregado INT,
    IN _condiciondevolucion VARCHAR(50),
    IN _observaciones  VARCHAR(50)
)
BEGIN
    DECLARE _count_ocupados INT;
    declare _idbene int;
    
    select idbeneficiario into _idbene
    from prestamos where idprestamo = _idprestamo;
    
    -- Actualizar ocupado a 'NO', la condicionentrega y observaciones para los idejemplar asociados al idprestamo y que la fechadevolucion es now()
    UPDATE ejemplares ej
    JOIN librosentregados le ON ej.idejemplar = le.idejemplar
    SET ej.ocupado = 'NO', le.condicionentrega = _condiciondevolucion, le.observaciones = _observaciones, le.fechadevolucion = NOW()
    WHERE le.idprestamo = _idprestamo;

    -- Verificar si todos los idejemplar tienen ocupado='NO'
    SELECT COUNT(*) INTO _count_ocupados
    FROM ejemplares ej
    JOIN librosentregados le ON ej.idejemplar = le.idejemplar
    WHERE le.idprestamo = _idprestamo AND ej.ocupado = 'NO';

    -- Si todos los idejemplar tienen ocupado='NO', actualizar el estado del préstamo a 'T'
    IF _count_ocupados > 0 THEN
        UPDATE prestamos SET estado = 'T' WHERE idprestamo = _idprestamo;
        UPDATE usuarios SET estado = 1 , inactive_at = NOW() WHERE idusuario = _idbene;
        UPDATE libros l SET l.cantidad = l.cantidad + _count_ocupados
        WHERE l.idlibro = (SELECT idlibro FROM ejemplares WHERE idejemplar = (SELECT MIN(idejemplar)
                FROM librosentregados WHERE idlibroentregado = _idlibroentregado));
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

/* Procedure structure for procedure `spu_desactivar_ejemplar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_desactivar_ejemplar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_desactivar_ejemplar`(
	IN _idejemplar INT
)
BEGIN 
	UPDATE ejemplares SET
	estado = 0,
	inactive_at = now()
	WHERE idejemplar = _idejemplar;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_ejemplar_idlibro` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_ejemplar_idlibro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_ejemplar_idlibro`(
	in _idlibro int
)
begin	
	SELECT ejemplares.idejemplar, libros.libro, ejemplares.codigo_libro, ejemplares.ocupado, ejemplares.estado
	FROM ejemplares
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	WHERE ejemplares.idlibro = _idlibro
	order by idejemplar asc;
end */$$
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
	WHERE usuarios.idrol IN(2,3) AND usuarios.estado = 1;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_grafico_rol` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_grafico_rol` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_grafico_rol`( IN _idrol INT)
BEGIN
	SELECT  COUNT(ejemplares.idlibro) AS 'totales', libros.libro
	FROM librosentregados
	INNER JOIN ejemplares ON ejemplares.idejemplar = librosentregados.idejemplar
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN usuarios ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN roles ON roles.idrol = usuarios.idrol
	WHERE usuarios.idrol = _idrol AND prestamos.estado = 'T'
	GROUP BY librosentregados.idejemplar DESC;
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
	estado = 0,
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
	SELECT prestamos.idprestamo, usuarios.idusuario, CONCAT( personas.nombres, ' ', personas.apellidos) AS 'nombres', prestamos.descripcion, prestamos.fechasolicitud, prestamos.fechaentrega, prestamos.fechaprestamo
	FROM prestamos
	INNER JOIN usuarios ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE prestamos.estado = 'D'
	ORDER BY idprestamo DESC;
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
	IN _prestamo INT
)
BEGIN
	SELECT librosentregados.idlibroentregado, ejemplares.idejemplar, ejemplares.codigo_libro, libros.imagenportada, roles.nombrerol, CONCAT(personas.nombres, ' ',personas.apellidos) AS 'nombres', 
	prestamos.descripcion,librosentregados.condicionentrega,librosentregados.condiciondevolucion, librosentregados.observaciones, categorias.categoria, 
	subcategorias.subcategoria, libros.libro, prestamos.fechasolicitud, prestamos.fechaentrega, prestamos.fechaprestamo, fechadevolucion,
	prestamos.fecharespuesta
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN ejemplares ON ejemplares.idejemplar = librosentregados.idejemplar 
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria
	INNER JOIN usuarios usu1 ON usu1.idusuario = prestamos.idbeneficiario
	INNER JOIN roles ON roles.idrol = usu1.idrol
	INNER JOIN personas ON personas.idpersona = usu1.idpersona
	WHERE prestamos.idprestamo = _prestamo AND prestamos.estado = 'T';
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

/* Procedure structure for procedure `spu_listar_todoprestamos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_todoprestamos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_todoprestamos`()
BEGIN
	SELECT idprestamo,prestamos.`fechasolicitud`, prestamos.descripcion, prestamos.enbiblioteca,
	fechaprestamo, prestamos.fechaentrega, concat(personas.nombres, ' ', personas.apellidos) as 'Nombres'
	FROM prestamos
	INNER JOIN usuarios ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.`idpersona` = usuarios.`idpersona`
	WHERE prestamos.estado = 'T'
	ORDER BY idprestamo ASC;
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

/* Procedure structure for procedure `spu_mostrar_detallejemplar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_mostrar_detallejemplar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_mostrar_detallejemplar`(
	IN _idlibro INT
)
BEGIN
	SELECT idejemplar, libros.idlibro, libros.libro, ejemplares.codigo_libro, ejemplares.ocupado, ejemplares.estado
	FROM ejemplares
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	WHERE libros.idlibro = _idlibro;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_obtener_detalleautores` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_obtener_detalleautores` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_obtener_detalleautores`(
	IN _idlibro INT
)
BEGIN
	SELECT detalleautores.iddetalleautor, libros.idlibro, categorias.categoria, subcategorias.subcategoria, CONCAT(editoriales.nombres,' ', editoriales.paisorigen) AS 'Editorial',
	libros.cantidad, libros.numeropaginas, libros.codigo, libros.formato,
	libros.descripcion, libros.idioma, libros.anio, libros.tipo, libros.imagenportada, libros.edicion, CONCAT(autores.autor,' ',autores.apellidos) AS 'Autor'
	FROM detalleautores
	INNER JOIN libros ON libros.idlibro = detalleautores.idlibro
	INNER JOIN autores ON autores.idautor = detalleautores.idautor 
	INNER JOIN editoriales ON editoriales.ideditorial = libros.ideditorial
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria
	WHERE detalleautores.idlibro = _idlibro;
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
    DECLARE cantidad_libros INT;
    DECLARE contador INT DEFAULT 1;
    DECLARE nuevo_codigo INT;
    
     INSERT INTO libros (idsubcategoria, ideditorial, libro, tipo, cantidad, numeropaginas, codigo, edicion,formato,anio,idioma,descripcion,imagenportada)
     VALUES (_idsubcategoria, _ideditorial, _libro, _tipo, _cantidad, _numeropaginas, _codigo, _edicion,_formato,_anio,_idioma,_descripcion,_imagenportada);
	
     SET @idlibro = LAST_INSERT_ID();
     
     insert into detalleautores(idlibro, idautor) values
				(@idlibro, _idautor);

    -- Obtener la cantidad de libros para el ID 
    SELECT cantidad INTO cantidad_libros FROM libros WHERE idlibro = @idlibro;

    -- Obtener el último código_libro global
    SELECT COALESCE(MAX(codigo_libro), 0) INTO nuevo_codigo FROM ejemplares;

    -- Incrementar el código_libro global
    SET nuevo_codigo = nuevo_codigo + 1;

    -- Insertar ejemplares para el ID del libro
    WHILE contador <= cantidad_libros DO
        -- Encontrar el próximo código_libro disponible
        WHILE EXISTS (SELECT 1 FROM ejemplares WHERE codigo_libro = nuevo_codigo AND idlibro = @idlibro ) DO
            SET nuevo_codigo = nuevo_codigo + 1;
        END WHILE;

        -- Insertar el nuevo ejemplar
        INSERT INTO ejemplares (idlibro, codigo_libro)
        VALUES (@idlibro , nuevo_codigo);

        SET contador = contador + 1;
        SET nuevo_codigo = nuevo_codigo + 1;
    END WHILE;
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
	inner join ejemplares on ejemplares.idejemplar = librosentregados.idejemplar
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
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

/* Procedure structure for procedure `spu_traerEjemplar_libroentregado` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_traerEjemplar_libroentregado` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_traerEjemplar_libroentregado`(
	in _idprestamo int
)
begin
	select librosentregados.idlibroentregado, prestamos.idprestamo, ejemplares.idejemplar, ejemplares.codigo_libro, ejemplares.ocupado, libros.libro, librosentregados.condicionentrega, date(librosentregados.fechadevolucion) as 'fechadevolucion'
	from librosentregados
	inner join ejemplares on ejemplares.idejemplar = librosentregados.idejemplar
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	inner join prestamos on prestamos.idprestamo = librosentregados.idprestamo
	where prestamos.idprestamo = _idprestamo
	order by ejemplares.idejemplar asc;
end */$$
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

/* Procedure structure for procedure `spu_updateD_todo_prestamo` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_updateD_todo_prestamo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_updateD_todo_prestamo`(
    IN _idprestamo INT,
    IN _idlibroentregado INT,
    IN _condiciondevolucion VARCHAR(50),
    IN _observaciones  VARCHAR(50)
)
BEGIN
    DECLARE _count_ocupados INT;
    declare _idbene int;
    
    select idbeneficiario into _idbene
    from prestamos where idprestamo = _idprestamo;
    
    -- Actualizar ocupado a 'NO', la condicionentrega y observaciones para los idejemplar asociados al idprestamo y que la fechadevolucion es now()
    UPDATE ejemplares ej
    JOIN librosentregados le ON ej.idejemplar = le.idejemplar
    SET ej.ocupado = 'NO', le.condiciondevolucion = _condiciondevolucion, le.observaciones = _observaciones, le.fechadevolucion = NOW()
    WHERE le.idprestamo = _idprestamo;

    -- Verificar si todos los idejemplar tienen ocupado='NO'
    SELECT COUNT(*) INTO _count_ocupados
    FROM ejemplares ej
    JOIN librosentregados le ON ej.idejemplar = le.idejemplar
    WHERE le.idprestamo = _idprestamo AND ej.ocupado = 'NO';

    -- Si todos los idejemplar tienen ocupado='NO', actualizar el estado del préstamo a 'T'
    IF _count_ocupados > 0 THEN
        UPDATE prestamos SET estado = 'T' WHERE idprestamo = _idprestamo;
        UPDATE usuarios SET estado = 1 , inactive_at = NOW() WHERE idusuario = _idbene;
        UPDATE libros l SET l.cantidad = l.cantidad + _count_ocupados
        WHERE l.idlibro = (SELECT idlibro FROM ejemplares WHERE idejemplar = (SELECT MIN(idejemplar)
                FROM librosentregados WHERE idlibroentregado = _idlibroentregado));
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_update_devoluciones` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_update_devoluciones` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_update_devoluciones`(
	IN _idlibroentregado INT,
	IN _idprestamos INT,
	-- IN _idejemplar INT,
	IN _condiciondevolucion VARCHAR(50),
	IN _observaciones   VARCHAR(50)	
)
BEGIN
	 DECLARE cantidad_actual INT;
	 DECLARE _idbene INT;
	 DECLARE _idlibro INT;
	 DECLARE _idejemplar INT;
	 
	 select idejemplar into _idejemplar
	 from librosentregados where idlibroentregado = _idlibroentregado;
	 
	 UPDATE librosentregados SET
	 condiciondevolucion = _condiciondevolucion,
	 observaciones = _observaciones,
	 fechadevolucion = NOW()
	 WHERE idlibroentregado = _idlibroentregado;
	
	 -- SELECT idprestamo INTO _idprestamos
	 -- FROM librosentregados WHERE idlibroentregado = _idlibroentregado;
	 
	 SELECT idlibro INTO _idlibro
	 FROM ejemplares WHERE idejemplar = _idejemplar;
	 
	 SELECT idbeneficiario INTO _idbene
	 FROM prestamos WHERE idprestamo = _idprestamos;
	 
	 UPDATE usuarios SET estado = 1
	 WHERE idusuario = _idbene;
	 
	 UPDATE prestamos SET
	 estado = 'T'
	 WHERE idprestamo = _idprestamos;
	 
	 UPDATE ejemplares SET ocupado = 'NO'
	 WHERE idejemplar = _idejemplar;
	
	SELECT cantidad INTO cantidad_actual
	FROM libros
	WHERE idlibro = _idlibro;
	
        -- SE actualiza la cantidad del libro
        UPDATE libros
        SET cantidad = cantidad_actual + 1
        WHERE idlibro = _idlibro;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_update_ejemplar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_update_ejemplar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_update_ejemplar`(
    IN _idejemplar INT,
    IN _condiciondevolucion VARCHAR(50),
    IN _observaciones VARCHAR(50),
    IN _idlibroentregado INT
)
BEGIN
    DECLARE _count_ocupados INT;
    DECLARE _idbene INT;
    DECLARE _idprestamo INT;
    DECLARE _idlibro INT;
    DECLARE _cantidadactual SMALLINT;
    
    SELECT idlibro INTO _idlibro
    FROM ejemplares WHERE idejemplar = _idejemplar;
    
    SELECT idprestamo INTO _idprestamo
    FROM librosentregados WHERE idlibroentregado = _idlibroentregado;
	
    SELECT idbeneficiario INTO _idbene
    FROM prestamos WHERE idprestamo = _idprestamo;
    
    UPDATE ejemplares SET
    ocupado = 'NO'
    WHERE idejemplar = _idejemplar;
    
    UPDATE librosentregados SET
    fechadevolucion =  NOW(),
    condiciondevolucion = _condiciondevolucion,
    observaciones = _observaciones
    WHERE idlibroentregado = _idlibroentregado;
    
    SELECT cantidad INTO _cantidadactual
    FROM libros
    WHERE idlibro = _idlibro;

    -- SE actualiza la cantidad del libro
    UPDATE libros
    SET cantidad = _cantidadactual + 1
    WHERE idlibro = _idlibro;

    -- Contar los idejemplar asociados al idprestamo que tienen ocupado='SI'
    SELECT COUNT(*) INTO _count_ocupados
    FROM ejemplares ej
    JOIN librosentregados le ON ej.idejemplar = le.idejemplar
    WHERE le.idprestamo = _idprestamo
        AND ej.ocupado = 'SI';

    -- Actualizar el estado del préstamo en función de la cantidad de ejemplares ocupados
    IF _count_ocupados = 0 THEN
        UPDATE prestamos SET estado = 'T' WHERE idprestamo = _idprestamo;
        UPDATE usuarios SET estado = 1 WHERE idusuario = _idbene;
    ELSE
        UPDATE prestamos SET estado = 'D' WHERE idprestamo = _idprestamo;
    END IF;
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
