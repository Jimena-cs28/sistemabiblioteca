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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `detalleautores` */

insert  into `detalleautores`(`iddetalleautor`,`idlibro`,`idautor`,`creat_at`,`update_at`,`inactive_at`) values 
(1,1,3,'2023-11-29 15:05:35',NULL,NULL),
(2,2,2,'2023-11-29 15:06:45',NULL,NULL),
(3,3,2,'2023-11-29 15:08:03',NULL,NULL),
(4,4,2,'2023-11-29 15:11:13',NULL,NULL),
(5,5,1,'2023-11-29 15:12:26',NULL,NULL),
(6,6,3,'2023-11-29 15:13:38',NULL,NULL),
(7,7,3,'2023-11-29 15:15:39',NULL,NULL),
(8,8,2,'2023-11-29 15:18:17',NULL,NULL),
(9,9,1,'2023-11-29 15:25:46',NULL,NULL),
(10,10,2,'2023-11-29 15:28:17',NULL,NULL),
(11,13,3,'2023-11-30 01:32:38',NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ejemplares` */

insert  into `ejemplares`(`idejemplar`,`idlibro`,`codigo_libro`,`ocupado`,`estado`,`creat_at`,`update_at`,`inactive_at`) values 
(1,1,1,'NO','1','2023-11-29 15:05:35',NULL,NULL),
(2,1,2,'SI','1','2023-11-29 15:05:35',NULL,NULL),
(3,1,3,'SI','1','2023-11-29 15:05:35',NULL,NULL),
(4,2,4,'NO','1','2023-11-29 15:06:45',NULL,NULL),
(5,2,5,'NO','1','2023-11-29 15:06:45',NULL,NULL),
(6,2,6,'SI','1','2023-11-29 15:06:45',NULL,NULL),
(7,2,7,'SI','1','2023-11-29 15:06:45',NULL,NULL),
(8,2,8,'SI','1','2023-11-29 15:06:45',NULL,NULL),
(9,2,9,'SI','1','2023-11-29 15:06:45',NULL,NULL),
(10,2,10,'SI','1','2023-11-29 15:06:45',NULL,NULL),
(11,2,11,'NO','1','2023-11-29 15:06:45',NULL,NULL),
(12,2,12,'NO','1','2023-11-29 15:06:45',NULL,NULL),
(13,2,13,'NO','1','2023-11-29 15:06:45',NULL,NULL),
(14,2,14,'NO','1','2023-11-29 15:06:45',NULL,NULL),
(15,3,15,'NO','1','2023-11-29 15:08:03',NULL,NULL),
(16,3,16,'NO','1','2023-11-29 15:08:03',NULL,NULL),
(17,3,17,'NO','1','2023-11-29 15:08:03',NULL,NULL),
(18,3,18,'NO','1','2023-11-29 15:08:03',NULL,NULL),
(19,3,19,'NO','1','2023-11-29 15:08:03',NULL,NULL),
(20,3,20,'NO','1','2023-11-29 15:08:03',NULL,NULL),
(21,3,21,'NO','1','2023-11-29 15:08:03',NULL,NULL),
(22,3,22,'NO','1','2023-11-29 15:08:03',NULL,NULL),
(23,3,23,'NO','1','2023-11-29 15:08:03',NULL,NULL),
(24,3,24,'NO','1','2023-11-29 15:08:03',NULL,NULL),
(25,3,25,'NO','1','2023-11-29 15:08:03',NULL,NULL),
(26,3,26,'NO','1','2023-11-29 15:08:03',NULL,NULL),
(27,4,27,'NO','1','2023-11-29 15:11:13',NULL,NULL),
(28,4,28,'NO','1','2023-11-29 15:11:13',NULL,NULL),
(29,4,29,'NO','1','2023-11-29 15:11:13',NULL,NULL),
(30,4,30,'NO','1','2023-11-29 15:11:13',NULL,NULL),
(31,4,31,'NO','1','2023-11-29 15:11:13',NULL,NULL),
(32,4,32,'NO','1','2023-11-29 15:11:13',NULL,NULL),
(33,4,33,'NO','1','2023-11-29 15:11:13',NULL,NULL),
(34,4,34,'NO','1','2023-11-29 15:11:14',NULL,NULL),
(35,4,35,'NO','1','2023-11-29 15:11:14',NULL,NULL),
(36,4,36,'NO','1','2023-11-29 15:11:14',NULL,NULL),
(37,4,37,'NO','1','2023-11-29 15:11:14',NULL,NULL),
(38,4,38,'NO','1','2023-11-29 15:11:14',NULL,NULL),
(39,5,39,'NO','0','2023-11-29 15:12:26',NULL,'2023-11-29 19:23:10'),
(40,5,40,'NO','1','2023-11-29 15:12:26',NULL,NULL),
(41,5,41,'NO','1','2023-11-29 15:12:26',NULL,NULL),
(42,5,42,'NO','1','2023-11-29 15:12:26',NULL,NULL),
(43,5,43,'SI','1','2023-11-29 15:12:26',NULL,NULL),
(44,5,44,'NO','1','2023-11-29 15:12:26',NULL,NULL),
(45,5,45,'NO','1','2023-11-29 15:12:26',NULL,NULL),
(46,5,46,'NO','1','2023-11-29 15:12:26',NULL,NULL),
(47,5,47,'NO','1','2023-11-29 15:12:26',NULL,NULL),
(48,6,48,'NO','1','2023-11-29 15:13:38',NULL,NULL),
(49,6,49,'NO','1','2023-11-29 15:13:38',NULL,NULL),
(50,6,50,'NO','1','2023-11-29 15:13:38',NULL,NULL),
(51,6,51,'NO','1','2023-11-29 15:13:38',NULL,NULL),
(52,6,52,'NO','1','2023-11-29 15:13:38',NULL,NULL),
(53,6,53,'NO','1','2023-11-29 15:13:38',NULL,NULL),
(54,6,54,'NO','1','2023-11-29 15:13:38',NULL,NULL),
(55,6,55,'NO','1','2023-11-29 15:13:38',NULL,NULL),
(56,6,56,'NO','1','2023-11-29 15:13:38',NULL,NULL),
(57,6,57,'NO','1','2023-11-29 15:13:38',NULL,NULL),
(58,6,58,'NO','1','2023-11-29 15:13:38',NULL,NULL),
(59,6,59,'NO','1','2023-11-29 15:13:38',NULL,NULL),
(60,7,60,'NO','0','2023-11-29 15:15:39',NULL,'2023-11-29 20:36:45'),
(61,7,61,'NO','1','2023-11-29 15:15:39',NULL,NULL),
(62,7,62,'NO','1','2023-11-29 15:15:39',NULL,NULL),
(63,7,63,'NO','1','2023-11-29 15:15:40',NULL,NULL),
(64,7,64,'NO','0','2023-11-29 15:15:40',NULL,'2023-11-30 21:00:52'),
(65,7,65,'NO','1','2023-11-29 15:15:40',NULL,NULL),
(66,7,66,'NO','1','2023-11-29 15:15:40',NULL,NULL),
(67,7,67,'NO','1','2023-11-29 15:15:40',NULL,NULL),
(68,7,68,'NO','1','2023-11-29 15:15:40',NULL,NULL),
(69,7,69,'NO','1','2023-11-29 15:15:40',NULL,NULL),
(70,7,70,'NO','1','2023-11-29 15:15:40',NULL,NULL),
(71,7,71,'NO','1','2023-11-29 15:15:40',NULL,NULL),
(72,7,72,'NO','1','2023-11-29 15:15:40',NULL,NULL),
(73,7,73,'NO','1','2023-11-29 15:15:40',NULL,NULL),
(74,7,74,'NO','1','2023-11-29 15:15:40',NULL,NULL),
(75,7,75,'NO','1','2023-11-29 15:15:40',NULL,NULL),
(76,7,76,'NO','1','2023-11-29 15:15:40',NULL,NULL),
(77,7,77,'NO','1','2023-11-29 15:15:40',NULL,NULL),
(78,7,78,'NO','1','2023-11-29 15:15:40',NULL,NULL),
(79,7,79,'NO','1','2023-11-29 15:15:40',NULL,NULL),
(80,7,80,'NO','1','2023-11-29 15:15:40',NULL,NULL),
(81,7,81,'NO','1','2023-11-29 15:15:40',NULL,NULL),
(82,8,82,'SI','1','2023-11-29 15:18:17',NULL,NULL),
(83,8,83,'SI','1','2023-11-29 15:18:17',NULL,NULL),
(84,8,84,'SI','1','2023-11-29 15:18:17',NULL,NULL),
(85,8,85,'SI','1','2023-11-29 15:18:17',NULL,NULL),
(86,8,86,'SI','1','2023-11-29 15:18:17',NULL,NULL),
(87,8,87,'SI','1','2023-11-29 15:18:17',NULL,NULL),
(88,8,88,'SI','1','2023-11-29 15:18:17',NULL,NULL),
(89,8,89,'SI','1','2023-11-29 15:18:17',NULL,NULL),
(90,8,90,'SI','1','2023-11-29 15:18:17',NULL,NULL),
(91,8,91,'NO','1','2023-11-29 15:18:17',NULL,NULL),
(92,8,92,'NO','1','2023-11-29 15:18:17',NULL,NULL),
(93,8,93,'NO','1','2023-11-29 15:18:17',NULL,NULL),
(94,8,94,'NO','1','2023-11-29 15:18:17',NULL,NULL),
(95,8,95,'NO','1','2023-11-29 15:18:17',NULL,NULL),
(96,8,96,'NO','1','2023-11-29 15:18:17',NULL,NULL),
(97,8,97,'NO','1','2023-11-29 15:18:17',NULL,NULL),
(98,8,98,'NO','1','2023-11-29 15:18:17',NULL,NULL),
(99,8,99,'NO','1','2023-11-29 15:18:17',NULL,NULL),
(100,8,100,'NO','1','2023-11-29 15:18:17',NULL,NULL),
(101,8,101,'NO','1','2023-11-29 15:18:17',NULL,NULL),
(102,8,102,'NO','1','2023-11-29 15:18:18',NULL,NULL),
(103,9,103,'NO','1','2023-11-29 15:25:46',NULL,NULL),
(104,9,104,'NO','1','2023-11-29 15:25:46',NULL,NULL),
(105,9,105,'NO','1','2023-11-29 15:25:46',NULL,NULL),
(106,9,106,'NO','1','2023-11-29 15:25:46',NULL,NULL),
(107,9,107,'NO','1','2023-11-29 15:25:46',NULL,NULL),
(108,9,108,'NO','1','2023-11-29 15:25:46',NULL,NULL),
(109,9,109,'NO','1','2023-11-29 15:25:46',NULL,NULL),
(110,9,110,'NO','1','2023-11-29 15:25:46',NULL,NULL),
(111,9,111,'NO','1','2023-11-29 15:25:46',NULL,NULL),
(112,9,112,'NO','1','2023-11-29 15:25:46',NULL,NULL),
(113,9,113,'NO','1','2023-11-29 15:25:46',NULL,NULL),
(114,9,114,'NO','1','2023-11-29 15:25:46',NULL,NULL),
(115,10,115,'NO','0','2023-11-29 15:28:17',NULL,NULL),
(116,10,116,'NO','0','2023-11-29 15:28:17',NULL,NULL),
(117,10,117,'NO','0','2023-11-29 15:28:17',NULL,NULL),
(118,10,118,'NO','0','2023-11-29 15:28:17',NULL,NULL),
(119,10,119,'NO','0','2023-11-29 15:28:18',NULL,NULL),
(120,10,120,'NO','1','2023-11-29 15:28:18',NULL,NULL),
(121,10,121,'NO','1','2023-11-29 15:28:18',NULL,NULL),
(122,10,122,'NO','1','2023-11-29 15:28:18',NULL,NULL),
(123,10,123,'NO','1','2023-11-29 15:28:18',NULL,NULL),
(124,10,124,'NO','1','2023-11-29 15:28:18',NULL,NULL),
(125,10,125,'NO','1','2023-11-29 15:28:18',NULL,NULL),
(126,10,126,'NO','1','2023-11-29 15:28:18',NULL,NULL),
(127,10,127,'NO','1','2023-11-29 15:28:18',NULL,NULL),
(128,10,128,'NO','1','2023-11-29 15:28:18',NULL,NULL),
(129,10,129,'NO','1','2023-11-29 15:28:18',NULL,NULL),
(130,10,130,'NO','1','2023-11-29 15:28:18',NULL,NULL),
(131,10,131,'NO','1','2023-11-29 15:28:18',NULL,NULL),
(132,10,132,'NO','1','2023-11-29 15:28:18',NULL,NULL),
(133,10,133,'NO','1','2023-11-29 15:28:18',NULL,NULL),
(134,10,134,'NO','1','2023-11-29 15:28:18',NULL,NULL),
(135,10,135,'NO','1','2023-11-29 15:28:18',NULL,NULL),
(136,10,136,'NO','1','2023-11-29 15:28:18',NULL,NULL),
(137,10,137,'NO','1','2023-11-29 15:28:18',NULL,NULL),
(138,10,138,'NO','1','2023-11-29 15:28:18',NULL,NULL),
(139,10,139,'NO','1','2023-11-29 15:28:18',NULL,NULL),
(140,10,140,'NO','1','2023-11-29 15:28:18',NULL,NULL),
(141,10,141,'NO','1','2023-11-29 15:28:18',NULL,NULL),
(142,10,142,'NO','1','2023-11-29 15:28:18',NULL,NULL),
(143,10,143,'NO','1','2023-11-29 15:28:18',NULL,NULL),
(144,10,144,'NO','1','2023-11-29 15:28:18',NULL,NULL),
(145,8,145,'NO','1','2023-11-29 19:09:11',NULL,NULL),
(146,8,146,'NO','1','2023-11-29 19:09:11',NULL,NULL),
(147,1,147,'SI','1','2023-11-29 19:32:58',NULL,NULL),
(148,1,148,'SI','1','2023-11-29 19:32:58',NULL,NULL),
(149,1,149,'NO','1','2023-11-29 19:32:58',NULL,NULL),
(150,1,150,'NO','1','2023-11-29 19:32:58',NULL,NULL),
(151,1,151,'NO','1','2023-11-29 19:32:58',NULL,NULL),
(152,5,48,'NO','1','2023-11-29 20:47:22',NULL,NULL),
(153,1,152,'NO','1','2023-11-29 20:51:34',NULL,NULL),
(154,13,153,'NO','1','2023-11-30 01:32:38',NULL,NULL),
(155,13,154,'NO','1','2023-11-30 01:32:38',NULL,NULL),
(156,13,155,'NO','1','2023-11-30 01:32:38',NULL,NULL),
(157,13,156,'NO','1','2023-11-30 01:32:38',NULL,NULL),
(158,13,157,'NO','1','2023-11-30 01:32:38',NULL,NULL),
(159,13,158,'NO','1','2023-11-30 01:32:38',NULL,NULL),
(160,13,159,'NO','1','2023-11-30 01:32:38',NULL,NULL),
(161,13,160,'NO','1','2023-11-30 01:32:38',NULL,NULL),
(162,13,161,'NO','1','2023-11-30 01:32:38',NULL,NULL),
(163,13,162,'NO','1','2023-11-30 01:32:38',NULL,NULL),
(164,13,163,'NO','1','2023-11-30 01:32:38',NULL,NULL),
(165,13,164,'NO','1','2023-11-30 01:32:38',NULL,NULL),
(166,13,165,'NO','1','2023-11-30 21:44:00',NULL,NULL),
(167,1,153,'NO','1','2023-11-30 21:47:28',NULL,NULL),
(168,1,154,'NO','1','2023-11-30 21:48:49',NULL,NULL),
(169,1,155,'NO','1','2023-11-30 21:49:11',NULL,NULL),
(170,5,49,'NO','1','2023-11-30 21:50:06',NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `libros` */

insert  into `libros`(`idlibro`,`idsubcategoria`,`ideditorial`,`libro`,`tipo`,`cantidad`,`numeropaginas`,`codigo`,`edicion`,`formato`,`anio`,`idioma`,`descripcion`,`imagenportada`,`create_at`,`update_at`,`inactive_at`,`estado`) values 
(1,5,3,'Física conceptual','texto',12,233,534.000,'','Mediano','2023-10-31','Español','','b36634a8bfcc1396e2978a86f6109972ea7cf21e.jpg','2023-11-29 15:05:35',NULL,NULL,'1'),
(2,5,2,'El mentor de matematicas','texto',12,54,513.000,'','Mediano','2010-04-04','Español','','97a4a7f5b043deabd251b570924e6771d5e4bd25.jpg','2023-11-29 15:06:45',NULL,NULL,'1'),
(3,5,1,'La biblia física y química ','texto',12,122,533.000,'','Mediano','0000-00-00','Español','','8f9fdb499d2464e5ffe3be387ab82ffd0f4e489a.jpg','2023-11-29 15:08:03',NULL,NULL,'1'),
(4,15,3,'La Biblia de las ciencias naturales','texto',12,231,581.000,'','Mediano','2009-02-22','Español','','4e87d276c24cb9042ee5096e1d6949dcf4fd1959.jpg','2023-11-29 15:11:13',NULL,NULL,'1'),
(5,6,3,'Atlas del cuerpo humano','',11,123,574.000,'','Mediano','0000-00-00','','','47807017b180438662eb758ad91c647da2794c4a.jpg','2023-11-29 15:12:26',NULL,NULL,'1'),
(6,4,3,'Atlas del cielo','',12,99,525.000,'','Mediano','0000-00-00','','','10bfd8627412f3225b8b2ea0a5574381967f0a07.jpg','2023-11-29 15:13:38',NULL,NULL,'1'),
(7,17,2,'La odisea','texto',22,121,883.000,'','Mediano','2010-05-05','Español','Naufragios, dioses irritados y hechizos: Odiseo tendrá que superar estos obstáculos si quiere regresar al lado de su amada esposa, Penélope','79b017a50a2c6aedbf55ce0d243b9a63f7dba7cc.jpg','2023-11-29 15:15:39',NULL,NULL,'1'),
(8,8,3,'Dracula','',23,211,820.008,'nose','Mediano','0000-00-00','','','433c680083340d35425ff2afeabeb0759e56b9ac.jpg','2023-11-29 15:18:17',NULL,NULL,'1'),
(9,18,1,'Los 7 habitos de los adolescentes altamente efectivos','texto',12,0,151.000,'','Mediano','0000-00-00','','','b7af718d8ad6b5a71e2b06a0d2e3faccb2e50cbc.jpg','2023-11-29 15:25:46',NULL,NULL,'1'),
(10,11,2,'La ciudad de los perros','texto',30,23,869.056,'','Mediano','2014-03-31','Español','','2d65566a0fe71c0798adb33bb4e9b0f3fa4a60e8.jpg','2023-11-29 15:28:17',NULL,NULL,'1'),
(13,11,2,'Don Quijote de la Mancha','texto',13,100,868.003,'','Mediano','2005-06-06','Español','4A','b4008ed4e525a3794845e39176fbd558305a895c.jpg','2023-11-30 01:32:37',NULL,NULL,'1');

/*Table structure for table `librosentregados` */

DROP TABLE IF EXISTS `librosentregados`;

CREATE TABLE `librosentregados` (
  `idlibroentregado` int(11) NOT NULL AUTO_INCREMENT,
  `idprestamo` int(11) NOT NULL,
  `idejemplar` int(11) NOT NULL,
  `condicionentrega` varchar(50) DEFAULT NULL,
  `condiciondevolucion` varchar(50) DEFAULT NULL,
  `observaciones` varchar(40) DEFAULT NULL,
  `fechadevolucion` datetime DEFAULT NULL,
  PRIMARY KEY (`idlibroentregado`),
  KEY `fk_idejemplar_libroentre` (`idejemplar`),
  KEY `fk_prestamo_libentre` (`idprestamo`),
  CONSTRAINT `fk_idejemplar_libroentre` FOREIGN KEY (`idejemplar`) REFERENCES `ejemplares` (`idejemplar`),
  CONSTRAINT `fk_prestamo_libentre` FOREIGN KEY (`idprestamo`) REFERENCES `prestamos` (`idprestamo`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `librosentregados` */

insert  into `librosentregados`(`idlibroentregado`,`idprestamo`,`idejemplar`,`condicionentrega`,`condiciondevolucion`,`observaciones`,`fechadevolucion`) values 
(1,1,60,'bien','Deteriorado','mal','2023-11-30 00:00:00'),
(2,3,27,'bien','bien','bien','2023-11-29 18:40:50'),
(3,3,30,'bien','bien','bien','2023-11-29 18:40:50'),
(4,3,29,'bien','bien','bien','2023-11-29 18:40:50'),
(5,3,28,'bien','bien','bien','2023-11-29 18:40:50'),
(6,4,110,'bien',NULL,NULL,'2023-12-01 00:00:00'),
(7,5,39,'bien','mal','no entregado','2023-11-30 00:00:00'),
(8,5,40,'bien','bien','bien','2023-11-29 20:35:07'),
(9,5,42,'bien','bien','bien','2023-11-30 00:00:00'),
(10,5,43,'bien','bien','bien','2023-11-30 00:00:00'),
(11,5,41,'bien','bien','bien','2023-11-30 00:00:00'),
(12,6,115,'bien','bien','bien','2023-11-30 18:51:32'),
(13,6,116,'bien','bien','bien','2023-11-30 18:51:32'),
(14,6,118,'bien','bien','bien','2023-11-30 18:51:32'),
(15,6,119,'bien','Mal','sin pasta','2023-11-30 00:00:00'),
(16,6,117,'bien','bien','bien','2023-11-30 18:51:32'),
(17,7,27,'bien','bien','bien','2023-11-30 18:51:45'),
(18,7,35,'bien','bien','bien','2023-11-30 18:51:45'),
(19,7,31,'bien','bien','bien','2023-11-30 18:51:45'),
(20,7,28,'bien','bien','bien','2023-11-30 18:51:45'),
(21,8,141,'bien',NULL,NULL,'2023-12-04 00:00:00'),
(22,8,115,'bien',NULL,NULL,'2023-12-01 00:00:00'),
(23,8,116,'bien',NULL,NULL,'2023-12-01 00:00:00'),
(24,8,121,'bien',NULL,NULL,'2023-12-04 00:00:00'),
(25,9,41,'bien','bien','bien','2023-11-30 18:11:56'),
(26,9,40,'bien','bien','bien','2023-11-30 18:11:56'),
(27,10,42,'bien','bien','bien','2023-11-30 18:51:56'),
(28,11,115,'bien',NULL,NULL,'2023-12-01 00:00:00'),
(29,11,116,'bien',NULL,NULL,'2023-12-01 00:00:00'),
(30,12,4,'bien','bien','bien','2023-11-30 23:02:35'),
(31,12,5,'bien','bien','bien','2023-11-30 23:02:35'),
(32,13,43,'bien',NULL,NULL,'2023-11-30 00:00:00'),
(33,14,59,'bien','bien','bien','2023-11-30 18:22:04'),
(34,14,155,'bien','bien','bien','2023-11-30 18:22:04'),
(35,14,154,'bien','bien','bien','2023-11-30 18:22:04'),
(36,15,41,'bien','bien','bien','2023-11-30 18:24:07'),
(37,15,11,'bien','bien','bien','2023-11-30 18:24:07'),
(38,15,12,'bien','bien','bien','2023-11-30 18:24:07'),
(39,15,40,'bien','bien','bien','2023-11-30 18:24:07'),
(40,16,2,'bien','bien','bien','2023-11-30 18:27:58'),
(41,16,1,'bien','bien','bien','2023-11-30 18:27:58'),
(42,17,61,'bien','Bien','Bien','2023-12-01 00:00:00'),
(43,17,62,'bien','Bien','Bien','2023-12-01 00:00:00'),
(44,17,63,'bien','Deteriorado','sin pasta','2023-12-01 00:00:00'),
(45,17,65,'bien','Deteriorado','sin pasta','2023-12-01 00:00:00'),
(46,17,64,'bien','Deteriorado','no se devolvio','2023-12-01 00:00:00'),
(47,17,66,'bien','Deteriorado','sin pasta','2023-12-01 00:00:00'),
(48,17,68,'bien','BIEN','BIEN','2023-11-30 21:15:07'),
(49,17,67,'bien','Deteriorado','mal','2023-12-01 00:00:00'),
(50,17,69,'bien','BIEN','BIEN','2023-11-30 21:15:07'),
(51,17,70,'bien','BIEN','BIEN','2023-11-30 21:15:07'),
(52,2,15,'bien','bien','bien','2023-11-30 21:31:42'),
(53,19,16,'bien','bien','bien','2023-11-30 21:38:05'),
(54,20,17,'bien','bien','bien','2023-11-30 21:31:20'),
(55,18,15,'bien',NULL,NULL,'2023-12-01 00:00:00'),
(56,21,154,'bien','bien','bien','2023-11-30 22:15:54'),
(57,21,155,'bien','bien','bien','2023-11-30 22:15:54'),
(58,21,157,'bien','bien','bien','2023-11-30 22:15:54'),
(59,21,158,'bien','bien','bien','2023-11-30 22:15:54'),
(60,21,159,'bien','bien','bien','2023-11-30 22:15:54'),
(61,21,156,'bien','bien','bien','2023-11-30 22:15:54'),
(62,21,160,'bien','bien','bien','2023-11-30 22:15:54'),
(63,21,163,'bien','bien','bien','2023-11-30 22:15:54'),
(64,21,162,'bien','bien','bien','2023-11-30 22:15:54'),
(65,21,161,'bien','bien','bien','2023-11-30 22:15:54'),
(66,23,6,'bien',NULL,NULL,'2023-12-01 00:00:00'),
(67,23,7,'bien',NULL,NULL,'2023-12-01 00:00:00'),
(68,23,8,'bien',NULL,NULL,'2023-12-01 00:00:00'),
(69,23,10,'bien',NULL,NULL,'2023-12-01 00:00:00'),
(70,23,9,'bien',NULL,NULL,'2023-12-01 00:00:00'),
(71,24,82,'bien',NULL,NULL,'2023-12-01 00:00:00'),
(72,24,85,'bien',NULL,NULL,'2023-12-01 00:00:00'),
(73,24,84,'bien',NULL,NULL,'2023-12-01 00:00:00'),
(74,24,83,'bien',NULL,NULL,'2023-12-01 00:00:00'),
(75,25,2,'bien',NULL,NULL,'2023-12-01 00:00:00'),
(76,25,3,'bien',NULL,NULL,'2023-12-01 00:00:00'),
(77,25,147,'bien',NULL,NULL,'2023-12-01 00:00:00'),
(78,25,148,'bien',NULL,NULL,'2023-12-01 00:00:00'),
(79,25,1,'bien','Bien','Bien','2023-12-01 00:00:00'),
(80,26,87,'bien',NULL,NULL,'2023-12-01 00:00:00'),
(81,26,89,'bien',NULL,NULL,'2023-12-01 00:00:00'),
(82,26,88,'bien',NULL,NULL,'2023-12-01 00:00:00'),
(83,26,86,'bien',NULL,NULL,'2023-12-01 00:00:00'),
(84,26,90,'bien',NULL,NULL,'2023-12-01 00:00:00'),
(85,28,115,'bien','mal','no se devolvio','2023-11-30 23:09:33'),
(86,28,116,'bien','mal','no se devolvio','2023-11-30 23:09:33'),
(87,28,118,'bien','mal','no se devolvio','2023-11-30 23:09:33'),
(88,28,117,'bien','mal','no se devolvio','2023-11-30 23:09:33'),
(89,28,119,'bien','mal','no se devolvio','2023-11-30 23:09:33');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `personas` */

insert  into `personas`(`idpersona`,`apellidos`,`nombres`,`nrodocumento`,`tipodocumento`,`fechanac`,`direccion`,`telefono`,`email`,`create_at`,`update_at`,`inactive_at`) values 
(1,'Berrocal paima','Luis Fernando','76543001','DNI','0000-00-00','Sunampe','964513274','','2023-11-14 20:04:43',NULL,NULL),
(2,'Cartagena Salazar','Jimena Adriana','73194180','DNI','0000-00-00','El carmen','','95107563','2023-11-14 20:04:43',NULL,NULL),
(3,'Cardenas Martinez','Maria Luisa','88678671','DNI','0000-00-00','','961770778','','2023-11-15 17:34:31',NULL,NULL),
(4,'Cartagena Salazar','Adriana Jimena','68754574','DNI','0000-00-00','Grocio Prado','950478703','','2023-11-17 22:10:26',NULL,NULL),
(5,'Flores Vilcapuma','Juan Miguel','65742687','DNI','0000-00-00','Grocio Prado','930704500','','2023-11-17 23:09:29',NULL,NULL),
(6,'Belleza Quispe','Kiara ','68276870','DNI','0000-00-00','Chincha Baja','','','2023-11-17 23:10:50',NULL,NULL),
(7,'Nicaragua Navarro','Jhon Francia','78710787','DNI','0000-00-00','Sunampe','950847870','','2023-11-17 23:12:24',NULL,NULL),
(8,'Turco Blanco','Juan Gabriel','47187168','DNI','0000-00-00','','928725757','','2023-11-21 21:00:57',NULL,NULL),
(9,'Turco Blanco','Juan Gabriel','57282068','DNI','0000-00-00','','956500007','','2023-11-21 21:02:05',NULL,NULL),
(10,'Blanco Turco','Juan','2706807','DNI','0000-00-00','Sunampe','958752405','','2023-11-21 21:03:43',NULL,NULL),
(11,'Tasayco Gomez','Raúl','72890192','DNI','1990-10-10','Chincha Alta','938789282','','2023-11-21 21:04:32',NULL,NULL),
(12,'Moron Roblez','Jasira Angela','57468484','DNI','0000-00-00','Grocio Prado','956404584','','2023-11-22 22:10:20',NULL,NULL),
(13,'Lopez García','Elizabeth','78290181','DNI','0000-00-00','Chincha Baja','928782981','','2023-11-25 19:45:10',NULL,NULL),
(15,'Garcia','Fred alfredo','68725872','DNI','0000-00-00','chincha baja','','','2023-11-25 21:18:51',NULL,NULL),
(16,'Huaman Condori','Maria Alejandra','63527687','DNI','0000-00-00','','987204687','','2023-11-29 18:04:47',NULL,NULL);

/*Table structure for table `prestamos` */

DROP TABLE IF EXISTS `prestamos`;

CREATE TABLE `prestamos` (
  `idprestamo` int(11) NOT NULL AUTO_INCREMENT,
  `idbeneficiario` int(11) NOT NULL,
  `idbibliotecario` int(11) DEFAULT NULL,
  `idlibro` int(11) DEFAULT NULL,
  `cantidad` smallint(6) DEFAULT NULL,
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
  KEY `fk_idlibro_prestamo` (`idlibro`),
  CONSTRAINT `fk_idbene_prestamo` FOREIGN KEY (`idbeneficiario`) REFERENCES `usuarios` (`idusuario`),
  CONSTRAINT `fk_idbiblio_prestamo` FOREIGN KEY (`idbibliotecario`) REFERENCES `usuarios` (`idusuario`),
  CONSTRAINT `fk_idlibro_prestamo` FOREIGN KEY (`idlibro`) REFERENCES `libros` (`idlibro`),
  CONSTRAINT `ck_enbiblio_presta` CHECK (`enbiblioteca` in ('SI','NO')),
  CONSTRAINT `ck_estado_ore` CHECK (`estado` in ('E','S','R','D','T','N'))
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `prestamos` */

insert  into `prestamos`(`idprestamo`,`idbeneficiario`,`idbibliotecario`,`idlibro`,`cantidad`,`fechasolicitud`,`fechaprestamo`,`fecharespuesta`,`fechaentrega`,`descripcion`,`enbiblioteca`,`lugardestino`,`estado`,`activo`) values 
(1,4,1,NULL,NULL,'2023-11-29 18:02:43','2023-11-29 00:00:00',NULL,'2023-11-29 19:20:06','1A','SI',NULL,'T','1'),
(2,2,NULL,3,1,'2023-11-29 18:08:26','2023-11-30 00:00:00','2023-11-30 18:53:16','2023-11-30 21:19:07','4B','SI','','T','1'),
(3,12,1,NULL,NULL,'2023-11-29 18:36:52','2023-11-29 18:36:52',NULL,'2023-11-29 18:36:52','Religion','SI',NULL,'T','1'),
(4,6,1,NULL,NULL,'2023-11-29 18:43:23','2023-12-01 00:00:00',NULL,NULL,'2A','SI',NULL,'N','1'),
(5,7,1,NULL,NULL,'2023-11-29 19:22:25','2023-11-29 19:22:25',NULL,'2023-11-29 19:22:25','3M','SI',NULL,'T','1'),
(6,4,1,NULL,NULL,'2023-11-29 20:54:52','2023-11-29 20:54:52',NULL,'2023-11-29 20:54:52','1A','SI',NULL,'T','1'),
(7,12,1,NULL,NULL,'2023-11-29 21:33:45','2023-11-29 21:33:45',NULL,'2023-11-29 21:33:45','Religion','SI',NULL,'T','1'),
(8,15,1,NULL,NULL,'2023-11-29 21:37:45','2023-11-30 00:00:00',NULL,NULL,'3M','SI',NULL,'N','1'),
(9,2,1,NULL,NULL,'2023-11-29 23:08:28','2023-12-01 00:00:00',NULL,'2023-11-30 00:14:30','4A','SI',NULL,'T','1'),
(10,5,1,NULL,NULL,'2023-11-30 00:15:39','2023-11-30 00:00:00',NULL,'2023-11-30 00:15:54','1A','SI',NULL,'T','1'),
(11,6,1,NULL,NULL,'2023-11-30 01:11:55','2023-12-01 00:00:00',NULL,'2023-11-30 01:24:26','3M','SI',NULL,'T','1'),
(12,7,1,NULL,NULL,'2023-11-30 01:23:08','2023-12-01 00:00:00',NULL,'2023-11-30 21:19:04','3M','SI',NULL,'T','1'),
(13,15,1,NULL,NULL,'2023-11-30 01:24:02','2023-12-01 00:00:00',NULL,'2023-11-30 20:28:06','4A','SI',NULL,'D','1'),
(14,13,2,NULL,NULL,'2023-11-30 18:13:36','2023-11-30 00:00:00',NULL,'2023-11-30 18:21:32','3M','SI',NULL,'T','1'),
(15,13,2,NULL,NULL,'2023-11-30 18:22:56','2023-12-01 00:00:00',NULL,'2023-11-30 18:23:45','3M','SI',NULL,'T','1'),
(16,13,2,NULL,2,'2023-11-30 18:24:34','2023-11-30 18:24:34',NULL,'2023-11-30 18:24:34','3M','SI',NULL,'T','1'),
(17,13,2,NULL,10,'2023-11-30 18:28:15','2023-11-30 18:28:15',NULL,'2023-11-30 18:28:15','3M','SI',NULL,'T','1'),
(18,2,NULL,3,1,'2023-11-30 21:16:40','2023-11-30 00:00:00','2023-11-30 21:32:51',NULL,'4B','SI','','N','1'),
(19,14,2,NULL,NULL,'2023-11-30 21:18:52','2023-12-01 00:00:00',NULL,'2023-11-30 21:33:07','3M','SI',NULL,'T','1'),
(20,7,2,NULL,NULL,'2023-11-30 21:30:39','2023-11-30 21:30:39',NULL,'2023-11-30 21:30:39','3M','SI',NULL,'T','1'),
(21,13,2,NULL,NULL,'2023-11-30 21:42:18','2023-12-01 00:00:00',NULL,'2023-11-30 22:15:41','3M','SI',NULL,'T','1'),
(22,5,2,NULL,NULL,'2023-11-30 22:01:13','2023-11-30 22:01:13',NULL,'2023-11-30 22:01:13','1A','SI',NULL,'E','1'),
(23,12,2,NULL,NULL,'2023-11-30 22:02:06','2023-11-30 22:02:06',NULL,'2023-11-30 22:02:06','Religion','SI',NULL,'D','1'),
(24,6,2,NULL,NULL,'2023-11-30 22:03:58','2023-11-30 22:03:58',NULL,'2023-11-30 22:03:58','3M','SI',NULL,'D','1'),
(25,5,2,NULL,NULL,'2023-11-30 22:07:01','2023-11-30 22:07:01',NULL,'2023-11-30 22:07:01','1A','SI',NULL,'D','1'),
(26,7,2,NULL,NULL,'2023-11-30 22:14:22','2023-11-30 22:14:22',NULL,'2023-11-30 22:14:22','3M','SI',NULL,'D','1'),
(27,3,NULL,3,1,'2023-11-30 22:21:15','2023-11-30 00:00:00',NULL,NULL,'4B','SI','','S','1'),
(28,4,2,NULL,NULL,'2023-11-30 22:59:39','2023-12-04 00:00:00',NULL,'2023-11-30 23:01:00','1A','SI',NULL,'T','1');

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(14,10,'Historia de américa del sur',980,'2023-11-14 20:09:42',NULL,NULL),
(15,6,'Plantas',580,'2023-11-27 23:59:12',NULL,NULL),
(17,9,'Literatura Helénica, Literatura Griega Clásica',880,'2023-11-28 00:03:45',NULL,NULL),
(18,2,'Psicología',150,'2023-11-28 00:11:47',NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `usuarios` */

insert  into `usuarios`(`idusuario`,`idpersona`,`idrol`,`nombreusuario`,`claveacceso`,`create_at`,`update_at`,`inactive_at`,`estado`) values 
(1,1,1,'75123489','$2y$10$1EwQL/puaUQHsn3KpLDQge.QJ5zTmDQ3PmQkd2du.4H91O8UsatWC','2023-11-14 20:04:56',NULL,NULL,'1'),
(2,2,3,'78674219','$2y$10$1EwQL/puaUQHsn3KpLDQge.QJ5zTmDQ3PmQkd2du.4H91O8UsatWC','2023-11-14 20:04:56',NULL,'2023-11-30 23:42:42','0'),
(3,3,3,'Maria12','$2y$10$pjvcVk3.cIXv36rbkzd1se1x3hMkwJuhFb9hxWzntIVVJXXHJ4aOO','2023-11-15 17:34:31',NULL,'2023-11-30 23:10:42','1'),
(4,4,3,'Adri12','$2y$10$BAFdgrEAUrbCiAvJqXK1JewmEmWD4z6elZ/SbjfPL6AtlAdtycXyK','2023-11-17 22:10:26',NULL,'2023-11-30 23:11:42','1'),
(5,5,2,'Juan12','$2y$10$DO47kyJla58I/3HnjIfwqODpmZpT0d92aC98PJvnhzt0iA.CAu.0a','2023-11-17 23:09:29',NULL,'2023-11-30 22:07:03','1'),
(6,6,3,'Kiarabq','$2y$10$uwF4lFXTH1mw4yw.lXX7HeVTMGAr10dRPE4DnypxrX5oYb3quMvum','2023-11-17 23:10:50',NULL,'2023-11-30 23:12:04','1'),
(7,7,3,'JhonF','$2y$10$Cp0BSJyKCFSKllRAZ/.DA.8Eu3BR/IC4IdUi0.Yj3rWAGUz7hPSRG','2023-11-17 23:12:24',NULL,'2023-11-30 23:13:07','1'),
(11,11,2,'72890192','$2y$10$1EwQL/puaUQHsn3KpLDQge.QJ5zTmDQ3PmQkd2du.4H91O8UsatWC','2023-11-21 21:04:32',NULL,'2023-11-25 22:00:23','1'),
(12,12,2,'54165','$2y$10$IAtQzGqfXelNXJfSkEt8i.5UxQkdDQgf0xTvrjxWcdbPLN0h.0NkO','2023-11-22 22:10:20',NULL,'2023-11-30 22:02:07','1'),
(13,13,3,'78290181','$2y$10$1EwQL/puaUQHsn3KpLDQge.QJ5zTmDQ3PmQkd2du.4H91O8UsatWC','2023-11-25 19:45:10',NULL,'2023-11-30 23:13:36','1'),
(14,15,3,'Fred12','$2y$10$DGRQGH1Ch28HBqHokIY6.u01dcMoXXz1/aJxq5Fah345UG5.zu9Oe','2023-11-25 21:18:51',NULL,'2023-11-30 21:18:54','1'),
(15,16,2,'Ale12','$2y$10$hawx981.c.gQRjCAPIQQOeVPoUcibqg1lEhSLhUNCgPQtqOT72qgO','2023-11-29 18:04:47',NULL,'2023-11-30 01:24:05','1');

/* Procedure structure for procedure `GRAFICO_INDEX` */

/*!50003 DROP PROCEDURE IF EXISTS  `GRAFICO_INDEX` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GRAFICO_INDEX`()
BEGIN
	SELECT  COUNT(ejemplares.idlibro) AS 'totales', libros.libro
	FROM librosentregados
	INNER JOIN ejemplares ON ejemplares.idejemplar = librosentregados.idejemplar
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	WHERE prestamos.estado = 'T'
	GROUP BY ejemplares.idlibro
	ORDER BY totales DESC
	LIMIT 7;
END */$$
DELIMITER ;

/* Procedure structure for procedure `ReporteLibrosPrestadosPorCategoria` */

/*!50003 DROP PROCEDURE IF EXISTS  `ReporteLibrosPrestadosPorCategoria` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ReporteLibrosPrestadosPorCategoria`()
BEGIN
    SELECT c.categoria, COUNT(p.idprestamo) as CantidadPrestada
    FROM categorias c
    LEFT JOIN subcategorias sc ON c.idcategoria = sc.idcategoria
    LEFT JOIN libros l ON sc.idsubcategoria = l.idsubcategoria
    LEFT JOIN ejemplares e ON l.idlibro = e.idlibro
    LEFT JOIN librosentregados le ON e.idejemplar = le.idejemplar
    LEFT JOIN prestamos p ON le.idprestamo = p.idprestamo
    WHERE p.estado = 'D' -- Cambiar según el estado de préstamo deseado
    GROUP BY c.idcategoria;
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

/* Procedure structure for procedure `spu_activar_estado_ejem` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_activar_estado_ejem` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_activar_estado_ejem`(
	in _idejemplar int
)
begin
	update ejemplares set
	estado = 1,
	update_at = now()
	where idejemplar = _idejemplar;
	
end */$$
DELIMITER ;

/* Procedure structure for procedure `spu_actualizar_ejemplares` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_actualizar_ejemplares` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_actualizar_ejemplares`(
    IN p_idlibro INT,
    IN p_nueva_cantidad INT
)
BEGIN
    DECLARE cantidad_actual INT;
    DECLARE diferencia INT;
    DECLARE i INT DEFAULT 1;
    DECLARE nuevo_codigo_libro INT;

    -- Obtener la cantidad actual de ejemplares para el libro
    SELECT COUNT(*) INTO cantidad_actual FROM ejemplares WHERE idlibro = p_idlibro;

    -- Calcular la diferencia entre la cantidad actual y la nueva cantidad
    SET diferencia = p_nueva_cantidad - cantidad_actual;

    -- Obtener el último código_libro global
    SELECT COALESCE(MAX(codigo_libro), 0) INTO nuevo_codigo_libro FROM ejemplares;

    -- Ajustar el nuevo código_libro según la diferencia
    SET nuevo_codigo_libro = nuevo_codigo_libro + diferencia;

    IF diferencia > 0 THEN
        -- Aumentar la cantidad de ejemplares
        WHILE i <= diferencia DO
            INSERT INTO ejemplares (idlibro, codigo_libro)
            VALUES (p_idlibro, nuevo_codigo_libro + i);

            SET i = i + 1;
        END WHILE;
    ELSeIF diferencia < 0 THEN
        -- Disminuir la cantidad de ejemplares
        DELETE FROM ejemplares
        WHERE idlibro = p_idlibro
        AND codigo_libro > nuevo_codigo_libro;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_actualizar_estados_librosentregados` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_actualizar_estados_librosentregados` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_actualizar_estados_librosentregados`(
	IN _estado CHAR(1),
	IN _idprestamo INT
)
BEGIN
	UPDATE prestamos SET estado = _estado WHERE idprestamo = _idprestamo;

END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_actualizar_libro` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_actualizar_libro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_actualizar_libro`(
    IN p_idlibro INT, 
    IN p_nueva_cantidad INT
)
BEGIN
    DECLARE v_ultimo_codigo_libro INT;
    DECLARE v_nuevo_codigo_libro INT;
    DECLARE contador INT DEFAULT 1;

    -- Obtener el último número de código_libro para el libro específico
    SELECT COALESCE(MAX(codigo_libro), 0) INTO v_ultimo_codigo_libro
    FROM ejemplares
    WHERE idlibro = p_idlibro;

    -- Verificar si hay ejemplares existentes
    IF v_ultimo_codigo_libro IS NOT NULL THEN
        -- Calcular el nuevo número de código_libro
        SET v_nuevo_codigo_libro = v_ultimo_codigo_libro + 1;

        -- Insertar ejemplares para la nueva cantidad
        WHILE contador <= p_nueva_cantidad DO
            INSERT INTO ejemplares (idlibro, codigo_libro)
            VALUES (p_idlibro, v_nuevo_codigo_libro);

            SET contador = contador + 1;
            SET v_nuevo_codigo_libro = v_nuevo_codigo_libro + 1;
        END WHILE;

        -- Actualizar la cantidad del libro          
        UPDATE libros SET 
        cantidad = cantidad + p_nueva_cantidad
        WHERE idlibro = p_idlibro;

        -- Imprimir mensaje o devolver resultado si es necesario
        SELECT 'Cantidad y código_libro actualizados correctamente' AS 'Mensaje';
    ELSE
        -- Si no hay ejemplares existentes, mostrar mensaje de error
        SELECT 'No hay ejemplares existentes para el libro especificado' AS 'Error';
    END IF;

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

/* Procedure structure for procedure `spu_buscar_libro` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_buscar_libro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_buscar_libro`(
    IN _idlibro INT
)
BEGIN
        SELECT libros.idlibro, libros.imagenportada, libros.libro, subcategorias.subcategoria,
        categorias.categoria, libros.tipo, libros.numeropaginas, libros.codigo,
        CONCAT(autores.autor, " ", autores.apellidos) AS "autor", editoriales.nombres AS "editorial",
        libros.descripcion, (SELECT COUNT(*) FROM ejemplares WHERE idlibro = _idlibro AND ocupado = 'NO' AND estado = 1) AS "cantidad"
	FROM libros
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN detalleautores ON detalleautores.idlibro = libros.idlibro
	INNER JOIN autores ON autores.idautor = detalleautores.idautor
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria
	INNER JOIN editoriales ON editoriales.ideditorial = libros.ideditorial 
	WHERE libros.idlibro = _idlibro;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_cambiarEstado_Devolucion` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_cambiarEstado_Devolucion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_cambiarEstado_Devolucion`(IN _idprestamo INT)
BEGIN
    -- Actualizar el estado de los ejemplares con ocupado='SI' asociados al idprestamo a 0
    UPDATE ejemplares
    SET estado = '0'
    WHERE idejemplar IN (SELECT le.idejemplar FROM librosentregados le JOIN ejemplares e ON le.idejemplar = e.idejemplar
        WHERE le.idprestamo = _idprestamo AND e.ocupado = 'SI');
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_cancelar_reserva` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_cancelar_reserva` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_cancelar_reserva`(
	in _idprestamo int
)
begin
	declare _idbene int;
	
	select idbeneficiario into _idbene
	from prestamos where idprestamo = _idprestamo;
	
    -- Actualizar ejemplares a 'NO' para los idejemplar asociados al idprestamo
    UPDATE ejemplares ej
    JOIN librosentregados le ON ej.idejemplar = le.idejemplar
    SET ej.ocupado = 'NO'
    WHERE le.idprestamo = _idprestamo;
	
    update usuarios set 
    estado = '1'
    where idusuario = _idbene;
    
    update prestamos 
    set estado = 'N'
    where idprestamo = _idprestamo;
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
	SELECT COUNT(idprestamo) AS 'categorias'
	FROM prestamos where estado = 'S';
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
	FROM prestamos where estado = 'T';
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

/* Procedure structure for procedure `spu_datos_personales` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_datos_personales` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_datos_personales`(
	in _idusuario int
)
begin
	select idusuario, concat(personas.apellidos, ' ', personas.nombres) as 'Datos', personas.nrodocumento, personas.fechanac, personas.direccion,
	personas.telefono, personas.email, usuarios.nombreusuario, roles.nombrerol
	from usuarios
	inner join personas on personas.idpersona = usuarios.idpersona
	inner join roles on roles.idrol = usuarios.idrol
	where usuarios.idusuario = _idusuario;
end */$$
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

/* Procedure structure for procedure `spu_ejemplarlibro` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_ejemplarlibro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_ejemplarlibro`(
	IN _idlibro INT
)
BEGIN 
	SELECT* FROM ejemplares WHERE estado = 1 AND ocupado = "NO" AND idlibro = _idlibro;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_ejemplar_idlibro` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_ejemplar_idlibro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_ejemplar_idlibro`(
	IN _idlibro INT
)
BEGIN	
	SELECT ejemplares.idejemplar, libros.libro, libros.codigo, ejemplares.codigo_libro, ejemplares.ocupado, ejemplares.estado
	FROM ejemplares
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	WHERE ejemplares.idlibro = _idlibro
	ORDER BY idejemplar ASC;
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
	SELECT usuarios.idusuario, CONCAT(personas.nombres,' ', personas.apellidos, ' - ',roles.nombrerol) AS 'nombres', usuarios.estado
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
	GROUP BY ejemplares.idlibro
	ORDER BY totales DESC
	LIMIT 5;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_historial` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_historial` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_historial`(
	IN _idusuario INT
)
BEGIN
	SELECT prestamos.idprestamo, libros.libro AS 'libro', libros.imagenportada, prestamos.descripcion,fechasolicitud, 
	DATE(fechaprestamo) AS 'fechaprestamo', prestamos.estado,
	prestamos.cantidad
	FROM prestamos
	INNER JOIN librosentregados ON librosentregados.idprestamo = prestamos.idprestamo
	INNER JOIN ejemplares ON ejemplares.idejemplar = librosentregados.idejemplar
	LEFT JOIN libros ON libros.idlibro = ejemplares.idlibro
	INNER JOIN usuarios  ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE prestamos.idbeneficiario = _idusuario
	ORDER BY fechaprestamo DESC;
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
	WHERE usuarios.idrol = 3 AND estado = 0
	ORDER BY idusuario DESC;
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
	WHERE usuarios.idrol = 2 AND estado = 0
	ORDER BY idusuario desc;
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

	DECLARE _idbene INT;
	
	SELECT idbeneficiario INTO _idbene
	FROM prestamos
	WHERE idprestamo = _idprestamo;

        -- Registra el libro entregado
	INSERT INTO librosentregados (idprestamo, idejemplar, condicionentrega,fechadevolucion) VALUES
			(_idprestamo,_idejemplar, _condicionEntrega,_fechadevolución);
        
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
	DECLARE _idbene INT;
	IF _fechadevolución = "" THEN SET _fechadevolución = NULL; END IF;

	
	SELECT idbeneficiario INTO _idbene
	FROM prestamos
	WHERE idprestamo = _idprestamo;
	-- select * from prestamos
		
	    -- Verifica si hay suficientes libros disponibles para restar
    
        -- Registra el libro entregado
	INSERT INTO librosentregados (idprestamo, idejemplar, condicionentrega,fechadevolucion) VALUES
			(_idprestamo,_idejemplar, _condicionEntrega,_fechadevolución);
        
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
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listado_libros` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listado_libros` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listado_libros`()
BEGIN
	SELECT ej.idlibro, det.iddetalleautor, cat.categoria, sub.subcategoria, lib.libro, COUNT(ej.idlibro) AS 'Disponible' , 
	lib.cantidad AS 'cantidad', lib.codigo, CONCAT(aut.autor, ' ', aut.apellidos) AS 'autor'
	FROM subcategorias sub
	JOIN categorias cat ON sub.idcategoria = cat.idcategoria
	JOIN libros lib ON sub.idsubcategoria = lib.idsubcategoria
	JOIN detalleautores det ON lib.idlibro = det.idlibro
	JOIN autores aut ON det.idautor = aut.idautor
	LEFT JOIN ejemplares ej ON lib.idlibro = ej.idlibro
	WHERE ej.ocupado = 'NO' AND ej.estado = 1
	GROUP BY ej.idlibro
	order by ej.idlibro desc;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_devolucionpendientes` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_devolucionpendientes` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_devolucionpendientes`()
BEGIN
	SELECT prestamos.idprestamo, prestamos.idbeneficiario, CONCAT( personas.nombres, ' ', personas.apellidos) AS 'nombres', prestamos.descripcion, prestamos.fechasolicitud, prestamos.fechaentrega, prestamos.fechaprestamo
	FROM prestamos
	INNER JOIN usuarios ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE prestamos.estado = 'D'
	ORDER BY idprestamo DESC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_ejemplares` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_ejemplares` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_ejemplares`(
	IN _idlibro INT,
	IN _cantidad INT
)
BEGIN
	SELECT idejemplar, codigo_libro FROM ejemplares WHERE idlibro = _idlibro AND ocupado = 'NO' AND estado = 1 LIMIT _cantidad;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_entregaspendiente` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_entregaspendiente` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_entregaspendiente`()
BEGIN   
	SELECT prestamos.idprestamo, librosentregados.idlibroentregado, libros.libro, libros.idlibro, libros.codigo, libros.imagenportada,CONCAT( personas.nombres, ' ', personas.apellidos) AS 'nombres', prestamos.descripcion, 
	prestamos.fechasolicitud, DATE(fechaprestamo) AS 'fechaprestamo'
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN ejemplares ON ejemplares.idejemplar = librosentregados.idejemplar
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	INNER JOIN usuarios ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE prestamos.estado = 'R'
	-- order by librosentregados.idlibroentregado
	GROUP BY prestamos.idprestamo desc;
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
	SELECT librosentregados.idlibroentregado, ejemplares.idejemplar, ejemplares.codigo_libro, libros.codigo, libros.imagenportada, roles.nombrerol, CONCAT(personas.nombres, ' ',personas.apellidos) AS 'nombres', 
	prestamos.descripcion,librosentregados.condicionentrega,librosentregados.condiciondevolucion, librosentregados.observaciones, categorias.categoria, 
	subcategorias.subcategoria, libros.libro, prestamos.fechasolicitud, prestamos.fechaentrega, prestamos.fechaprestamo, librosentregados.fechadevolucion, prestamos.lugardestino,
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
	CONCAT(autores.autor, ' ', autores.apellidos) AS "autor", editoriales.nombres AS "editorial",
	(SELECT COUNT(*) FROM ejemplares WHERE idlibro = libros.idlibro AND ejemplares.ocupado = 'NO' AND ejemplares.estado = 1) AS "cantidad"
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

/* Procedure structure for procedure `spu_listar_reporte` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_reporte` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_reporte`()
begin
	SELECT c.idcategoria, c.categoria, COUNT(p.idprestamo) AS 'CantidadPrestada'
	FROM categorias c
	LEFT JOIN subcategorias sc ON c.idcategoria = sc.idcategoria
	LEFT JOIN libros l ON sc.idsubcategoria = l.idsubcategoria
	LEFT JOIN ejemplares e ON l.idlibro = e.idlibro
	LEFT JOIN librosentregados le ON e.idejemplar = le.idejemplar
	LEFT JOIN prestamos p ON le.idprestamo = p.idprestamo
	GROUP BY c.idcategoria;
end */$$
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
	SELECT idprestamo,prestamos.`fechasolicitud`, prestamos.descripcion, prestamos.enbiblioteca,
	fechaprestamo, prestamos.fechaentrega, CONCAT(personas.nombres, ' ', personas.apellidos) AS 'Nombres'
	FROM prestamos
	INNER JOIN usuarios ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.`idpersona` = usuarios.`idpersona`
	WHERE prestamos.estado = 'T'
	ORDER BY idprestamo desc;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_list_libro` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_list_libro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_list_libro`(	
)
BEGIN
	SELECT libros.idlibro, libros.libro, libros.imagenportada, subcategorias.subcategoria, categorias.categoria, libros.tipo, libros.codigo,
	CONCAT(autores.autor, " ",autores.apellidos) AS "autor", editoriales.nombres AS "editorial", 
	(SELECT COUNT(*) FROM ejemplares WHERE idlibro = libros.idlibro AND ocupado = 'NO' AND estado = 1) AS "cantidad"
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
	personas.nrodocumento, personas.fechanac, personas.direccion,
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
	SELECT detalleautores.iddetalleautor, libros.idlibro, libros.libro, categorias.categoria, subcategorias.subcategoria, CONCAT(editoriales.nombres,' ', editoriales.paisorigen) AS 'Editorial',
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

/* Procedure structure for procedure `spu_obtener_libroentregado` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_obtener_libroentregado` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_obtener_libroentregado`(
	IN _idlibroentregado INT
)
BEGIN
	SELECT librosentregados.idlibroentregado, concat(personas.nombres, ' ',personas.apellidos) 'nombres' , personas.apellidos, prestamos.descripcion,
	libros.libro, prestamos.fechasolicitud, DATE(fechaprestamo) AS 'fechaprestamo', DATE(fechadevolucion) AS 'fechadevolucion'
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN ejemplares ON ejemplares.idejemplar = librosentregados.idejemplar
	inner join libros on libros.idlibro = ejemplares.idlibro
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

/* Procedure structure for procedure `spu_registrar_libros_entregados` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_registrar_libros_entregados` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_registrar_libros_entregados`(
	IN _idejemplar INT,
	IN _observacion VARCHAR(50),
	IN _idprestamo INT,
	IN _fechadevolucion DATETIME
	
)
BEGIN
	INSERT INTO librosentregados(idprestamo, idejemplar, condicionentrega, fechadevolucion) 
	VALUE (_idprestamo, _idejemplar, _observacion, _fechadevolucion);
	
	UPDATE ejemplares SET ocupado = 'SI' WHERE idejemplar = _idejemplar;
	UPDATE prestamos SET fecharespuesta = NOW() WHERE idprestamo = _idprestamo;
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

/* Procedure structure for procedure `spu_registrar_solicitud_usuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_registrar_solicitud_usuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_registrar_solicitud_usuario`(
	IN _idlibro INT,
	IN _idbeneficiario INT,
	IN _cantidad INT,
	IN _descripcion VARCHAR(20),
	IN _enbiblioteca CHAR(2),
	IN _lugardestino VARCHAR(100),
	IN _fechaprestamo DATETIME
)
BEGIN
	INSERT INTO prestamos(idlibro, idbeneficiario, cantidad, descripcion, enbiblioteca, lugardestino, fechaprestamo, estado) VALUES 
	(_idlibro, _idbeneficiario, _cantidad, _descripcion, _enbiblioteca, 
	_lugardestino, _fechaprestamo, 'S');

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
	SELECT idlibroentregado, categorias.categoria, subcategorias.subcategoria, libros.libro, 
	CONCAT(personas.nombres, ' ' ,personas.apellidos) AS 'nombres',	prestamos.descripcion
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN ejemplares ON ejemplares.idejemplar = librosentregados.idejemplar
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria
	INNER JOIN usuarios ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE prestamos.estado = 'T' AND prestamos.descripcion = _descripcion
	GROUP BY personas.nombres;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_reporte_fechasolicitud` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_reporte_fechasolicitud` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_reporte_fechasolicitud`( 
	in _fechasolicitud date,
	in _fechasolicitud1 date
)
begin
	SELECT c.idcategoria, c.categoria, COUNT(p.idprestamo) AS 'CantidadPrestada'
	FROM categorias c
	LEFT JOIN subcategorias sc ON c.idcategoria = sc.idcategoria
	LEFT JOIN libros l ON sc.idsubcategoria = l.idsubcategoria
	LEFT JOIN ejemplares e ON l.idlibro = e.idlibro
	LEFT JOIN librosentregados le ON e.idejemplar = le.idejemplar
	LEFT JOIN prestamos p ON le.idprestamo = p.idprestamo
	wHERE date(p.fechasolicitud) BETWEEN _fechasolicitud AND _fechasolicitud1
	GROUP BY c.idcategoria;
end */$$
DELIMITER ;

/* Procedure structure for procedure `spu_search_book` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_search_book` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_search_book`(
	in _nombre varchar(50)
)
begin
	SELECT ej.idlibro, det.iddetalleautor, cat.categoria, sub.subcategoria, lib.libro, COUNT(ej.idlibro) AS 'Disponible' , 
	lib.cantidad AS 'cantidad', lib.codigo, CONCAT(aut.autor, ' ', aut.apellidos) AS 'autor'
	FROM subcategorias sub
	JOIN categorias cat ON sub.idcategoria = cat.idcategoria
	JOIN libros lib ON sub.idsubcategoria = lib.idsubcategoria
	JOIN detalleautores det ON lib.idlibro = det.idlibro
	JOIN autores aut ON det.idautor = aut.idautor
	LEFT JOIN ejemplares ej ON lib.idlibro = ej.idlibro
	WHERE ej.ocupado = 'NO' AND ej.estado = 1 and (_nombre ="" OR lib.libro LIKE CONCAT("%",_nombre, "%"))
	GROUP BY ej.idlibro;
end */$$
DELIMITER ;

/* Procedure structure for procedure `spu_search_prestamo` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_search_prestamo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_search_prestamo`(
	in _nombres varchar(50)
)
begin
	SELECT idprestamo,prestamos.`fechasolicitud`, prestamos.descripcion, prestamos.enbiblioteca,
	fechaprestamo, prestamos.fechaentrega, CONCAT(personas.nombres, ' ', personas.apellidos) AS 'Nombres'
	FROM prestamos
	INNER JOIN usuarios ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.`idpersona` = usuarios.`idpersona`
	WHERE prestamos.estado = 'T' and (_nombres ="" OR personas.nombres LIKE CONCAT("%",_nombres, "%"))
	ORDER BY idprestamo DESC;
end */$$
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
	SELECT prestamos.idprestamo, CONCAT(personas.nombres, '' , personas.apellidos) AS 'Nombres', libros.libro AS 'libro', prestamos.descripcion,fechasolicitud, 
	DATE(fechaprestamo) AS 'fechaprestamo', prestamos.cantidad, libros.idlibro
	FROM prestamos
	INNER JOIN libros ON libros.idlibro = prestamos.idlibro
	INNER JOIN usuarios  ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE prestamos.estado = 'S';
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

/* Procedure structure for procedure `spu_traer_grado` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_traer_grado` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_traer_grado`(
	in _idusuario int
)
begin 
	SELECT u.idusuario, p.descripcion
	FROM usuarios u
-- JOIN roles r ON u.idrol = r.idrol
	JOIN prestamos p ON u.idusuario = p.idbeneficiario
	WHERE u.idusuario = _idusuario and p.estado = 'T'
	group by u.idusuario;
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
    -- IN _idlibroentregado INT,
    IN _condiciondevolucion VARCHAR(50),
    IN _observaciones  VARCHAR(50)
)
BEGIN
    DECLARE _count_ocupados INT;

    -- Actualizar ejemplares a 'NO' y registrar observaciones y fecha de devolución para los idejemplar asociados al idprestamo
    UPDATE ejemplares ej
    JOIN librosentregados le ON ej.idejemplar = le.idejemplar
    SET ej.ocupado = 'NO',
        le.observaciones = _observaciones,
        le.condiciondevolucion = _condiciondevolucion,
        le.fechadevolucion = NOW()
    WHERE le.idprestamo = _idprestamo AND ej.ocupado = 'SI';

    -- Verificar si todos los idejemplar tienen ocupado='NO'
    SELECT COUNT(*) INTO _count_ocupados
    FROM ejemplares ej
    JOIN librosentregados le ON ej.idejemplar = le.idejemplar
    WHERE le.idprestamo = _idprestamo AND ej.ocupado = 'NO';

    -- Si todos los idejemplar tienen ocupado='NO', actualizar el estado del préstamo a 'T'
    IF _count_ocupados > 0 THEN
        UPDATE prestamos SET estado = 'T' WHERE idprestamo = _idprestamo;
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
    IN _idlibroentregado INT
)
BEGIN
    DECLARE _count_ocupados INT;
    DECLARE _idbene INT;
    DECLARE _idprestamo INT;
    
    SELECT idprestamo INTO _idprestamo
    FROM librosentregados WHERE idlibroentregado = _idlibroentregado;
	
    SELECT idbeneficiario INTO _idbene
    FROM prestamos WHERE idprestamo = _idprestamo;
    
    UPDATE ejemplares SET
    ocupado = 'NO'
    WHERE idejemplar = _idejemplar;
    
    UPDATE librosentregados SET
    condiciondevolucion = 'Bien',
    observaciones = 'Bien'
    WHERE idlibroentregado = _idlibroentregado;


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

/* Procedure structure for procedure `spu_update_ejemplar_mal` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_update_ejemplar_mal` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_update_ejemplar_mal`(
    IN _idejemplar INT,
    IN _idlibroentregado INT,
    in _observaciones varchar(50),
    in _condiciondevoluciones varchar(20)
)
BEGIN
    DECLARE _count_ocupados INT;
    DECLARE _idbene INT;
    DECLARE _idprestamo INT;
    
    SELECT idprestamo INTO _idprestamo
    FROM librosentregados WHERE idlibroentregado = _idlibroentregado;
	
    SELECT idbeneficiario INTO _idbene
    FROM prestamos WHERE idprestamo = _idprestamo;
    
    UPDATE ejemplares SET
    ocupado = 'NO'
    WHERE idejemplar = _idejemplar;
    
    UPDATE librosentregados SET
    condiciondevolucion = _condiciondevoluciones,
    observaciones = _observaciones
    WHERE idlibroentregado = _idlibroentregado;

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

/* Procedure structure for procedure `spu_validar_libroprestado` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_validar_libroprestado` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_validar_libroprestado`(
	IN _idusuario INT
)
BEGIN
	SELECT COUNT(*) AS 'cantidad' FROM prestamos WHERE idbeneficiario = _idusuario AND estado IN ('S', 'R', 'D') ;

END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
