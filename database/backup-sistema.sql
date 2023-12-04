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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `detalleautores` */

insert  into `detalleautores`(`iddetalleautor`,`idlibro`,`idautor`,`creat_at`,`update_at`,`inactive_at`) values 
(1,1,2,'2023-12-02 19:16:45',NULL,NULL),
(2,2,2,'2023-12-02 19:25:15',NULL,NULL),
(3,3,1,'2023-12-02 20:48:41',NULL,NULL),
(4,4,3,'2023-12-02 20:50:05',NULL,NULL),
(5,5,1,'2023-12-02 20:51:56',NULL,NULL),
(6,6,1,'2023-12-03 15:30:08',NULL,NULL),
(7,7,2,'2023-12-03 21:21:24',NULL,NULL);

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
  `condicion` varchar(100) NOT NULL,
  `creat_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL,
  PRIMARY KEY (`idejemplar`),
  KEY `fk_idlibro_ejemplar` (`idlibro`),
  CONSTRAINT `fk_idlibro_ejemplar` FOREIGN KEY (`idlibro`) REFERENCES `libros` (`idlibro`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ejemplares` */

insert  into `ejemplares`(`idejemplar`,`idlibro`,`codigo_libro`,`ocupado`,`estado`,`condicion`,`creat_at`,`update_at`,`inactive_at`) values 
(1,1,1,'SI','1','Usado','2023-12-02 19:22:50',NULL,NULL),
(2,1,2,'NO','1','Mal','2023-12-02 19:22:50',NULL,NULL),
(3,1,3,'NO','1','Mal','2023-12-02 19:22:50',NULL,NULL),
(4,2,4,'SI','1','Usado','2023-12-02 19:25:15',NULL,NULL),
(5,2,5,'SI','1','Usado','2023-12-02 19:25:15',NULL,NULL),
(6,2,6,'NO','1','bien','2023-12-02 19:25:15',NULL,NULL),
(7,2,7,'NO','1','bien','2023-12-02 19:25:15',NULL,NULL),
(8,2,8,'NO','1','Usado','2023-12-02 19:25:15',NULL,NULL),
(9,2,9,'NO','1','Usado','2023-12-02 19:25:15',NULL,NULL),
(10,2,10,'NO','1','Usado','2023-12-02 19:25:16',NULL,NULL),
(11,2,11,'NO','1','Usado','2023-12-02 19:25:16',NULL,NULL),
(12,2,12,'NO','1','Usado','2023-12-02 19:25:16',NULL,NULL),
(13,2,13,'NO','1','Usado','2023-12-02 19:25:16',NULL,NULL),
(14,2,14,'NO','1','Usado','2023-12-02 19:25:16',NULL,NULL),
(15,3,15,'NO','0','Deteriorado','2023-12-02 20:48:41',NULL,'2023-12-03 15:48:24'),
(16,3,16,'NO','1','Deteriorado','2023-12-02 20:48:41',NULL,NULL),
(17,3,17,'NO','1','Deteriorado','2023-12-02 20:48:41',NULL,NULL),
(18,3,18,'NO','1','Deteriorado','2023-12-02 20:48:41',NULL,NULL),
(19,3,19,'NO','0','Deteriorado','2023-12-02 20:48:41',NULL,'2023-12-03 00:27:41'),
(20,3,20,'NO','0','Deteriorado','2023-12-02 20:48:41',NULL,NULL),
(21,3,21,'NO','0','Deteriorado','2023-12-02 20:48:41',NULL,NULL),
(22,3,22,'NO','0','Deteriorado','2023-12-02 20:48:41',NULL,NULL),
(23,3,23,'NO','1','Usado','2023-12-02 20:48:41',NULL,NULL),
(24,3,24,'NO','1','Usado','2023-12-02 20:48:41',NULL,NULL),
(25,3,25,'NO','1','Usado','2023-12-02 20:48:41',NULL,NULL),
(26,3,26,'NO','1','Usado','2023-12-02 20:48:41',NULL,NULL),
(27,4,27,'NO','1','Usado','2023-12-02 20:50:05',NULL,NULL),
(28,4,28,'NO','1','Usado','2023-12-02 20:50:05',NULL,NULL),
(29,4,29,'NO','1','Usado','2023-12-02 20:50:05',NULL,NULL),
(30,4,30,'NO','1','Usado','2023-12-02 20:50:05',NULL,NULL),
(31,4,31,'NO','1','Usado','2023-12-02 20:50:05',NULL,NULL),
(32,4,32,'NO','1','Usado','2023-12-02 20:50:05',NULL,NULL),
(33,4,33,'NO','1','Usado','2023-12-02 20:50:05',NULL,NULL),
(34,4,34,'NO','1','Usado','2023-12-02 20:50:05',NULL,NULL),
(35,4,35,'NO','1','Usado','2023-12-02 20:50:05',NULL,NULL),
(36,4,36,'NO','1','Usado','2023-12-02 20:50:05',NULL,NULL),
(37,4,37,'NO','1','Usado','2023-12-02 20:50:05',NULL,NULL),
(38,4,38,'NO','1','Usado','2023-12-02 20:50:05',NULL,NULL),
(39,5,39,'NO','1','Bien','2023-12-02 20:51:56',NULL,NULL),
(40,5,40,'NO','0','Deteriorado','2023-12-02 20:51:56',NULL,'2023-12-02 23:47:06'),
(41,5,41,'NO','1','Mal','2023-12-02 20:51:56',NULL,NULL),
(42,5,42,'NO','1','Usado','2023-12-02 20:51:56',NULL,NULL),
(43,5,43,'NO','1','Usado','2023-12-02 20:51:56',NULL,NULL),
(44,5,44,'NO','1','Usado','2023-12-02 20:51:56',NULL,NULL),
(45,5,45,'NO','1','Usado','2023-12-02 20:51:56',NULL,NULL),
(46,5,46,'NO','1','Usado','2023-12-02 20:51:56',NULL,NULL),
(47,5,47,'NO','1','Usado','2023-12-02 20:51:56',NULL,NULL),
(48,1,4,'NO','1','Mal','2023-12-02 21:47:15',NULL,NULL),
(49,1,48,'NO','1','Mal','2023-12-02 22:48:44',NULL,NULL),
(50,1,49,'NO','1','nuevo','2023-12-02 22:48:44',NULL,NULL),
(51,5,48,'NO','1','nuevo','2023-12-02 22:50:04',NULL,NULL),
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
(64,7,62,'SI','1','Nuevo','2023-12-03 21:21:24',NULL,NULL),
(65,7,63,'NO','1','Nuevo','2023-12-03 21:21:24',NULL,NULL),
(66,7,64,'NO','1','Nuevo','2023-12-03 21:21:24',NULL,NULL),
(67,7,65,'NO','1','Nuevo','2023-12-03 21:21:24',NULL,NULL),
(68,7,66,'NO','1','Nuevo','2023-12-03 21:21:24',NULL,NULL),
(69,7,67,'NO','1','Nuevo','2023-12-03 21:21:24',NULL,NULL),
(70,7,68,'NO','1','Nuevo','2023-12-03 21:21:24',NULL,NULL),
(71,7,69,'NO','1','Nuevo','2023-12-03 21:21:24',NULL,NULL),
(72,7,70,'NO','1','Nuevo','2023-12-03 21:21:25',NULL,NULL),
(73,7,71,'NO','1','Nuevo','2023-12-03 21:21:25',NULL,NULL),
(74,7,72,'NO','1','Nuevo','2023-12-03 21:21:25',NULL,NULL),
(75,7,73,'NO','1','Nuevo','2023-12-03 21:21:25',NULL,NULL),
(76,7,74,'NO','1','Nuevo','2023-12-03 21:21:25',NULL,NULL),
(77,7,75,'NO','1','Nuevo','2023-12-03 21:21:25',NULL,NULL),
(78,7,76,'NO','1','Nuevo','2023-12-03 21:21:25',NULL,NULL),
(79,7,77,'NO','1','Nuevo','2023-12-03 21:21:25',NULL,NULL),
(80,7,78,'NO','1','Nuevo','2023-12-03 21:21:25',NULL,NULL),
(81,7,79,'NO','1','Nuevo','2023-12-03 21:21:25',NULL,NULL),
(82,7,80,'NO','1','Nuevo','2023-12-03 21:21:25',NULL,NULL),
(83,7,81,'NO','1','Nuevo','2023-12-03 21:21:25',NULL,NULL),
(84,7,82,'NO','1','Nuevo','2023-12-03 21:21:25',NULL,NULL),
(85,7,83,'NO','1','Nuevo','2023-12-03 21:21:25',NULL,NULL);

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
(1,5,1,'fisica conceptual','text',6,142,534.000,'','','0000-00-00','español','','','2023-12-02 19:16:45',NULL,NULL,'1'),
(2,3,1,'El mentor de matemáticas ','texto',11,113,513.000,'','Mediano','2010-02-23','Español','','d97204132dc1ef9543af7cc95d91db604580272e.jpg','2023-12-02 19:25:15',NULL,NULL,'1'),
(3,5,4,'La Biblia de la física y quimica','texto',12,122,533.000,'','Mediano','2020-03-24','Español','','3202e00ba85735c7a7e3a7426275081ad1426767.jpg','2023-12-02 20:48:41',NULL,NULL,'1'),
(4,15,3,'La Biblia de las ciencias naturales ','texto',12,121,581.000,'','Mediano','2009-05-31','Español','','34d5c98fd01b2b2cc48d1029fb46b61682aa7f6a.jpg','2023-12-02 20:50:05',NULL,NULL,'1'),
(5,6,1,'Atlas del cuerpo Humano','texto',10,100,574.000,'','Mediano','2010-05-04','Español','trata del cuerpo humano','NULL','2023-12-02 20:51:56',NULL,NULL,'1'),
(6,4,1,'Atlas del cielo','',12,111,525.000,'','Mediano','2010-02-22','Español','','a89d48460f4e35405f9bb15136900c9227d52b37.jpg','2023-12-03 15:30:08',NULL,NULL,'1'),
(7,17,2,'La odisea','comic',22,111,883.000,'','pequeño','2010-02-22','Español','','773b6ef271458e20fa5c74942e6abbdd06392717.jpg','2023-12-03 21:21:24',NULL,NULL,'1');

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(32,13,64,'Nuevo',NULL,NULL,'2023-12-04 00:00:00');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(13,13,5,NULL,NULL,'2023-12-03 23:35:07','2023-12-04 00:00:00',NULL,NULL,'5H','SI',NULL,'R','1',NULL);

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
(2,2,3,'78674219','$2y$10$1EwQL/puaUQHsn3KpLDQge.QJ5zTmDQ3PmQkd2du.4H91O8UsatWC','2023-11-14 20:04:56',NULL,'2023-11-30 23:42:42','1'),
(3,3,3,'Maria12','$2y$10$pjvcVk3.cIXv36rbkzd1se1x3hMkwJuhFb9hxWzntIVVJXXHJ4aOO','2023-11-15 17:34:31',NULL,'2023-11-30 23:10:42','1'),
(4,4,3,'Adri12','$2y$10$BAFdgrEAUrbCiAvJqXK1JewmEmWD4z6elZ/SbjfPL6AtlAdtycXyK','2023-11-17 22:10:26',NULL,'2023-12-03 23:17:15','1'),
(5,5,2,'Juan12','$2y$10$DO47kyJla58I/3HnjIfwqODpmZpT0d92aC98PJvnhzt0iA.CAu.0a','2023-11-17 23:09:29',NULL,'2023-12-03 00:30:14','1'),
(6,6,3,'Kiarabq','$2y$10$uwF4lFXTH1mw4yw.lXX7HeVTMGAr10dRPE4DnypxrX5oYb3quMvum','2023-11-17 23:10:50',NULL,'2023-12-03 00:09:55','1'),
(7,7,3,'JhonF','$2y$10$Cp0BSJyKCFSKllRAZ/.DA.8Eu3BR/IC4IdUi0.Yj3rWAGUz7hPSRG','2023-11-17 23:12:24',NULL,'2023-12-03 21:09:25','1'),
(11,11,2,'72890192','$2y$10$1EwQL/puaUQHsn3KpLDQge.QJ5zTmDQ3PmQkd2du.4H91O8UsatWC','2023-11-21 21:04:32',NULL,'2023-11-25 22:00:23','1'),
(12,12,2,'54165','$2y$10$IAtQzGqfXelNXJfSkEt8i.5UxQkdDQgf0xTvrjxWcdbPLN0h.0NkO','2023-11-22 22:10:20',NULL,'2023-12-03 15:45:34','1'),
(13,13,3,'78290181','$2y$10$1EwQL/puaUQHsn3KpLDQge.QJ5zTmDQ3PmQkd2du.4H91O8UsatWC','2023-11-25 19:45:10',NULL,'2023-12-03 23:35:08','0'),
(14,15,3,'Fred12','$2y$10$DGRQGH1Ch28HBqHokIY6.u01dcMoXXz1/aJxq5Fah345UG5.zu9Oe','2023-11-25 21:18:51',NULL,'2023-12-03 21:22:32','1'),
(15,16,2,'Ale12','$2y$10$hawx981.c.gQRjCAPIQQOeVPoUcibqg1lEhSLhUNCgPQtqOT72qgO','2023-11-29 18:04:47',NULL,'2023-12-02 19:47:53','1');

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
	SELECT ejemplares.idejemplar, libros.libro, libros.codigo, ejemplares.condicion, ejemplares.codigo_libro, ejemplares.ocupado, ejemplares.estado
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
	prestamos.cantidad, prestamos.motivorechazo
	FROM prestamos
	INNER JOIN libros ON libros.idlibro = prestamos.idlibro
	INNER JOIN usuarios  ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE prestamos.idbeneficiario = _idusuario
	ORDER BY idprestamo DESC;
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
	prestamos.fecharespuesta, prestamos.estado, prestamos.motivorechazo
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN ejemplares ON ejemplares.idejemplar = librosentregados.idejemplar 
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria
	INNER JOIN usuarios usu1 ON usu1.idusuario = prestamos.idbeneficiario
	INNER JOIN roles ON roles.idrol = usu1.idrol
	INNER JOIN personas ON personas.idpersona = usu1.idpersona
	WHERE prestamos.idprestamo = _prestamo AND prestamos.estado in ('T', 'C');
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
	fechaprestamo, prestamos.fechaentrega, CONCAT(personas.nombres, ' ', personas.apellidos) AS 'Nombres', prestamos.motivorechazo
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

/* Procedure structure for procedure `spu_rechazar_solicitud` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_rechazar_solicitud` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_rechazar_solicitud`(
	IN _idprestamo INT,
	IN _motivo	VARCHAR(200)
)
BEGIN
	UPDATE prestamos SET motivorechazo = _motivo, estado = 'C' WHERE idprestamo = _idprestamo;
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
    in _condicion varchar(100)
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
    
      IF _condiciondevolucion  IN ('Deteriorado','Mal')THEN
        UPDATE ejemplares e
        JOIN librosentregados le ON e.idejemplar = le.idejemplar
        SET e.condicion = _condiciondevolucion
        WHERE le.idprestamo = _idprestamo;
    END IF;
    
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
    in _ideditorial int,
    in _libro varchar(100),
    in _tipo varchar(50),
    in _numeropaginas smallint,
    in _codigo decimal(6,3),
    in _edicion varchar(100),
    in _formato varchar(50),
    in _anio	date,
    in _idioma  varchar(20),
    in _descripcion varchar(200),
    in _imagenportada varchar(200),
    in _idautor  int
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
        
        update detalleautores set
        idautor = _idautor
        where idlibro = _idlibro;
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
