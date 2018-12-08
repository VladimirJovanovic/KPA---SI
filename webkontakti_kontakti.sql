-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: webkontakti
-- ------------------------------------------------------
-- Server version	5.5.62

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
-- Table structure for table `kontakti`
--

DROP TABLE IF EXISTS `kontakti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kontakti` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `fkKorisnik` int(11) NOT NULL,
  `fkDrzava` int(11) NOT NULL,
  `Ime` varchar(25) NOT NULL,
  `Prezime` varchar(25) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Telefon` varchar(15) NOT NULL,
  `Opis` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Korisnik` (`fkKorisnik`),
  KEY `fk_Drzava` (`fkDrzava`),
  CONSTRAINT `fk_Drzava` FOREIGN KEY (`fkDrzava`) REFERENCES `drzava` (`ID`),
  CONSTRAINT `fk_Korisnik` FOREIGN KEY (`fkKorisnik`) REFERENCES `korisnik` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kontakti`
--

LOCK TABLES `kontakti` WRITE;
/*!40000 ALTER TABLE `kontakti` DISABLE KEYS */;
INSERT INTO `kontakti` VALUES (1,1,1,'Milos','Milosevic','milos@gmail.com','065123789','             Milos je student.'),(4,2,1,'www','ww','ww@sss','123445','             qweerwrwe'),(5,2,3,'few','few','few','432','             432'),(6,2,3,'few','few','few','432','             432'),(7,1,1,'few','few','','','             '),(9,1,1,'Marko','Markovic','m@m.com','2132323','dsdhsjd             '),(10,1,1,'aa','aa','aa','212','             dsd'),(12,1,2,'Milan','Milanovic','milan@milan.com','064123456','             Milan je student KPA.'),(13,1,1,'Marko','Markovic','m@m.com','1212','             sdsd'),(14,1,2,'Petar','Petrovic','ppetar@gmail.com','061123456','             Petar je radnik.');
/*!40000 ALTER TABLE `kontakti` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-08 15:16:02
