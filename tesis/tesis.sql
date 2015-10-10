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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mapa`
--

LOCK TABLES `mapa` WRITE;
/*!40000 ALTER TABLE `mapa` DISABLE KEYS */;
INSERT INTO `mapa` VALUES (17,1,'2015-09-25 09:28:29'),(18,5,'2015-09-25 09:29:38'),(19,1,'2015-09-25 09:31:17'),(20,6,'2015-09-29 19:03:04'),(21,10,'2015-10-01 20:46:03'),(22,10,'2015-10-01 20:57:32');
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mapamarker`
--

LOCK TABLES `mapamarker` WRITE;
/*!40000 ALTER TABLE `mapamarker` DISABLE KEYS */;
INSERT INTO `mapamarker` VALUES (1,17,'Alejandro Sosa','Pedro Isnardi 4250','Cordoba','Cordoba','-31.4132746','-64.2408889',500,'S','Probando todo'),(2,17,'Yanina Zwenger','Colon 5200','Cordoba','Cordoba','-31.3963996','-64.2510772',1000,'S','Veremos'),(3,17,'Manuel Sosa','La Pampa 1468 ','Cordoba','Cordoba','-31.4291706','-64.2088649',5000,'N','lalala'),(4,17,'Manuel Andres Sosa Adorati','Venta y Media 4250','Cordoba','Cordoba','-31.4058856','-64.23868329999999',2000,'N','Con Observaciones'),(5,17,'Bizit Global','Av. Hipolito Yrigoyen 31','Cordoba','Cordoba','-31.4206221','-64.18857299999999',100,'S','S/0'),(6,18,'Sujeto 1 Perez','Av. Santa Ana 1500','Cordoba','Cordoba','-31.4170817','-64.2076649',2,'N','Veremos'),(7,18,'Sujeto 2 Rodrigues','Av. Colon 2500','Cordoba','Cordoba','-31.4041612','-64.2148773',50,'S','Option'),(8,18,'sujeto 3 Diaz','Av. Fuerza Aerea 4000','Cordoba','Cordoba','-31.4321649','-64.2402747',600,'N','lalala'),(9,19,'prueba1 uno','Av. Santa Ana 1850','Cordoba','Cordoba','-31.416483','-64.2108197',2,'N','Veremos'),(10,19,'prueba2 dos','Rodriguez del Busto 3219','Cordoba','Cordoba','-31.37097','-64.22171',50,'S','Option'),(11,19,'prueba3 tres','Av. Fuerza Aerea 2850','Cordoba','Cordoba','-31.4312434','-64.2265847',600,'N','lalala'),(12,19,'prueba4 cuatro','Olegario Correa 800','Cordoba','Cordoba','-31.4174966','-64.2178504',300,'S','S/O'),(13,19,'prueba5 cinco','Av. Patria 585','Cordoba','Cordoba','-31.4074526','-64.1586638',500,'S','S/O'),(14,19,'prueba6 seis','Gral. Paz 30','Cordoba','Cordoba','-31.4147663','-64.186504',700,'N','Hay Observaciones'),(15,20,'Alejandro Sosa','Pedro Isnardi 4250','Cordoba','Cordoba','-31.4132746','-64.2408889',500,'S','Probando todo'),(16,20,'Yanina Zwenger','Colon 5200','Cordoba','Cordoba','-31.3963996','-64.2510772',1000,'S','Veremos'),(17,20,'Manuel Sosa','La Pampa 1468 ','Cordoba','Cordoba','-31.4291706','-64.2088649',5000,'N','lalala'),(18,20,'Manuel Andres Sosa Adorati','Venta y Media 4250','Cordoba','Cordoba','-31.4058856','-64.23868329999999',2000,'N','Con Observaciones'),(19,20,'Bizit Global','Av. Hipolito Yrigoyen 31','Cordoba','Cordoba','-31.4206221','-64.18857299999999',100,'S','S/0'),(20,21,'Sujeto 1 Perez','Av. Santa Ana 1500','Cordoba','Cordoba','-31.4170817','-64.2076649',2,'N','Veremos'),(21,21,'Sujeto 2 Rodrigues','Av. Colon 2500','Cordoba','Cordoba','-31.4041612','-64.2148773',50,'S','Option'),(22,21,'sujeto 3 Diaz','Av. Fuerza Aerea 4000','Cordoba','Cordoba','-31.4321649','-64.2402747',600,'N','lalala'),(23,22,'Alejandro Sosa','Pedro Isnardi 4250','Cordoba','Cordoba','-31.4132746','-64.2408889',500,'S','Probando todo'),(24,22,'Yanina Zwenger','Colon 5200','Cordoba','Cordoba','-31.3963996','-64.2510772',1000,'S','Veremos'),(25,22,'Manuel Sosa','La Pampa 1468 ','Cordoba','Cordoba','-31.4291706','-64.2088649',5000,'N','lalala'),(26,22,'Manuel Andres Sosa Adorati','Venta y Media 4250','Cordoba','Cordoba','-31.4058856','-64.23868329999999',2000,'N','Con Observaciones'),(27,22,'Bizit Global','Av. Hipolito Yrigoyen 31','Cordoba','Cordoba','-31.4206221','-64.18857299999999',100,'S','S/0');
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
INSERT INTO `per_privi` VALUES (9,1),(9,2),(9,3),(9,4),(9,5),(9,6),(9,7),(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(6,4),(6,5),(6,9),(5,1),(5,2),(5,3),(5,4),(5,8),(5,9),(10,8),(10,9);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES (1,'alec9','ama921sa','Alejandro',' Sosa',27921909),(5,'yani_zwenger','--hrz9454--','Maria Yanina','Zwenger',31506563),(6,'manuelfonsss','ama921','Manuel Antonio','Sosa',7964879),(7,'rrr','rrr','rrrr','rrrrrrrrr',55555),(9,'msosa','camifran','Manuel Andres','Sosa Adorati',25608860),(10,'bmeloni','20454593','Brenda','Meloni',20454593);
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
INSERT INTO `privilegios` VALUES (1,'altaPersona'),(4,'altaPrivilegio'),(6,'asignaPrivilegio'),(2,'bajaPersona'),(5,'bajaPrivilegio'),(8,'exportaInfo'),(3,'modificaPersona'),(7,'SuperAdmin'),(9,'visualizaGraficos');
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

-- Dump completed on 2015-10-10 11:52:29
