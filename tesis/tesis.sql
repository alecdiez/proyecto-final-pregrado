CREATE DATABASE  IF NOT EXISTS `tesis` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `tesis`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: tesis
-- ------------------------------------------------------
-- Server version	5.6.23-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `audit_login`
--

DROP TABLE IF EXISTS `audit_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_login` (
  `auditLoginId` int(11) NOT NULL AUTO_INCREMENT,
  `audtiLoginUsrId` int(11) DEFAULT NULL,
  `auditLoginUsr` varchar(250) DEFAULT NULL,
  `auditLoginPass` varchar(250) DEFAULT NULL,
  `auditLoginIP` varchar(250) NOT NULL,
  `auditLoginFecha` datetime NOT NULL,
  `auditLoginConectado` varchar(45) NOT NULL,
  PRIMARY KEY (`auditLoginId`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_login`
--

LOCK TABLES `audit_login` WRITE;
/*!40000 ALTER TABLE `audit_login` DISABLE KEYS */;
INSERT INTO `audit_login` VALUES (10,0,'alec9','','','2015-11-02 20:00:41','N'),(11,1,'alec9','ama921sa','192.168.0.102','2015-11-02 20:01:01','S'),(12,1,'alec9','ama921sa','127.0.0.1','2015-11-02 20:35:28','S'),(13,0,'alec9','','66.249.83.214','2015-11-02 20:38:40','N'),(14,1,'alec9','ama921sa','66.249.83.203','2015-11-02 20:39:07','S'),(15,1,'alec9','ama921sa','127.0.0.1','2015-11-02 20:46:26','S'),(16,1,'alec9','ama921sa','127.0.0.1','2015-11-02 20:48:29','S'),(17,1,'alec9','ama921sa','127.0.0.1','2015-11-02 20:49:22','S'),(18,1,'alec9','ama921sa','127.0.0.1','2015-11-02 20:49:30','S'),(19,1,'alec9','ama921sa','127.0.0.1','2015-11-02 20:49:59','S'),(20,1,'alec9','ama921sa','127.0.0.1','2015-11-02 20:50:20','S'),(21,1,'alec9','ama921sa','127.0.0.1','2015-11-02 20:50:45','S'),(22,1,'alec9','ama921sa','127.0.0.1','2015-11-02 20:51:15','S'),(23,1,'alec9','ama921sa','127.0.0.1','2015-11-02 20:52:17','S'),(24,1,'alec9','ama921sa','127.0.0.1','2015-11-02 20:52:53','S'),(25,1,'alec9','ama921sa','127.0.0.1','2015-11-02 20:53:24','S'),(26,1,'alec9','ama921sa','127.0.0.1','2015-11-02 20:53:45','S'),(27,1,'alec9','ama921sa','127.0.0.1','2015-11-02 20:54:30','S'),(28,1,'alec9','ama921sa','127.0.0.1','2015-11-02 20:55:02','S'),(29,1,'alec9','ama921sa','127.0.0.1','2015-11-02 20:55:29','S'),(30,1,'alec9','ama921sa','127.0.0.1','2015-11-02 20:56:05','S'),(31,1,'alec9','ama921sa','127.0.0.1','2015-11-02 20:56:51','S'),(32,1,'alec9','ama921sa','127.0.0.1','2015-11-02 20:57:25','S'),(33,1,'alec9','ama921sa','127.0.0.1','2015-11-02 20:57:54','S'),(34,1,'alec9','ama921sa','127.0.0.1','2015-11-02 20:58:39','S'),(35,1,'alec9','ama921sa','127.0.0.1','2015-11-02 20:58:48','S'),(36,1,'alec9','ama921sa','127.0.0.1','2015-11-02 20:59:08','S'),(37,1,'alec9','ama921sa','127.0.0.1','2015-11-02 21:00:56','S'),(38,1,'alec9','ama921sa','127.0.0.1','2015-11-02 21:02:04','S'),(39,1,'alec9','ama921sa','127.0.0.1','2015-11-02 21:04:24','S'),(40,1,'alec9','ama921sa','127.0.0.1','2015-11-02 21:04:48','S'),(41,1,'alec9','ama921sa','127.0.0.1','2015-11-02 21:05:44','S'),(42,1,'alec9','ama921sa','127.0.0.1','2015-11-02 21:06:14','S'),(43,1,'alec9','ama921sa','127.0.0.1','2015-11-02 21:06:37','S'),(44,1,'alec9','ama921sa','127.0.0.1','2015-11-02 21:07:19','S'),(45,1,'alec9','ama921sa','127.0.0.1','2015-11-02 21:38:57','S'),(46,6,'manuelfonsss','ama921','127.0.0.1','2015-11-02 21:39:15','S'),(47,1,'alec9','ama921sa','127.0.0.1','2015-11-02 21:39:21','S'),(48,1,'alec9','ama921sa','127.0.0.1','2015-11-02 21:40:20','S'),(49,1,'alec9','ama921sa','127.0.0.1','2015-11-03 07:30:53','S'),(50,1,'alec9','ama921sa','127.0.0.1','2015-11-03 07:35:51','S'),(51,1,'alec9','ama921sa','127.0.0.1','2015-11-03 07:36:04','S'),(52,1,'alec9','ama921sa','127.0.0.1','2015-11-03 07:45:48','S'),(53,1,'alec9','ama921sa','127.0.0.1','2015-11-03 07:59:59','S'),(54,1,'alec9','ama921sa','127.0.0.1','2015-11-03 08:00:37','S'),(55,1,'alec9','ama921sa','127.0.0.1','2015-11-03 08:01:36','S'),(56,1,'alec9','ama921sa','127.0.0.1','2015-11-03 08:04:09','S'),(57,1,'alec9','ama921sa','127.0.0.1','2015-11-03 08:06:01','S'),(58,1,'alec9','ama921sa','127.0.0.1','2015-11-03 08:07:00','S'),(59,1,'alec9','ama921sa','127.0.0.1','2015-11-03 08:07:11','S'),(60,1,'alec9','ama921sa','127.0.0.1','2015-11-03 08:07:42','S'),(61,1,'alec9','ama921sa','127.0.0.1','2015-11-03 08:09:01','S'),(62,5,'yani_zwenger','--hrz9454--','186.153.203.90','2015-11-03 09:40:24','S'),(63,1,'alec9','ama921sa','186.153.203.90','2015-11-03 09:41:11','S'),(64,0,'sadfasdf','asdfasdfasdf','186.153.203.90','2015-11-03 09:41:48','N'),(65,1,'alec9','ama921sa','186.153.203.90','2015-11-03 09:41:54','S'),(66,1,'alec9','ama921sa','186.153.203.90','2015-11-03 13:23:40','S'),(67,1,'alec9','ama921sa','186.153.203.90','2015-11-03 14:43:17','S'),(68,12,'nuliana','nuliana','181.111.70.219','2015-11-03 14:48:43','S'),(69,10,'bmeloni','20454593','186.124.184.31','2015-11-03 18:14:53','S'),(70,11,'apvarela','42160675','186.124.184.31','2015-11-03 18:19:14','S'),(71,10,'bmeloni','20454593','186.124.184.31','2015-11-03 18:21:43','S'),(72,10,'bmeloni','20454593','186.124.184.31','2015-11-03 18:22:31','S'),(73,10,'bmeloni','20454593','186.124.184.31','2015-11-03 20:04:53','S'),(74,11,'apvarela','42160675','186.124.184.31','2015-11-03 20:16:07','S'),(75,10,'bmeloni','20454593','186.124.184.31','2015-11-03 20:20:19','S'),(76,1,'alec9','ama921sa','127.0.0.1','2015-11-03 21:15:12','S'),(77,1,'alec9','ama921sa','127.0.0.1','2015-11-04 08:06:17','S'),(78,1,'alec9','ama921sa','127.0.0.1','2015-11-05 08:02:58','S'),(79,1,'alec9','ama921sa','186.153.203.90','2015-11-05 15:56:11','S'),(80,1,'alec9','ama921sa','186.153.203.90','2015-11-06 17:38:11','S'),(81,1,'alec9','ama921sa','127.0.0.1','2015-11-09 07:34:51','S'),(82,1,'alec9','ama921sa','127.0.0.1','2015-11-09 20:54:53','S'),(83,1,'alec9','ama921sa','186.153.203.90','2015-11-11 10:34:37','S'),(84,1,'alec9','ama921sa','186.153.203.90','2015-11-11 10:39:31','S'),(85,1,'alec9','ama921sa','186.153.203.90','2015-11-11 11:44:02','S'),(86,1,'alec9','ama921sa','127.0.0.1','2015-11-12 08:01:11','S'),(87,1,'alec9','ama921sa','127.0.0.1','2015-11-12 21:08:19','S'),(88,1,'alec9','ama921sa','127.0.0.1','2015-11-23 19:11:43','S'),(89,1,'alec9','ama921sa','186.153.203.90','2015-11-26 10:58:57','S'),(90,1,'alec9','ama921sa','127.0.0.1','2015-11-26 18:48:29','S'),(91,1,'alec9','ama921sa','127.0.0.1','2015-11-26 18:56:42','S'),(92,1,'alec9','ama921sa','127.0.0.1','2015-11-26 19:46:00','S'),(93,1,'alec9','ama921sa','127.0.0.1','2015-11-26 21:11:54','S'),(94,0,'','','181.15.98.134','2015-11-27 09:16:49','N'),(95,13,'pbadariotti','pbadariotti','181.15.98.134','2015-11-27 09:18:38','S'),(96,13,'pbadariotti','pbadariotti','181.15.98.134','2015-11-27 09:44:02','S'),(97,1,'alec9','ama921sa','127.0.0.1','2015-12-01 18:40:35','S'),(98,1,'alec9','ama921sa','127.0.0.1','2015-12-03 09:01:15','S'),(99,0,'admin','admin','181.110.21.137','2015-12-23 17:56:00','N'),(100,0,'csimes','csimes','181.110.21.137','2015-12-23 17:56:10','N'),(101,0,'asosa','asosa','181.110.21.137','2015-12-23 17:56:21','N'),(102,0,'admin','admin','181.110.21.137','2015-12-23 17:56:29','N'),(103,12,'nuliana','nuliana','181.110.21.137','2015-12-23 18:16:38','S'),(104,0,'csimes','csimes','181.110.21.137','2015-12-23 18:17:53','N'),(105,1,'alec9','ama921sa','186.153.203.90','2016-01-12 09:09:56','S'),(106,1,'alec9','ama921sa','127.0.0.1','2016-01-13 08:03:18','S'),(107,1,'alec9','ama921sa','186.153.203.90','2016-01-13 11:44:09','S'),(108,12,'nuliana','nuliana','201.252.188.15','2016-01-13 11:49:37','S'),(109,1,'alec9','ama921sa','200.68.67.53','2016-01-19 11:12:30','S'),(110,1,'alec9','ama921sa','186.153.203.90','2016-01-25 17:15:25','S'),(111,1,'alec9','ama921sa','186.153.203.90','2016-01-27 11:58:41','S'),(112,1,'alec9','ama921sa','127.0.0.1','2016-02-04 12:08:07','S'),(113,1,'alec9','ama921sa','186.153.203.90','2016-02-17 14:24:48','S'),(114,1,'alec9','ama921sa','15.211.201.84','2016-02-23 17:18:12','S'),(115,1,'alec9','ama921sa','127.0.0.1','2016-02-28 11:27:46','S'),(116,1,'alec9','ama921sa','127.0.0.1','2016-02-28 11:48:16','S'),(117,1,'alec9','ama921sa','186.153.203.90','2016-02-29 17:30:17','S'),(118,1,'alec9','ama921sa','127.0.0.1','2016-03-06 10:02:17','S'),(119,1,'alec9','ama921sa','127.0.0.1','2016-03-06 11:40:47','S'),(120,1,'alec9','ama921sa','127.0.0.1','2016-03-19 16:21:35','S'),(121,1,'alec9','ama921sa','190.225.136.155','2016-03-21 18:25:20','S'),(122,1,'alec9','ama921sa','127.0.0.1','2016-03-27 21:54:42','S'),(123,1,'alec9','ama921sa','15.211.201.82','2016-03-31 10:03:09','S'),(124,1,'alec9','ama921sa','127.0.0.1','2016-04-08 20:41:40','S'),(125,1,'alec9','ama921sa','181.1.84.87','2016-04-09 09:29:14','S'),(126,1,'alec9','ama921sa','127.0.0.1','2016-04-09 11:16:42','S'),(127,1,'alec9','ama921sa','127.0.0.1','2016-04-09 11:20:31','S'),(128,1,'alec9','ama921sa','127.0.0.1','2016-04-09 11:29:28','S'),(129,1,'alec9','ama921sa','127.0.0.1','2016-04-09 11:55:45','S'),(130,1,'alec9','ama921sa','127.0.0.1','2016-04-09 12:00:16','S'),(131,1,'alec9','ama921sa','127.0.0.1','2016-04-09 12:03:42','S'),(132,1,'alec9','ama921sa','127.0.0.1','2016-04-09 12:04:28','S'),(133,1,'alec9','ama921sa','127.0.0.1','2016-04-09 12:08:13','S'),(134,1,'alec9','ama921sa','127.0.0.1','2016-04-09 12:08:39','S'),(135,1,'alec9','ama921sa','127.0.0.1','2016-04-09 12:09:00','S'),(136,1,'alec9','ama921sa','127.0.0.1','2016-04-09 12:09:26','S'),(137,1,'alec9','ama921sa','127.0.0.1','2016-04-09 12:10:29','S'),(138,1,'alec9','ama921sa','127.0.0.1','2016-04-09 12:15:39','S'),(139,1,'alec9','ama921sa','127.0.0.1','2016-04-09 12:16:51','S'),(140,1,'alec9','ama921sa','127.0.0.1','2016-04-09 12:17:45','S'),(141,1,'alec9','ama921sa','127.0.0.1','2016-04-09 12:18:34','S'),(142,1,'alec9','ama921sa','127.0.0.1','2016-04-09 12:19:45','S'),(143,1,'alec9','ama921sa','127.0.0.1','2016-04-09 12:20:10','S'),(144,1,'alec9','ama921sa','127.0.0.1','2016-04-09 12:22:44','S'),(145,1,'alec9','ama921sa','127.0.0.1','2016-04-09 12:23:22','S'),(146,1,'alec9','ama921sa','127.0.0.1','2016-04-09 12:24:59','S'),(147,1,'alec9','ama921sa','127.0.0.1','2016-04-09 12:26:09','S'),(148,1,'alec9','ama921sa','127.0.0.1','2016-04-09 12:26:52','S'),(149,1,'alec9','ama921sa','127.0.0.1','2016-04-09 12:28:55','S'),(150,1,'alec9','ama921sa','127.0.0.1','2016-04-09 12:30:30','S'),(151,5,'Yani_zwenger','--hrz9454--','127.0.0.1','2016-04-09 12:31:17','S'),(152,1,'alec9','ama921sa','127.0.0.1','2016-04-09 12:32:20','S'),(153,5,'Yani_zwenger','--hrz9454--','127.0.0.1','2016-04-09 12:33:35','S'),(154,1,'alec9','ama921sa','127.0.0.1','2016-04-13 07:51:08','S'),(155,1,'alec9','ama921sa','127.0.0.1','2016-04-25 15:01:49','S'),(156,1,'alec9','ama921sa','127.0.0.1','2016-05-07 18:15:08','S'),(157,1,'alec9','ama921sa','127.0.0.1','2016-05-08 12:00:18','S'),(158,1,'alec9','ama921sa','127.0.0.1','2016-05-08 14:02:54','S'),(159,1,'alec9','ama921sa','127.0.0.1','2016-05-08 16:02:57','S'),(160,1,'alec9','ama921sa','127.0.0.1','2016-05-08 16:16:02','S'),(161,1,'alec9','ama921sa','144.9.56.131','2016-05-11 14:20:33','S'),(162,1,'alec9','ama921sa','144.9.56.131','2016-05-11 14:22:15','S'),(163,1,'alec9','ama921sa','190.228.70.180','2016-05-13 16:55:10','S'),(164,1,'alec9','ama921sa','190.228.70.180','2016-05-13 17:08:43','S'),(165,1,'alec9','ama921sa','127.0.0.1','2016-05-21 10:53:57','S');
/*!40000 ALTER TABLE `audit_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mapa`
--

DROP TABLE IF EXISTS `mapa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mapa` (
  `mapaId` int(11) NOT NULL AUTO_INCREMENT,
  `mapaUsrId` int(11) NOT NULL,
  `mapaFecha` datetime NOT NULL,
  `mapaEstado` int(11) NOT NULL,
  `mapaObserva` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`mapaId`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mapa`
--

LOCK TABLES `mapa` WRITE;
/*!40000 ALTER TABLE `mapa` DISABLE KEYS */;
INSERT INTO `mapa` VALUES (26,1,'2015-10-22 19:55:39',1,'probando que funcione biennnn'),(27,1,'2015-10-24 17:59:03',1,NULL),(32,1,'2015-10-26 15:07:34',1,'sdfgsdfgsdfg'),(33,1,'2015-10-27 20:43:07',1,''),(34,10,'2015-10-30 14:38:32',1,''),(35,10,'2015-10-30 15:00:53',1,''),(36,10,'2015-11-03 20:06:22',1,''),(37,11,'2015-11-03 20:16:36',1,''),(38,1,'2016-05-08 14:03:59',1,'NUEVO MAPA');
/*!40000 ALTER TABLE `mapa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mapamarker`
--

DROP TABLE IF EXISTS `mapamarker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mapamarker` (
  `mapaMarkerId` int(11) NOT NULL AUTO_INCREMENT,
  `mapaId` int(11) NOT NULL,
  `mapaMarkerCliNomApe` varchar(250) NOT NULL,
  `mapaMarkerDirección` varchar(250) NOT NULL,
  `mapaMarkerCiudad` varchar(250) NOT NULL,
  `mapaMarkerProvincia` varchar(250) NOT NULL,
  `mapaMarkerLat` varchar(250) DEFAULT NULL,
  `mapaMarkerLong` varchar(250) DEFAULT NULL,
  `mapaMarkerVenta` decimal(10,0) DEFAULT NULL,
  `mapaMarkerEntrega` varchar(2) DEFAULT NULL,
  `mapaMarkerObserva` varchar(1500) DEFAULT NULL,
  `mapaMarkerEstado` int(11) NOT NULL,
  PRIMARY KEY (`mapaMarkerId`),
  KEY `mapaId_idx` (`mapaId`),
  CONSTRAINT `mapaId` FOREIGN KEY (`mapaId`) REFERENCES `mapa` (`mapaId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mapamarker`
--

LOCK TABLES `mapamarker` WRITE;
/*!40000 ALTER TABLE `mapamarker` DISABLE KEYS */;
INSERT INTO `mapamarker` VALUES (43,26,'Alejandro Sosa','Pedro Isnardi 4250','Cordoba','Cordoba','-31.4132744','-64.24090629999999',500,'S','Probando todo',1),(44,26,'Yanina Zwenger','Colon 5200','Cordoba','Cordoba','-31.3963993','-64.25107729999999',1000,'S','Veremos',1),(45,26,'Manuel Sosa','La Pampa 1468 ','Cordoba','Cordoba','-31.4291707','-64.20886519999999',5000,'N','lalala',1),(46,26,'Manuel Andres Sosa Adorati','Venta y Media 4250','Cordoba','Cordoba','-31.4058859','-64.2386834',2000,'N','Con Observaciones',1),(47,26,'Bizit Global','Av. Hipolito Yrigoyen 31','Cordoba','Cordoba','-31.4208985','-64.1882753',100,'S','S/0',1),(48,27,'Sujeto 1 Perez','Av. Santa Ana 1500','Cordoba','Cordoba','-31.4170814','-64.2076649',2,'N','Veremos',1),(49,27,'Sujeto 2 Rodrigues','Av. Colon 2500','Cordoba','Cordoba','-31.4041609','-64.2148772',50,'S','Option',1),(50,27,'sujeto 3 Diaz','Av. Fuerza Aerea 4000','Cordoba','Cordoba','-31.4321646','-64.2402747',800,'N','lalala',1),(51,32,'Alejandro','la pampa 1468','cordoba','cordoba','-31.4291707','-64.20886519999999',5000,'N','lalalala',1),(52,32,'yanina','pedro domingo isnardi','cordoba','cordoba','-31.4134026','-64.2377032',4000,'S','probando',1),(53,33,'prueba1 uno','Av. Santa Ana 1850','Cordoba','Cordoba','-31.4164828','-64.2108196',2,'N','Veremos',1),(54,33,'prueba2 dos','Rodriguez del Busto 3219','Cordoba','Cordoba','-31.37097','-64.22171',50,'S','Option',1),(55,33,'prueba3 tres','Av. Fuerza Aerea 2850','Cordoba','Cordoba','-31.4312431','-64.2265847',600,'N','lalala',1),(56,33,'prueba4 cuatro','Olegario Correa 800','Cordoba','Cordoba','-31.4174965','-64.2178508',300,'S','S/O',1),(57,33,'prueba5 cinco','Av. Patria 4200','Cordoba','Cordoba','-31.3709293','-62.09925',500,'S','S/O',1),(58,33,'prueba6 seis','Gral. Paz 30','Cordoba','Cordoba','-31.4147663','-64.186504',700,'N','Hay Observaciones',1),(59,35,'CARRIZO LUCAS','GENERAL PAZ 15','CORDOBA','CORDOBA','-31.4150544','-64.1866663',150,'S','',1),(60,35,'MALDONADO EMILSE','AVENIDA VALPARAISO 1000','CORDOBA','CORDBOA','-31.4579753','-64.1867737',200,'S','',1),(61,36,'Enrico Linares','avenida valparaiso 1200','cordoba','cordoba','-31.4581065','-64.1866691',250,'S','',1),(62,36,'Lorena cisneros','caceros 300','cordoba','cordoba','-31.4170565','-64.1891093',300,'S','',1),(63,37,'carla giuliano','avenida armada argentina 1000','codoba','cordoba','-31.4596852','-64.2154929',200,'S','',1);
/*!40000 ALTER TABLE `mapamarker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `per_privi`
--

DROP TABLE IF EXISTS `per_privi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `per_privi` (
  `perId` int(11) DEFAULT NULL,
  `priviId` int(11) DEFAULT NULL,
  KEY `perId_idx` (`perId`),
  KEY `priviId_idx` (`priviId`),
  CONSTRAINT `perId` FOREIGN KEY (`perId`) REFERENCES `personas` (`perId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `priviId` FOREIGN KEY (`priviId`) REFERENCES `privilegios` (`priviId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `per_privi`
--

LOCK TABLES `per_privi` WRITE;
/*!40000 ALTER TABLE `per_privi` DISABLE KEYS */;
INSERT INTO `per_privi` VALUES (6,4),(6,5),(6,9),(10,1),(10,2),(10,3),(10,4),(10,5),(10,6),(10,7),(10,8),(10,9),(10,10),(12,1),(12,2),(12,3),(12,4),(12,5),(12,6),(12,7),(12,8),(12,9),(12,10),(11,9),(11,10),(13,1),(13,2),(13,3),(13,4),(13,5),(13,6),(13,7),(13,8),(13,9),(13,10),(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(9,1),(9,2),(9,3),(9,4),(9,5),(9,6),(9,7),(9,8),(9,9),(9,10),(5,1),(5,2),(5,3),(5,4),(5,5),(5,6),(5,7),(5,8),(5,9),(5,10);
/*!40000 ALTER TABLE `per_privi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personas` (
  `perId` int(11) NOT NULL AUTO_INCREMENT,
  `perUsuario` varchar(245) NOT NULL,
  `perPass` varchar(245) NOT NULL,
  `perNom` varchar(245) NOT NULL,
  `perApe` varchar(245) NOT NULL,
  `perDni` int(11) NOT NULL,
  PRIMARY KEY (`perId`),
  UNIQUE KEY `perUsuario_UNIQUE` (`perUsuario`),
  UNIQUE KEY `perDni_UNIQUE` (`perDni`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES (1,'alec9','ama921sa','Alejandro',' Sosa',27921909),(5,'yani_zwenger','--hrz9454--','Maria Yanina','Zwenger',31506563),(6,'manuelfonsss','ama921','Manuel Antonio','Sosa',7964879),(9,'msosa','camifran','Manuel Andres','Sosa Adorati',25608860),(10,'bmeloni','20454593','Brenda','Meloni',20454593),(11,'apvarela','42160675','ANA PAULA','VARELA',42160675),(12,'nuliana','nuliana','Nerina','Uliana',555555),(13,'pbadariotti','pbadariotti','Patricia','Badariotti',222222);
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilegios`
--

DROP TABLE IF EXISTS `privilegios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privilegios` (
  `priviId` int(11) NOT NULL,
  `privilegio` varchar(245) NOT NULL,
  PRIMARY KEY (`priviId`),
  UNIQUE KEY `privilegio_UNIQUE` (`privilegio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilegios`
--

LOCK TABLES `privilegios` WRITE;
/*!40000 ALTER TABLE `privilegios` DISABLE KEYS */;
INSERT INTO `privilegios` VALUES (1,'altaPersona'),(4,'altaPrivilegio'),(6,'asignaPrivilegio'),(2,'bajaPersona'),(5,'bajaPrivilegio'),(8,'exportaInfo'),(3,'modificaPersona'),(11,'privilegio de prueba 1'),(12,'privilegio de prueba 2'),(13,'privilegio de prueba 3'),(14,'privilegio de prueba 4'),(15,'privilegio de prueba 5'),(7,'SuperAdmin'),(9,'visualizaGraficos'),(10,'visualizaMapas');
/*!40000 ALTER TABLE `privilegios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'tesis'
--

--
-- Dumping routines for database 'tesis'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-25 17:50:20
