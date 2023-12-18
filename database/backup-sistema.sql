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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `autores` */

insert  into `autores`(`idautor`,`apellidos`,`autor`,`pseudonimio`,`nacionalidad`,`create_at`,`update_at`,`inactive_at`) values 
(1,'Crary','Jonathan','','Vermont','2023-11-14 20:09:45',NULL,NULL),
(2,'Verdy','Luis','','Frances','2023-11-14 20:09:45',NULL,NULL),
(3,'Cortes','Jeremy','','Estadunidence','2023-11-14 20:09:45',NULL,NULL),
(4,'Vargas Llosa','Mario','','peruano','2023-12-04 23:31:48',NULL,NULL),
(5,'Vallejo','Cesar','','Peruano','2023-12-04 23:34:19',NULL,NULL),
(6,'Homero','','','Grecia','2023-12-10 20:40:17',NULL,NULL),
(7,'Stoker','Bram','','Irlanda','2023-12-10 20:45:29',NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `detalleautores` */

insert  into `detalleautores`(`iddetalleautor`,`idlibro`,`idautor`,`creat_at`,`update_at`,`inactive_at`) values 
(1,1,3,'2023-12-02 19:16:45',NULL,NULL),
(2,2,2,'2023-12-02 19:25:15',NULL,NULL),
(3,3,1,'2023-12-02 20:48:41',NULL,NULL),
(4,4,3,'2023-12-02 20:50:05',NULL,NULL),
(5,5,1,'2023-12-02 20:51:56',NULL,NULL),
(6,6,1,'2023-12-03 15:30:08',NULL,NULL),
(7,7,1,'2023-12-03 21:21:24',NULL,NULL),
(8,8,3,'2023-12-05 22:19:19',NULL,NULL),
(9,9,7,'2023-12-10 20:47:41',NULL,NULL),
(10,10,4,'2023-12-10 20:56:57',NULL,NULL),
(11,11,3,'2023-12-10 21:00:03',NULL,NULL),
(12,12,3,'2023-12-12 19:49:41',NULL,NULL),
(13,14,3,'2023-12-16 23:59:48',NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `editoriales` */

insert  into `editoriales`(`ideditorial`,`nombres`,`telefono`,`website`,`email`,`paisorigen`,`create_at`,`update_at`,`inactive_at`) values 
(1,'Ariel','943883123','','jonathanc@gmail.com','EEUU','2023-11-14 20:10:11',NULL,NULL),
(2,'Paidos','913033923','','max@gmail.com','España','2023-11-14 20:10:11',NULL,NULL),
(3,'Cesar Vallejo','965417283','','jonathanc@gmail.com','Perú','2023-11-14 20:10:15',NULL,NULL),
(4,'Mario Vagas Llosa','963417283','','max@gmail.com','Perú','2023-11-14 20:10:15',NULL,NULL),
(5,'Bruño','',NULL,NULL,'España, Madrid','2023-12-10 20:42:30',NULL,NULL);

/*Table structure for table `ejemplares` */

DROP TABLE IF EXISTS `ejemplares`;

CREATE TABLE `ejemplares` (
  `idejemplar` int(11) NOT NULL AUTO_INCREMENT,
  `idlibro` int(11) NOT NULL,
  `codigo_libro` int(11) NOT NULL,
  `ocupado` char(2) NOT NULL DEFAULT 'NO',
  `estado` char(1) NOT NULL DEFAULT '1',
  `condicion` varchar(100) NOT NULL,
  `creat_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL,
  PRIMARY KEY (`idejemplar`),
  KEY `fk_idlibro_ejemplar` (`idlibro`),
  CONSTRAINT `fk_idlibro_ejemplar` FOREIGN KEY (`idlibro`) REFERENCES `libros` (`idlibro`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ejemplares` */

insert  into `ejemplares`(`idejemplar`,`idlibro`,`codigo_libro`,`ocupado`,`estado`,`condicion`,`creat_at`,`update_at`,`inactive_at`) values 
(1,1,1,'NO','1','Usado','2023-12-02 19:22:50','2023-12-08 19:07:20',NULL),
(2,1,2,'NO','1','Usado','2023-12-02 19:22:50','2023-12-17 20:42:39',NULL),
(3,1,3,'NO','1','Usado','2023-12-02 19:22:50','2023-12-17 20:42:45',NULL),
(4,2,4,'SI','1','Usado','2023-12-02 19:25:15',NULL,NULL),
(5,2,5,'SI','1','Usado','2023-12-02 19:25:15',NULL,NULL),
(6,2,6,'NO','0','Deteriorado','2023-12-02 19:25:15',NULL,NULL),
(7,2,7,'NO','0','Deteriorado','2023-12-02 19:25:15',NULL,NULL),
(8,2,8,'NO','0','Deteriorado','2023-12-02 19:25:15',NULL,NULL),
(9,2,9,'NO','0','Deteriorado','2023-12-02 19:25:15',NULL,NULL),
(10,2,10,'NO','0','Deteriorado','2023-12-02 19:25:16',NULL,NULL),
(11,2,11,'NO','1','Usado','2023-12-02 19:25:16',NULL,NULL),
(12,2,12,'NO','1','Usado','2023-12-02 19:25:16',NULL,NULL),
(13,2,13,'NO','1','Usado','2023-12-02 19:25:16',NULL,NULL),
(14,2,14,'NO','1','Usado','2023-12-02 19:25:16',NULL,NULL),
(15,3,15,'NO','1','Usado','2023-12-02 20:48:41','2023-12-16 00:31:24','2023-12-03 15:48:24'),
(16,3,16,'NO','1','Usado','2023-12-02 20:48:41','2023-12-16 00:36:45',NULL),
(17,3,17,'NO','0','Deteriorado','2023-12-02 20:48:41',NULL,NULL),
(18,3,18,'NO','0','Deteriorado','2023-12-02 20:48:41',NULL,NULL),
(19,3,19,'NO','0','Deteriorado','2023-12-02 20:48:41',NULL,'2023-12-03 00:27:41'),
(20,3,20,'NO','0','Deteriorado','2023-12-02 20:48:41',NULL,NULL),
(21,3,21,'NO','0','Deteriorado','2023-12-02 20:48:41',NULL,NULL),
(22,3,22,'NO','0','Deteriorado','2023-12-02 20:48:41',NULL,NULL),
(23,3,23,'NO','0','Deteriorado','2023-12-02 20:48:41',NULL,NULL),
(24,3,24,'NO','0','Deteriorado','2023-12-02 20:48:41',NULL,NULL),
(25,3,25,'NO','0','Deteriorado','2023-12-02 20:48:41',NULL,NULL),
(26,3,26,'NO','0','Deteriorado','2023-12-02 20:48:41',NULL,NULL),
(27,4,27,'NO','0','Deteriorado','2023-12-02 20:50:05',NULL,NULL),
(28,4,28,'NO','0','Deteriorado','2023-12-02 20:50:05',NULL,NULL),
(29,4,29,'NO','0','Deteriorado','2023-12-02 20:50:05',NULL,NULL),
(30,4,30,'NO','0','Deteriorado','2023-12-02 20:50:05',NULL,NULL),
(31,4,31,'NO','0','Mal','2023-12-02 20:50:05',NULL,NULL),
(32,4,32,'NO','0','Mal','2023-12-02 20:50:05',NULL,NULL),
(33,4,33,'NO','0','Mal','2023-12-02 20:50:05',NULL,NULL),
(34,4,34,'NO','0','Mal','2023-12-02 20:50:05',NULL,NULL),
(35,4,35,'NO','0','Mal','2023-12-02 20:50:05',NULL,NULL),
(36,4,36,'NO','1','Usado','2023-12-02 20:50:05',NULL,NULL),
(37,4,37,'NO','1','Usado','2023-12-02 20:50:05',NULL,NULL),
(38,4,38,'NO','1','Usado','2023-12-02 20:50:05',NULL,NULL),
(39,5,39,'NO','1','Usado','2023-12-02 20:51:56',NULL,NULL),
(40,5,40,'NO','0','Deteriorado','2023-12-02 20:51:56',NULL,'2023-12-02 23:47:06'),
(41,5,41,'NO','0','Deteriorado','2023-12-02 20:51:56',NULL,NULL),
(42,5,42,'NO','1','Usado','2023-12-02 20:51:56',NULL,NULL),
(43,5,43,'NO','1','Usado','2023-12-02 20:51:56',NULL,NULL),
(44,5,44,'NO','1','Usado','2023-12-02 20:51:56',NULL,NULL),
(45,5,45,'NO','0','Deteriorado','2023-12-02 20:51:56',NULL,NULL),
(46,5,46,'NO','0','Deteriorado','2023-12-02 20:51:56',NULL,NULL),
(47,5,47,'NO','0','Deteriorado','2023-12-02 20:51:56',NULL,NULL),
(48,1,4,'NO','1','Usado','2023-12-02 21:47:15','2023-12-17 20:42:48',NULL),
(49,1,48,'NO','1','Nuevo','2023-12-02 22:48:44','2023-12-17 20:43:02',NULL),
(50,1,49,'NO','1','Usado','2023-12-02 22:48:44','2023-12-17 20:42:50',NULL),
(51,5,48,'NO','0','Deteriorado','2023-12-02 22:50:04',NULL,NULL),
(52,6,50,'NO','1','Nuevo','2023-12-03 15:30:08',NULL,NULL),
(53,6,51,'NO','1','Nuevo','2023-12-03 15:30:08',NULL,NULL),
(54,6,52,'NO','1','Nuevo','2023-12-03 15:30:08',NULL,NULL),
(55,6,53,'NO','1','Nuevo','2023-12-03 15:30:08',NULL,NULL),
(56,6,54,'NO','1','Nuevo','2023-12-03 15:30:08',NULL,NULL),
(57,6,55,'NO','1','Nuevo','2023-12-03 15:30:08',NULL,NULL),
(58,6,56,'NO','1','Nuevo','2023-12-03 15:30:08',NULL,NULL),
(59,6,57,'NO','1','Nuevo','2023-12-03 15:30:08',NULL,NULL),
(60,6,58,'NO','1','Nuevo','2023-12-03 15:30:08',NULL,NULL),
(61,6,59,'NO','1','Nuevo','2023-12-03 15:30:08',NULL,NULL),
(62,6,60,'NO','1','Nuevo','2023-12-03 15:30:08',NULL,NULL),
(63,6,61,'NO','1','Nuevo','2023-12-03 15:30:08',NULL,NULL),
(64,7,62,'NO','1','Usado','2023-12-03 21:21:24','2023-12-15 23:48:51',NULL),
(65,7,63,'NO','0','Mal','2023-12-03 21:21:24',NULL,NULL),
(66,7,64,'NO','0','Mal','2023-12-03 21:21:24',NULL,NULL),
(67,7,65,'NO','0','Mal','2023-12-03 21:21:24',NULL,NULL),
(68,7,66,'NO','0','Mal','2023-12-03 21:21:24',NULL,NULL),
(69,7,67,'NO','0','Mal','2023-12-03 21:21:24',NULL,NULL),
(70,7,68,'NO','0','Mal','2023-12-03 21:21:24',NULL,NULL),
(71,7,69,'NO','0','Mal','2023-12-03 21:21:24',NULL,NULL),
(72,7,70,'NO','0','Mal','2023-12-03 21:21:25',NULL,NULL),
(73,7,71,'NO','0','Mal','2023-12-03 21:21:25',NULL,NULL),
(74,7,72,'NO','0','Mal','2023-12-03 21:21:25',NULL,NULL),
(75,7,73,'NO','0','Mal','2023-12-03 21:21:25',NULL,NULL),
(76,7,74,'NO','0','Mal','2023-12-03 21:21:25',NULL,NULL),
(77,7,75,'NO','0','Mal','2023-12-03 21:21:25',NULL,NULL),
(78,7,76,'NO','0','Mal','2023-12-03 21:21:25',NULL,NULL),
(79,7,77,'NO','0','Mal','2023-12-03 21:21:25',NULL,NULL),
(80,7,78,'NO','0','Mal','2023-12-03 21:21:25',NULL,NULL),
(81,7,79,'NO','0','Mal','2023-12-03 21:21:25',NULL,NULL),
(82,7,80,'NO','0','Mal','2023-12-03 21:21:25',NULL,NULL),
(83,7,81,'NO','0','Mal','2023-12-03 21:21:25',NULL,NULL),
(84,7,82,'NO','0','Mal','2023-12-03 21:21:25',NULL,NULL),
(85,7,83,'NO','0','Mal','2023-12-03 21:21:25',NULL,NULL),
(86,1,50,'NO','1','Usado','2023-12-04 19:32:34','2023-12-17 20:43:07',NULL),
(87,8,84,'NO','1','Usado','2023-12-05 22:19:19',NULL,NULL),
(88,8,85,'NO','1','Usado','2023-12-05 22:19:19',NULL,NULL),
(89,8,86,'NO','1','Usado','2023-12-05 22:19:19',NULL,NULL),
(90,8,87,'NO','1','Usado','2023-12-05 22:19:19',NULL,NULL),
(91,8,88,'NO','1','Usado','2023-12-05 22:19:19',NULL,NULL),
(92,8,89,'NO','1','Usado','2023-12-05 22:19:19',NULL,NULL),
(93,8,90,'NO','1','Usado','2023-12-05 22:19:19',NULL,NULL),
(94,8,91,'NO','1','Usado','2023-12-05 22:19:19',NULL,NULL),
(95,8,92,'NO','1','Usado','2023-12-05 22:19:19',NULL,NULL),
(96,8,93,'NO','1','Usado','2023-12-05 22:19:19',NULL,NULL),
(97,8,94,'NO','1','Usado','2023-12-05 22:19:19',NULL,NULL),
(98,8,95,'NO','1','Usado','2023-12-05 22:19:19',NULL,NULL),
(99,9,96,'NO','0','Deteriorado','2023-12-10 20:47:41',NULL,NULL),
(100,9,97,'SI','1','Usado','2023-12-10 20:47:41',NULL,NULL),
(101,9,98,'NO','1','Usado','2023-12-10 20:47:41',NULL,NULL),
(102,9,99,'NO','1','Usado','2023-12-10 20:47:41',NULL,NULL),
(103,9,100,'NO','1','Usado','2023-12-10 20:47:41',NULL,NULL),
(104,9,101,'NO','1','Usado','2023-12-10 20:47:41',NULL,NULL),
(105,9,102,'NO','1','Usado','2023-12-10 20:47:41',NULL,NULL),
(106,9,103,'NO','1','Usado','2023-12-10 20:47:41',NULL,NULL),
(107,9,104,'NO','1','Usado','2023-12-10 20:47:41',NULL,NULL),
(108,9,105,'NO','1','Usado','2023-12-10 20:47:41',NULL,NULL),
(109,9,106,'NO','1','Usado','2023-12-10 20:47:41',NULL,NULL),
(110,9,107,'NO','1','Usado','2023-12-10 20:47:41',NULL,NULL),
(111,9,108,'NO','1','Usado','2023-12-10 20:47:41',NULL,NULL),
(112,9,109,'NO','1','Usado','2023-12-10 20:47:41',NULL,NULL),
(113,9,110,'NO','1','Usado','2023-12-10 20:47:41',NULL,NULL),
(114,9,111,'NO','1','Usado','2023-12-10 20:47:41',NULL,NULL),
(115,9,112,'NO','1','Usado','2023-12-10 20:47:41',NULL,NULL),
(116,9,113,'NO','1','Usado','2023-12-10 20:47:41',NULL,NULL),
(117,9,114,'NO','1','Usado','2023-12-10 20:47:41',NULL,NULL),
(118,9,115,'NO','1','Usado','2023-12-10 20:47:41',NULL,NULL),
(119,9,116,'NO','1','Usado','2023-12-10 20:47:42',NULL,NULL),
(120,10,117,'NO','0','Usado','2023-12-10 20:56:57',NULL,NULL),
(121,10,118,'NO','0','Mal','2023-12-10 20:56:57',NULL,'2023-12-11 21:51:20'),
(122,10,119,'NO','1','Usado','2023-12-10 20:56:57',NULL,NULL),
(123,10,120,'NO','1','Usado','2023-12-10 20:56:57',NULL,NULL),
(124,10,121,'NO','1','Usado','2023-12-10 20:56:57',NULL,NULL),
(125,10,122,'NO','1','Usado','2023-12-10 20:56:57',NULL,NULL),
(126,10,123,'NO','1','Usado','2023-12-10 20:56:57',NULL,NULL),
(127,10,124,'NO','1','Usado','2023-12-10 20:56:57',NULL,NULL),
(128,10,125,'NO','1','Usado','2023-12-10 20:56:57',NULL,NULL),
(129,10,126,'NO','1','Usado','2023-12-10 20:56:57',NULL,NULL),
(130,10,127,'NO','1','Usado','2023-12-10 20:56:57',NULL,NULL),
(131,10,128,'NO','1','Usado','2023-12-10 20:56:57',NULL,NULL),
(132,10,129,'NO','1','Usado','2023-12-10 20:56:57',NULL,NULL),
(133,10,130,'NO','1','Usado','2023-12-10 20:56:57',NULL,NULL),
(134,10,131,'NO','1','Usado','2023-12-10 20:56:57',NULL,NULL),
(135,10,132,'NO','1','Usado','2023-12-10 20:56:57',NULL,NULL),
(136,10,133,'NO','1','Usado','2023-12-10 20:56:57',NULL,NULL),
(137,10,134,'NO','1','Usado','2023-12-10 20:56:57',NULL,NULL),
(138,10,135,'NO','1','Usado','2023-12-10 20:56:57',NULL,NULL),
(139,10,136,'NO','1','Usado','2023-12-10 20:56:57',NULL,NULL),
(140,10,137,'NO','1','Usado','2023-12-10 20:56:57',NULL,NULL),
(141,10,138,'NO','1','Usado','2023-12-10 20:56:58',NULL,NULL),
(142,10,139,'NO','1','Usado','2023-12-10 20:56:58',NULL,NULL),
(143,10,140,'NO','1','Usado','2023-12-10 20:56:58',NULL,NULL),
(144,10,141,'NO','1','Usado','2023-12-10 20:56:58',NULL,NULL),
(145,10,142,'NO','1','Usado','2023-12-10 20:56:58',NULL,NULL),
(146,10,143,'NO','1','Usado','2023-12-10 20:56:58',NULL,NULL),
(147,10,144,'NO','1','Usado','2023-12-10 20:56:58',NULL,NULL),
(148,10,145,'NO','1','Usado','2023-12-10 20:56:58',NULL,NULL),
(149,10,146,'NO','1','Usado','2023-12-10 20:56:58',NULL,NULL),
(150,11,147,'NO','1','Nuevo','2023-12-10 21:00:03','2023-12-15 23:40:51',NULL),
(151,11,148,'NO','1','Nuevo','2023-12-10 21:00:03','2023-12-15 23:46:36',NULL),
(152,1,51,'NO','1','usado','2023-12-11 20:29:44',NULL,NULL),
(153,12,149,'NO','1','Usado','2023-12-12 19:49:41',NULL,NULL),
(154,11,149,'NO','1','Nuevo','2023-12-16 00:19:05',NULL,NULL),
(155,11,150,'NO','1','Nuevo','2023-12-16 00:20:38',NULL,NULL),
(156,11,151,'NO','1','Usado','2023-12-16 00:22:14',NULL,NULL),
(157,14,152,'NO','1','Nuevo','2023-12-16 23:59:48',NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `libros` */

insert  into `libros`(`idlibro`,`idsubcategoria`,`ideditorial`,`libro`,`tipo`,`cantidad`,`numeropaginas`,`codigo`,`edicion`,`formato`,`anio`,`idioma`,`descripcion`,`imagenportada`,`create_at`,`update_at`,`inactive_at`,`estado`) values 
(1,5,1,'Física conceptual','texto',8,144,534.000,'nada','mediano','2000-12-12','español','nada','d1f9082eec58f538687959488d04d0b369e51e1c.jpg','2023-12-02 19:16:45',NULL,'2023-12-08 19:07:17','1'),
(2,3,1,'El mentor de matemáticas ','texto',11,113,513.000,'','Mediano','2010-02-23','Español','','d97204132dc1ef9543af7cc95d91db604580272e.jpg','2023-12-02 19:25:15',NULL,NULL,'1'),
(3,5,4,'La Biblia de la física y quimica','texto',12,122,533.000,'','Mediano','2020-03-24','Español','','3202e00ba85735c7a7e3a7426275081ad1426767.jpg','2023-12-02 20:48:41',NULL,'2023-12-16 00:31:08','1'),
(4,15,3,'La Biblia de las ciencias naturales ','texto',12,121,581.000,'','Mediano','2009-05-31','Español','','34d5c98fd01b2b2cc48d1029fb46b61682aa7f6a.jpg','2023-12-02 20:50:05',NULL,NULL,'1'),
(5,6,1,'Atlas del cuerpo Humano','texto',10,100,574.000,'','Mediano','2010-05-04','Español','trata del cuerpo humano','cee4cdd14588a258d38a114810164b887a053492.jpg','2023-12-02 20:51:56',NULL,NULL,'1'),
(6,4,1,'Atlas del cielo','',12,111,525.000,'','Mediano','2010-02-22','Español','','a89d48460f4e35405f9bb15136900c9227d52b37.jpg','2023-12-03 15:30:08',NULL,NULL,'1'),
(7,17,1,'La odisea','historieta',22,111,883.000,'a','pequeño','2010-02-22','Español','La Odisea narra las aventuras de Odiseo, popularmente conocido como Ulises, en su viaje de regreso a su patria, Ítaca, luego de pasar diez años combatiendo en la guerra de Troya.','773b6ef271458e20fa5c74942e6abbdd06392717.jpg','2023-12-03 21:21:24',NULL,'2023-12-15 23:48:43','1'),
(8,18,2,'Los 7 hábitos de los adolescentes altamente afectivos','texto',12,210,150.001,'Madrid','Mediano','2003-03-31','Español','La época contemporánea fue el salto que provoco un gran cambio en la sociedad del siglo XVIII, la cual está marcada por grandes revoluciones y transformaciones en todos los aspectos que la constituyen','6fc68f5c4164cd8fba5802d6edd7408d1720622a.jpg','2023-12-05 22:19:19',NULL,NULL,'1'),
(9,8,5,'Dracula','comic',21,120,820.008,'','Pequeño','2010-03-04','Español','Un texto inquietante y una dinámica distribución de planos y viñetas llenas de atractivos personajes, bien identificados y diferenciados, crean el ambiente adecuado para que el niño se sumerja en una ','ea56ead04647442a6f7662064151c69e298f2396.jpg','2023-12-10 20:47:41',NULL,NULL,'1'),
(10,11,1,'La Ciudad de los perros','texo',30,121,869.056,'','Mediano','2011-04-13','Español','','62ff7ae3c091ba1df6bfb37d4c2c71b6320ab13f.jpg','2023-12-10 20:56:57',NULL,NULL,'1'),
(11,4,1,'sssssPrueba','texto',5,144,531.000,'nada','mediano','2000-12-12','español','nada','','2023-12-10 21:00:03',NULL,'2023-12-15 23:36:17','1'),
(12,19,3,'Dracula ','texto',1,121,58.000,'','Mediano','2010-04-24','Español','11111111111111111111111111111111111111111','d6ce6ed8edfb40bcaee8671f91012b2f4a175597.jpg','2023-12-12 19:49:41',NULL,NULL,'1'),
(14,3,1,'Prueba2','texto',1,144,531.000,'nada','mediano','2000-12-12','español','nada','1089b2d92e54a7f684358e33c78860e35c8b0540.jpg','2023-12-16 23:59:48',NULL,NULL,'1');

/*Table structure for table `librosentregados` */

DROP TABLE IF EXISTS `librosentregados`;

CREATE TABLE `librosentregados` (
  `idlibroentregado` int(11) NOT NULL AUTO_INCREMENT,
  `idprestamo` int(11) NOT NULL,
  `idejemplar` int(11) NOT NULL,
  `condicionentrega` varchar(100) NOT NULL,
  `condiciondevolucion` varchar(50) DEFAULT NULL,
  `observaciones` varchar(40) DEFAULT NULL,
  `fechadevolucion` datetime DEFAULT NULL,
  PRIMARY KEY (`idlibroentregado`),
  KEY `fk_idejemplar_libroentre` (`idejemplar`),
  KEY `fk_prestamo_libentre` (`idprestamo`),
  CONSTRAINT `fk_idejemplar_libroentre` FOREIGN KEY (`idejemplar`) REFERENCES `ejemplares` (`idejemplar`),
  CONSTRAINT `fk_prestamo_libentre` FOREIGN KEY (`idprestamo`) REFERENCES `prestamos` (`idprestamo`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `librosentregados` */

insert  into `librosentregados`(`idlibroentregado`,`idprestamo`,`idejemplar`,`condicionentrega`,`condiciondevolucion`,`observaciones`,`fechadevolucion`) values 
(1,3,15,'Deteriorado','Deteriorado','rayado','2023-12-03 00:00:00'),
(2,3,16,'Deteriorado','Bien','Bien','2023-12-03 00:00:00'),
(3,3,18,'Deteriorado','Bien','Bien','2023-12-03 00:00:00'),
(4,3,17,'Deteriorado','Bien','Bien','2023-12-03 00:00:00'),
(5,2,16,'',NULL,NULL,'2023-12-04 00:00:00'),
(6,2,23,'','bien','bien','2023-12-03 20:28:32'),
(7,2,24,'','bien','bien','2023-12-03 20:28:32'),
(8,2,25,'','bien','bien','2023-12-03 20:28:32'),
(9,5,6,'bien',NULL,NULL,'2023-12-04 00:00:00'),
(10,6,50,'','bien','bien','2023-12-03 15:56:42'),
(11,6,51,'','bien','bien','2023-12-03 15:56:42'),
(12,7,27,'','bien','bien','2023-12-03 16:01:10'),
(13,7,28,'','bien','bien','2023-12-03 16:01:10'),
(14,7,29,'','bien','bien','2023-12-03 16:01:10'),
(15,7,30,'','bien','bien','2023-12-03 16:01:10'),
(16,7,31,'','bien','bien','2023-12-03 16:01:10'),
(17,7,32,'','bien','bien','2023-12-03 16:01:10'),
(18,7,33,'','bien','bien','2023-12-03 16:01:10'),
(19,7,34,'','bien','bien','2023-12-03 16:01:10'),
(20,7,35,'','bien','bien','2023-12-03 16:01:10'),
(21,7,36,'','bien','bien','2023-12-03 16:01:10'),
(22,8,6,'bien','bien','bien','2023-12-03 19:26:25'),
(23,8,7,'bien','bien','bien','2023-12-03 19:26:25'),
(24,10,52,'Nuevo','bien','bien','2023-12-03 21:09:37'),
(25,10,53,'Nuevo','bien','bien','2023-12-03 21:09:37'),
(26,11,64,'Nuevo','bien','bien','2023-12-03 21:22:41'),
(27,11,65,'Nuevo','bien','bien','2023-12-03 21:22:41'),
(28,11,66,'Nuevo','bien','bien','2023-12-03 21:22:41'),
(29,11,67,'Nuevo','bien','bien','2023-12-03 21:22:41'),
(30,11,68,'Nuevo','bien','bien','2023-12-03 21:22:41'),
(31,12,6,'bien','Bien','Bien','2023-12-03 00:00:00'),
(32,13,64,'Nuevo','Bien','bien','2023-12-04 18:57:17'),
(33,14,27,'Usado','Deteriorado','no se entrego','2023-12-04 18:45:04'),
(34,14,30,'Usado','Deteriorado','no se entrego','2023-12-04 18:45:04'),
(35,14,29,'Usado','Deteriorado','no se entrego','2023-12-04 18:45:04'),
(36,14,28,'Usado','Deteriorado','no se entrego','2023-12-04 18:45:04'),
(37,15,1,'Usado','Deteriorado','no devuelto','2023-12-04 18:59:48'),
(38,15,2,'Mal','Deteriorado','no devuelto','2023-12-04 18:59:48'),
(39,15,3,'Mal','Deteriorado','no devuelto','2023-12-04 18:59:48'),
(40,15,48,'Mal','Deteriorado','no devuelto','2023-12-04 18:59:48'),
(41,15,50,'nuevo','Deteriorado','no devuelto','2023-12-04 18:59:48'),
(42,15,49,'Mal','Deteriorado','no devuelto','2023-12-04 18:59:48'),
(43,16,62,'',NULL,NULL,NULL),
(44,16,63,'',NULL,NULL,NULL),
(45,17,16,'Deteriorado','Bien','','2023-12-05 21:41:05'),
(46,18,1,'','Bien','bien','2023-12-05 20:01:01'),
(47,18,2,'',NULL,NULL,'2023-12-06 00:00:00'),
(48,18,3,'',NULL,NULL,'2023-12-06 00:00:00'),
(49,18,48,'',NULL,NULL,'2023-12-06 00:00:00'),
(50,18,49,'','Bien','bien','2023-12-05 20:01:01'),
(51,18,50,'','Bien','bien','2023-12-05 20:01:01'),
(52,18,86,'','Bien','bien','2023-12-05 20:01:01'),
(53,19,1,'Deteriorado','Bien','bien','2023-12-05 20:07:12'),
(54,19,2,'Deteriorado','Bien','bien','2023-12-05 20:07:12'),
(55,19,3,'Deteriorado','Bien','bien','2023-12-05 20:07:12'),
(56,19,48,'Deteriorado','Bien','bien','2023-12-05 20:07:12'),
(57,19,50,'Deteriorado','Bien','bien','2023-12-05 20:07:12'),
(58,19,49,'Deteriorado','Bien','bien','2023-12-05 20:07:12'),
(59,19,86,'usado','Bien','bien','2023-12-05 20:07:12'),
(60,20,54,'','Bien','bien','2023-12-05 20:07:21'),
(61,20,55,'','Bien','bien','2023-12-05 20:07:21'),
(62,20,56,'','Bien','bien','2023-12-05 20:07:21'),
(63,20,57,'','Bien','bien','2023-12-05 20:07:21'),
(64,20,53,'','Bien','bien','2023-12-05 20:07:21'),
(65,20,52,'','Bien','bien','2023-12-05 20:07:21'),
(66,20,58,'','Bien','bien','2023-12-05 20:07:21'),
(67,20,62,'','Bien','bien','2023-12-05 20:07:21'),
(68,20,61,'','Bien','bien','2023-12-05 20:07:21'),
(69,20,60,'','Bien','bien','2023-12-05 20:07:21'),
(70,20,59,'','Bien','bien','2023-12-05 20:07:21'),
(71,20,63,'','Bien','bien','2023-12-05 20:07:21'),
(72,21,64,'','Mal','no entregado','2023-12-05 20:08:05'),
(73,21,65,'','Mal','no entregado','2023-12-05 20:08:05'),
(74,21,66,'','Mal','no entregado','2023-12-05 20:08:05'),
(75,21,67,'','Mal','no entregado','2023-12-05 20:08:05'),
(76,21,68,'','Mal','no entregado','2023-12-05 20:08:05'),
(77,21,69,'','Mal','no entregado','2023-12-05 20:08:05'),
(78,21,71,'','Mal','no entregado','2023-12-05 20:08:05'),
(79,21,70,'','Mal','no entregado','2023-12-05 20:08:05'),
(80,21,74,'','Mal','no entregado','2023-12-05 20:08:05'),
(81,21,75,'','Mal','no entregado','2023-12-05 20:08:05'),
(82,21,72,'','Mal','no entregado','2023-12-05 20:08:05'),
(83,21,73,'','Mal','no entregado','2023-12-05 20:08:05'),
(84,21,76,'','Mal','no entregado','2023-12-05 20:08:05'),
(85,21,77,'','Mal','no entregado','2023-12-05 20:08:05'),
(86,21,79,'','Mal','no entregado','2023-12-05 20:08:05'),
(87,21,78,'','Mal','no entregado','2023-12-05 20:08:05'),
(88,21,81,'','Mal','no entregado','2023-12-05 20:08:05'),
(89,21,80,'','Mal','no entregado','2023-12-05 20:08:05'),
(90,21,82,'','Mal','no entregado','2023-12-05 20:08:05'),
(91,21,83,'','Mal','no entregado','2023-12-05 20:08:05'),
(92,21,84,'','Mal','no entregado','2023-12-05 20:08:05'),
(93,21,85,'','Mal','no entregado','2023-12-05 20:08:05'),
(94,24,6,'bien','Bien','no entrego','2023-12-05 21:48:22'),
(95,25,87,'Usado','Bien','bien','2023-12-05 22:22:19'),
(96,25,88,'Usado','Bien','bien','2023-12-05 22:22:19'),
(97,26,88,'Usado','Bien','bien','2023-12-05 22:26:20'),
(98,26,87,'Usado','Bien','bien','2023-12-05 22:26:20'),
(99,27,6,'bien','Bien','bien','2023-12-07 23:02:22'),
(100,27,7,'bien','Bien','bien','2023-12-07 23:02:22'),
(101,27,9,'Usado','Bien','bien','2023-12-07 23:02:22'),
(102,27,11,'Usado','Bien','bien','2023-12-07 23:02:22'),
(103,27,8,'Usado','Bien','bien','2023-12-07 23:02:22'),
(104,27,10,'Usado','Bien','bien','2023-12-07 23:02:22'),
(105,27,12,'Usado','Bien','bien','2023-12-07 23:02:22'),
(106,27,13,'Usado','Bien','bien','2023-12-07 23:02:22'),
(107,27,14,'Usado','Bien','bien','2023-12-07 23:02:22'),
(108,29,7,'bien','Bien','bien','2023-12-07 23:26:37'),
(109,29,8,'Usado','Bien','bien','2023-12-07 23:26:37'),
(110,29,6,'bien','Bien','bien','2023-12-07 23:26:37'),
(111,30,6,'bien','Bien','bien','2023-12-08 22:56:43'),
(112,31,1,'Deteriorado','Bien','bien','2023-12-08 22:51:43'),
(113,31,32,'Usado','Bien','bien','2023-12-08 22:51:43'),
(114,31,31,'Usado','Bien','bien','2023-12-08 22:51:43'),
(115,32,52,'Nuevo','Bien','bien','2023-12-08 23:31:41'),
(116,33,64,'Mal','Bien','bien','2023-12-10 00:30:29'),
(117,34,23,'Usado','Bien','bien','2023-12-10 23:36:03'),
(118,34,32,'Usado','Bien','bien','2023-12-10 23:36:03'),
(119,34,31,'Usado','Bien','bien','2023-12-10 23:36:03'),
(120,35,120,'Usado','Bien','bien','2023-12-10 21:35:00'),
(121,36,151,'Usado','Bien','bien','2023-12-10 21:39:20'),
(122,36,150,'Usado','Bien','bien','2023-12-10 21:39:20'),
(123,37,99,'Usado','Bien','bien','2023-12-10 21:43:00'),
(124,38,99,'Usado','Bien','bien','2023-12-10 21:46:15'),
(125,39,120,'Usado','Bien','bien','2023-12-10 21:47:05'),
(126,40,39,'Bien','Bien','bien','2023-12-10 21:48:00'),
(127,41,99,'Usado','Bien','Bien','2023-12-11 00:00:00'),
(128,42,52,'Nuevo','Bien','bien','2023-12-10 23:12:06'),
(129,44,52,'Nuevo','Bien','bien','2023-12-10 23:27:18'),
(130,45,6,'bien','Bien','bien','2023-12-10 23:33:14'),
(131,45,7,'bien','Bien','bien','2023-12-10 23:33:14'),
(132,46,6,'bien','Bien','bien','2023-12-10 23:34:26'),
(133,47,32,'Usado','Bien','bien','2023-12-10 23:40:48'),
(134,47,31,'Usado','Bien','bien','2023-12-10 23:40:48'),
(135,48,39,'Bien','Bien','bien','2023-12-11 00:12:10'),
(136,49,52,'Nuevo','Bien','bien','2023-12-11 21:49:38'),
(137,49,39,'Bien','Bien','bien','2023-12-11 21:49:38'),
(138,50,121,'Usado','Mal','mal','2023-12-11 00:00:00'),
(139,51,99,'Usado','Bien','bien','2023-12-11 21:55:22'),
(140,52,100,'Usado','Bien','bien','2023-12-11 21:59:35'),
(141,53,31,'Usado','Bien','bien','2023-12-11 22:01:47'),
(142,54,39,'Bien','Bien','bien','2023-12-11 22:13:21'),
(143,55,100,'Usado','Bien','bien','2023-12-11 22:14:33'),
(144,56,39,'Bien','Bien','bien','2023-12-11 22:15:58'),
(145,57,100,'Usado','Bien','bien','2023-12-12 20:36:10'),
(146,58,39,'Bien','Bien','bien','2023-12-12 20:38:27'),
(147,59,39,'Bien','Bien','bien','2023-12-12 20:40:11'),
(148,60,39,'Bien','Bien','bien','2023-12-12 20:42:39'),
(149,61,122,'Usado','Bien','Bien','2023-12-12 20:46:03'),
(150,62,152,'usado','Bien','Bien','2023-12-12 20:53:25'),
(151,63,6,'bien','Bien','bien','2023-12-12 20:54:29'),
(152,64,100,'Usado','Bien','bien','2023-12-12 21:00:12'),
(153,65,87,'Usado','Bien','bien','2023-12-12 21:01:48'),
(154,66,100,'Usado','Bien','bien','2023-12-12 21:03:03'),
(155,67,122,'Usado','Bien','bien','2023-12-12 21:04:27'),
(156,68,100,'Usado','Bien','Bien','2023-12-13 00:00:00'),
(157,69,39,'Bien','Bien','Bien','2023-12-12 21:06:52'),
(158,70,23,'Usado','Bien','Bien','2023-12-12 21:10:10'),
(159,71,31,'Usado','Bien','Bien','2023-12-13 00:00:00'),
(160,71,32,'Usado','Bien','bien','2023-12-12 21:17:21'),
(161,71,34,'Usado','Bien','bien','2023-12-12 21:17:21'),
(162,71,33,'Usado','Bien','bien','2023-12-12 21:17:21'),
(163,71,35,'Usado','Bien','bien','2023-12-12 21:17:21'),
(164,72,23,'Usado','Bien','bien','2023-12-12 21:28:32'),
(165,73,100,'Usado','Bien','bien','2023-12-12 21:32:01'),
(166,74,100,'Usado','Bien','Bien','2023-12-13 21:34:27'),
(167,75,39,'Bien','Bien','Bien','2023-12-13 22:08:59'),
(168,76,1,'Deteriorado','Deteriorado','sin pasta','2023-12-13 22:28:19'),
(169,77,6,'bien','Deteriorado','sin pasta','2023-12-13 22:37:32'),
(170,78,39,'Bien','Deteriorado','sin pasta','2023-12-13 22:57:39'),
(171,78,41,'Mal','Deteriorado','sin pasta','2023-12-13 22:57:39'),
(172,78,42,'Usado','Deteriorado','sin pasta','2023-12-13 22:57:39'),
(173,78,43,'Usado','Deteriorado','sin pasta','2023-12-13 22:57:39'),
(174,78,44,'Usado','Deteriorado','sin pasta','2023-12-13 22:57:39'),
(175,79,45,'Usado','Deteriorado','sin pasta','2023-12-13 23:12:30'),
(176,79,51,'nuevo','Deteriorado','sin pasta','2023-12-13 23:12:30'),
(177,79,47,'Usado','Deteriorado','sin pasta','2023-12-13 23:12:30'),
(178,79,46,'Usado','Deteriorado','sin pasta','2023-12-13 23:12:30'),
(179,80,7,'bien','Deteriorado','sin pasta','2023-12-13 23:19:27'),
(180,80,8,'Usado','Deteriorado','sin pasta','2023-12-13 23:19:27'),
(181,80,10,'Usado','Deteriorado','sin pasta','2023-12-13 23:19:27'),
(182,80,9,'Usado','Deteriorado','sin pasta','2023-12-13 23:19:27'),
(183,81,100,'Usado','Deteriorado','sin pasta','2023-12-13 23:24:38'),
(184,82,31,'Usado','Mal','no se devolvio','2023-12-13 23:48:40'),
(185,82,32,'Usado','Mal','no se devolvio','2023-12-13 23:48:40'),
(186,82,33,'Usado','Mal','no se devolvio','2023-12-13 23:48:40'),
(187,82,35,'Usado','Mal','no se devolvio','2023-12-13 23:48:40'),
(188,82,34,'Usado','Mal','no se devolvio','2023-12-13 23:48:40'),
(189,83,23,'Usado','Deteriorado','sin pasta','2023-12-13 23:50:15'),
(190,83,24,'Usado','Deteriorado','sin pasta','2023-12-13 23:50:15'),
(191,83,25,'Usado','Deteriorado','sin pasta','2023-12-13 23:50:15'),
(192,83,26,'Usado','Deteriorado','sin pasta','2023-12-13 23:50:15'),
(193,84,36,'Usado','Bien','bien','2023-12-13 23:53:28'),
(194,85,101,'Usado','Bien','Bien','2023-12-14 00:00:00'),
(195,85,100,'Deteriorado','Bien','Bien','2023-12-14 00:00:00'),
(196,86,39,'Deteriorado','Bien','bien','2023-12-14 00:03:37'),
(197,87,6,'Deteriorado','Bien','bien','2023-12-14 00:04:32'),
(198,88,52,'Nuevo','Bien','bien','2023-12-14 00:05:23'),
(199,89,39,'Deteriorado','Bien','bien','2023-12-14 00:07:38'),
(200,90,6,'Deteriorado','Deteriorado','roto','2023-12-14 00:21:18'),
(201,91,11,'Usado','Bien','bien','2023-12-14 00:25:16'),
(202,92,52,'Nuevo','Bien','bien','2023-12-14 00:39:12'),
(203,93,122,'Usado','Bien','bien','2023-12-14 00:40:08'),
(204,94,39,'Deteriorado','Bien','bien','2023-12-14 17:03:11'),
(205,95,153,'Usado','Bien','bien','2023-12-14 00:41:01'),
(206,96,11,'Usado','Bien','bien','2023-12-14 17:40:07'),
(207,99,12,'Usado','Bien','bien','2023-12-14 17:40:00'),
(208,100,100,'Deteriorado','Bien','bien','2023-12-14 17:38:09'),
(209,101,13,'Usado','Bien','bien','2023-12-14 17:39:54'),
(210,103,39,'Deteriorado','Bien','bien','2023-12-14 17:38:00'),
(211,104,52,'Nuevo','Bien','bien','2023-12-14 17:39:48'),
(212,105,39,'Deteriorado','Bien','bien','2023-12-14 18:00:33'),
(213,106,41,'Deteriorado','Bien','bien','2023-12-14 18:08:07'),
(214,107,42,'Deteriorado','Bien','bien','2023-12-16 18:46:48'),
(215,107,43,'Deteriorado','Bien','bien','2023-12-16 18:46:48'),
(216,108,52,'Nuevo',NULL,NULL,'2023-12-15 00:00:00'),
(217,117,100,'Deteriorado','Bien','bien','2023-12-16 21:24:30'),
(218,119,11,'Usado','Bien','','2023-12-16 21:19:44'),
(219,124,101,'Usado','Bien','bien','2023-12-16 21:17:03'),
(220,123,102,'Usado','Bien','bien','2023-12-16 21:37:59'),
(221,125,64,'Usado','Bien','bien','2023-12-16 21:39:35'),
(222,126,52,'Nuevo','Bien','bien','2023-12-17 22:57:45'),
(223,127,15,'Usado','Bien','bien','2023-12-17 22:57:39'),
(224,128,100,'Usado',NULL,NULL,'2023-12-19 00:00:00'),
(225,129,122,'Usado','Bien','bien','2023-12-17 22:58:15');

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `personas` */

insert  into `personas`(`idpersona`,`apellidos`,`nombres`,`nrodocumento`,`tipodocumento`,`fechanac`,`direccion`,`telefono`,`email`,`create_at`,`update_at`,`inactive_at`) values 
(1,'Berrocal paima','Luis Fernando','76543003','DNI',NULL,'Sunampe','964513274','','2023-11-14 20:04:43',NULL,NULL),
(2,'Cartagena Salazar','Jimena Adriana','73194180','DNI','0000-00-00','El carmen','','95107563','2023-11-14 20:04:43',NULL,NULL),
(3,'Cardenas Martinez','Maria Luisa','88678671','DNI','2010-05-06','','961770778','','2023-11-15 17:34:31',NULL,NULL),
(4,'Cartagena Salazar','Adriana Jimena','68754574','DNI','0000-00-00','Grocio Prado','950478703','','2023-11-17 22:10:26',NULL,NULL),
(5,'Flores Vilcapuma','Juan Miguel','65742687','DNI','1979-06-06','Grocio Prado','930704500','Juan@gmail.com','2023-11-17 23:09:29',NULL,NULL),
(6,'Belleza Quispe','Kiara ','68276870','DNI','0000-00-00','Chincha Baja','','','2023-11-17 23:10:50',NULL,NULL),
(7,'Valencia Navarro','Jhon Miguel','78710787','DNI','0000-00-00','Sunampe','950847870','','2023-11-17 23:12:24',NULL,NULL),
(8,'Felix Atuncar','Jose Antonio','73194188','DNI','0000-00-00','','928725757','','2023-11-21 21:00:57',NULL,NULL),
(9,'Turco Blanco','Juan Gabriel','57282068','DNI','0000-00-00','','956500007','','2023-11-21 21:02:05',NULL,NULL),
(10,'Blanco Turco','Juan','2706807','DNI','0000-00-00','Sunampe','958752405','','2023-11-21 21:03:43',NULL,NULL),
(11,'Tasayco Gomez','Raúl','72890192','DNI','1990-10-10','Chincha Alta','938789282','','2023-11-21 21:04:32',NULL,NULL),
(12,'Moron Roblez','Jasira Angela','57468484','DNI','0000-00-00','Grocio Prado','956404584','','2023-11-22 22:10:20',NULL,NULL),
(13,'Lopez García','Elizabeth','78290181','DNI','0000-00-00','Chincha Baja','928782981','','2023-11-25 19:45:10',NULL,NULL),
(15,'Garcia','Fred alfredo','68725872','DNI','0000-00-00','chincha baja','','','2023-11-25 21:18:51',NULL,NULL),
(16,'Huaman Condori','Maria Alejandra','63527687','DNI','1980-08-07','','987204687','','2023-11-29 18:04:47',NULL,NULL),
(17,'Palomino Hernández ','Carlos','79602857','DNI','0000-00-00','','','','2023-12-16 21:54:16',NULL,NULL),
(18,'Salazar Urbano','Kenia ','62578726','DNI','0000-00-00','Grocio Prado','962485028','','2023-12-16 21:55:57',NULL,NULL),
(20,'Tasayco Cardenas','Juan','72890123','DNI','2006-10-10','Chincha Alta','938789282','','2023-12-16 21:59:20',NULL,NULL),
(21,'García Campos','Dominick','70056460','DNI','2008-05-31','Sunampe','925408054','','2023-12-16 22:06:23',NULL,NULL),
(22,'Guillen Amoretti','Gabriela','65247872','DNI','2008-05-05','','9','','2023-12-16 22:07:18',NULL,NULL),
(23,'Navarro Vilchez','Xiomara','52687268','DNI','2009-03-31','Chincha','','','2023-12-17 21:46:35',NULL,NULL),
(24,'Sanchez Flores','Luisa','72089808','DNI','1980-03-09','','','','2023-12-17 21:47:56',NULL,NULL),
(25,'Alcca Herrera','Viviana Luisa','56268787','DNI','2010-05-04','Grocio Prado','950680746','54514@gmail.com','2023-12-17 21:49:00',NULL,NULL),
(26,'Garcia Monayco','Ursula','7654321','DNI','2010-06-04','Sunampe','925456406','Sunampe','2023-12-17 21:51:55',NULL,NULL),
(28,'Cabrera Luque','Irene','73194181','DNI','0000-00-00','','','','2023-12-17 22:53:51',NULL,NULL);

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
  `motivorechazo` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idprestamo`),
  KEY `fk_idbene_prestamo` (`idbeneficiario`),
  KEY `fk_idbiblio_prestamo` (`idbibliotecario`),
  KEY `fk_idlibro_prestamo` (`idlibro`),
  CONSTRAINT `fk_idbene_prestamo` FOREIGN KEY (`idbeneficiario`) REFERENCES `usuarios` (`idusuario`),
  CONSTRAINT `fk_idbiblio_prestamo` FOREIGN KEY (`idbibliotecario`) REFERENCES `usuarios` (`idusuario`),
  CONSTRAINT `fk_idlibro_prestamo` FOREIGN KEY (`idlibro`) REFERENCES `libros` (`idlibro`),
  CONSTRAINT `ck_enbiblio_presta` CHECK (`enbiblioteca` in ('SI','NO')),
  CONSTRAINT `ck_estado_ore` CHECK (`estado` in ('E','S','R','D','T','N','C'))
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `prestamos` */

insert  into `prestamos`(`idprestamo`,`idbeneficiario`,`idbibliotecario`,`idlibro`,`cantidad`,`fechasolicitud`,`fechaprestamo`,`fecharespuesta`,`fechaentrega`,`descripcion`,`enbiblioteca`,`lugardestino`,`estado`,`activo`,`motivorechazo`) values 
(1,5,NULL,4,2,'2023-12-03 15:19:25','2023-12-04 00:00:00',NULL,NULL,'Ciencias social','SI','','C','1','No se encontro el libro'),
(2,5,NULL,3,4,'2023-12-03 15:21:30','2023-12-04 00:00:00','2023-12-03 15:50:32','2023-12-03 20:27:24','Ciencia Social','SI','','T','1',NULL),
(3,12,1,NULL,NULL,'2023-12-03 15:45:24','2023-12-03 15:45:24',NULL,'2023-12-03 15:45:24','Ciencia','SI',NULL,'T','1',NULL),
(4,13,1,NULL,NULL,'2023-12-03 15:51:13','2023-12-03 15:51:13',NULL,'2023-12-03 15:51:13','3M','SI',NULL,'E','1',NULL),
(5,4,1,NULL,NULL,'2023-12-03 15:52:04','2023-12-04 00:00:00',NULL,NULL,'4A','SI',NULL,'C','1','mal'),
(6,5,NULL,6,2,'2023-12-03 15:53:29','2023-12-04 00:00:00','2023-12-03 15:53:47','2023-12-03 15:54:19','','SI','','T','1',NULL),
(7,5,NULL,4,10,'2023-12-03 15:57:41','2023-12-03 00:00:00','2023-12-03 15:58:13','2023-12-03 16:01:02','Ciencia','SI','','T','1',NULL),
(8,5,NULL,2,2,'2023-12-03 16:01:48','2023-12-04 00:00:00','2023-12-03 19:25:49','2023-12-03 19:26:05','','SI','','T','1',NULL),
(9,5,NULL,6,2,'2023-12-03 19:44:58','2023-12-04 00:00:00',NULL,NULL,'','SI','','C','1','no se encontro el libro'),
(10,7,5,NULL,NULL,'2023-12-03 21:09:24','2023-12-03 21:09:24',NULL,'2023-12-03 21:09:24','','SI',NULL,'T','1',NULL),
(11,14,5,NULL,NULL,'2023-12-03 21:22:30','2023-12-03 21:22:30',NULL,'2023-12-03 21:22:30','4A','SI',NULL,'T','1',NULL),
(12,4,5,NULL,NULL,'2023-12-03 23:17:13','2023-12-03 23:17:13',NULL,'2023-12-03 23:17:13','3M','SI',NULL,'T','1',NULL),
(13,13,5,NULL,NULL,'2023-12-03 23:35:07','2023-12-04 00:00:00',NULL,'2023-12-04 18:57:10','5H','SI',NULL,'T','1',NULL),
(14,12,1,NULL,NULL,'2023-12-04 18:08:35','2023-12-05 00:00:00',NULL,'2023-12-04 18:09:06','Ciencia','SI',NULL,'T','1',NULL),
(15,13,1,NULL,NULL,'2023-12-04 18:59:26','2023-12-04 18:59:26',NULL,'2023-12-04 18:59:26','5H','SI',NULL,'T','1',NULL),
(16,5,NULL,7,2,'2023-12-04 21:31:56','2023-12-07 00:00:00',NULL,NULL,'','SI','','C','1','no se encontro el libro'),
(17,14,1,NULL,NULL,'2023-12-04 22:54:51','2023-12-05 00:00:00',NULL,'2023-12-05 21:38:15','4A','SI',NULL,'T','1',NULL),
(18,5,1,NULL,NULL,'2023-12-05 19:56:33','2023-12-05 19:56:33',NULL,'2023-12-05 19:56:33','Ciencia Social','SI',NULL,'T','1',NULL),
(19,6,1,NULL,NULL,'2023-12-05 20:02:03','2023-12-05 20:02:03',NULL,'2023-12-05 20:02:03','4A','SI',NULL,'T','1',NULL),
(20,5,1,NULL,NULL,'2023-12-05 20:03:44','2023-12-06 00:00:00',NULL,'2023-12-05 20:03:55','Ciencia Social','SI',NULL,'T','1',NULL),
(21,5,1,NULL,NULL,'2023-12-05 20:06:22','2023-12-05 20:06:22',NULL,'2023-12-05 20:06:22','Ciencia Social','SI',NULL,'T','1',NULL),
(22,5,1,NULL,NULL,'2023-12-05 21:29:24','2023-12-05 21:29:24',NULL,'2023-12-05 21:29:24','Ciencia Social','SI',NULL,'E','1',NULL),
(23,4,1,NULL,NULL,'2023-12-05 21:37:10','2023-12-05 21:37:10',NULL,'2023-12-05 21:37:10','3M','SI',NULL,'E','1',NULL),
(24,14,1,NULL,NULL,'2023-12-05 21:41:22','2023-12-05 21:41:22',NULL,'2023-12-05 21:41:22','4A','SI',NULL,'T','1',NULL),
(25,6,1,NULL,NULL,'2023-12-05 22:20:05','2023-12-05 22:20:05',NULL,'2023-12-05 22:20:05','4A','SI',NULL,'T','1',NULL),
(26,6,1,NULL,NULL,'2023-12-05 22:26:02','2023-12-05 22:26:02',NULL,'2023-12-05 22:26:02','4A','SI',NULL,'T','1',NULL),
(27,7,1,NULL,NULL,'2023-12-07 23:01:13','2023-12-07 23:01:13',NULL,'2023-12-07 23:01:13','4B','SI',NULL,'T','1',NULL),
(28,15,1,NULL,NULL,'2023-12-07 23:25:40','2023-12-07 23:25:40',NULL,'2023-12-07 23:25:40','Matematica','SI',NULL,'E','1',NULL),
(29,15,1,NULL,NULL,'2023-12-07 23:26:18','2023-12-07 23:26:18',NULL,'2023-12-07 23:26:18','Matematica','SI',NULL,'T','1',NULL),
(30,14,1,NULL,NULL,'2023-12-08 20:16:58','2023-12-10 00:00:00',NULL,'2023-12-08 22:56:28','4A','SI',NULL,'T','1',NULL),
(31,5,1,NULL,NULL,'2023-12-08 20:18:53','2023-12-11 00:00:00',NULL,'2023-12-08 22:51:22','Ciencia Social','SI',NULL,'T','1',NULL),
(32,13,1,NULL,NULL,'2023-12-08 23:31:29','2023-12-08 23:31:29',NULL,'2023-12-08 23:31:29','5H','SI',NULL,'T','1',NULL),
(33,4,1,NULL,NULL,'2023-12-09 21:16:58','2023-12-11 00:00:00',NULL,'2023-12-09 21:17:16','3M','SI',NULL,'T','1',NULL),
(34,12,1,NULL,NULL,'2023-12-10 00:29:16','2023-12-11 00:00:00',NULL,'2023-12-10 23:35:39','Ciencia','SI',NULL,'T','1',NULL),
(35,3,1,NULL,NULL,'2023-12-10 21:07:13','2023-12-10 21:07:13',NULL,'2023-12-10 21:07:13','1A','SI',NULL,'T','1',NULL),
(36,5,1,NULL,NULL,'2023-12-10 21:38:33','2023-12-10 21:38:33',NULL,'2023-12-10 21:38:33','Ciencia Social','SI',NULL,'T','1',NULL),
(37,13,1,NULL,NULL,'2023-12-10 21:42:41','2023-12-10 21:42:41',NULL,'2023-12-10 21:42:41','5H','SI',NULL,'T','1',NULL),
(38,4,1,NULL,NULL,'2023-12-10 21:46:02','2023-12-10 21:46:02',NULL,'2023-12-10 21:46:02','3M','SI',NULL,'T','1',NULL),
(39,14,1,NULL,NULL,'2023-12-10 21:46:51','2023-12-10 21:46:51',NULL,'2023-12-10 21:46:51','4A','SI',NULL,'T','1',NULL),
(40,14,1,NULL,NULL,'2023-12-10 21:47:25','2023-12-10 21:47:25',NULL,'2023-12-10 21:47:25','4A','SI',NULL,'T','1',NULL),
(41,4,1,NULL,NULL,'2023-12-10 22:19:00','2023-12-10 22:19:00',NULL,'2023-12-10 22:19:00','3M','SI',NULL,'T','1',NULL),
(42,4,1,NULL,NULL,'2023-12-10 23:09:59','2023-12-10 23:09:59',NULL,'2023-12-10 23:09:59','3M','SI',NULL,'T','1',NULL),
(43,4,1,NULL,NULL,'2023-12-10 23:26:08','2023-12-10 23:26:08',NULL,'2023-12-10 23:26:08','3M','SI',NULL,'E','1',NULL),
(44,4,1,NULL,NULL,'2023-12-10 23:26:49','2023-12-10 23:26:49',NULL,'2023-12-10 23:26:49','3M','SI',NULL,'T','1',NULL),
(45,11,1,NULL,NULL,'2023-12-10 23:32:38','2023-12-10 23:32:38',NULL,'2023-12-10 23:32:38','Matematica','SI',NULL,'T','1',NULL),
(46,11,1,NULL,NULL,'2023-12-10 23:34:14','2023-12-10 23:34:14',NULL,'2023-12-10 23:34:14','Matematica','SI',NULL,'T','1',NULL),
(47,12,1,NULL,NULL,'2023-12-10 23:38:49','2023-12-11 00:00:00',NULL,'2023-12-10 23:39:00','Ciencia','SI',NULL,'T','1',NULL),
(48,12,1,NULL,NULL,'2023-12-11 00:09:01','2023-12-11 00:09:01',NULL,'2023-12-11 00:09:01','Ciencia','SI',NULL,'T','1',NULL),
(49,4,1,NULL,NULL,'2023-12-11 20:52:04','2023-12-11 20:52:04',NULL,'2023-12-11 20:52:04','3M','SI',NULL,'T','1',NULL),
(50,14,1,NULL,NULL,'2023-12-11 21:47:00','2023-12-11 21:47:00',NULL,'2023-12-11 21:47:00','4A','SI',NULL,'T','1',NULL),
(51,14,1,NULL,NULL,'2023-12-11 21:55:05','2023-12-11 21:55:05',NULL,'2023-12-11 21:55:05','4A','SI',NULL,'T','1',NULL),
(52,13,1,NULL,NULL,'2023-12-11 21:59:21','2023-12-11 21:59:21',NULL,'2023-12-11 21:59:21','5H','SI',NULL,'T','1',NULL),
(53,12,1,NULL,NULL,'2023-12-11 22:01:31','2023-12-11 22:01:31',NULL,'2023-12-11 22:01:31','Ciencia','SI',NULL,'T','1',NULL),
(54,14,1,NULL,NULL,'2023-12-11 22:12:32','2023-12-11 22:12:32',NULL,'2023-12-11 22:12:32','4A','SI',NULL,'T','1',NULL),
(55,7,1,NULL,NULL,'2023-12-11 22:14:19','2023-12-11 22:14:19',NULL,'2023-12-11 22:14:19','4B','SI',NULL,'T','1',NULL),
(56,14,1,NULL,NULL,'2023-12-11 22:15:45','2023-12-11 22:15:45',NULL,'2023-12-11 22:15:45','4A','SI',NULL,'T','1',NULL),
(57,4,1,NULL,NULL,'2023-12-12 20:34:21','2023-12-12 20:34:21',NULL,'2023-12-12 20:34:21','3M','SI',NULL,'T','1',NULL),
(58,13,1,NULL,NULL,'2023-12-12 20:37:29','2023-12-12 20:37:29',NULL,'2023-12-12 20:37:29','5H','SI',NULL,'T','1',NULL),
(59,4,1,NULL,NULL,'2023-12-12 20:39:09','2023-12-12 20:39:09',NULL,'2023-12-12 20:39:09','3M','SI',NULL,'T','1',NULL),
(60,4,1,NULL,NULL,'2023-12-12 20:42:06','2023-12-12 20:42:06',NULL,'2023-12-12 20:42:06','3M','SI',NULL,'T','1',NULL),
(61,13,1,NULL,NULL,'2023-12-12 20:45:25','2023-12-12 20:45:25',NULL,'2023-12-12 20:45:25','5H','SI',NULL,'T','1',NULL),
(62,13,1,NULL,NULL,'2023-12-12 20:53:10','2023-12-12 20:53:10',NULL,'2023-12-12 20:53:10','5H','SI',NULL,'T','1',NULL),
(63,13,1,NULL,NULL,'2023-12-12 20:54:21','2023-12-12 20:54:21',NULL,'2023-12-12 20:54:21','5H','SI',NULL,'T','1',NULL),
(64,13,1,NULL,NULL,'2023-12-12 20:59:50','2023-12-12 20:59:50',NULL,'2023-12-12 20:59:50','5H','SI',NULL,'T','1',NULL),
(65,4,1,NULL,NULL,'2023-12-12 21:01:26','2023-12-12 21:01:26',NULL,'2023-12-12 21:01:26','3M','SI',NULL,'T','1',NULL),
(66,13,1,NULL,NULL,'2023-12-12 21:02:50','2023-12-12 21:02:50',NULL,'2023-12-12 21:02:50','5H','SI',NULL,'T','1',NULL),
(67,7,1,NULL,NULL,'2023-12-12 21:04:11','2023-12-12 21:04:11',NULL,'2023-12-12 21:04:11','4B','SI',NULL,'T','1',NULL),
(68,14,1,NULL,NULL,'2023-12-12 21:06:03','2023-12-12 21:06:03',NULL,'2023-12-12 21:06:03','4A','SI',NULL,'T','1',NULL),
(69,13,1,NULL,NULL,'2023-12-12 21:06:33','2023-12-12 21:06:33',NULL,'2023-12-12 21:06:33','5H','SI',NULL,'T','1',NULL),
(70,6,1,NULL,NULL,'2023-12-12 21:09:33','2023-12-12 21:09:33',NULL,'2023-12-12 21:09:33','4A','SI',NULL,'T','1',NULL),
(71,12,1,NULL,NULL,'2023-12-12 21:15:27','2023-12-12 21:15:27',NULL,'2023-12-12 21:15:27','Ciencia','SI',NULL,'T','1',NULL),
(72,6,1,NULL,NULL,'2023-12-12 21:21:44','2023-12-12 21:21:44',NULL,'2023-12-12 21:21:44','4A','SI',NULL,'T','1',NULL),
(73,14,1,NULL,NULL,'2023-12-12 21:30:50','2023-12-13 00:00:00',NULL,'2023-12-12 21:31:46','4A','SI',NULL,'T','1',NULL),
(74,14,1,NULL,NULL,'2023-12-13 21:31:00','2023-12-13 21:31:00',NULL,'2023-12-13 21:31:00','4A','SI',NULL,'T','1',NULL),
(75,13,1,NULL,NULL,'2023-12-13 21:38:22','2023-12-13 21:38:22',NULL,'2023-12-13 21:38:22','5H','SI',NULL,'T','1',NULL),
(76,13,1,NULL,NULL,'2023-12-13 22:22:50','2023-12-13 22:22:50',NULL,'2023-12-13 22:22:50','5H','SI',NULL,'T','1',NULL),
(77,4,1,NULL,NULL,'2023-12-13 22:37:21','2023-12-13 22:37:21',NULL,'2023-12-13 22:37:21','3M','SI',NULL,'T','1',NULL),
(78,12,1,NULL,NULL,'2023-12-13 22:48:04','2023-12-13 22:48:04',NULL,'2023-12-13 22:48:04','Ciencia','SI',NULL,'T','1',NULL),
(79,5,1,NULL,NULL,'2023-12-13 22:49:05','2023-12-13 22:49:05',NULL,'2023-12-13 22:49:05','Ciencia Social','SI',NULL,'T','1',NULL),
(80,15,1,NULL,NULL,'2023-12-13 23:07:09','2023-12-13 23:07:09',NULL,'2023-12-13 23:07:09','Matematica','SI',NULL,'T','1',NULL),
(81,14,1,NULL,NULL,'2023-12-13 23:08:37','2023-12-13 23:08:37',NULL,'2023-12-13 23:08:37','4A','SI',NULL,'T','1',NULL),
(82,12,1,NULL,NULL,'2023-12-13 23:45:02','2023-12-13 23:45:02',NULL,'2023-12-13 23:45:02','Ciencia','SI',NULL,'T','1',NULL),
(83,12,1,NULL,NULL,'2023-12-13 23:49:48','2023-12-13 23:49:48',NULL,'2023-12-13 23:49:48','Ciencia','SI',NULL,'T','1',NULL),
(84,12,1,NULL,NULL,'2023-12-13 23:53:11','2023-12-13 23:53:11',NULL,'2023-12-13 23:53:11','Ciencia','SI',NULL,'T','1',NULL),
(85,13,1,NULL,NULL,'2023-12-13 23:59:29','2023-12-13 23:59:29',NULL,'2023-12-13 23:59:29','5H','SI',NULL,'T','1',NULL),
(86,12,1,NULL,NULL,'2023-12-14 00:03:26','2023-12-14 00:03:26',NULL,'2023-12-14 00:03:26','Ciencia','SI',NULL,'T','1',NULL),
(87,12,1,NULL,NULL,'2023-12-14 00:04:14','2023-12-14 00:04:14',NULL,'2023-12-14 00:04:14','Ciencia','SI',NULL,'T','1',NULL),
(88,14,1,NULL,NULL,'2023-12-14 00:05:11','2023-12-14 00:05:11',NULL,'2023-12-14 00:05:11','4A','SI',NULL,'T','1',NULL),
(89,7,1,NULL,NULL,'2023-12-14 00:07:24','2023-12-14 00:07:24',NULL,'2023-12-14 00:07:24','','SI',NULL,'T','1',NULL),
(90,11,1,NULL,NULL,'2023-12-14 00:20:02','2023-12-14 00:20:02',NULL,'2023-12-14 00:20:02','Matematica','NO',NULL,'T','1',NULL),
(91,13,1,NULL,NULL,'2023-12-14 00:25:00','2023-12-14 00:25:00',NULL,'2023-12-14 00:25:00','5H','SI',NULL,'T','1',NULL),
(92,13,1,NULL,NULL,'2023-12-14 00:33:48','2023-12-14 00:33:48',NULL,'2023-12-14 00:33:48','5H','SI',NULL,'T','1',NULL),
(93,6,1,NULL,NULL,'2023-12-14 00:39:56','2023-12-14 00:39:56',NULL,'2023-12-14 00:39:56','4A','SI',NULL,'T','1',NULL),
(94,13,1,NULL,NULL,'2023-12-14 00:40:37','2023-12-14 00:40:37',NULL,'2023-12-14 00:40:37','5H','SI',NULL,'T','1',NULL),
(95,15,1,NULL,NULL,'2023-12-14 00:40:49','2023-12-14 00:40:49',NULL,'2023-12-14 00:40:49','Matematica','SI',NULL,'T','1',NULL),
(96,13,1,NULL,NULL,'2023-12-14 17:04:51','2023-12-14 17:04:51',NULL,'2023-12-14 17:04:51','5H','SI',NULL,'T','1',NULL),
(98,14,1,NULL,NULL,'2023-12-14 17:29:24','2023-12-14 00:00:00',NULL,NULL,'4A','SI',NULL,'E','1',NULL),
(99,4,1,NULL,NULL,'2023-12-14 17:29:49','0000-00-00 00:00:00',NULL,'2023-12-14 17:38:44','3M','SI',NULL,'T','1',NULL),
(100,14,1,NULL,NULL,'2023-12-14 17:30:46','2023-12-14 00:00:00',NULL,'2023-12-14 17:37:18','4A','SI',NULL,'T','1',NULL),
(101,15,1,NULL,NULL,'2023-12-14 17:31:29','2023-12-14 00:00:00',NULL,'2023-12-14 17:38:46','Matematica','SI',NULL,'T','1',NULL),
(103,7,1,NULL,NULL,'2023-12-14 17:34:21','2023-12-14 17:34:21',NULL,'2023-12-14 17:34:21','','SI',NULL,'T','1',NULL),
(104,7,1,NULL,NULL,'2023-12-14 17:38:32','2023-12-14 00:00:00',NULL,'2023-12-14 17:39:34','','SI',NULL,'T','1',NULL),
(105,4,1,NULL,NULL,'2023-12-14 17:40:33','2023-12-14 00:00:00',NULL,'2023-12-14 17:40:46','3M','SI',NULL,'T','1',NULL),
(106,14,1,NULL,NULL,'2023-12-14 17:49:25','2023-12-14 17:49:25',NULL,'2023-12-14 17:49:25','4A','SI',NULL,'T','1',NULL),
(107,13,1,NULL,NULL,'2023-12-14 17:50:13','2023-12-14 17:50:13',NULL,'2023-12-14 17:50:13','5H','SI',NULL,'T','1',NULL),
(108,4,1,NULL,NULL,'2023-12-14 18:19:47','2023-12-14 00:00:00',NULL,NULL,'3M','SI',NULL,'C','1','no recogió'),
(111,5,1,NULL,NULL,'2023-12-14 21:56:01','2023-12-14 21:56:01',NULL,'2023-12-14 21:56:01','Ciencia Social','SI',NULL,'E','1',NULL),
(116,14,1,NULL,NULL,'2023-12-14 22:09:11','2023-12-14 22:09:11',NULL,'2023-12-14 22:09:11','4A','SI',NULL,'E','1',NULL),
(117,5,1,NULL,NULL,'2023-12-14 22:11:12','2023-12-14 22:11:12',NULL,'2023-12-14 22:11:12','Ciencia Social','SI',NULL,'T','1',NULL),
(119,12,1,NULL,NULL,'2023-12-15 22:06:33','2023-12-15 22:06:33',NULL,'2023-12-15 22:06:33','Ciencia','SI',NULL,'T','1',NULL),
(121,15,1,NULL,NULL,'2023-12-15 22:46:43','2023-12-15 22:46:43',NULL,'2023-12-15 22:46:43','Matematica','SI',NULL,'E','1',NULL),
(122,2,1,NULL,NULL,'2023-12-15 22:47:37','2023-12-15 22:47:37',NULL,'2023-12-15 22:47:37','','SI',NULL,'E','1',NULL),
(123,3,NULL,9,1,'2023-12-16 21:11:05','2023-12-18 00:00:00','2023-12-16 21:14:13','2023-12-16 21:37:52','','SI','','T','1',NULL),
(124,14,1,NULL,NULL,'2023-12-16 21:12:59','2023-12-16 21:12:59',NULL,'2023-12-16 21:12:59','4A','SI',NULL,'T','1',NULL),
(125,13,1,NULL,NULL,'2023-12-16 21:39:25','2023-12-16 21:39:25',NULL,'2023-12-16 21:39:25','5H','NO','Salón 5','T','1',NULL),
(126,4,1,NULL,NULL,'2023-12-17 21:39:47','2023-12-17 21:39:47',NULL,'2023-12-17 21:39:47','3M','SI',NULL,'T','1',NULL),
(127,17,1,NULL,NULL,'2023-12-17 21:42:15','2023-12-17 21:42:15',NULL,'2023-12-17 21:42:15','Quimica','SI',NULL,'T','1',NULL),
(128,14,1,NULL,NULL,'2023-12-17 21:44:07','2023-12-19 00:00:00',NULL,NULL,'4A','SI',NULL,'R','1',NULL),
(129,2,NULL,10,1,'2023-12-17 21:56:31','2023-12-18 00:00:00','2023-12-17 21:57:23','2023-12-17 22:58:06','','NO','aula','T','1',NULL);

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
  CONSTRAINT `ck_nombrerol_roles` CHECK (`nombrerol` in ('Administrador','Profesor','Estudiante','Subdirector'))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `roles` */

insert  into `roles`(`idrol`,`nombrerol`,`cantidadmax`,`create_at`,`update_at`,`inactive_at`) values 
(1,'Administrador',5,'2023-11-14 20:04:52',NULL,NULL),
(2,'Profesor',40,'2023-11-14 20:04:52',NULL,NULL),
(3,'Estudiante',3,'2023-11-14 20:04:52',NULL,NULL),
(4,'Subdirector',1,'2023-12-06 22:32:09',NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(18,2,'Psicología',150,'2023-11-28 00:11:47',NULL,NULL),
(19,1,'Computación',6,'2023-12-08 19:12:23',NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `usuarios` */

insert  into `usuarios`(`idusuario`,`idpersona`,`idrol`,`nombreusuario`,`claveacceso`,`create_at`,`update_at`,`inactive_at`,`estado`) values 
(1,1,1,'75123489','$2y$10$XHDYbSiabfwFNp10G4eu1u4q9Kr2scVpAjCIisanEocgIaTcs2XCO','2023-11-14 20:04:56','2023-12-18 00:18:01','2023-12-12 21:19:21','1'),
(2,2,3,'78674219','$2y$10$1EwQL/puaUQHsn3KpLDQge.QJ5zTmDQ3PmQkd2du.4H91O8UsatWC','2023-11-14 20:04:56',NULL,'2023-12-10 21:34:31','1'),
(3,3,3,'Maria12','$2y$10$pxX3igy8jxsXn0d6pIfhuOAgrqtyYllrjRoKExylPwWx5eV.sL5Wi','2023-11-15 17:34:31','2023-12-16 21:03:46','2023-12-10 23:00:42','1'),
(4,4,3,'Adri12','$2y$10$BAFdgrEAUrbCiAvJqXK1JewmEmWD4z6elZ/SbjfPL6AtlAdtycXyK','2023-11-17 22:10:26',NULL,'2023-12-17 21:39:49','1'),
(5,5,2,'Juan12','$2y$10$DO47kyJla58I/3HnjIfwqODpmZpT0d92aC98PJvnhzt0iA.CAu.0a','2023-11-17 23:09:29',NULL,'2023-12-14 22:11:13','1'),
(6,6,3,'Kiarabq','$2y$10$uwF4lFXTH1mw4yw.lXX7HeVTMGAr10dRPE4DnypxrX5oYb3quMvum','2023-11-17 23:10:50',NULL,'2023-12-14 00:39:58','1'),
(7,7,3,'JhonF','$2y$10$Cp0BSJyKCFSKllRAZ/.DA.8Eu3BR/IC4IdUi0.Yj3rWAGUz7hPSRG','2023-11-17 23:12:24',NULL,'2023-12-14 17:38:34','1'),
(11,11,2,'72890192','$2y$10$1EwQL/puaUQHsn3KpLDQge.QJ5zTmDQ3PmQkd2du.4H91O8UsatWC','2023-11-21 21:04:32',NULL,'2023-12-14 00:21:18','1'),
(12,12,2,'54165','$2y$10$IAtQzGqfXelNXJfSkEt8i.5UxQkdDQgf0xTvrjxWcdbPLN0h.0NkO','2023-11-22 22:10:20',NULL,'2023-12-15 22:06:36','1'),
(13,13,3,'78290181','$2y$10$1EwQL/puaUQHsn3KpLDQge.QJ5zTmDQ3PmQkd2du.4H91O8UsatWC','2023-11-25 19:45:10',NULL,'2023-12-16 21:39:26','1'),
(14,15,3,'Fred12','$2y$10$DGRQGH1Ch28HBqHokIY6.u01dcMoXXz1/aJxq5Fah345UG5.zu9Oe','2023-11-25 21:18:51',NULL,'2023-12-17 21:44:08','0'),
(15,16,2,'Ale12','$2y$10$hawx981.c.gQRjCAPIQQOeVPoUcibqg1lEhSLhUNCgPQtqOT72qgO','2023-11-29 18:04:47',NULL,'2023-12-14 17:31:30','1'),
(16,8,4,'73194188','$2y$10$M0PnVKniA4vjKwavvC1m9O1YdwzNM.XQInVKho5PJr0GjA6Bbt9gO','2023-12-06 22:43:32',NULL,NULL,'1'),
(17,17,2,'79602857','$2y$10$a7KStvb08eV1c9PyS8PReOjjEiF7FfCdh8EwmiheLCuCVyFTNJKki','2023-12-16 21:54:16',NULL,'2023-12-17 21:42:17','1'),
(18,18,2,'62578726','$2y$10$ez444zmhg4SzVdk35k/0W.QcA3bWt4W09C6.Pag26HkACSf7ZsoWa','2023-12-16 21:55:57',NULL,NULL,'1'),
(19,20,2,'72890123','4321','2023-12-16 21:59:20',NULL,NULL,'1'),
(20,21,3,'70056460','$2y$10$v.3w9UOJlIJMnXVODL7iF.47eZ6RDWl7pAi5hMk46Wo2ffnAzBmJa','2023-12-16 22:06:23',NULL,NULL,'1'),
(21,22,2,'65247872','$2y$10$za35/IWlsOy5Vb93DTpcfOwsF7KofQvqPNJEXty.lYNvcMSjmWQjG','2023-12-16 22:07:18',NULL,NULL,'1'),
(22,23,3,'52687268','$2y$10$uauysBK41DWsuuoIm/7cGeWwXduyl9yXL7/Ny8eQ.tI2tOnk.JQ6C','2023-12-17 21:46:35',NULL,NULL,'1'),
(23,24,2,'72089808','$2y$10$UKTTfZx.q.T/4p3FzPNiYORp51padIo2brBwgvUziAmajFlKOZvM2','2023-12-17 21:47:56',NULL,NULL,'1'),
(24,25,3,'56268787','$2y$10$XOJiHWnq5sfLQXhJw9FdXud1WwOZDv4jIQPns4NuqahrfSH8GeejS','2023-12-17 21:49:00',NULL,NULL,'1'),
(25,26,3,'','$2y$10$Ej/6Z4Kr1ZWdBDN/RG26ieTvDX1VBzqGtmKx1oCSKjC/5Vw.w5OXm','2023-12-17 21:51:55',NULL,NULL,'1'),
(26,28,3,'73194180','$2y$10$bPkn7xtfsjnJy5cYJ8q2TePbwjch8IUdF.AtGRiU3FcxqC.YZqGgS','2023-12-17 22:53:51','2023-12-17 22:54:44',NULL,'1');

/* Trigger structure for table `prestamos` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `tg_validar_prestamo_usuario` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `tg_validar_prestamo_usuario` AFTER UPDATE ON `prestamos` FOR EACH ROW 
BEGIN
	DECLARE _cantidadusuario INT;
	DECLARE _rolusuario INT;
	
	SET _cantidadusuario = (SELECT COUNT(*) AS 'cantidad' FROM prestamos WHERE idbeneficiario =  new.idbeneficiario AND estado IN ('S', 'R', 'D'));
	SET _rolusuario = (SELECT idrol FROM usuarios WHERE idusuario = new.idbeneficiario);
	

	IF _rolusuario = 3 AND _cantidadusuario = 0 THEN
		UPDATE usuarios SET estado = 1 WHERE idusuario = new.idbeneficiario; 
	END IF;
	
	IF _rolusuario = 2 AND _cantidadusuario < 2 THEN
		UPDATE usuarios SET estado = 1 WHERE idusuario = new.idbeneficiario; 
	END IF;
END */$$


DELIMITER ;

/* Procedure structure for procedure `ActualizarCondicionEjemplar` */

/*!50003 DROP PROCEDURE IF EXISTS  `ActualizarCondicionEjemplar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarCondicionEjemplar`(
    IN p_idlibroentregado INT
)
BEGIN
    DECLARE v_condicion_devolucion VARCHAR(50);

    -- Obtener la condición de devolución
    SELECT condiciondevolucion INTO v_condicion_devolucion
    FROM librosentregados
    WHERE idlibroentregado = p_idlibroentregado;

    -- Actualizar la condición en la tabla ejemplares solo si condiciondevolucion = 'bien'
    IF v_condicion_devolucion in ('Deteriorado','Mal')THEN
        UPDATE ejemplares e
        JOIN librosentregados le ON e.idejemplar = le.idejemplar
        SET e.condicion = v_condicion_devolucion
        WHERE le.idlibroentregado = p_idlibroentregado;
    END IF;
END */$$
DELIMITER ;

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
	IN _idejemplar INT,
	in _condicion varchar(10)
)
BEGIN
	UPDATE ejemplares SET
	estado = 1,
	condicion = _condicion,
	update_at = NOW()
	WHERE idejemplar = _idejemplar;
	
END */$$
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
    IN p_nueva_cantidad INT,
    in _condicion varchar(50)
)
BEGIN
      DECLARE v_ultimo_codigo_libro INT;
      DECLARE v_nuevo_codigo_libro INT;
      DECLARE contador INT DEFAULT 1;
    -- Obtener el último número de código_libro
     -- SELECT COALESCE(MAX(codigo_libro), 0) INTO v_ultimo_codigo_libro FROM ejemplares;
     
    SELECT MAX(codigo_libro) INTO v_ultimo_codigo_libro
    FROM ejemplares
    WHERE idlibro = p_idlibro;

    -- Verificar si hay ejemplares existentes
    IF v_ultimo_codigo_libro IS NOT NULL THEN
        -- Calcular el nuevo número de código_libro
        SET v_nuevo_codigo_libro = v_ultimo_codigo_libro + 1;

        -- Insertar ejemplares para la nueva cantidad
        
        WHILE contador <= p_nueva_cantidad DO
            INSERT INTO ejemplares (idlibro, codigo_libro, condicion)
            VALUES (p_idlibro, v_nuevo_codigo_libro,_condicion);

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
	IN _idprestamo INT,
	in _motivo varchar(10)
)
BEGIN
	DECLARE _idbene INT;
	
	SELECT idbeneficiario INTO _idbene
	FROM prestamos WHERE idprestamo = _idprestamo;
	
    -- Actualizar ejemplares a 'NO' para los idejemplar asociados al idprestamo
    UPDATE ejemplares ej
    JOIN librosentregados le ON ej.idejemplar = le.idejemplar
    SET ej.ocupado = 'NO'
    WHERE le.idprestamo = _idprestamo;
	
    UPDATE usuarios SET 
    estado = '1'
    WHERE idusuario = _idbene;
    
    UPDATE prestamos SET 
    estado = 'C',
    motivorechazo = _motivo
    WHERE idprestamo = _idprestamo;
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
	SELECT libros.idlibro, libros.libro, subcategorias.subcategoria, categorias.categoria
	FROM libros
	LEFT JOIN ejemplares ON libros.idlibro = ejemplares.idejemplar
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria
	WHERE libros.estado = 1; -- AND ejemplares.estado IN (1,0);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_conseguir_libro_historial` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_conseguir_libro_historial` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_conseguir_libro_historial`()
BEGIN 
	SELECT libros.idlibro, libros.libro, subcategorias.subcategoria, categorias.categoria
	FROM libros
	LEFT JOIN ejemplares ON libros.idlibro = ejemplares.idejemplar
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria
	WHERE libros.estado in( 1,0); -- AND ejemplares.estado IN (1,0);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_datos_personales` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_datos_personales` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_datos_personales`(
	in _idusuario int
)
begin
	select idusuario,personas.idpersona, personas.apellidos,  personas.nombres, personas.nrodocumento, personas.fechanac, personas.direccion,
	personas.telefono, personas.email, usuarios.nombreusuario, roles.nombrerol
	from usuarios
	inner join personas on personas.idpersona = usuarios.idpersona
	inner join roles on roles.idrol = usuarios.idrol
	where usuarios.idusuario = _idusuario;
end */$$
DELIMITER ;

/* Procedure structure for procedure `spu_datos_personales_user` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_datos_personales_user` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_datos_personales_user`(
	IN _idusuario INT
)
BEGIN
	SELECT idusuario, personas.idpersona, personas.apellidos, personas.nombres, personas.nrodocumento, personas.fechanac, personas.direccion,
	personas.telefono, personas.email, usuarios.nombreusuario, roles.nombrerol
	FROM usuarios
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	INNER JOIN roles ON roles.idrol = usuarios.idrol
	WHERE usuarios.idusuario = _idusuario;
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
	SELECT ejemplares.idejemplar, libros.libro, libros.codigo, ejemplares.condicion, ejemplares.codigo_libro, ejemplares.ocupado, ejemplares.estado
	FROM ejemplares
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	WHERE ejemplares.idlibro = _idlibro
	ORDER BY idejemplar ASC;

    IF NOT EXISTS (
    
        SELECT 1
        FROM ejemplares
        WHERE idlibro = _idlibro AND estado <> 0
    ) THEN
        -- Actualizar el estado del libro a 0
        UPDATE libros
        SET estado = 0,
        inactive_at = now()
        WHERE idlibro = _idlibro;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_filtrar_ejemplares` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_filtrar_ejemplares` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_filtrar_ejemplares`(
	IN _idlibro INT
)
BEGIN
	SELECT ejemplares.idejemplar, libros.libro,CONCAT( libros.codigo, '-',codigo_libro) AS 'Ejemplares', ejemplares.condicion
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
	SELECT usuarios.idusuario, concat(personas.nombres, ' ',personas.apellidos) as 'nombres' , usuarios.estado, roles.nombrerol
	FROM usuarios
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	INNER JOIN roles ON roles.idrol = usuarios.idrol
	WHERE usuarios.idrol = 3 AND usuarios.estado = 1;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_filtro_teacher` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_filtro_teacher` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_filtro_teacher`()
BEGIN
	SELECT usuarios.idusuario, CONCAT(personas.nombres, ' ',personas.apellidos) AS 'nombres' , usuarios.estado, roles.nombrerol
	FROM usuarios
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	INNER JOIN roles ON roles.idrol = usuarios.idrol
	WHERE usuarios.idrol = 2 AND usuarios.estado = 1;
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
	prestamos.cantidad, prestamos.motivorechazo, librosentregados.fechadevolucion, libros.codigo
	FROM prestamos
	INNER JOIN libros ON libros.idlibro = prestamos.idlibro
	INNER JOIN usuarios  ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	LEFT JOIN librosentregados ON librosentregados.idprestamo = prestamos.idprestamo
	WHERE prestamos.idbeneficiario = _idusuario
	GROUP BY prestamos.idprestamo ORDER BY idprestamo DESC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_inabilitar_usuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_inabilitar_usuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_inabilitar_usuario`(
	IN _idusuario INT
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
SELECT 
    ej.idlibro, det.iddetalleautor, cat.categoria, sub.subcategoria,lib.libro,lib.cantidad ,(SELECT COUNT(*) FROM ejemplares WHERE idlibro = lib.idlibro AND ocupado = 'NO' AND estado = 1) AS 'Disponible',
    lib.codigo,
    CONCAT(aut.autor, ' ', aut.apellidos) AS 'autor'
FROM 
    subcategorias sub
    JOIN categorias cat ON sub.idcategoria = cat.idcategoria
    JOIN libros lib ON sub.idsubcategoria = lib.idsubcategoria
    JOIN detalleautores det ON lib.idlibro = det.idlibro
    JOIN autores aut ON det.idautor = aut.idautor
    LEFT JOIN ejemplares ej ON lib.idlibro = ej.idlibro
WHERE 
    lib.estado in (1,0)
GROUP BY 
    ej.idlibro
ORDER BY 
    ej.idlibro DESC;

-- Luego, la sentencia UPDATE
UPDATE libros AS lib
SET 
    lib.estado = 
        CASE
            WHEN (
                SELECT COUNT(*) 
                FROM ejemplares ej
                WHERE ej.idlibro = lib.idlibro AND ej.ocupado = 'NO' AND ej.estado = 1
            ) > 0 THEN 1
            ELSE 0
        END
WHERE 
    EXISTS (
        SELECT 1
        FROM ejemplares ej
        WHERE ej.idlibro = lib.idlibro AND ej.ocupado = 'NO' AND ej.estado IN (1, 0)
    );

end */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_devolucionpendientes` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_devolucionpendientes` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_devolucionpendientes`()
BEGIN
	SELECT idlibroentregado,prestamos.idprestamo, prestamos.descripcion, libros.idlibro, ejemplares.codigo_libro, libros.libro, usuarios.idusuario, CONCAT( personas.nombres, ' ', personas.apellidos) AS 'nombres', 
	libros.tipo, prestamos.fechasolicitud,prestamos.fechaentrega, DATE(prestamos.fechaprestamo) AS 'fechaprestamo', prestamos.estado,MIN(DATE(librosentregados.fechadevolucion)) AS 'fechadevolucion'
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN ejemplares ON ejemplares.idejemplar = librosentregados.idejemplar
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	INNER JOIN usuarios ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE prestamos.estado = 'D'
	GROUP  BY prestamos.idprestamo
	ORDER BY idlibroentregado DESC;
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
	SELECT idejemplar, codigo_libro, condicion FROM ejemplares WHERE idlibro = _idlibro AND ocupado = 'NO' AND estado = 1 LIMIT _cantidad;
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
	SELECT idusuario,personas.idpersona, roles.nombrerol, personas.nombres, personas.apellidos, personas.fechanac, personas.nrodocumento, personas.telefono, personas.email, personas.direccion, nombreusuario
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
	prestamos.fecharespuesta, prestamos.lugardestino, prestamos.motivorechazo, prestamos.estado
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN ejemplares ON ejemplares.idejemplar = librosentregados.idejemplar 
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria
	INNER JOIN usuarios usu1 ON usu1.idusuario = prestamos.idbeneficiario
	INNER JOIN roles ON roles.idrol = usu1.idrol
	INNER JOIN personas ON personas.idpersona = usu1.idpersona
	WHERE prestamos.idprestamo = _prestamo AND prestamos.estado in ('T','C');
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
	SELECT idusuario,personas.idpersona, roles.nombrerol, personas.nombres, personas.apellidos,personas.fechanac, personas.nrodocumento, personas.telefono, personas.email, personas.direccion, nombreusuario
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
BEGIN
	SELECT c.idcategoria, c.categoria, c.codigo, COUNT(p.idprestamo) AS 'CantidadPrestada'
	FROM categorias c
	LEFT JOIN subcategorias sc ON c.idcategoria = sc.idcategoria
	LEFT JOIN libros l ON sc.idsubcategoria = l.idsubcategoria
	LEFT JOIN ejemplares e ON l.idlibro = e.idlibro
	LEFT JOIN librosentregados le ON e.idejemplar = le.idejemplar
	LEFT JOIN prestamos p ON le.idprestamo = p.idprestamo
	GROUP BY c.idcategoria;
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
	fechaprestamo, prestamos.fechaentrega, CONCAT(personas.nombres, ' ', personas.apellidos) AS 'Nombres', prestamos.motivorechazo, prestamos.estado
	FROM prestamos
	INNER JOIN usuarios ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.`idpersona` = usuarios.`idpersona`
	WHERE prestamos.estado IN ('T', 'C')
	ORDER BY idprestamo DESC;
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
	SELECT detalleautores.iddetalleautor, libros.idlibro, libros.libro,categorias.idcategoria, subcategorias.subcategoria, editoriales.nombres, editoriales.paisorigen,autores.apellidos, autores.autor, autores.nacionalidad,
	 categorias.categoria, subcategorias.idsubcategoria, editoriales.ideditorial,
	libros.cantidad, libros.numeropaginas, libros.codigo, libros.formato,
	libros.descripcion, libros.idioma, libros.anio, libros.tipo, libros.imagenportada, libros.edicion, autores.idautor
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

/* Procedure structure for procedure `spu_olvidar_contraseña` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_olvidar_contraseña` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_olvidar_contraseña`(
	in _user varchar(20),
	in _clave varchar(100)
)
begin
	update usuarios set
	claveacceso = _clave,
	update_at = now()
	where nombreusuario = _user;
end */$$
DELIMITER ;

/* Procedure structure for procedure `spu_rechazar_solicitud` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_rechazar_solicitud` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_rechazar_solicitud`(
	IN _idprestamo INT,
	IN _idejemplar	INT,
	IN _motivo	VARCHAR(200)
)
BEGIN
	INSERT INTO librosentregados (idprestamo, idejemplar)
	VALUE (_idprestamo, _idejemplar);
	
	UPDATE prestamos SET motivorechazo = _motivo, estado = 'C' WHERE idprestamo = _idprestamo;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_register_autor` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_register_autor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_register_autor`(
	IN _nombre VARCHAR(40),
	IN _apellidos VARCHAR(40),
	IN _seudonimio VARCHAR(40),
	IN _nacionalidad VARCHAR(50)
)
BEGIN
	INSERT INTO autores (autor,apellidos,pseudonimio, nacionalidad, create_at) VALUES
		(_nombre,_apellidos,_seudonimio,_nacionalidad,NOW());
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_register_categoria` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_register_categoria` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_register_categoria`(
	IN _categoria VARCHAR(40),
	IN _codigo smallint
)
BEGIN
	INSERT INTO categorias (categoria, codigo) VALUES
		(_categoria, _codigo);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_register_editorial` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_register_editorial` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_register_editorial`(
	IN _nombres VARCHAR(40),
	IN _telefono char(15),
	IN _website VARCHAR(40),
	IN _email VARCHAR(50),
	in _pais varchar(40)
)
BEGIN
	IF _website = "" THEN SET _website = NULL; END IF;       
	IF _email = "" THEN SET _email = NULL; END IF;       

	INSERT INTO editoriales (nombres,telefono,website, email, paisorigen) VALUES
		(_nombres,_telefono,_website,_email,_pais);
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
    IN _idautor  INT,
    IN _condicion VARCHAR(100)
)
BEGIN
    DECLARE cantidad_libros INT;
    DECLARE contador INT DEFAULT 1;
    DECLARE nuevo_codigo INT;
    
     INSERT INTO libros (idsubcategoria, ideditorial, libro, tipo, cantidad, numeropaginas, codigo, edicion,formato,anio,idioma,descripcion,imagenportada)
     VALUES (_idsubcategoria, _ideditorial, _libro, _tipo, _cantidad, _numeropaginas, _codigo, _edicion,_formato,_anio,_idioma,_descripcion,_imagenportada);
	
     SET @idlibro = LAST_INSERT_ID();
     
     INSERT INTO detalleautores(idlibro, idautor) VALUES
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
        INSERT INTO ejemplares (idlibro, codigo_libro, condicion)
        VALUES (@idlibro , nuevo_codigo, _condicion);
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
	DECLARE _cantidadusuario INT;
	DECLARE _rolusuario INT;
	INSERT INTO prestamos(idlibro, idbeneficiario, cantidad, descripcion, enbiblioteca, lugardestino, fechaprestamo, estado) VALUES 
	(_idlibro, _idbeneficiario, _cantidad, _descripcion, _enbiblioteca, 
	_lugardestino, _fechaprestamo, 'S');
	
	SET _cantidadusuario = (SELECT COUNT(*) AS 'cantidad' FROM prestamos WHERE idbeneficiario = _idbeneficiario AND estado IN ('S', 'R', 'D'));
	SET _rolusuario = (SELECT idrol FROM usuarios WHERE idusuario = _idbeneficiario);
	

	IF _rolusuario = 3 AND _cantidadusuario = 1 THEN
		UPDATE usuarios SET estado = 0 WHERE idusuario = _idbeneficiario; 
	END IF;
	
	IF _rolusuario = 2 AND _cantidadusuario = 2 THEN
		UPDATE usuarios SET estado = 0 WHERE idusuario = _idbeneficiario; 
	END IF;

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
	IN _fechasolicitud DATE,
	IN _fechasolicitud1 DATE
)
BEGIN
	SELECT c.idcategoria, c.categoria, c.codigo, COUNT(p.idprestamo) AS 'CantidadPrestada'
	FROM categorias c
	LEFT JOIN subcategorias sc ON c.idcategoria = sc.idcategoria
	LEFT JOIN libros l ON sc.idsubcategoria = l.idsubcategoria
	LEFT JOIN ejemplares e ON l.idlibro = e.idlibro
	LEFT JOIN librosentregados le ON e.idejemplar = le.idejemplar
	LEFT JOIN prestamos p ON le.idprestamo = p.idprestamo
	WHERE DATE(p.fechasolicitud) BETWEEN _fechasolicitud AND _fechasolicitud1
	GROUP BY c.idcategoria;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_reporte_idusuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_reporte_idusuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_reporte_idusuario`(
	in _idusuario int
)
begin
	SELECT c.idcategoria, c.categoria, c.codigo, COUNT(p.idprestamo) AS 'CantidadPrestada'
	FROM categorias c
	LEFT JOIN subcategorias sc ON c.idcategoria = sc.idcategoria
	LEFT JOIN libros l ON sc.idsubcategoria = l.idsubcategoria
	LEFT JOIN ejemplares e ON l.idlibro = e.idlibro
	LEFT JOIN librosentregados le ON e.idejemplar = le.idejemplar
	LEFT JOIN prestamos p ON le.idprestamo = p.idprestamo
	LEFT JOIN usuarios u ON p.idbeneficiario = u.idusuario
	LEFT JOIN roles r ON u.idrol = r.idrol
	WHERE r.idrol = _idusuario 
	GROUP BY c.idcategoria;
end */$$
DELIMITER ;

/* Procedure structure for procedure `spu_reporte_libro` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_reporte_libro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_reporte_libro`( in idlibro int)
begin
	SELECT librosentregados.idlibroentregado, ejemplares.idejemplar, CONCAT(personas.nombres , ' ',personas.apellidos) AS 'nombres' , prestamos.descripcion, roles.nombrerol, ejemplares.codigo_libro, libros.codigo,librosentregados.condicionentrega,librosentregados.condiciondevolucion, librosentregados.observaciones, 
	libros.libro,DATE(prestamos.fechaprestamo) AS 'fechaprestamo', DATE(librosentregados.fechadevolucion) AS 'fechadevolucion'
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN ejemplares ON ejemplares.idejemplar = librosentregados.idejemplar 
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria
	INNER JOIN usuarios usu1 ON usu1.idusuario = prestamos.idbeneficiario
	INNER JOIN roles ON roles.idrol = usu1.idrol
	INNER JOIN personas ON personas.idpersona = usu1.idpersona
	WHERE libros.idlibro = idlibro AND prestamos.estado = 'T'
	order by idlibroentregado asc;
end */$$
DELIMITER ;

/* Procedure structure for procedure `spu_reporte_libro_group` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_reporte_libro_group` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_reporte_libro_group`(
	in idlibro int
)
begin
	SELECT libros.libro, libros.codigo
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN ejemplares ON ejemplares.idejemplar = librosentregados.idejemplar 
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	WHERE libros.idlibro = idlibro AND prestamos.estado = 'T'
	GROUP BY libros.idlibro;
end */$$
DELIMITER ;

/* Procedure structure for procedure `spu_report_group_descripcion` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_report_group_descripcion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_report_group_descripcion`(
	in descripcion int
)
begin
	SELECT idprestamo, CONCAT(personas.nombres , ' ',personas.apellidos) AS 'nombres' , prestamos.descripcion, roles.nombrerol
	FROM prestamos
	INNER JOIN usuarios usu1 ON usu1.idusuario = prestamos.idbeneficiario
	INNER JOIN roles ON roles.idrol = usu1.idrol
	INNER JOIN personas ON personas.idpersona = usu1.idpersona
	WHERE prestamos.idbeneficiario = descripcion AND prestamos.estado = 'T'
	group by idbeneficiario;
end */$$
DELIMITER ;

/* Procedure structure for procedure `SPU_REPORT_USUARIO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SPU_REPORT_USUARIO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_REPORT_USUARIO`(
	IN DESCRIPCION INT
)
BEGIN
	SELECT librosentregados.idlibroentregado, ejemplares.idejemplar, concat(personas.nombres , ' ',personas.apellidos) as 'nombres' , prestamos.descripcion, roles.nombrerol, ejemplares.codigo_libro, libros.codigo,librosentregados.condicionentrega,librosentregados.condiciondevolucion, librosentregados.observaciones, 
	libros.libro, date(prestamos.fechasolicitud) as 'fechasolicitud', date(prestamos.fechaentrega) as 'fechaentrega', date(prestamos.fechaprestamo) as 'fechaprestamo', date(librosentregados.fechadevolucion) as 'fechadevolucion', prestamos.lugardestino,prestamos.fecharespuesta
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN ejemplares ON ejemplares.idejemplar = librosentregados.idejemplar 
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria
	INNER JOIN usuarios usu1 ON usu1.idusuario = prestamos.idbeneficiario
	INNER JOIN roles ON roles.idrol = usu1.idrol
	INNER JOIN personas ON personas.idpersona = usu1.idpersona
	WHERE prestamos.idbeneficiario = DESCRIPCION AND prestamos.estado = 'T';
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_search_book` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_search_book` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_search_book`(
	IN _nombre VARCHAR(50)
)
BEGIN
	SELECT 
	    ej.idlibro, det.iddetalleautor, cat.categoria, sub.subcategoria,lib.libro,lib.cantidad ,(SELECT COUNT(*) FROM ejemplares WHERE idlibro = lib.idlibro AND ocupado = 'NO' AND estado = 1) AS 'Disponible',
	    lib.codigo,
	    CONCAT(aut.autor, ' ', aut.apellidos) AS 'autor'
	FROM 
	    subcategorias sub
	    JOIN categorias cat ON sub.idcategoria = cat.idcategoria
	    JOIN libros lib ON sub.idsubcategoria = lib.idsubcategoria
	    JOIN detalleautores det ON lib.idlibro = det.idlibro
	    JOIN autores aut ON det.idautor = aut.idautor
	    LEFT JOIN ejemplares ej ON lib.idlibro = ej.idlibro
	WHERE 
	    lib.estado IN (1,0) and (_nombre ="" OR lib.libro LIKE CONCAT("%",_nombre, "%"))
	GROUP BY 
	    ej.idlibro
	ORDER BY 
	    ej.idlibro DESC;

	-- Luego, la sentencia UPDATE
	UPDATE libros AS lib
	SET 
	    lib.estado = 
		CASE
		    WHEN (
			SELECT COUNT(*) 
			FROM ejemplares ej
			WHERE ej.idlibro = lib.idlibro AND ej.ocupado = 'NO' AND ej.estado = 1
		    ) > 0 THEN 1
		    ELSE 0
		END
	WHERE 
	    EXISTS (
		SELECT 1
		FROM ejemplares ej
		WHERE ej.idlibro = lib.idlibro AND ej.ocupado = 'NO' AND ej.estado IN (1, 0)
	    );
END */$$
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
	SELECT prestamos.idprestamo, CONCAT(personas.nombres, ' ' , personas.apellidos) AS 'Nombres', libros.libro AS 'libro', prestamos.descripcion,fechasolicitud, 
	DATE(fechaprestamo) AS 'fechaprestamo', prestamos.cantidad, libros.idlibro
	FROM prestamos
	INNER JOIN libros ON libros.idlibro = prestamos.idlibro
	INNER JOIN usuarios  ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE prestamos.estado = 'S';
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_traercondicion_ejemplar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_traercondicion_ejemplar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_traercondicion_ejemplar`(
	in _idejemplar int
)
begin
	select idejemplar, condicion
	from ejemplares
	where idejemplar = _idejemplar;
end */$$
DELIMITER ;

/* Procedure structure for procedure `spu_traerEjemplar_libroentregado` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_traerEjemplar_libroentregado` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_traerEjemplar_libroentregado`(
	IN _idprestamo INT
)
BEGIN
	SELECT librosentregados.idlibroentregado, prestamos.idprestamo, ejemplares.idejemplar,librosentregados.condiciondevolucion, ejemplares.codigo_libro, libros.codigo, ejemplares.ocupado, libros.libro, 
	librosentregados.condicionentrega, DATE(librosentregados.fechadevolucion) AS 'fechadevolucion'
	FROM librosentregados
	INNER JOIN ejemplares ON ejemplares.idejemplar = librosentregados.idejemplar
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	WHERE prestamos.idprestamo = _idprestamo
	ORDER BY ejemplares.idejemplar ASC;
END */$$
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

/* Procedure structure for procedure `spu_traer_subcategoria` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_traer_subcategoria` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_traer_subcategoria`(
	IN _idcategoria INT
)
BEGIN 
	SELECT idsubcategoria, categorias.categoria, subcategorias.subcategoria, subcategorias.codigo
	FROM subcategorias
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria
	WHERE subcategorias.idcategoria = _idcategoria
	ORDER BY subcategorias.idsubcategoria DESC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_updateD_todo_prestamo` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_updateD_todo_prestamo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_updateD_todo_prestamo`(
    IN _idprestamo INT,
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

      IF _condiciondevolucion  IN ('Deteriorado','Mal')THEN
        UPDATE ejemplares e
        JOIN librosentregados le ON e.idejemplar = le.idejemplar
        SET e.condicion = _condiciondevolucion
        WHERE le.idprestamo = _idprestamo;
    end if;

    -- Verificar si todos los idejemplar tienen ocupado='NO'
    SELECT COUNT(*) INTO _count_ocupados
    FROM ejemplares ej
    JOIN librosentregados le ON ej.idejemplar = le.idejemplar
    WHERE le.idprestamo = _idprestamo AND ej.ocupado = 'NO';

    UPDATE prestamos SET estado = 'T' WHERE idprestamo = _idprestamo;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_update_admin` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_update_admin` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_update_admin`(
	in _idusu int,
    IN _apellidos VARCHAR(50), 
    IN _nombres VARCHAR(30),
    IN _nrodocumento CHAR(8),
    IN _fechanac DATE,
    IN _direccion VARCHAR(100),
    IN _telefono CHAR(9),
    IN _email VARCHAR(100),
    IN _nombreusuario VARCHAR(50)
)
begin
	-- Actualizar la tabla personas
    UPDATE personas SET 
    apellidos = _apellidos,
    nombres = _nombres,
    nrodocumento = _nrodocumento,
    fechanac = _fechanac,
    direccion = _direccion,
    telefono = _telefono,	
    email = _email
    WHERE idpersona = (SELECT idpersona FROM usuarios WHERE idusuario = _idusu);

	-- Actualizar la tabla usuarios
	UPDATE usuarios
	SET nombreusuario = _nombreusuario
	WHERE idusuario = _idusu;
end */$$
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
    IN _observaciones VARCHAR(50),
    IN _condiciondevoluciones VARCHAR(20)
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

    IF _condiciondevoluciones IN ('Deteriorado','Mal')THEN
        UPDATE ejemplares e
        JOIN librosentregados le ON e.idejemplar = le.idejemplar
        SET e.condicion = _condiciondevoluciones
        WHERE le.idlibroentregado = _idlibroentregado;
    END IF;
    
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

/* Procedure structure for procedure `spu_update_libro` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_update_libro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_update_libro`(
    IN _idlibro INT, 
    IN _idsubcategoria INT,
    IN _ideditorial INT,
    IN _libro VARCHAR(100),
    IN _tipo VARCHAR(50),
    IN _numeropaginas SMALLINT,
    IN _codigo DECIMAL(6,3),
    IN _edicion VARCHAR(100),
    IN _formato VARCHAR(50),
    IN _anio	DATE,
    IN _idioma  VARCHAR(20),
    IN _descripcion VARCHAR(200),
    IN _idautor  INT,
    IN _imagenportada VARCHAR(100)
)
BEGIN

        -- Actualizar la cantidad del libro          
        UPDATE libros SET 
        idsubcategoria = _idsubcategoria,
        ideditorial = _ideditorial,
        libro = _libro,
        tipo = _tipo,
        numeropaginas = _numeropaginas,
        codigo = _codigo,
        edicion = _edicion,
        formato = _formato,
        anio = _anio,
        idioma = _idioma,
        descripcion = _descripcion,
        imagenportada = _imagenportada
        WHERE idlibro = _idlibro;
        
        UPDATE detalleautores SET
        idautor = _idautor
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

/* Procedure structure for procedure `spu_update_user` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_update_user` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_update_user`(
    IN _idpersona INT,
    IN _apellidos VARCHAR(50), 
    IN _nombres VARCHAR(30),
    IN _nrodocumento CHAR(8),
    IN _fechanac DATE,
    IN _direccion VARCHAR(100),
    IN _telefono CHAR(9),
    IN _email VARCHAR(100),
    IN _nombreusuario VARCHAR(50)
)
BEGIN
    -- Inserta el registro en la tabla "personas"
    UPDATE personas SET 
    apellidos = _apellidos,
    nombres = _nombres,
    nrodocumento = _nrodocumento,
    fechanac = _fechanac,
    direccion = _direccion,
    telefono = _telefono,
    email = _email
    WHERE idpersona = _idpersona;
    
    update usuarios set
    nombreusuario = _nombreusuario
    where idpersona = _idpersona;
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

/* Procedure structure for procedure `updated` */

/*!50003 DROP PROCEDURE IF EXISTS  `updated` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updated`(
    IN p_idprestamo INT
)
BEGIN
    DECLARE v_condicion_devolucion VARCHAR(50);

    -- Obtener la condición de devolución
    SELECT condiciondevolucion INTO v_condicion_devolucion
    FROM librosentregados
    WHERE idprestamo = p_idprestamo
    AND condiciondevolucion = 'bien';

    -- Actualizar la condición en la tabla ejemplares si condiciondevolucion = 'bien'
    IF v_condicion_devolucion = 'bien' THEN
        UPDATE ejemplares e
        JOIN librosentregados le ON e.idejemplar = le.idejemplar
        SET e.condicion = v_condicion_devolucion
        WHERE le.idprestamo = p_idprestamo;
    END IF;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
