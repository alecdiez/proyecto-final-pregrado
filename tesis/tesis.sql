CREATE DATABASE  IF NOT EXISTS `tesis` /*!40100 DEFAULT CHARACTER SET utf8 */;
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
-- Table structure for table `mapa`
--

DROP TABLE IF EXISTS `mapa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mapa` (
  `mapaId` int(11) NOT NULL AUTO_INCREMENT,
  `mapaUsrId` int(11) NOT NULL,
  `mapaFecha` datetime NOT NULL,
  PRIMARY KEY (`mapaId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mapa`
--

LOCK TABLES `mapa` WRITE;
/*!40000 ALTER TABLE `mapa` DISABLE KEYS */;
INSERT INTO `mapa` VALUES (7,1,'2015-07-19 10:58:06'),(8,1,'2015-07-19 11:26:34'),(9,1,'2015-07-19 11:28:44'),(10,1,'2015-07-19 12:00:52'),(11,1,'2015-07-19 12:02:42'),(12,1,'2015-07-19 19:20:36'),(13,1,'2015-07-19 19:23:56'),(14,1,'2015-07-19 19:25:21');
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
  `mapamarkerVenta` decimal(10,0) DEFAULT NULL,
  `mapamarkerEntrega` varchar(2) DEFAULT NULL,
  `mapamarkerObserva` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`mapaMarkerId`),
  KEY `mapaId_idx` (`mapaId`),
  CONSTRAINT `mapaId` FOREIGN KEY (`mapaId`) REFERENCES `mapa` (`mapaId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mapamarker`
--

LOCK TABLES `mapamarker` WRITE;
/*!40000 ALTER TABLE `mapamarker` DISABLE KEYS */;
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
INSERT INTO `per_privi` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(6,4),(6,5),(8,1),(8,2),(8,3),(8,4),(8,5),(8,6),(5,1),(5,2),(5,3),(5,4);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES (1,'alec9','ama921sa','Alejandro',' Sosa',27921909),(5,'yani_zwenger','--hrz9454--','Maria Yanina','Zwenger',31506563),(6,'manuelfonsss','ama921','Manuel Antonio','Sosa',7964879),(7,'rrr','rrr','rrrr','rrrrrrrrr',55555),(8,'bmeloni','bmeloni','Brenda','Meloni',50000000);
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
INSERT INTO `privilegios` VALUES (1,'altaPersona'),(4,'altaPrivilegio'),(6,'asignaPrivilegio'),(2,'bajaPersona'),(5,'bajaPrivilegio'),(3,'modificaPersona');
/*!40000 ALTER TABLE `privilegios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-19 19:46:48
