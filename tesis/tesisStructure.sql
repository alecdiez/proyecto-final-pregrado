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

-- Dump completed on 2016-05-25 17:56:24
