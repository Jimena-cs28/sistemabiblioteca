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
(1,2,2,'2023-11-14 20:10:38',NULL,NULL),
(2,4,2,'2023-11-17 23:43:29',NULL,NULL),
(3,3,3,'2023-11-17 23:46:32',NULL,NULL),
(4,5,2,'2023-11-18 01:01:51',NULL,NULL),
(5,6,2,'2023-11-18 02:29:30',NULL,NULL),
(6,7,3,'2023-11-18 02:32:15',NULL,NULL),
(7,8,3,'2023-11-27 23:42:38',NULL,NULL),
(8,9,3,'2023-11-27 23:46:22',NULL,NULL),
(9,10,2,'2023-11-28 00:01:17',NULL,NULL),
(10,11,2,'2023-11-28 00:08:31',NULL,NULL),
(11,12,2,'2023-11-28 00:14:35',NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ejemplares` */

insert  into `ejemplares`(`idejemplar`,`idlibro`,`codigo_libro`,`ocupado`,`estado`,`creat_at`,`update_at`,`inactive_at`) values 
(1,2,1,'SI','1','2023-11-14 20:11:01',NULL,'2023-11-18 00:13:52'),
(2,2,2,'SI','1','2023-11-14 20:11:01',NULL,NULL),
(3,2,3,'SI','1','2023-11-14 20:11:01',NULL,NULL),
(4,2,4,'NO','0','2023-11-14 20:11:01',NULL,'2023-11-18 00:35:37'),
(5,2,5,'SI','1','2023-11-14 20:11:01',NULL,NULL),
(6,2,6,'NO','1','2023-11-14 20:11:01',NULL,NULL),
(7,2,7,'NO','1','2023-11-14 20:11:01',NULL,NULL),
(8,2,8,'NO','1','2023-11-14 20:11:01',NULL,NULL),
(9,2,9,'NO','1','2023-11-14 20:11:01',NULL,NULL),
(10,3,10,'NO','0','2023-11-17 23:28:38',NULL,'2023-11-18 00:38:58'),
(11,3,11,'NO','1','2023-11-17 23:28:38',NULL,NULL),
(12,3,12,'NO','0','2023-11-17 23:28:38',NULL,'2023-11-18 18:51:42'),
(13,3,13,'NO','1','2023-11-17 23:28:38',NULL,NULL),
(14,3,14,'SI','1','2023-11-17 23:28:38',NULL,NULL),
(15,3,15,'NO','1','2023-11-17 23:28:38',NULL,NULL),
(16,3,16,'NO','1','2023-11-17 23:28:38',NULL,NULL),
(17,3,17,'NO','1','2023-11-17 23:28:38',NULL,NULL),
(18,3,18,'NO','1','2023-11-17 23:28:38',NULL,NULL),
(19,4,19,'NO','1','2023-11-17 23:43:29',NULL,NULL),
(20,4,20,'NO','1','2023-11-17 23:43:29',NULL,NULL),
(21,4,21,'NO','1','2023-11-17 23:43:29',NULL,NULL),
(22,4,22,'NO','1','2023-11-17 23:43:30',NULL,NULL),
(23,5,23,'SI','1','2023-11-18 01:01:51','2023-11-27 21:21:49',NULL),
(24,5,24,'SI','1','2023-11-18 01:01:51','2023-11-27 21:22:00','2023-11-22 18:07:23'),
(25,5,25,'NO','1','2023-11-18 01:01:51','2023-11-27 22:59:26',NULL),
(26,5,26,'NO','1','2023-11-18 01:01:51','2023-11-27 22:59:28',NULL),
(27,5,27,'NO','1','2023-11-18 01:01:51','2023-11-27 22:59:30',NULL),
(28,5,28,'NO','1','2023-11-18 01:01:51','2023-11-27 22:59:33',NULL),
(29,5,29,'NO','0','2023-11-18 01:01:51',NULL,NULL),
(30,5,30,'NO','0','2023-11-18 01:01:51',NULL,NULL),
(31,5,31,'NO','1','2023-11-18 01:01:51',NULL,NULL),
(32,5,32,'SI','1','2023-11-18 01:01:51',NULL,NULL),
(33,5,33,'NO','1','2023-11-18 01:01:51',NULL,NULL),
(34,5,34,'SI','1','2023-11-18 01:01:51',NULL,NULL),
(35,5,35,'NO','1','2023-11-18 01:01:51',NULL,NULL),
(36,5,36,'NO','1','2023-11-18 01:01:51',NULL,NULL),
(37,5,37,'NO','1','2023-11-18 01:01:51',NULL,NULL),
(38,5,38,'NO','1','2023-11-18 01:01:51','2023-11-27 22:59:42',NULL),
(39,5,39,'NO','1','2023-11-18 01:01:51','2023-11-27 22:59:40',NULL),
(40,5,40,'NO','1','2023-11-18 01:01:51',NULL,NULL),
(41,5,41,'NO','1','2023-11-18 01:01:51',NULL,NULL),
(42,5,42,'NO','1','2023-11-18 01:01:51',NULL,NULL),
(43,5,43,'NO','1','2023-11-18 01:01:51',NULL,NULL),
(44,6,44,'NO','0','2023-11-18 02:29:30',NULL,NULL),
(45,6,45,'NO','0','2023-11-18 02:29:30',NULL,NULL),
(46,6,46,'NO','1','2023-11-18 02:29:30','2023-11-27 21:31:52',NULL),
(47,6,47,'NO','1','2023-11-18 02:29:31','2023-11-27 21:31:15',NULL),
(48,6,48,'NO','1','2023-11-18 02:29:31',NULL,NULL),
(49,6,49,'NO','1','2023-11-18 02:29:31',NULL,NULL),
(50,6,50,'NO','1','2023-11-18 02:29:31',NULL,NULL),
(51,6,51,'NO','1','2023-11-18 02:29:31',NULL,NULL),
(52,6,52,'NO','1','2023-11-18 02:29:31',NULL,NULL),
(53,6,53,'NO','1','2023-11-18 02:29:31',NULL,NULL),
(54,6,54,'NO','1','2023-11-18 02:29:31',NULL,NULL),
(55,6,55,'NO','1','2023-11-18 02:29:31',NULL,NULL),
(56,7,56,'NO','0','2023-11-18 02:32:15',NULL,'2023-11-22 18:04:22'),
(57,7,57,'NO','0','2023-11-18 02:32:15',NULL,NULL),
(58,7,58,'NO','0','2023-11-18 02:32:15',NULL,NULL),
(59,7,59,'NO','0','2023-11-19 22:21:15',NULL,NULL),
(60,7,60,'NO','0','2023-11-19 22:21:15',NULL,NULL),
(61,7,61,'NO','0','2023-11-19 22:21:15',NULL,NULL),
(62,4,23,'NO','1','2023-11-19 22:22:51',NULL,NULL),
(63,4,24,'NO','1','2023-11-19 22:22:51',NULL,NULL),
(64,4,25,'NO','1','2023-11-19 22:22:51',NULL,NULL),
(65,5,62,'NO','1','2023-11-19 22:25:17',NULL,NULL),
(66,5,63,'NO','1','2023-11-19 22:25:17',NULL,NULL),
(67,5,64,'SI','1','2023-11-19 22:25:17',NULL,NULL),
(68,4,65,'NO','1','2023-11-21 00:05:46',NULL,NULL),
(69,4,66,'NO','0','2023-11-21 00:05:46',NULL,'2023-11-25 21:34:16'),
(70,4,67,'NO','1','2023-11-21 00:05:46',NULL,NULL),
(71,7,68,'SI','1','2023-11-21 21:55:51',NULL,NULL),
(72,7,69,'NO','1','2023-11-21 22:05:49',NULL,NULL),
(73,7,70,'NO','1','2023-11-21 22:09:48',NULL,NULL),
(74,7,71,'NO','1','2023-11-21 22:15:08',NULL,NULL),
(75,7,72,'NO','1','2023-11-21 23:01:17',NULL,NULL),
(76,7,73,'NO','1','2023-11-22 21:19:39',NULL,NULL),
(77,7,74,'NO','1','2023-11-22 21:19:52',NULL,NULL),
(78,7,75,'NO','1','2023-11-22 21:54:13',NULL,NULL),
(79,7,76,'NO','1','2023-11-22 21:54:47',NULL,NULL),
(80,7,77,'NO','1','2023-11-22 21:59:19',NULL,NULL),
(82,7,79,'NO','1','2023-11-23 13:52:07',NULL,NULL),
(83,7,80,'NO','1','2023-11-23 13:52:07',NULL,NULL),
(84,7,81,'NO','1','2023-11-23 14:08:14',NULL,NULL),
(85,7,82,'NO','1','2023-11-23 14:08:14',NULL,NULL),
(86,7,83,'NO','1','2023-11-23 14:08:14',NULL,NULL),
(87,2,84,'NO','1','2023-11-23 14:10:44',NULL,NULL),
(88,2,85,'NO','1','2023-11-23 14:11:42',NULL,NULL),
(89,8,86,'NO','1','2023-11-27 23:42:38',NULL,NULL),
(90,8,87,'NO','1','2023-11-27 23:42:38',NULL,NULL),
(91,8,88,'NO','1','2023-11-27 23:42:38',NULL,NULL),
(92,8,89,'NO','1','2023-11-27 23:42:38',NULL,NULL),
(93,8,90,'NO','1','2023-11-27 23:42:38',NULL,NULL),
(94,8,91,'NO','1','2023-11-27 23:42:38',NULL,NULL),
(95,8,92,'NO','1','2023-11-27 23:42:38',NULL,NULL),
(96,8,93,'NO','1','2023-11-27 23:42:38',NULL,NULL),
(97,8,94,'NO','1','2023-11-27 23:42:38',NULL,NULL),
(98,8,95,'NO','1','2023-11-27 23:42:38',NULL,NULL),
(99,8,96,'NO','1','2023-11-27 23:42:38',NULL,NULL),
(100,8,97,'NO','1','2023-11-27 23:42:38',NULL,NULL),
(101,9,98,'NO','1','2023-11-27 23:46:22',NULL,NULL),
(102,9,99,'NO','1','2023-11-27 23:46:22',NULL,NULL),
(103,9,100,'NO','1','2023-11-27 23:46:22',NULL,NULL),
(104,9,101,'NO','1','2023-11-27 23:46:22',NULL,NULL),
(105,9,102,'NO','1','2023-11-27 23:46:22',NULL,NULL),
(106,9,103,'NO','1','2023-11-27 23:46:22',NULL,NULL),
(107,9,104,'NO','1','2023-11-27 23:46:22',NULL,NULL),
(108,9,105,'NO','1','2023-11-27 23:46:22',NULL,NULL),
(109,9,106,'NO','1','2023-11-27 23:46:22',NULL,NULL),
(110,9,107,'NO','1','2023-11-27 23:46:22',NULL,NULL),
(111,9,108,'NO','1','2023-11-27 23:46:22',NULL,NULL),
(112,10,109,'NO','1','2023-11-28 00:01:17',NULL,NULL),
(113,10,110,'NO','1','2023-11-28 00:01:17',NULL,NULL),
(114,10,111,'NO','1','2023-11-28 00:01:17',NULL,NULL),
(115,10,112,'NO','1','2023-11-28 00:01:17',NULL,NULL),
(116,10,113,'NO','1','2023-11-28 00:01:17',NULL,NULL),
(117,10,114,'NO','1','2023-11-28 00:01:17',NULL,NULL),
(118,10,115,'NO','1','2023-11-28 00:01:17',NULL,NULL),
(119,10,116,'NO','1','2023-11-28 00:01:17',NULL,NULL),
(120,10,117,'NO','1','2023-11-28 00:01:17',NULL,NULL),
(121,10,118,'NO','1','2023-11-28 00:01:17',NULL,NULL),
(122,10,119,'NO','1','2023-11-28 00:01:17',NULL,NULL),
(123,10,120,'NO','1','2023-11-28 00:01:17',NULL,NULL),
(124,11,121,'NO','1','2023-11-28 00:08:31',NULL,NULL),
(125,11,122,'NO','1','2023-11-28 00:08:31',NULL,NULL),
(126,11,123,'NO','1','2023-11-28 00:08:31',NULL,NULL),
(127,11,124,'NO','1','2023-11-28 00:08:31',NULL,NULL),
(128,11,125,'NO','1','2023-11-28 00:08:31',NULL,NULL),
(129,11,126,'NO','1','2023-11-28 00:08:31',NULL,NULL),
(130,11,127,'NO','1','2023-11-28 00:08:31',NULL,NULL),
(131,11,128,'NO','1','2023-11-28 00:08:31',NULL,NULL),
(132,11,129,'NO','1','2023-11-28 00:08:31',NULL,NULL),
(133,11,130,'NO','1','2023-11-28 00:08:31',NULL,NULL),
(134,11,131,'NO','1','2023-11-28 00:08:31',NULL,NULL),
(135,11,132,'NO','1','2023-11-28 00:08:31',NULL,NULL),
(136,11,133,'NO','1','2023-11-28 00:08:31',NULL,NULL),
(137,11,134,'NO','1','2023-11-28 00:08:31',NULL,NULL),
(138,11,135,'NO','1','2023-11-28 00:08:31',NULL,NULL),
(139,11,136,'NO','1','2023-11-28 00:08:31',NULL,NULL),
(140,11,137,'NO','1','2023-11-28 00:08:31',NULL,NULL),
(141,11,138,'NO','1','2023-11-28 00:08:31',NULL,NULL),
(142,11,139,'NO','1','2023-11-28 00:08:31',NULL,NULL),
(143,11,140,'NO','1','2023-11-28 00:08:31',NULL,NULL),
(144,11,141,'NO','1','2023-11-28 00:08:31',NULL,NULL),
(145,11,142,'NO','1','2023-11-28 00:08:31',NULL,NULL),
(146,12,143,'NO','1','2023-11-28 00:14:36',NULL,NULL),
(147,12,144,'NO','1','2023-11-28 00:14:36',NULL,NULL),
(148,12,145,'NO','1','2023-11-28 00:14:36',NULL,NULL),
(149,12,146,'NO','1','2023-11-28 00:14:36',NULL,NULL),
(150,12,147,'NO','1','2023-11-28 00:14:36',NULL,NULL),
(151,12,148,'NO','1','2023-11-28 00:14:36',NULL,NULL),
(152,12,149,'NO','1','2023-11-28 00:14:36',NULL,NULL),
(153,12,150,'NO','1','2023-11-28 00:14:36',NULL,NULL),
(154,12,151,'NO','1','2023-11-28 00:14:36',NULL,NULL),
(155,12,152,'NO','1','2023-11-28 00:14:36',NULL,NULL),
(156,12,153,'NO','1','2023-11-28 00:14:36',NULL,NULL),
(157,12,154,'NO','1','2023-11-28 00:14:36',NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `libros` */

insert  into `libros`(`idlibro`,`idsubcategoria`,`ideditorial`,`libro`,`tipo`,`cantidad`,`numeropaginas`,`codigo`,`edicion`,`formato`,`anio`,`idioma`,`descripcion`,`imagenportada`,`create_at`,`update_at`,`inactive_at`,`estado`) values 
(2,1,1,'Historia del mundo contemporáneo','texto',11,132,140.053,'','','0000-00-00','castellano','','','2023-11-14 20:10:19',NULL,'2023-11-17 16:46:34','1'),
(3,6,3,'Atlas del Cuerpo Humano','texto',9,200,574.000,'','Grande','2010-03-14','Español','','5ebd3a899d16780ea9262bcfca2dbb0862dc0711.jpg','2023-11-17 23:28:38',NULL,NULL,'1'),
(4,4,2,'Prueba','texto',10,23,23.200,'','Mediano','2010-11-12','español','solo es una prueba','','2023-11-17 23:43:29',NULL,NULL,'1'),
(5,8,4,'Dracula','Historieta',24,112,820.080,'','Pequeño','2002-04-22','Español','','ca5187750b3191148ad5c97ac0a5f4abb93ac1cd.jpg','2023-11-18 01:01:51',NULL,NULL,'1'),
(6,5,2,'La Biblia de la física y química','texto',12,400,533.000,'','Mediano','0000-00-00','Español','','9215482f122d95dd5f419b17b8ae2ea990d9bf73.jpg','2023-11-18 02:29:30',NULL,NULL,'1'),
(7,5,3,'Física conceptual','texto',21,101,534.000,'nada','mediano','2000-12-12','español','nada','5b4c73af96a588fee2853d208a86bb21a697de9a.jpg','2023-11-18 02:32:14',NULL,NULL,'1'),
(8,4,1,'Atlas del cielo','Texto',12,150,525.000,'','Mediano','2010-02-22','Español','','8077a318a61d722e1212e4303695b4ea152eab5a.jpg','2023-11-27 23:42:38',NULL,NULL,'1'),
(9,3,2,'El mentor de matematicas','texto',11,120,513.000,'','Mediano','0000-00-00','Español','','fe7150d28ece0bd33dc768c71084f6b4cb65664e.jpg','2023-11-27 23:46:22',NULL,NULL,'1'),
(10,15,4,'La Biblia de las ciencias naturales','texto',12,221,581.000,'','Grande','0000-00-00','Español','','14189ddfc23b8045bb3f2afb39dd126dd9383633.jpg','2023-11-28 00:01:16',NULL,NULL,'1'),
(11,17,1,'La Odisea','Texto',22,126,883.000,'','Mediano','2010-01-21','Español','Naufragios, dioses irritados y hechizos: Odiseo tendrá que superar estos obstáculos si quiere regresar al lado de su amada esposa, Penélope. La colección «Libros en Acción», de la editorial Bruño, ada','404ef778562260628aecc1a940e7e8ccd53ee060.jpg','2023-11-28 00:08:31',NULL,NULL,'1'),
(12,18,2,'Los 7 hábitos de los adolescentes altamente efectivos','texto',12,213,151.000,'','Mediano','2009-02-23','Español','','cee5abcfa09adf5c9afe7091f9da52568976cf64.jpg','2023-11-28 00:14:35',NULL,NULL,'1');

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
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `librosentregados` */

insert  into `librosentregados`(`idlibroentregado`,`idprestamo`,`idejemplar`,`condicionentrega`,`condiciondevolucion`,`observaciones`,`fechadevolucion`) values 
(1,2,39,'Nuevo','bien','bien','2023-11-23 22:14:11'),
(2,2,42,'Nuevo','bien','bien','2023-11-23 22:14:11'),
(3,2,43,'Nuevo','bien','bien','2023-11-23 22:14:11'),
(4,2,41,'Nuevo','bien','bien','2023-11-23 22:14:11'),
(5,2,40,'Nuevo','bien','bien','2023-11-23 22:14:11'),
(6,3,39,'Nuevo','bien','bien','2023-11-25 17:00:35'),
(7,3,40,'Nuevo','bien','bien','2023-11-25 17:00:35'),
(8,3,42,'Nuevo','bien','bien','2023-11-25 17:00:35'),
(9,3,41,'Nuevo','bien','bien','2023-11-25 17:00:35'),
(10,3,43,'Nuevo','bien','bien','2023-11-25 17:00:35'),
(11,1,62,'bien','bien','bien','2023-11-25 18:14:26'),
(12,4,23,'bien','bien','bien','2023-11-25 18:13:43'),
(13,4,25,'bien','bien','bien','2023-11-25 18:13:43'),
(14,4,26,'bien','bien','bien','2023-11-25 18:13:43'),
(15,4,27,'bien','bien','bien','2023-11-25 18:13:43'),
(16,4,28,'bien','bien','bien','2023-11-25 18:13:43'),
(17,5,29,'Nuevo','bien','bien','2023-11-25 18:14:40'),
(18,6,44,'','bien','bien','2023-11-25 18:15:34'),
(19,6,45,'','bien','bien','2023-11-25 18:15:34'),
(20,6,46,'','bien','bien','2023-11-25 18:15:34'),
(21,6,47,'','bien','bien','2023-11-25 18:15:34'),
(22,6,48,'','bien','bien','2023-11-25 18:15:34'),
(23,6,49,'','bien','bien','2023-11-25 18:15:34'),
(24,6,50,'','bien','bien','2023-11-25 18:15:34'),
(25,6,51,'','bien','bien','2023-11-25 18:15:34'),
(26,6,52,'','bien','bien','2023-11-25 18:15:34'),
(27,6,53,'','bien','bien','2023-11-25 18:15:34'),
(28,8,57,'','bien','bien','2023-11-25 21:36:02'),
(29,8,58,'','bien','bien','2023-11-25 21:36:02'),
(30,8,59,'','bien','bien','2023-11-25 21:36:02'),
(31,8,60,'','bien','bien','2023-11-25 21:36:02'),
(32,8,61,'','bien','bien','2023-11-25 21:36:02'),
(33,8,68,'','bien','bien','2023-11-25 21:36:02'),
(34,8,69,'','bien','bien','2023-11-25 21:36:02'),
(35,7,23,'','bien','bien','2023-11-25 18:25:56'),
(36,9,11,'','bien','bien','2023-11-25 22:18:43'),
(37,10,19,'','mal','mal','2023-11-25 22:03:29'),
(38,11,23,'','BIEN','BIEN','2023-11-25 21:43:13'),
(39,11,25,'','BIEN','BIEN','2023-11-25 21:43:13'),
(40,11,26,'','BIEN','BIEN','2023-11-25 21:43:13'),
(41,11,27,'','BIEN','BIEN','2023-11-25 21:43:13'),
(42,11,28,'','BIEN','BIEN','2023-11-25 21:43:13'),
(43,11,29,'','BIEN','BIEN','2023-11-25 21:43:13'),
(44,11,30,'','BIEN','BIEN','2023-11-25 21:43:13'),
(45,11,31,'','BIEN','BIEN','2023-11-25 21:43:13'),
(46,11,32,'','BIEN','BIEN','2023-11-25 21:43:13'),
(47,11,33,'','BIEN','BIEN','2023-11-25 21:43:13'),
(48,11,34,'','BIEN','BIEN','2023-11-25 21:43:13'),
(49,11,35,'','BIEN','BIEN','2023-11-25 21:43:13'),
(50,11,36,'','BIEN','BIEN','2023-11-25 21:43:13'),
(51,11,37,'','BIEN','BIEN','2023-11-25 21:43:13'),
(52,11,38,'','BIEN','BIEN','2023-11-25 21:43:13'),
(53,11,39,'','BIEN','BIEN','2023-11-25 21:43:13'),
(54,11,40,'','BIEN','BIEN','2023-11-25 21:43:13'),
(55,11,41,'','BIEN','BIEN','2023-11-25 21:43:13'),
(56,11,42,'','BIEN','BIEN','2023-11-25 21:43:13'),
(57,11,43,'','BIEN','BIEN','2023-11-25 21:43:13'),
(58,11,62,'','BIEN','BIEN','2023-11-25 21:43:13'),
(59,11,63,'','BIEN','BIEN','2023-11-25 21:43:13'),
(60,11,64,'','BIEN','BIEN','2023-11-25 21:43:13'),
(61,12,62,'',NULL,NULL,NULL),
(62,12,63,'',NULL,NULL,NULL),
(63,12,64,'','bien','bien',NULL),
(64,13,13,'Nuevo','BIEN','BIEN','2023-11-25 21:48:56'),
(65,13,14,'Nuevo',NULL,NULL,'2023-11-27 00:00:00'),
(66,14,20,'','mal','mal','2023-11-25 22:06:14'),
(67,15,1,'bien',NULL,NULL,'2023-11-26 00:00:00'),
(68,15,2,'bien',NULL,NULL,'2023-11-26 00:00:00'),
(69,15,5,'bien',NULL,NULL,'2023-11-26 00:00:00'),
(70,15,3,'bien',NULL,NULL,'2023-11-26 00:00:00'),
(71,15,6,'bien','BIEN','BIEN','2023-11-25 21:50:42'),
(72,16,57,'Nuevo','bien','bien','2023-11-25 21:53:26'),
(73,16,58,'Nuevo','bien','bien','2023-11-25 21:53:26'),
(74,16,61,'Nuevo','bien','bien','2023-11-25 21:53:26'),
(75,16,59,'Nuevo','bien','bien','2023-11-25 21:53:26'),
(76,16,71,'Nuevo','bien','bien','2023-11-25 21:53:26'),
(77,16,60,'Nuevo','bien','bien','2023-11-25 21:53:26'),
(78,16,72,'Nuevo','BIEN','BIEN','2023-11-26 00:00:00'),
(79,17,6,'Nuevo','mal','mal','2023-11-25 21:56:54'),
(80,17,7,'Nuevo','mal','mal','2023-11-25 21:56:54'),
(81,18,57,'Nuevo','mal','mal','2023-11-25 22:00:24'),
(82,18,60,'Nuevo','mal','mal','2023-11-25 22:00:24'),
(83,18,61,'Nuevo','mal','mal','2023-11-25 22:00:24'),
(84,18,58,'Nuevo','mal','mal','2023-11-25 22:00:24'),
(85,18,59,'Nuevo','mal','mal','2023-11-25 22:00:24'),
(86,18,71,'Nuevo','mal','mal','2023-11-25 22:00:24'),
(87,18,75,'Nuevo','mal','mal','2023-11-25 22:00:24'),
(88,18,73,'Nuevo','mal','mal','2023-11-25 22:00:24'),
(89,18,72,'Nuevo','mal','mal','2023-11-25 22:00:24'),
(90,18,74,'Nuevo','mal','mal','2023-11-25 22:00:24'),
(91,19,58,'bien','mal','mal','2023-11-25 22:19:54'),
(92,19,59,'bien','mal','mal','2023-11-25 22:19:54'),
(93,19,61,'bien','bien','bien','2023-11-26 00:00:00'),
(94,19,60,'bien','mal','mal','2023-11-25 22:19:54'),
(95,19,57,'bien','mal','mal','2023-11-25 22:19:54'),
(96,20,23,'Nuevo','mal','mal','2023-11-25 22:56:43'),
(97,20,25,'Nuevo','mal','mal','2023-11-25 22:56:43'),
(98,20,29,'Nuevo','mal','mal','2023-11-25 22:56:43'),
(99,20,28,'Nuevo','mal','mal','2023-11-25 22:56:43'),
(100,20,27,'Nuevo','mal','mal','2023-11-25 22:56:43'),
(101,20,26,'Nuevo','mal','mal','2023-11-25 22:56:43'),
(102,20,38,'Nuevo','mal','mal','2023-11-25 22:56:43'),
(103,20,30,'Nuevo','mal','mal','2023-11-25 22:56:43'),
(104,20,39,'Nuevo','mal','mal','2023-11-25 22:56:43'),
(105,21,57,'Nuevo','mal','mal','2023-11-25 22:59:48'),
(106,21,60,'Nuevo','mal','mal','2023-11-25 22:59:48'),
(107,21,58,'Nuevo','mal','mal','2023-11-25 22:59:48'),
(108,21,61,'Nuevo','bien','bien','2023-11-26 00:00:00'),
(109,21,59,'Nuevo','mal','mal','2023-11-25 22:59:48'),
(110,22,45,'Nuevo','bien','bien','2023-11-26 22:35:17'),
(111,22,47,'Nuevo','bien','bien','2023-11-26 22:35:17'),
(112,22,44,'Nuevo','bien','bien','2023-11-26 22:35:17'),
(113,22,46,'Nuevo','bien','bien','2023-11-26 22:35:17'),
(114,22,48,'Nuevo','bien','bien','2023-11-26 00:00:00'),
(115,23,31,'Nuevo','bien','bien','2023-11-26 22:46:08'),
(116,23,32,'Nuevo','bien','bien','2023-11-26 22:46:08'),
(117,23,33,'Nuevo','bien','bien','2023-11-26 22:46:08'),
(118,23,36,'Nuevo','bien','bien','2023-11-26 22:46:08'),
(119,23,35,'Nuevo','bien','bien','2023-11-26 22:46:08'),
(120,23,34,'Nuevo','bien','bien','2023-11-26 22:46:08'),
(121,23,41,'Nuevo','bien','bien','2023-11-26 22:46:08'),
(122,23,40,'Nuevo','bien','bien','2023-11-26 22:46:08'),
(123,23,37,'Nuevo','bien','bien','2023-11-26 22:46:08'),
(124,24,71,'','bien','bien','2023-11-26 23:14:32'),
(125,25,6,'Nuevo','mal','mal','2023-11-26 23:16:44'),
(126,25,7,'Nuevo','mal','mal','2023-11-26 23:16:44'),
(127,25,8,'Nuevo','mal','mal','2023-11-26 23:16:44'),
(128,25,9,'Nuevo','mal','mal','2023-11-26 23:16:44'),
(129,25,87,'Nuevo','bien','bien','2023-11-27 00:00:00'),
(130,26,16,'bien','mal','mal','2023-11-26 23:19:03'),
(131,26,13,'bien','mal','mal','2023-11-26 23:19:03'),
(132,26,17,'bien','bien','bien','2023-11-27 00:00:00'),
(133,26,11,'bien','mal','mal','2023-11-26 23:19:03'),
(134,26,15,'bien','mal','mal','2023-11-26 23:19:03'),
(135,27,31,'','mal','mal','2023-11-27 18:17:33'),
(136,27,32,'','mal','mal','2023-11-27 18:17:33'),
(137,27,34,'','bein','bien','0000-00-00 00:00:00'),
(138,27,33,'','mal','mal','2023-11-27 18:17:33'),
(139,27,35,'','bien','bien','0000-00-00 00:00:00'),
(140,28,36,'bien','mal','mal','2023-11-27 21:56:15'),
(141,28,37,'bien','mal','mal','2023-11-27 21:56:15'),
(142,28,42,'bien','mal','mal','2023-11-27 21:56:15'),
(143,28,40,'bien','mal','mal','2023-11-27 21:56:15'),
(144,28,41,'bien','mal','mal','2023-11-27 21:56:15'),
(145,29,33,'Nuevo','mal','mal','2023-11-27 21:56:46'),
(146,30,49,'bien','mal','mal','2023-11-27 17:58:48'),
(147,30,48,'bien','mal','mal','2023-11-27 17:58:48'),
(148,30,50,'bien','mal','mal','2023-11-27 17:58:48'),
(149,30,51,'bien','mal','mal','2023-11-27 17:58:48'),
(150,30,52,'bien','mal','mal','2023-11-27 17:58:48'),
(151,31,13,'Nuevo','mal','mal','2023-11-27 18:25:04'),
(152,31,11,'Nuevo','mal','mal','2023-11-27 18:25:04'),
(153,31,17,'Nuevo','mal','mal','2023-11-27 18:25:04'),
(154,31,16,'Nuevo','mal','mal','2023-11-27 18:25:04'),
(155,31,15,'Nuevo','mal','mal','2023-11-27 18:25:04'),
(156,32,48,'bien','mal','mal','2023-11-27 21:48:05'),
(157,33,31,'bien','mal','mal','2023-11-27 21:45:25'),
(158,34,24,'bien',NULL,NULL,'2023-11-29 00:00:00'),
(159,34,32,'bien',NULL,NULL,'2023-11-29 00:00:00'),
(160,34,34,'bien',NULL,NULL,'2023-11-29 00:00:00'),
(161,34,23,'bien',NULL,NULL,'2023-11-29 00:00:00'),
(162,34,33,'bien',NULL,NULL,'2023-11-29 00:00:00'),
(163,35,71,'bien','mal','mal','2023-11-27 21:42:34'),
(164,36,9,'Nuevo','mal','mal','2023-11-27 21:58:06'),
(165,36,7,'Nuevo','mal','mal','2023-11-27 21:58:06'),
(166,36,6,'Nuevo','mal','mal','2023-11-27 21:58:06'),
(167,36,8,'Nuevo','mal','mal','2023-11-27 21:58:06'),
(168,37,33,'bien','mal','mal','2023-11-27 22:00:24'),
(169,37,31,'bien','mal','mal','2023-11-27 22:00:24'),
(170,37,36,'bien','mal','mal','2023-11-27 22:00:24'),
(171,37,35,'bien','mal','mal','2023-11-27 22:00:24'),
(172,37,37,'bien','mal','mal','2023-11-27 22:00:24'),
(173,38,71,'Nuevo','mal','mal','2023-11-27 22:10:56'),
(174,38,74,'Nuevo','mal','mal','2023-11-27 22:10:56'),
(175,38,73,'Nuevo','mal','mal','2023-11-27 22:10:56'),
(176,38,72,'Nuevo','mal','mal','2023-11-27 22:10:56'),
(177,39,31,'bien','mal','mal','2023-11-27 22:41:36'),
(178,39,33,'bien','mal','mal','2023-11-27 22:41:36'),
(179,39,35,'bien','mal','mal','2023-11-27 22:41:36'),
(180,39,37,'bien','mal','mal','2023-11-27 22:41:36'),
(181,39,36,'bien','mal','mal','2023-11-27 22:41:36'),
(182,40,71,'Nuevo',NULL,NULL,'2023-11-28 00:00:00'),
(183,40,67,'Nuevo',NULL,NULL,'2023-11-28 00:00:00'),
(184,41,31,'bien','mal','mal','2023-11-27 22:59:01'),
(185,41,33,'bien','mal','mal','2023-11-27 22:59:01'),
(186,41,35,'bien','mal','mal','2023-11-27 22:59:01'),
(187,41,36,'bien','mal','mal','2023-11-27 22:59:01'),
(188,41,37,'bien','mal','mal','2023-11-27 22:59:01');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(15,'Garcia','Fred alfredo','68725872','DNI','0000-00-00','chincha baja','','','2023-11-25 21:18:51',NULL,NULL);

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
  `fechadevolucion` datetime DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `prestamos` */

insert  into `prestamos`(`idprestamo`,`idbeneficiario`,`idbibliotecario`,`idlibro`,`cantidad`,`fechasolicitud`,`fechaprestamo`,`fecharespuesta`,`fechaentrega`,`fechadevolucion`,`descripcion`,`enbiblioteca`,`lugardestino`,`estado`,`activo`) values 
(1,2,NULL,5,1,'2023-11-23 20:55:46','2023-11-27 00:00:00',NULL,'2023-11-25 18:13:04','2023-11-27 00:00:00','1A','SI','','T','1'),
(2,5,1,NULL,NULL,'2023-11-23 21:06:07','2023-11-23 21:06:07',NULL,'2023-11-23 21:06:07',NULL,'3M','SI',NULL,'T','1'),
(3,5,1,NULL,NULL,'2023-11-23 22:38:15','2023-11-23 00:00:00',NULL,'2023-11-25 17:00:23',NULL,'3M','SI',NULL,'T','1'),
(4,11,NULL,5,5,'2023-11-25 17:09:26','2023-11-27 00:00:00',NULL,'2023-11-25 18:13:12','2023-11-27 00:00:00','Matematica','SI','','T','1'),
(5,6,1,NULL,NULL,'2023-11-25 17:13:18','2023-11-27 00:00:00',NULL,'2023-11-25 18:14:13',NULL,'Matematica','SI',NULL,'T','1'),
(6,11,NULL,6,10,'2023-11-25 17:42:59','2023-11-27 00:00:00',NULL,'2023-11-25 18:15:22','2023-11-27 00:00:00','Matematica','SI','','T','1'),
(7,2,NULL,5,1,'2023-11-25 18:18:55','2023-11-25 00:00:00',NULL,'2023-11-25 18:21:52','2023-11-27 00:00:00','1A','SI','','T','1'),
(8,11,NULL,7,7,'2023-11-25 18:20:21','2023-11-25 00:00:00',NULL,'2023-11-25 18:21:53','2023-11-25 00:00:00','Matematica','SI','','T','1'),
(9,2,NULL,3,1,'2023-11-25 18:22:12','2023-11-25 00:00:00',NULL,'2023-11-25 18:25:17','2023-11-27 00:00:00','1A','SI','','T','1'),
(10,2,NULL,4,1,'2023-11-25 18:26:15','2023-11-25 00:00:00',NULL,'2023-11-25 19:02:15','2023-11-27 00:00:00','1A','SI','','T','1'),
(11,11,NULL,5,23,'2023-11-25 18:41:15','2023-11-25 00:00:00',NULL,'2023-11-25 19:02:16','0000-00-00 00:00:00','Matematica','SI','','T','1'),
(12,11,NULL,5,4,'2023-11-25 18:42:06','2023-11-25 00:00:00',NULL,'2023-11-25 19:02:14','0000-00-00 00:00:00','mm','SI','','T','1'),
(13,13,1,NULL,NULL,'2023-11-25 19:50:31','2023-11-26 00:00:00',NULL,'2023-11-25 20:34:33',NULL,'3M','SI',NULL,'T','1'),
(14,13,NULL,4,1,'2023-11-25 19:55:03','2023-11-26 00:00:00',NULL,'2023-11-25 20:34:29','0000-00-00 00:00:00','1H','SI','','T','1'),
(15,2,1,NULL,NULL,'2023-11-25 21:49:59','2023-11-25 21:49:59',NULL,'2023-11-25 21:49:59',NULL,'1A','SI',NULL,'T','1'),
(16,3,1,NULL,NULL,'2023-11-25 21:52:09','2023-11-25 21:52:09',NULL,'2023-11-25 21:52:09',NULL,'1A','SI',NULL,'T','1'),
(17,4,1,NULL,NULL,'2023-11-25 21:56:33','2023-11-25 21:56:33',NULL,'2023-11-25 21:56:33',NULL,'4A','NO','Salon 4','T','1'),
(18,11,1,NULL,NULL,'2023-11-25 21:57:39','2023-11-25 21:57:39',NULL,'2023-11-25 21:57:39',NULL,'Matematica','SI',NULL,'T','1'),
(19,2,1,NULL,NULL,'2023-11-25 22:19:21','2023-11-25 22:19:21',NULL,'2023-11-25 22:19:21',NULL,'1A','SI',NULL,'T','1'),
(20,7,1,NULL,NULL,'2023-11-25 22:35:32','2023-11-25 22:35:32',NULL,'2023-11-25 22:35:32',NULL,'3M','SI',NULL,'T','1'),
(21,7,1,NULL,NULL,'2023-11-25 22:57:42','2023-11-25 22:57:42',NULL,'2023-11-25 22:57:42',NULL,'3M','SI',NULL,'T','1'),
(22,13,1,NULL,NULL,'2023-11-25 23:00:09','2023-11-25 23:00:09',NULL,'2023-11-25 23:00:09',NULL,'3M','SI',NULL,'T','1'),
(23,14,1,NULL,NULL,'2023-11-26 22:45:48','2023-11-26 22:45:48',NULL,'2023-11-26 22:45:48',NULL,'','SI',NULL,'T','1'),
(24,2,1,NULL,NULL,'2023-11-26 22:49:21','2023-11-26 22:49:21',NULL,'2023-11-26 22:49:21',NULL,'1A','NO','Salon 4','T','1'),
(25,6,1,NULL,NULL,'2023-11-26 23:16:12','2023-11-26 23:16:12',NULL,'2023-11-26 23:16:12',NULL,'Matematica','SI',NULL,'T','1'),
(26,4,1,NULL,NULL,'2023-11-26 23:18:30','2023-11-26 23:18:30',NULL,'2023-11-26 23:18:30',NULL,'4A','SI',NULL,'T','1'),
(27,2,1,NULL,NULL,'2023-11-26 23:25:06','2023-11-26 23:25:06',NULL,'2023-11-26 23:25:06',NULL,'1A','SI',NULL,'T','1'),
(28,7,1,NULL,NULL,'2023-11-26 23:29:27','2023-11-27 00:00:00',NULL,'2023-11-27 18:53:21',NULL,'3M','SI',NULL,'T','1'),
(29,5,1,NULL,NULL,'2023-11-27 17:35:51','2023-11-27 17:35:51',NULL,'2023-11-27 17:35:51',NULL,'3M','SI',NULL,'T','1'),
(30,5,1,NULL,NULL,'2023-11-27 17:58:09','2023-11-27 17:58:09',NULL,'2023-11-27 17:58:09',NULL,'3M','SI',NULL,'T','1'),
(31,12,1,NULL,NULL,'2023-11-27 18:24:44','2023-11-27 18:24:44',NULL,'2023-11-27 18:24:44',NULL,'3M','SI',NULL,'T','1'),
(32,2,NULL,6,1,'2023-11-27 18:44:38','2023-11-28 00:00:00',NULL,'2023-11-27 18:55:20','2023-11-28 00:00:00','1A','SI','','T','1'),
(33,2,NULL,5,1,'2023-11-27 18:54:16','2023-11-27 00:00:00',NULL,'2023-11-27 18:55:02','2023-11-27 00:00:00','1A','SI','','T','1'),
(34,5,1,NULL,NULL,'2023-11-27 21:33:38','2023-11-28 00:00:00',NULL,NULL,NULL,'3M','SI',NULL,'R','1'),
(35,3,1,NULL,NULL,'2023-11-27 21:42:08','2023-11-27 21:42:08',NULL,'2023-11-27 21:42:08',NULL,'1A','SI',NULL,'T','1'),
(36,6,1,NULL,NULL,'2023-11-27 21:57:26','2023-11-27 21:57:26',NULL,'2023-11-27 21:57:26',NULL,'Matematica','SI',NULL,'T','1'),
(37,3,1,NULL,NULL,'2023-11-27 22:00:02','2023-11-27 22:00:02',NULL,'2023-11-27 22:00:02',NULL,'1A','SI',NULL,'T','1'),
(38,13,1,NULL,NULL,'2023-11-27 22:10:35','2023-11-27 22:10:35',NULL,'2023-11-27 22:10:35',NULL,'3M','SI',NULL,'T','1'),
(39,12,1,NULL,NULL,'2023-11-27 22:41:19','2023-11-27 22:41:19',NULL,'2023-11-27 22:41:19',NULL,'3M','SI',NULL,'T','1'),
(40,14,1,NULL,NULL,'2023-11-27 22:42:55','2023-11-28 00:00:00',NULL,NULL,NULL,'Comunicacion','SI',NULL,'R','1'),
(41,5,1,NULL,NULL,'2023-11-27 22:58:41','2023-11-27 22:58:41',NULL,'2023-11-27 22:58:41',NULL,'3M','SI',NULL,'T','1');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `usuarios` */

insert  into `usuarios`(`idusuario`,`idpersona`,`idrol`,`nombreusuario`,`claveacceso`,`create_at`,`update_at`,`inactive_at`,`estado`) values 
(1,1,1,'75123489','$2y$10$1EwQL/puaUQHsn3KpLDQge.QJ5zTmDQ3PmQkd2du.4H91O8UsatWC','2023-11-14 20:04:56',NULL,NULL,'1'),
(2,2,3,'78674219','$2y$10$1EwQL/puaUQHsn3KpLDQge.QJ5zTmDQ3PmQkd2du.4H91O8UsatWC','2023-11-14 20:04:56',NULL,'2023-11-27 21:48:05','1'),
(3,3,3,'Maria12','$2y$10$pjvcVk3.cIXv36rbkzd1se1x3hMkwJuhFb9hxWzntIVVJXXHJ4aOO','2023-11-15 17:34:31',NULL,'2023-11-27 22:00:21','1'),
(4,4,3,'Adri12','$2y$10$BAFdgrEAUrbCiAvJqXK1JewmEmWD4z6elZ/SbjfPL6AtlAdtycXyK','2023-11-17 22:10:26',NULL,'2023-11-26 23:19:02','1'),
(5,5,2,'Juan12','$2y$10$DO47kyJla58I/3HnjIfwqODpmZpT0d92aC98PJvnhzt0iA.CAu.0a','2023-11-17 23:09:29',NULL,'2023-11-27 22:58:59','0'),
(6,6,3,'Kiarabq','$2y$10$uwF4lFXTH1mw4yw.lXX7HeVTMGAr10dRPE4DnypxrX5oYb3quMvum','2023-11-17 23:10:50',NULL,'2023-11-27 21:58:05','1'),
(7,7,3,'JhonF','$2y$10$Cp0BSJyKCFSKllRAZ/.DA.8Eu3BR/IC4IdUi0.Yj3rWAGUz7hPSRG','2023-11-17 23:12:24',NULL,'2023-11-27 21:56:14','1'),
(11,11,2,'72890192','$2y$10$1EwQL/puaUQHsn3KpLDQge.QJ5zTmDQ3PmQkd2du.4H91O8UsatWC','2023-11-21 21:04:32',NULL,'2023-11-25 22:00:23','1'),
(12,12,2,'54165','$2y$10$IAtQzGqfXelNXJfSkEt8i.5UxQkdDQgf0xTvrjxWcdbPLN0h.0NkO','2023-11-22 22:10:20',NULL,'2023-11-27 22:41:35','0'),
(13,13,3,'78290181','$2y$10$1EwQL/puaUQHsn3KpLDQge.QJ5zTmDQ3PmQkd2du.4H91O8UsatWC','2023-11-25 19:45:10',NULL,'2023-11-27 22:10:55','1'),
(14,15,3,'Fred12','$2y$10$DGRQGH1Ch28HBqHokIY6.u01dcMoXXz1/aJxq5Fah345UG5.zu9Oe','2023-11-25 21:18:51',NULL,'2023-11-27 22:42:56','0');

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
	GROUP BY librosentregados.idejemplar
	oRDER BY totales DESC
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
    -- Obtener el último número de código_libro
     SELECT COALESCE(MAX(codigo_libro), 0) INTO v_ultimo_codigo_libro FROM ejemplares;
     
    -- SELECT MAX(codigo_libro) INTO v_ultimo_codigo_libro
    -- FROM ejemplares
    -- WHERE idlibro = p_idlibro;

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
        cantidad = cantidad + p_nueva_cantidad    -- select * from detalleautores
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

/* Procedure structure for procedure `spu_datos_personales` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_datos_personales` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_datos_personales`(
	IN _idusuario INT
)
BEGIN 
	SELECT personas.apellidos,personas.nombres,personas.nrodocumento,personas.fechanac,
	personas.direccion,personas.telefono,personas.email,roles.nombrerol FROM usuarios

INNER JOIN personas ON personas.idpersona=usuarios.idpersona
INNER JOIN roles ON roles.idrol=usuarios.idrol WHERE usuarios.idusuario=_idusuario;

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
	GROUP BY librosentregados.idejemplar
	order by totales desc
	limit 5;
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
	DATE(fechaprestamo) AS 'fechaprestamo', DATE(fechadevolucion) AS 'fechadevolucion', prestamos.estado,
	prestamos.cantidad
	FROM prestamos
	INNER JOIN libros ON libros.idlibro = prestamos.idlibro
	INNER JOIN usuarios  ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE prestamos.idbeneficiario = _idusuario;
	
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
begin
	SELECT ej.idlibro, det.iddetalleautor, cat.categoria, sub.subcategoria, lib.libro, COUNT(ej.idlibro) AS 'Disponible' , 
	lib.cantidad as 'cantidad', lib.codigo, concat(aut.autor, ' ', aut.apellidos) as 'autor'
	FROM subcategorias sub
	JOIN categorias cat ON sub.idcategoria = cat.idcategoria
	JOIN libros lib ON sub.idsubcategoria = lib.idsubcategoria
	JOIN detalleautores det ON lib.idlibro = det.idlibro
	JOIN autores aut ON det.idautor = aut.idautor
	LEFT JOIN ejemplares ej ON lib.idlibro = ej.idlibro
	WHERE ej.ocupado = 'NO' AND ej.estado = 1
	GROUP BY ej.idlibro;
end */$$
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
	SELECT prestamos.idprestamo, librosentregados.idlibroentregado, libros.libro, libros.idlibro, libros.codigo, libros.imagenportada,concat( personas.nombres, ' ', personas.apellidos) as 'nombres', prestamos.descripcion, 
	prestamos.fechasolicitud, DATE(fechaprestamo) AS 'fechaprestamo'
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN ejemplares ON ejemplares.idejemplar = librosentregados.idejemplar
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	INNER JOIN usuarios ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE prestamos.estado = 'R'
	-- order by librosentregados.idlibroentregado
	group BY prestamos.idprestamo;
end */$$
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
	subcategorias.subcategoria, libros.libro, prestamos.fechasolicitud, prestamos.fechaentrega, prestamos.fechaprestamo, librosentregados.fechadevolucion,
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
	IN _idprestamo INT
	
)
BEGIN
	INSERT INTO librosentregados(idprestamo, idejemplar, condicionentrega) 
	VALUE (_idprestamo, _idejemplar, _observacion);
	
	UPDATE ejemplares SET ocupado = 'SI' WHERE idejemplar = _idejemplar;
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
	IN _fechaprestamo DATETIME,
	IN _fechadevolución DATETIME
)
BEGIN
	INSERT INTO prestamos(idlibro, idbeneficiario, cantidad, descripcion, enbiblioteca, lugardestino, fechaprestamo, 
	fechadevolucion, estado) VALUES (_idlibro, _idbeneficiario, _cantidad, _descripcion, _enbiblioteca, 
	_lugardestino, _fechaprestamo, _fechadevolucion, 'S');

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
	DATE(fechaprestamo) AS 'fechaprestamo', DATE(fechadevolucion) AS 'fechadevolucion', prestamos.cantidad, libros.idlibro
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
    IN _condiciondevolucion VARCHAR(50),
    IN _observaciones VARCHAR(50),
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
    condiciondevolucion = _condiciondevolucion,
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
	SELECT COUNT(*) AS 'cantidad' FROM prestamos WHERE idbeneficiario = _idusuario AND estado IN ('S', 'E') ;

END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
