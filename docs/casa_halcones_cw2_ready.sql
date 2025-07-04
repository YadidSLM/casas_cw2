-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: casa_halcones_cw2
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `avatar`
--

DROP TABLE IF EXISTS `avatar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avatar` (
  `ID_AVATAR` tinyint(4) NOT NULL AUTO_INCREMENT,
  `ID_IMG_AVATAR` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_AVATAR`),
  KEY `LF_AVATAR` (`ID_IMG_AVATAR`),
  CONSTRAINT `LF_AVATAR` FOREIGN KEY (`ID_IMG_AVATAR`) REFERENCES `img_avatar` (`ID_IMG_AVATAR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avatar`
--

LOCK TABLES `avatar` WRITE;
/*!40000 ALTER TABLE `avatar` DISABLE KEYS */;
/*!40000 ALTER TABLE `avatar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `casa`
--

DROP TABLE IF EXISTS `casa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `casa` (
  `ID_CASA` tinyint(4) NOT NULL AUTO_INCREMENT,
  `CASA` char(20) DEFAULT NULL,
  PRIMARY KEY (`ID_CASA`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casa`
--

LOCK TABLES `casa` WRITE;
/*!40000 ALTER TABLE `casa` DISABLE KEYS */;
INSERT INTO `casa` VALUES (1,'halcones'),(2,'teporingos'),(3,'vaquitas'),(4,'ajolotes');
/*!40000 ALTER TABLE `casa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `casa_has_elemento_representativo`
--

DROP TABLE IF EXISTS `casa_has_elemento_representativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `casa_has_elemento_representativo` (
  `ID_CASA_HAS_ELEMENTO_REPRESENTATIVO` smallint(6) NOT NULL AUTO_INCREMENT,
  `ID_CASA` tinyint(4) DEFAULT NULL,
  `ID_ELEMENTO_REPRESENTATIVO` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`ID_CASA_HAS_ELEMENTO_REPRESENTATIVO`),
  KEY `ID_CASA` (`ID_CASA`),
  KEY `ID_ELEMENTO_REPRESENTATIVO` (`ID_ELEMENTO_REPRESENTATIVO`),
  CONSTRAINT `casa_has_elemento_representativo_ibfk_1` FOREIGN KEY (`ID_CASA`) REFERENCES `casa` (`ID_CASA`),
  CONSTRAINT `casa_has_elemento_representativo_ibfk_2` FOREIGN KEY (`ID_ELEMENTO_REPRESENTATIVO`) REFERENCES `elemento_representativo` (`ID_ELEMENTO_REPRESENTATIVO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casa_has_elemento_representativo`
--

LOCK TABLES `casa_has_elemento_representativo` WRITE;
/*!40000 ALTER TABLE `casa_has_elemento_representativo` DISABLE KEYS */;
/*!40000 ALTER TABLE `casa_has_elemento_representativo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `casa_has_habitacion`
--

DROP TABLE IF EXISTS `casa_has_habitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `casa_has_habitacion` (
  `ID_CASA_HAS_HABITACION` smallint(6) NOT NULL AUTO_INCREMENT,
  `ID_CASA` tinyint(4) DEFAULT NULL,
  `ID_HABITACION` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_CASA_HAS_HABITACION`),
  KEY `ID_CASA` (`ID_CASA`),
  KEY `ID_HABITACION` (`ID_HABITACION`),
  CONSTRAINT `casa_has_habitacion_ibfk_1` FOREIGN KEY (`ID_CASA`) REFERENCES `casa` (`ID_CASA`),
  CONSTRAINT `casa_has_habitacion_ibfk_2` FOREIGN KEY (`ID_HABITACION`) REFERENCES `habitacion_casa` (`ID_HABITACION_CASA`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casa_has_habitacion`
--

LOCK TABLES `casa_has_habitacion` WRITE;
/*!40000 ALTER TABLE `casa_has_habitacion` DISABLE KEYS */;
INSERT INTO `casa_has_habitacion` VALUES (1,2,1),(2,2,2),(3,2,3),(4,2,4),(5,4,5);
/*!40000 ALTER TABLE `casa_has_habitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elemento_representativo`
--

DROP TABLE IF EXISTS `elemento_representativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elemento_representativo` (
  `ID_ELEMENTO_REPRESENTATIVO` smallint(6) NOT NULL AUTO_INCREMENT,
  `IMG_HABITACION_RUTA` varchar(200) DEFAULT NULL,
  `FECHA_ALMACENAMIENTO` datetime DEFAULT NULL,
  `DESCRIPCION` char(100) DEFAULT NULL,
  PRIMARY KEY (`ID_ELEMENTO_REPRESENTATIVO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elemento_representativo`
--

LOCK TABLES `elemento_representativo` WRITE;
/*!40000 ALTER TABLE `elemento_representativo` DISABLE KEYS */;
/*!40000 ALTER TABLE `elemento_representativo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitacion_casa`
--

DROP TABLE IF EXISTS `habitacion_casa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habitacion_casa` (
  `ID_HABITACION_CASA` tinyint(4) NOT NULL AUTO_INCREMENT,
  `IMG_HABITACION_RUTA` varchar(255) DEFAULT NULL,
  `POSICION` enum('DORMITORIO','CHIMENEA','HABITACION','ELEMENTO') DEFAULT NULL,
  `NOMBRE_IMG` char(50) NOT NULL,
  PRIMARY KEY (`ID_HABITACION_CASA`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitacion_casa`
--

LOCK TABLES `habitacion_casa` WRITE;
/*!40000 ALTER TABLE `habitacion_casa` DISABLE KEYS */;
INSERT INTO `habitacion_casa` VALUES (1,'../statics/dormitorio_DORMITORIO.jpg','DORMITORIO',''),(2,'../statics/Fuego_CHIMENEA.jpg','CHIMENEA',''),(3,'../statics/habitat_HABITACION.JPG','HABITACION',''),(4,'../statics/Novia_de_tepo_ELEMENTO.jpg','ELEMENTO',''),(5,'../statics/tenis_ELEMENTO.jpeg','ELEMENTO','');
/*!40000 ALTER TABLE `habitacion_casa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `img_avatar`
--

DROP TABLE IF EXISTS `img_avatar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `img_avatar` (
  `ID_IMG_AVATAR` tinyint(4) NOT NULL AUTO_INCREMENT,
  `TIPO` enum('cabeza','torso','pantalon','zapato') DEFAULT NULL,
  `IMG_RUTA` varchar(200) DEFAULT NULL,
  `FECHA_ALMACENAMIENTO` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_IMG_AVATAR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `img_avatar`
--

LOCK TABLES `img_avatar` WRITE;
/*!40000 ALTER TABLE `img_avatar` DISABLE KEYS */;
/*!40000 ALTER TABLE `img_avatar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `ID_USUARIO` tinyint(4) NOT NULL AUTO_INCREMENT,
  `ID_AVATAR` tinyint(4) DEFAULT NULL,
  `ID_CASA` tinyint(4) DEFAULT NULL,
  `APODO` char(50) DEFAULT NULL,
  `NOMBRE` char(50) DEFAULT NULL,
  PRIMARY KEY (`ID_USUARIO`),
  KEY `fk_usuario_avatar` (`ID_AVATAR`),
  KEY `fk_usuario_casa` (`ID_CASA`),
  CONSTRAINT `fk_usuario_avatar` FOREIGN KEY (`ID_AVATAR`) REFERENCES `avatar` (`ID_AVATAR`),
  CONSTRAINT `fk_usuario_casa` FOREIGN KEY (`ID_CASA`) REFERENCES `casa` (`ID_CASA`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (3,NULL,2,'Trekis','Alma'),(4,NULL,4,'Emi','Emiliano');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-04 13:21:07
