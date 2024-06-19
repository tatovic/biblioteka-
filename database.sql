-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: biblioteka
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `knjige`
--

DROP TABLE IF EXISTS `knjige`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `knjige` (
  `knjiga_id` int unsigned NOT NULL AUTO_INCREMENT,
  `naslov` varchar(200) COLLATE utf8mb3_unicode_ci NOT NULL,
  `autor` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `zanr` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `godina_izdanja` year NOT NULL,
  `isbn` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dostupne_kopije` int NOT NULL,
  PRIMARY KEY (`knjiga_id`),
  UNIQUE KEY `isbn` (`isbn`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `knjige`
--

LOCK TABLES `knjige` WRITE;
/*!40000 ALTER TABLE `knjige` DISABLE KEYS */;
INSERT INTO `knjige` VALUES (1,'Prohujalo sa vihorom','Margaret Mičel','Roman',1936,'978-0-123456-47-2',3),(2,'Lovac u žitu','Dž. D. Selindžer','Roman',1951,'978-0-123456-48-9',5),(3,'Veliki Getsbi','F. Skot Ficdžerald','Fikcija',1925,'9780743273565',5),(4,'1984','Džordž Orvel','Distopija',1949,'9780451524935',3);
/*!40000 ALTER TABLE `knjige` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `korisnici`
--

DROP TABLE IF EXISTS `korisnici`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `korisnici` (
  `korisnik_id` int unsigned NOT NULL AUTO_INCREMENT,
  `korisnicko_ime` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `lozinka` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `uloga` enum('admin','korisnik') COLLATE utf8mb3_unicode_ci NOT NULL,
  `datum_kreiranja` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`korisnik_id`),
  UNIQUE KEY `korisnicko_ime` (`korisnicko_ime`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `korisnici`
--

LOCK TABLES `korisnici` WRITE;
/*!40000 ALTER TABLE `korisnici` DISABLE KEYS */;
INSERT INTO `korisnici` VALUES (2,'korisnik1','password123','korisnik1@example.com','korisnik','2024-06-10 16:35:29'),(3,'admin','adminpassword','admin@example.com','admin','2024-06-15 12:05:29');
/*!40000 ALTER TABLE `korisnici` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pozajmice`
--

DROP TABLE IF EXISTS `pozajmice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pozajmice` (
  `pozajmica_id` int unsigned NOT NULL AUTO_INCREMENT,
  `korisnik_id` int unsigned DEFAULT NULL,
  `knjiga_id` int unsigned DEFAULT NULL,
  `datum_pozajmice` date NOT NULL,
  `datum_vracanja` date DEFAULT NULL,
  `datum_isteka` date NOT NULL,
  PRIMARY KEY (`pozajmica_id`),
  KEY `korisnik_id` (`korisnik_id`),
  KEY `knjiga_id` (`knjiga_id`),
  CONSTRAINT `pozajmice_ibfk_1` FOREIGN KEY (`korisnik_id`) REFERENCES `korisnici` (`korisnik_id`),
  CONSTRAINT `pozajmice_ibfk_2` FOREIGN KEY (`knjiga_id`) REFERENCES `knjige` (`knjiga_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pozajmice`
--

LOCK TABLES `pozajmice` WRITE;
/*!40000 ALTER TABLE `pozajmice` DISABLE KEYS */;
INSERT INTO `pozajmice` VALUES (1,2,1,'2024-06-01','2024-06-10','2024-06-15'),(2,2,2,'2024-06-05',NULL,'2024-06-20'),(3,2,1,'2024-06-01',NULL,'2024-06-15');
/*!40000 ALTER TABLE `pozajmice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rezervacije`
--

DROP TABLE IF EXISTS `rezervacije`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rezervacije` (
  `rezervacija_id` int unsigned NOT NULL AUTO_INCREMENT,
  `korisnik_id` int unsigned DEFAULT NULL,
  `knjiga_id` int unsigned DEFAULT NULL,
  `datum_rezervacije` date NOT NULL,
  `status` enum('aktivna','otkazana','završena') COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`rezervacija_id`),
  KEY `korisnik_id` (`korisnik_id`),
  KEY `knjiga_id` (`knjiga_id`),
  CONSTRAINT `rezervacije_ibfk_1` FOREIGN KEY (`korisnik_id`) REFERENCES `korisnici` (`korisnik_id`),
  CONSTRAINT `rezervacije_ibfk_2` FOREIGN KEY (`knjiga_id`) REFERENCES `knjige` (`knjiga_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rezervacije`
--

LOCK TABLES `rezervacije` WRITE;
/*!40000 ALTER TABLE `rezervacije` DISABLE KEYS */;
INSERT INTO `rezervacije` VALUES (1,2,1,'2024-06-01','završena'),(2,2,2,'2024-06-05','aktivna'),(3,2,2,'2024-06-05','aktivna');
/*!40000 ALTER TABLE `rezervacije` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-19 18:08:11
