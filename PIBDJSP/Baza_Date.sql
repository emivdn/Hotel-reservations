-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: vidinei_lavinia_emilia
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `camere`
--

DROP TABLE IF EXISTS `camere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camere` (
  `idcamera` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tipcamera` varchar(200) DEFAULT NULL,
  `capacitate` int DEFAULT NULL,
  `pretnoapte` varchar(200) DEFAULT NULL,
  `disponibilitate` varchar(200) DEFAULT NULL,
  `facilitati` varchar(200) DEFAULT NULL,
  `dataultimeicuratari` date DEFAULT NULL,
  PRIMARY KEY (`idcamera`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camere`
--

LOCK TABLES `camere` WRITE;
/*!40000 ALTER TABLE `camere` DISABLE KEYS */;
INSERT INTO `camere` VALUES (1,'single',2,'240 lei','disponibila','televizor,internet,baie privata','2024-01-06'),(2,'double',4,'430lei','rezervata','televizor,internet,baie privata,mic dejun','2024-01-12'),(3,'suite',4,'375lei','ocupata','televizor,internet,baie privata,mic dejun','2024-01-11'),(4,'apartament',5,'470lei','disponibila','televizor,internet,baie privata,mic dejun,aparat cafea','2023-12-30'),(5,'double',4,'400lei','ocupata','televizor,internet,baie privata,mic dejun,aparat cafea','2024-01-09'),(6,'single',2,'250lei','disponibila','televizor,internet,baie privata,mic dejun,aparat cafea','2024-01-20'),(7,'apartament',5,'350lei','disponibila','televizor,internet,mic dejun,aparat cafea','2023-12-29');
/*!40000 ALTER TABLE `camere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clienti`
--

DROP TABLE IF EXISTS `clienti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clienti` (
  `idclient` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nume` varchar(100) DEFAULT NULL,
  `prenume` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `nrtelefon` varchar(45) DEFAULT NULL,
  `datacheckin` date DEFAULT NULL,
  `datacheckout` date DEFAULT NULL,
  PRIMARY KEY (`idclient`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clienti`
--

LOCK TABLES `clienti` WRITE;
/*!40000 ALTER TABLE `clienti` DISABLE KEYS */;
INSERT INTO `clienti` VALUES (1,'Popescu','Valentin','popescuv@email.com','0753729785','2024-01-20','2024-01-22'),(2,'Draghici','Andreea','andreeadraghi@gmail.com','0732564009','2024-01-15','2024-01-19'),(3,'Craciun','Dan','dan12@gmail.com','0752914066','2024-01-31','2024-02-03'),(4,'Matache','Ion','matache100ion@email.com','0723030021','2024-01-26','2024-01-27'),(5,'Zamfir','Oana','oana2000@email.com','0720299123','2024-01-02','2024-01-05'),(6,'Georgescu','Ionela','georgescu43@gmail.com','0732655004','2024-01-18','2024-01-20'),(7,'Vasilache','Claudiu','claudiuvasi@gmail.com','0789635326','2024-01-04','2024-01-09'),(8,'Popa','Ana','anaaa67@email.com','0720298704','2024-01-10','2024-01-13');
/*!40000 ALTER TABLE `clienti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoteluri`
--

DROP TABLE IF EXISTS `hoteluri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoteluri` (
  `idhotel` bigint unsigned NOT NULL AUTO_INCREMENT,
  `idcamera` bigint unsigned DEFAULT NULL,
  `idclient` bigint unsigned DEFAULT NULL,
  `numehotel` varchar(45) DEFAULT NULL,
  `oras` varchar(45) DEFAULT NULL,
  `nrstele` int DEFAULT NULL,
  `animaledecompanie` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idhotel`),
  KEY `fk_hoteluri_1_idx` (`idcamera`),
  KEY `fk_hoteluri_2_idx` (`idclient`),
  CONSTRAINT `fk_hoteluri_1` FOREIGN KEY (`idcamera`) REFERENCES `camere` (`idcamera`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_hoteluri_2` FOREIGN KEY (`idclient`) REFERENCES `clienti` (`idclient`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoteluri`
--

LOCK TABLES `hoteluri` WRITE;
/*!40000 ALTER TABLE `hoteluri` DISABLE KEYS */;
INSERT INTO `hoteluri` VALUES (1,1,8,'Transilvania','Bran',4,'DA'),(2,2,6,'Olimpus','Constanta',3,'NU'),(3,4,5,'Nicoleta','Moieciu',3,'DA'),(4,4,7,'Nicoleta','Moieciu',3,'DA'),(5,7,2,'Trei Brazi','Brasov',4,'NU'),(6,6,4,'Belvedere','Predeal',5,'NU'),(7,7,1,'Trei Brazi','Brasov',4,'NU');
/*!40000 ALTER TABLE `hoteluri` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-29 23:03:44
